<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Appointment extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->config->load("payroll");
        $this->config->load("mailsms");
        $this->notification = $this->config->item('notification');
        $this->notificationurl = $this->config->item('notification_url');
        $this->patient_notificationurl = $this->config->item('patient_notification_url');
        $this->search_type = $this->config->item('search_type');
        $this->load->library('mailsmsconf');
        $this->load->library('Enc_lib');

        $this->appointment_status = $this->config->item('appointment_status');
    }
 function doctorwise() {
    if ($this->input->post()) {
        // $this->session->set_userdata('top_menu', 'front_office');
        // $this->session->set_userdata('sub_menu', 'admin/appointment/doctorwise');
        
        // Validate the 'doctor' field
        $this->form_validation->set_rules('doctor', 'Doctor', 'required');

        if ($this->form_validation->run() == FALSE) {
            $data["doctors"] = $this->staff_model->getStaffbyrole(3);  // Fetch doctors for dropdown
            $data['resultlist'] = array(); // No results if validation fails

            $this->load->view('layout/header');
            $this->load->view('admin/appointment/appointmentview', $data);
            $this->load->view('layout/footer');
        } else {
            // Gather the input data
            $doctor_name = $this->input->post('doctor'); // Assuming doctor name is posted
            $date = $this->input->post('date');


           
            // Fetch doctors and appointments based on the filter
            $data["doctors"] = $this->staff_model->getStaffbyrole(3);  // Get all doctors for the dropdown
           
            $data['resultlist'] = $this->staff_model->getDoctorWiseAppointmentsByName($doctor_name, $date); // Use a new function for fetching appointments by name
 
            // Load the views
            $this->load->view('layout/header');
            $this->load->view('admin/appointment/appointmentview', $data);
            $this->load->view('layout/footer');
        }
    } else {
        // Default view without filters
        $data["doctors"] = $this->staff_model->getStaffbyrole(3);  // Fetch doctors for the dropdown
        $data['resultlist'] = array();  // Empty result list initially

        // Load the views
        $this->load->view('layout/header');
        $this->load->view('admin/appointment/appointmentview', $data);
        $this->load->view('layout/footer');
    }
}
    public function unauthorized() {
        $data = array();
        $this->load->view('layout/header', $data);
        $this->load->view('unauthorized', $data);
        $this->load->view('layout/footer', $data);
    }
    public function getBillDetails($id) {
        if (!$this->rbac->hasPrivilege('pharmacy bill', 'can_view')) {
            access_denied();
        }
        $print_details = $this->printing_model->get('', 'appointment');
        $data["print_details"] = $print_details;
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }

        $result = $this->appointment_model->getDetails($id);
        $data['result'] = $result;
        $detail = $this->pharmacy_model->getAllBillDetails($id);
        $data['detail'] = $detail;
        $this->load->view('admin/appointment/printBill', $data);
    }

    public function getDoctorFee($doctor_id) {
        $standard_charge = $this->db->select('standard_charge')->where('doctor', $doctor_id)->get("consult_charges")->row()->standard_charge;
        echo json_encode($standard_charge);
    }
public function add() {
        $this->form_validation->set_rules('date', $this->lang->line('appointment').' '.$this->lang->line('date'), 'required');
        $this->form_validation->set_rules('patient_name', $this->lang->line('patient') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('mobileno', $this->lang->line('phone'), 'required|numeric|callback_valid_mobile_number');
        $this->form_validation->set_rules('doctor', $this->lang->line('doctor'), 'required');
       // $this->form_validation->set_rules('message', $this->lang->line('message'), 'required');
        $this->form_validation->set_rules('appointment_status', $this->lang->line('appointment') . " " . $this->lang->line('status'), 'required');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date' => form_error('date'),
                'patient_name' => form_error('patient_name'),
                'mobileno' => form_error('mobileno'),
                'doctor' => form_error('doctor'),
               // 'message' => form_error('message'),
                'appointment_status' => form_error('appointment_status')
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $date = $this->input->post('date');
            $patient_id = $this->input->post('patient_id');
            //print_r($patient_id);
            // exit();
            $patient_name = $this->input->post('patient_name');
            $status = $this->input->post('appointment_status');

           
            
            
             $prefix = $this->setting_model->getPrefixSetting('appointment');
         if (empty($prefix)) {
            $prefix = "APPNO";
          }
        
        
         $check_id = $this->appointment_model->getMaxId();
            if (empty($check_id)) {
                $check_id = 0;
            }

            $max_id = $check_id + 1;
            if ($status == 'approved') {
                $app_no = $prefix . $max_id;
            } else {
                $app_no = '';
            }
            
   
    
        
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('mobileno');
            $appointment = array(
                'patient_id' => $patient_id,
                'appointment_no' => $app_no,
                'date' => date("Y-m-d H:i:s", $this->customlib->datetostrtotime($date)),
                'patient_name' => $this->input->post('patient_name'),
                'gender' => $this->input->post('gender'),
                'email' => $this->input->post('email'),
                'mobileno' => $countryCode.$number,
                'doctor' => $this->input->post('doctor'),
                'doctor_fee' => $this->input->post('doctor_fee'),
                'message' => $this->input->post('message'),
                'source' => 'Offline',
                'appointpriority' => $this->input->post('appointment_priority'),
                'appointment_status' => $status,
                'collected_by' => $this->customlib->getUserData()["id"]
                

            );

            // print_r($appointment);
            // exit();
            $insert_id = $this->appointment_model->add($appointment);

            $notificationurl = $this->notificationurl;
            $url_link = $notificationurl["appointment"];
            $url = base_url() . $url_link . '/' . $insert_id;
           // print_r($url);
           // exit();
            if ($status != 'approved') {
                $this->appointmentCreateNotification($patient_id, $patient_name, $url);
            } else {

                $this->appointmentApprovedNotification($patient_id, $this->input->post('doctor'), $this->input->post('patient_name'), $url);
            }
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Saved Successfully.');
        }
        echo json_encode($array);
    }
    
    /*public function valid_mobile_number($number) {
            // Remove any non-digit characters
            $cleaned_number = preg_replace('/\D/', '', $number);

            // Debugging: Output the cleaned number
            log_message('debug', 'Cleaned Number: ' . $cleaned_number);

            // Check if the cleaned number contains exactly 7 digits
            if (strlen($cleaned_number) === 7) {
                return TRUE;
            } else {
                $this->form_validation->set_message('valid_mobile_number', 'The {field} field must contain exactly 7 digits.');
                return FALSE;
            }
        }*/
        
        public function valid_mobile_number($number) {
    // Remove any non-digit characters
    $cleaned_number = preg_replace('/\D/', '', $number);

    // Debugging: Output the cleaned number
    log_message('debug', 'Cleaned Number: ' . $cleaned_number);

    // Check if the cleaned number contains exactly 7 digits
    if (preg_match('/^\d{7}$/', $cleaned_number)) {
        return TRUE;
    } else {
        $this->form_validation->set_message('valid_mobile_number', 'The {field} field must contain exactly 7 digits.');
        return FALSE;
    }
}


    public function appointmentCreateNotification($patient_id = '', $patient_name = '', $url) {
        $notification = $this->notification;
        $notification_desc = $notification["appointment_created"];
        $patient_url = $this->patient_notificationurl['appointment'];
        $patient_desc = str_replace(array('<patient>', '<url>'), array($patient_name, base_url() . $patient_url), $notification_desc);
        $desc = str_replace(array('<patient>', '<url>'), array($patient_name, $url), $notification_desc);

        if (!empty($patient_id)) {
            $notification_data = array('notification_title' => 'Appointment Created',
                'notification_desc' => $patient_desc,
                'notification_for' => 'Patient',
                'notification_type' => 'appointment',
                'receiver_id' => $patient_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $admin_notification_data = array('notification_title' => 'Appointment Created',
                'notification_desc' => $desc,
                'notification_for' => 'Super Admin',
                'notification_type' => 'appointment',
                'receiver_id' => '',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
        } else if (!empty($patient_name)) {
            $notification_data = array('notification_title' => 'Appointment Created',
                'notification_desc' => $patient_desc,
                'notification_for' => 'Patient',
                'notification_type' => 'appointment',
                'receiver_id' => $patient_name,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $admin_notification_data = array('notification_title' => 'Appointment Created',
                'notification_desc' => $desc,
                'notification_for' => 'Super Admin',
                'notification_type' => 'appointment',
                'receiver_id' => '',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
        }
        $this->notification_model->addSystemNotification($notification_data);
        $this->notification_model->addSystemNotification($admin_notification_data);
    }

    public function status($id) {
        $appointment_no = 'APPNO' . $id;
        $data = array('appointment_no' => $appointment_no, 'appointment_status' => 'approved');
        $this->appointment_model->status($id, $data);
        $appointment_details = $this->appointment_model->getDetails($id);
        $notificationurl = $this->notificationurl;
        $url_link = $notificationurl["appointment"];
        $url = base_url() . $url_link . '/' . $id;

        $this->appointmentApprovedNotification($appointment_details["patient_id"], $appointment_details["doctor"], $appointment_details["patient_name"], $url);
        $sender_details = array('appointment_id' => $id, 'contact_no' => $appointment_details["mobileno"], 'email' => $appointment_details["email"]);
        $this->mailsmsconf->mailsms('appointment', $sender_details);
        redirect('admin/appointment/search');
    }

    public function appointmentApprovedNotification($patient_id = '', $doctor_id, $patient_name = '', $url) {

        $notification = $this->notification;
        $notification_desc = $notification["appointment_approved"];

        $desc = str_replace(array('<patient>', '<url>'), array($patient_name, $url), $notification_desc);

        $patient_url = $this->patient_notificationurl['appointment'];
        $patient_desc = str_replace(array('<patient>', '<url>'), array($patient_name, base_url() . $patient_url), $notification_desc);

        if (!empty($patient_name)) {

            $notification_data = array('notification_title' => 'Appointment Approved',
                'notification_desc' => $patient_desc,
                'notification_for' => 'Patient',
                'notification_type' => 'appointment',
                'receiver_id' => $patient_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $admin_notification_data = array('notification_title' => 'Appointment Approved',
                'notification_desc' => $desc,
                'notification_for' => 'Super Admin',
                'notification_type' => 'appointment',
                'receiver_id' => '',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
            $this->notification_model->addSystemNotification($admin_notification_data);
        }

        if (!empty($doctor_id)) {

            $notification_data = array('notification_title' => 'Appointment Approved',
                'notification_desc' => $desc,
                'notification_for' => 'Doctor',
                'receiver_id' => $doctor_id,
                'notification_type' => 'appointment',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
        }
    }


    public function search() {
        $this->session->set_userdata('top_menu', 'front_office');
        $app_data = $this->session->flashdata('app_data');
        $data['app_data'] = $app_data;

        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        $data["appointment_status"] = $this->appointment_status;
        $data['resultlist'] = $this->appointment_model->searchFullText();
        $data["appointmentPriorityList"] = $this->appointment_model->getAppointmentpriorities();
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata['role_id'];
        $doctorid = "";
        $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
        $disable_option = FALSE;
        if ($doctor_restriction == 'enabled') {
            if ($role_id == 3) {
                $disable_option = TRUE;
                $doctorid = $userdata['id'];
            }
        }
        $data["doctor_select"] = $doctorid;
        $data["disable_option"] = $disable_option;

        $this->load->view('layout/header');
        $this->load->view('admin/appointment/search.php', $data);
        $this->load->view('layout/footer');
    }

    public function getDetails() {
        $id = $this->input->post("appointment_id");
        $result = $this->appointment_model->getDetails($id);
        $result["date"] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date']));
        echo json_encode($result);
    }

    public function getappDetails($id) {

        $result = $this->appointment_model->getDetails($id);
        $result["date"] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date']));
        echo json_encode($result);
    }

 public function update() {
        $this->form_validation->set_rules('date', $this->lang->line('appointment').' '.$this->lang->line('date'), 'required');
        $this->form_validation->set_rules('patient_name', $this->lang->line('patient') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('mobileno', $this->lang->line('phone'), 'required|numeric|callback_valid_mobile_number');
        $this->form_validation->set_rules('doctor', $this->lang->line('doctor'), 'required');
      //  $this->form_validation->set_rules('message', $this->lang->line('message'), 'required');
        //$this->form_validation->set_rules('appointment_status', $this->lang->line('appointment') . " " . $this->lang->line('status'), 'required');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date' => form_error('date'),
                'patient_name' => form_error('patient_name'),
                'mobileno' => form_error('mobileno'),
                'doctor' => form_error('doctor'),
               // 'message' => form_error('message'),
               // 'appointment_status' => form_error('appointment_status')
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('id');
            $status = $this->input->post('appointment_status');
            $date = $this->input->post('date');
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('mobileno');
            $appointment = array(
                'id' => $id,
                'patient_id' => $this->input->post('patient_id'),
                'date' => date("Y-m-d H:i:s", $this->customlib->datetostrtotime($date)),
                'patient_name' => $this->input->post('patient_name'),
                'gender' => $this->input->post('gender'),
                'email' => $this->input->post('email'),
                'mobileno' => $countryCode.$number,
                'doctor' => $this->input->post('doctor'),
                'doctor_fee' => $this->input->post('doctor_fee'),
                'appointpriority' => $this->input->post('edit_appointment_priority'),
                'message' => $this->input->post('message'),
              //  'appointment_status' => $this->input->post('appointment_status')
            );
            $this->appointment_model->update($appointment);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Saved Successfully.');
        }
        echo json_encode($array);
    }

    public function delete($id) {
        if (!empty($id)) {
            $this->appointment_model->delete($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function move($id) {
        $appointment_details = $this->appointment_model->getDetails($id);
        $patient_name = $appointment_details['patient_name'];

        $gender = $appointment_details['gender'];
        $email = $appointment_details['email'];
        $phone = $appointment_details['mobileno'];
        $doctor = $appointment_details['doctor'];
        $note = $appointment_details['message'];
        $appointment_date = $appointment_details['date'];
        $amount = $appointment_details['amount'];

        $check_patient_id = $this->patient_model->getMaxId();
        if (empty($check_patient_id)) {
            $check_patient_id = 1000;
        }
        $patient_id = $check_patient_id + 1;


        $patient_data = array(
            'patient_name' => $patient_name,
            'mobileno' => $phone,
            'email' => $email,
            'gender' => $gender,
            'patient_unique_id' => $patient_id,
            'note' => $note,
            'is_active' => 'yes',
        );


        $insert_id = $this->patient_model->add_patient($patient_data);

        $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);
        $data_patient_login = array(
            'username' => $this->patient_login_prefix . $insert_id,
            'password' => $user_password,
            'user_id' => $insert_id,
            'role' => 'patient'
        );
        $this->user_model->add($data_patient_login);
        $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
            $fileInfo = pathinfo($_FILES["file"]["name"]);
            $img_name = $insert_id . '.' . $fileInfo['extension'];
            move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
            $data_img = array('id' => $insert_id, 'image' => 'uploads/patient_images/' . $img_name);
            $this->patient_model->add($data_img);
        }
        if (isset($insert_id)) {

            $check_opd_id = $this->patient_model->getMaxOPDId();
            $opdnoid = $check_opd_id + 1;

            $opd_data = array(
                'appointment_date' => $appointment_date,
                'opd_no' => 'OPDN' . $opdnoid,
                'cons_doctor' => $doctor,
                'patient_id' => $insert_id,
                'amount' => $amount
            );
            $opd_id = $this->patient_model->add_opd($opd_data);

            if (isset($opd_id)) {
                $this->appointment_model->delete($id);
            }
        }

        redirect('admin/appointment/search');
    }

    public function moveopd($id) {

        $appointment_details = $this->appointment_model->getDetails($id);
        $appointment_id = $appointment_details['id'];
        $patient_name = $appointment_details['patient_name'];
        $patient_id = $appointment_details['patient_id'];
        $gender = $appointment_details['gender'];
        $email = $appointment_details['email'];
        $phone = $appointment_details['mobileno'];
        $doctor = $appointment_details['doctor'];
        $note = $appointment_details['message'];
        $appointment_date = $appointment_details['date'];
        $amount = $appointment_details['amount'];

        $opd_data = array(
            'appointment_date' => $appointment_date,
            'cons_doctor' => $doctor,
            'patient_id' => $patient_id,
        );

        $patient_data = array(
            'patient_name' => $patient_name,
            'gender' => $gender,
            'email' => $email,
            'phone' => $phone,
            'appointment_date' => $appointment_date,
            'cons_doctor' => $doctor,
        );

        if (!empty($patient_id)) {

            $data['opd_data'] = $opd_data;
        } else {
            $data['opd_data'] = $patient_data;
        }

        //$updateData = array('id' => $appointment_id, 'is_opd' =>'yes');
        // $this->appointment_model->update($updateData);
        $this->session->set_userdata("appointment_id", $appointment_id);
        $this->session->set_flashdata('opd_data', $data);
      $this->session->set_userdata('moveopd_marker', true);
        redirect("admin/patient/search/");
    }

    public function moveipd($id) {

        $appointment_details = $this->appointment_model->getDetails($id);

        $appointment_id = $appointment_details['id'];
        $patient_name = $appointment_details['patient_name'];
        $patient_id = $appointment_details['patient_id'];
        $gender = $appointment_details['gender'];
        $email = $appointment_details['email'];
        $phone = $appointment_details['mobileno'];
        $doctor = $appointment_details['doctor'];
        $note = $appointment_details['message'];
        $appointment_date = $appointment_details['date'];
        $amount = $appointment_details['amount'];

        $ipd_data = array(
            'appointment_date' => $appointment_date,
            'cons_doctor' => $doctor,
            'patient_id' => $patient_id,
        );

        $patient_data = array(
            'patient_name' => $patient_name,
            'gender' => $gender,
            'email' => $email,
            'phone' => $phone,
            'appointment_date' => $appointment_date,
            'cons_doctor' => $doctor,
        );

        if (!empty($patient_id)) {

            $data['ipd_data'] = $ipd_data;
        } else {
            $data['ipd_data'] = $patient_data;
        }

        //  $updateData = array('id' => $appointment_id, 'is_ipd' =>'yes');
        //$this->appointment_model->update($updateData);
        $this->session->set_userdata("appointment_id", $appointment_id);
        $this->session->set_flashdata('ipd_data', $data);
        $this->session->set_userdata('moveipd_marker', true);
        redirect("admin/patient/ipdsearch/");
    }

    public function getpatientDetails() {
        $id = $this->input->post("patient_id");
        $result = $this->appointment_model->getpatientDetails($id);
        echo json_encode($result);
    }

    public function appointmentreport() {

        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/appointment/appointmentReport');
        $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
        $data['doctorlist'] = $doctorlist;

        $select = 'appointment.*,staff.name,staff.surname';
        $join = array(
            'JOIN staff ON staff.id = appointment.doctor',
        );
        $where = array();
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata['role_id'];
        $user_id = $userdata["id"];
        $doctorid = $this->input->post('doctor');
        $disable_option = FALSE;
        $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
        if ($doctor_restriction == 'enabled') {
            if ($role_id == 3) {

                $user_id = $userdata["id"];
                $doctorid = $user_id;
                $where = array(
                    "appointment.doctor = " . $user_id,
                );
                $disable_option = TRUE;
            }
        }
        $data['disable_option'] = $disable_option;
        $data['user_id'] = $user_id;



        $data['doctor_select'] = $doctorid;
        if (!empty($doctorid)) {
            $where = array('appointment.doctor =' . $doctorid);
        }
        $table_name = "appointment";

        $search_type = $this->input->post("search_type");
        if (isset($search_type)) {
            $search_type = $this->input->post("search_type");
        } else {
            $search_type = "this_month";
        }
        if (empty($search_type)) {
            $search_type = "";
            $resultlist = $this->report_model->getReport($select, $join, $table_name, $where);
        } else {

            $search_table = "appointment";
            $search_column = "date";
            $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $where);
        }

        $data["searchlist"] = $this->search_type;
        $data["search_type"] = $search_type;
        $data["resultlist"] = $resultlist;
        $this->load->view('layout/header');
        $this->load->view('admin/appointment/appointmentReport.php', $data);
        $this->load->view('layout/footer');
    }
///////////////////////////////Added by Nalini 05-06-2024/////////////////////////////////////////
 public function onlineappointment() {
       /* if (!$this->rbac->hasPrivilege('charge_category', 'can_view')) {
            access_denied();
        }*/
       // $this->session->set_userdata('top_menu', 'setup');
       // $this->session->set_userdata('sub_menu', 'charges/index');
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
            $this->load->view("layout/header");
            $this->load->view("admin/appointment/onlineappointment", $data);
            $this->load->view("layout/footer");
        
    }

   public function shift() {
       /* if (!$this->rbac->hasPrivilege('charge_category', 'can_view')) {
            access_denied();
        }*/
       // $this->session->set_userdata('top_menu', 'setup');
       // $this->session->set_userdata('sub_menu', 'charges/index');

        $shifts = $this->appointment_model->getShifts();
        $data["shifts"] = $shifts;
       
            $this->load->view("layout/header");
            $this->load->view("admin/appointment/shift", $data);
            $this->load->view("layout/footer");
     
    }

function add_shift() {
        /*if (!$this->rbac->hasPrivilege('charge_category', 'can_add')) {
            access_denied();
        }*/
        $this->form_validation->set_rules(
                'name', $this->lang->line('name'), array('required',
            array('check_exists', array($this->appointment_model, 'valid_shift'))
                )
        );
        $this->form_validation->set_rules('time_from', 'time_from', 'required');
        $this->form_validation->set_rules('time_to', 'time_to', 'required');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('name'),
                'time_from' => form_error('time_from'),
                'time_to' => form_error('time_to'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $name = $this->input->post("name");
            $time_from = $this->input->post("time_from");
            $time_to = $this->input->post("time_to");
            $shiftid = $this->input->post("id");
             $is_active = $this->input->post("is_active");
            if (!empty($shiftid)) {
                $data = array('name' => $name, 'time_from' => $time_from, 'time_to' => $time_to, 'id' => $shiftid,'is_active'=> $is_active);
            } else {
                $data = array('name' => $name, 'time_from' => $time_from, 'time_to' => $time_to);
            }
            $insert_id = $this->appointment_model->addShift($data);
            if (!empty($shiftid)) {
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {

                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
        }
        echo json_encode($array);
    }
 function delete_shift($id) {
       // if (!$this->rbac->hasPrivilege('charge_category', 'can_delete')) {
          //  access_denied();
       // }
        $this->appointment_model->delete_shift($id);
        redirect('admin/appointment/shift');
    }
     function get_data_shift($id) {
        $result = $this->appointment_model->getShifts($id);
        echo json_encode($result);
    }
   public function doctor_shift() {
       /* if (!$this->rbac->hasPrivilege('charge_category', 'can_view')) {
            access_denied();
        }*/
       // $this->session->set_userdata('top_menu', 'setup');
       // $this->session->set_userdata('sub_menu', 'charges/index');

        $shifts = $this->appointment_model->getShiftsActive();
        $data["shifts"] = $shifts;
      
         $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        
       
            $this->load->view("layout/header");
            $this->load->view("admin/appointment/doctor_shift", $data);
            $this->load->view("layout/footer");
     
    }
    
   
   
     public function editDoctorGlobalShift() {
        // Get the POST data
        $doctor_id = $this->input->post('doctor_id');
        $shift_id = $this->input->post('shift_id');
        $status = $this->input->post('status');

        if ($doctor_id && $shift_id && isset($status)) {
            // Convert shift ID to shift name
            $shift_name = $this->appointment_model->getShiftNameById($shift_id);

            if ($shift_name) {
                // Update the doctor's shift status
                $result = $this->appointment_model->updateDoctorShiftStatus($doctor_id, $shift_name, $status);

                if ($result) {
                    echo json_encode(['status' => 'success', 'message' => 'Shift status updated successfully']);
                } else {
                    echo json_encode(['status' => 'error', 'message' => 'Failed to update shift status']);
                }
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Invalid shift ID']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Missing required parameters']);
        }
    }
}
