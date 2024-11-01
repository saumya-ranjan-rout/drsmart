<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class patient extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->config->load("image_valid");
        $this->config->load("mailsms");
        $this->notification = $this->config->item('notification');
        $this->notificationurl = $this->config->item('notification_url');
        $this->patient_notificationurl = $this->config->item('patient_notification_url');
        $this->load->library('Enc_lib');
        $this->load->library('encoding_lib');
        $this->load->library('mailsmsconf');
        $this->load->library('CSVReader');
        $this->load->library('Customlib');
        $this->marital_status = $this->config->item('marital_status');
        $this->payment_mode = $this->config->item('payment_mode');
        $this->search_type = $this->config->item('search_type');
        $this->blood_group = $this->config->item('bloodgroup');

        $this->charge_type = $this->config->item('charge_type');
        $data["charge_type"] = $this->charge_type;
        $this->patient_login_prefix = "pat";
        $this->load->model('Hospitaldepartment_model');
    }

    public function unauthorized()
    {
        $data = array();
        $this->load->view('layout/header', $data);
        $this->load->view('unauthorized', $data);
        $this->load->view('layout/footer', $data);
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_add')) {
            access_denied();
        }
        $patient_type = $this->customlib->getPatienttype();

        $this->form_validation->set_rules('appointment_date', $this->lang->line('appointment') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('consultant') . " " . $this->lang->line('doctor'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('patient_id', $this->lang->line('patient'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line('applied') . " " . $this->lang->line('charge'), 'trim|required|xss_clean');

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }


        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'appointment_date' => form_error('appointment_date'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'patient_id' => form_error('patient_id'),
                'amount' => form_error('amount'),
                'cheque_no' => form_error('cheque_no'),
                'cheque_date' => form_error('cheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $chequedate = $this->input->post('cheque_date');
            if ($this->input->post('payment_mode') == "Cheque") {
                $cheque_date = date('Y-m-d', $this->customlib->datetostrtotime($chequedate));
                $cheque_no = $this->input->post('cheque_no');
            } else {
                $cheque_date = "";
                $cheque_no = "";
            }

            $check_opd_id = $this->patient_model->getMaxOPDId();
            $opdnoid = $check_opd_id + 1;
            $doctor_id = $this->input->post('consultant_doctor');
            $insert_id = $this->input->post('patient_id');
            $email = $this->input->post('email');
            $mobileno = $this->input->post('mobileno');
            $patient_name = $this->input->post('patient_name');
            $appointment_date = $this->input->post('appointment_date');
            $isopd = $this->input->post('is_opd');
            $appointmentid = $this->input->post('appointment_id');
            $opd_data = array(
                'appointment_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                'case_type' => $this->input->post('case'),
                'opd_no' => 'OPDN' . $opdnoid,
                'symptoms' => $this->input->post('symptoms'),
                'refference' => $this->input->post('refference'),
                'cons_doctor' => $doctor_id,
                'height' => $this->input->post('height'),
                'weight' => $this->input->post('weight'),
                'bp' => $this->input->post('bp'),
                'pulse' => $this->input->post('pulse'),
                'temperature' => $this->input->post('temperature'),
                'respiration' => $this->input->post('respiration'),
                'pre_medical_issue' => $this->input->post('pmi'),
                'patient_id' => $insert_id,
                'casualty' => $this->input->post('casualty'),
                'organisation' => $this->input->post('organisation'),
                'payment_mode' => $this->input->post('payment_mode'),
                'note_remark' => $this->input->post('note'),
                'amount' => $this->input->post('amount'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
                'cheque_no' => $cheque_no,
                'cheque_date' => $cheque_date,
            );
            $opdn_id = $this->patient_model->add_opd($opd_data);
            $opd_no = 'OPDN' . $opdnoid;
            $notificationurl = $this->notificationurl;
            $url_link = $notificationurl["opd"];
            $url = base_url() . $url_link . '/' . $insert_id . '/' . $opdn_id;

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'), 'id' => $insert_id, 'opd_id' => $opdn_id);
            if ($this->session->has_userdata("appointment_id")) {
                $appointment_id = $this->session->userdata("appointment_id");
                $updateData = array('id' => $appointment_id, 'is_opd' => 'yes');
                $this->appointment_model->update($updateData);
                $this->session->unset_userdata('appointment_id');
            }

            $this->opdNotification($insert_id, $doctor_id, $opd_no, $url);

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'image' => 'uploads/patient_images/' . $img_name);
                $this->patient_model->add($data_img);
            }

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $opdn_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $opdn_id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->patient_model->add_opd($data_img);
            }

            $sender_details = array('patient_id' => $insert_id, 'patient_name' => $patient_name, 'opd_no' => $opd_no, 'contact_no' => $mobileno, 'email' => $email);
            $this->mailsmsconf->mailsms('opd_patient_registration', $sender_details);

            /* $sender_details = array('patient_id' => $insert_id, 'opd_no' => $opd_no, 'contact_no' => $this->input->post('contact'), 'email' => $this->input->post('email'));
            $this->mailsmsconf->mailsms('opd_patient_registration', $sender_details);*/
        }

        echo json_encode($array);
    }

    public function patientDetails()
    {

        if (!$this->rbac->hasPrivilege('patient', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $data = $this->patient_model->patientDetails($id);
        if (($data['dob'] == '') || ($data['dob'] == '0000-00-00') || ($data['dob'] == '1970-01-01')) {
            $data['dob'] = "";
        } else {
            $data['dob'] = date($this->customlib->getSchoolDateFormat(true, false), strtotime($data['dob']));
        }
        // $data['dob'] = date($this->customlib->getSchoolDateFormat(true,false),strtotime($data['dob']));
        //$listVehicle["death_date"] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($listVehicle['death_date']));
        echo json_encode($data);
    }

    public function getPatientType()
    {
        $opd_ipd_patient_type = $this->input->post('opd_ipd_patient_type');
        $opd_ipd_no = $this->input->post('opd_ipd_no');
        if ($opd_ipd_patient_type == 'opd') {
            if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
                access_denied();
            }
            $result = $this->patient_model->getOpdPatient($opd_ipd_no);
        } elseif ($opd_ipd_patient_type == 'ipd') {
            if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
                access_denied();
            }
            $result = $this->patient_model->getIpdPatient($opd_ipd_no);
        }
        echo json_encode($result);
    }

    public function add_revisit()
    {
        if (!$this->rbac->hasPrivilege('revisit', 'can_add')) {
            access_denied();
        }

        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('appointment_date', $this->lang->line('appointment') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('consultant') . " " . $this->lang->line('doctor'), 'trim|required|xss_clean');

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'appointment_date' => form_error('appointment_date'),
                'amount' => form_error('amount'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'cheque_no' => form_error('cheque_no'),
                'cheque_date' => form_error('cheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $chequedate = $this->input->post('cheque_date');
            if ($this->input->post('payment_mode') == "Cheque") {
                $cheque_date = date('Y-m-d', $this->customlib->datetostrtotime($chequedate));
                $cheque_no = $this->input->post('cheque_no');
            } else {
                $cheque_date = "";
                $cheque_no = "";
            }

            $check_patient_id = $this->patient_model->getMaxOPDId();
            if (empty($check_patient_id)) {
                $check_patient_id = 0;
            }
            $patient_id = $this->input->post('id');
            $email = $this->input->post('email');
            $mobileno = $this->input->post('mobileno');
            $opdn_id = $check_patient_id + 1;

            $patient_data = array(
                'id' => $this->input->post('id'),
                'old_patient' => $this->input->post('old_patient'),
            );
            $this->patient_model->add($patient_data);
            $appointment_date = $this->input->post('appointment_date');
            $opd_data = array(
                'patient_id' => $this->input->post('id'),
                'appointment_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                'opd_no' => 'OPDN' . $opdn_id,
                'height' => $this->input->post('height'),
                'weight' => $this->input->post('weight'),
                'bp' => $this->input->post('bp'),
                'case_type' => $this->input->post('revisit_case'),
                'symptoms' => $this->input->post('symptoms'),
                'known_allergies' => $this->input->post('known_allergies'),
                'refference' => $this->input->post('refference'),
                'cons_doctor' => $this->input->post('consultant_doctor'),
                'amount' => $this->input->post('amount'),
                'casualty' => $this->input->post('casualty'),
                'payment_mode' => $this->input->post('payment_mode'),
                'note_remark' => $this->input->post('note_remark'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
                'cheque_no' => $cheque_no,
                'cheque_date' => $cheque_date,
            );
            $opd_id = $this->patient_model->add_opd($opd_data);

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $opd_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $opd_id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->patient_model->add_opd($data_img);
            }

            $notificationurl = $this->notificationurl;
            $url_link = $notificationurl["opd"];
            $url = base_url() . $url_link . '/' . $patient_id . '/' . $opd_id;

            // $sender_details = array('patient_id' => $patient_id, 'opd_no' => 'OPDN' . $opdn_id, 'contact_no' => $this->input->post('contact'), 'email' => $this->input->post('email'));


            $this->opdNotification($this->input->post("id"), $this->input->post("consultant_doctor"), 'OPDN' . $opdn_id, $url);

            $sender_details = array('patient_id' => $patient_id, 'opd_no' => 'OPDN' . $opdn_id, 'contact_no' => $mobileno, 'email' => $email);
            $this->mailsmsconf->mailsms('patient_revisit', $sender_details);

            $array = array('status' => 'success', 'error' => '', 'id' => $opd_id, 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function getPatientId()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }
        $result = $this->patient_model->getPatientId();
        $data["result"] = $result;
        echo json_encode($result);
    }


    public function doctCharge()
    {

        if (!$this->rbac->hasPrivilege('doctor_charges', 'can_view')) {
            access_denied();
        }
        $doctor = $this->input->post("doctor");
        $organisation = $this->input->post("organisation");
        $data = $this->patient_model->doctortpaCharge($doctor, $organisation);

        echo json_encode($data);
    }

    public function doctortpaCharge()
    {
        if (!$this->rbac->hasPrivilege('patient', 'can_view')) {
            access_denied();
        }

        $doctor = $this->input->post("doctor");
        $organisation = $this->input->post("organisation");
        $result = $this->patient_model->doctortpaCharge($doctor, $organisation);
        $data['result'] = $result;
        echo json_encode($result);
    }

    public function doctName()
    {


        $doctor = $this->input->post("doctor");
        $data = $this->patient_model->doctName($doctor);
        echo json_encode($data);
    }

    public function opdNotification($patient_id = '', $doctor_id, $opd_no = '', $url)
    {

        $notification = $this->notification;
        $notification_desc = $notification["opd_created"];
        $desc = str_replace(array('<opdno>', '<url>'), array($opd_no, $url), $notification_desc);
        $patient_url = $this->patient_notificationurl['opd'];
        $patient_desc = str_replace(array('<opdno>', '<url>'), array($opd_no, base_url() . $patient_url), $notification_desc);
        if (!empty($patient_id)) {
            $notification_data = array(
                'notification_title' => 'OPD Visit Created',
                'notification_desc' => $patient_desc,
                'notification_for' => 'Patient',
                'notification_type' => 'opd',
                'receiver_id' => $patient_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $admin_notification_data = array(
                'notification_title' => 'OPD Visit Created',
                'notification_desc' => $desc,
                'notification_for' => 'Super Admin',
                'notification_type' => 'opd',
                'receiver_id' => '',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
            $this->notification_model->addSystemNotification($admin_notification_data);
        }

        if (!empty($doctor_id)) {

            $notification_data = array(
                'notification_title' => 'OPD Visit Created',
                'notification_desc' => $desc,
                'notification_for' => 'Doctor',
                'notification_type' => 'opd',
                'receiver_id' => $doctor_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
        }
    }

    public function ipdNotification($patient_id = '', $doctor_id, $ipdno = '', $url)
    {

        $notification = $this->notification;
        $notification_desc = $notification["ipd_created"];
        $desc = str_replace(array('<ipdno>', '<url>'), array($ipdno, $url), $notification_desc);
        $patient_url = $this->patient_notificationurl['ipd'];
        $patient_desc = str_replace(array('<ipdno>', '<url>'), array($ipdno, base_url() . $patient_url), $notification_desc);

        if (!empty($patient_id)) {
            $notification_data = array(
                'notification_title' => 'IPD Visit Created',
                'notification_desc' => $patient_desc,
                'notification_for' => 'Patient',
                'notification_type' => 'ipd',
                'receiver_id' => $patient_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );

            $admin_notification_data = array(
                'notification_title' => 'IPD Visit Created',
                'notification_desc' => $desc,
                'notification_for' => 'Super Admin',
                'notification_type' => 'ipd',
                'receiver_id' => '',
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
            $this->notification_model->addSystemNotification($admin_notification_data);
        }

        if (!empty($doctor_id)) {

            $notification_data = array(
                'notification_title' => 'IPD Visit Created',
                'notification_desc' => $desc,
                'notification_for' => 'Doctor',
                'notification_type' => 'ipd',
                'receiver_id' => $doctor_id,
                'date' => date("Y-m-d H:i:s"),
                'is_active' => 'yes',
            );
            $this->notification_model->addSystemNotification($notification_data);
        }
    }

 public function addpatient()
    {
        // if (!$this->rbac->hasPrivilege('patient', 'can_add')) {
        //     access_denied();
        // }
        $this->form_validation->set_rules('guardian_name', $this->lang->line('guardian_name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('number', $this->lang->line('mobile_no'), 'trim|required|callback_valid_mobile_number');
        $this->form_validation->set_rules('file', $this->lang->line('image'), 'callback_handle_upload');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('name'),
                'guardian_name' => form_error('guardian_name'),
                'number' => form_error('number'),
                'file' => form_error('file'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $check_patient_id = $this->patient_model->getMaxId();

            if (empty($check_patient_id)) {
                $check_patient_id = 1000;
            }

            $patient_id = $check_patient_id + 1;
            $dobdate = $this->input->post('dob');

            // $dob =   date("Y-m-d H:i:s", $this->customlib->datetostrtotime($dobdate));
            if ($dobdate == "") {
                $dob = "";
            } else {
                $dob = date('Y-m-d', $this->customlib->datetostrtotime($dobdate));
            }
            // print_r($dob);
            //  exit();
            // print_r($dob);
            //  exit();
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('number');
            $countryCode_altno = $this->input->post('countryCode_altno');
            $alternative_no = $this->input->post('alternative_no');
            $patient_data = array(
                'patient_name' => $this->input->post('name'),
                'mobileno' => $countryCode . $number,
                'marital_status' => $this->input->post('marital_status'),
                'email' => $this->input->post('email'),
                'gender' => $this->input->post('gender'),
                'guardian_name' => $this->input->post('guardian_name'),
                'blood_group' => $this->input->post('blood_group'),
                'identity_number' => $this->input->post('identification_number'),
                'address' => $this->input->post('address'),
                'tpa' => $this->input->post('tpa'),
                'tpa_id' => $this->input->post('tpa_id'),
                'tpa_validity' => $this->input->post('tpa_validity'),
                'alternative_no' =>  $countryCode_altno . $alternative_no,
                'known_allergies' => $this->input->post('known_allergies'),
                'patient_unique_id' => $patient_id,
                'note' => $this->input->post('note'),
                'age' => $this->input->post('age'),
                'month' => $this->input->post('month'),
                'dob' => $dob,
                'is_active' => 'yes',
                'discharged' => 'no',
            );
            $insert_id = $this->patient_model->add_patient($patient_data);
            if ($this->session->has_userdata("appointment_id")) {
                $appointment_id = $this->session->userdata("appointment_id");
                $updateData = array('id' => $appointment_id, 'patient_id' => $insert_id);
                $this->appointment_model->update($updateData);
                // $this->session->unset_userdata('appointment_id');
            }
            $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);
            $data_patient_login = array(
                'username' => $this->patient_login_prefix . $insert_id,
                'password' => $user_password,
                'user_id' => $insert_id,
                'role' => 'patient'
            );
            $this->user_model->add($data_patient_login);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'), 'id' => $insert_id);

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'image' => 'uploads/patient_images/' . $img_name);
            } else {
                $data_img = array('id' => $insert_id, 'image' => 'uploads/patient_images/no_image.png');
            }
            $this->patient_model->add($data_img);

//Barcode
            // $generator = new BarcodeGeneratorPNG();
            // $barcodeImage = $generator->getBarcode($insert_id, $generator::TYPE_CODE_128);
            // $barcodeFilePath = FCPATH . 'uploads/barcode/' . $insert_id . '.png'; 
            // file_put_contents($barcodeFilePath, $barcodeImage);

            $barcodeUrl = 'https://barcode.tec-it.com/barcode.ashx?data=' . $insert_id . '&code=Code128&dpi=96';
$barcodeFilePath = FCPATH . 'uploads/barcode/' . $insert_id . '.png';
$barcodeImage = file_get_contents($barcodeUrl);
file_put_contents($barcodeFilePath, $barcodeImage);

//Barcode

//Qrcode
// $data = $insert_id;
// $filename = FCPATH . 'uploads/qrcode/' . $insert_id . '.png'; 
// QRcode::png($data, $filename, QR_ECLEVEL_L, 4);

$qrcodeUrl = 'https://api.qrserver.com/v1/create-qr-code/?data=' . urlencode($insert_id) . '&size=150x150';
$qrcodeFilePath = FCPATH . 'uploads/qrcode/' . $insert_id . '.png';
$qrcodeImage = file_get_contents($qrcodeUrl);
file_put_contents($qrcodeFilePath, $qrcodeImage);
//Qrcode



            $sender_details = array('id' => $insert_id, 'credential_for' => 'patient', 'username' => $this->patient_login_prefix . $insert_id, 'password' => $user_password, 'contact_no' => $this->input->post('mobileno'), 'email' => $this->input->post('email'));
            $this->mailsmsconf->mailsms('login_credential', $sender_details);
        }
        echo json_encode($array);
    }


    public function valid_mobile_number($number)
    {
        // Remove any non-digit characters
        $cleaned_number = preg_replace('/\D/', '', $number);

        // Debugging: Output the cleaned number
        log_message('debug', 'Cleaned Number: ' . $cleaned_number);

        // Check if the cleaned number contains exactly 7 digits
        if (preg_match('/^\d{7}$/', $cleaned_number)) {
            return TRUE;
        } else {
            $this->form_validation->set_message('valid_mobile_number', $this->lang->line('valid_mobile_number'));
            return FALSE;
        }
    }

    public function handle_upload()
    {

        $image_validate = $this->config->item('image_validate');

        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {

            $file_type = $_FILES["file"]['type'];
            $file_size = $_FILES["file"]["size"];
            $file_name = $_FILES["file"]["name"];
            $allowed_extension = $image_validate['allowed_extension'];
            $ext = pathinfo($file_name, PATHINFO_EXTENSION);
            $allowed_mime_type = $image_validate['allowed_mime_type'];
            if ($files = @getimagesize($_FILES['file']['tmp_name'])) {

                if (!in_array($files['mime'], $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', 'File Type Not Allowed');
                    return false;
                }

                if (!in_array(strtolower($ext), $allowed_extension) || !in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', 'Extension Not Allowed');
                    return false;
                }
                if ($file_size > $image_validate['upload_size']) {
                    $this->form_validation->set_message('handle_upload', $this->lang->line('file_size_shoud_be_less_than') . number_format($image_validate['upload_size'] / 1048576, 2) . " MB");
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_upload', "File Type / Extension Not Allowed");
                return false;
            }

            return true;
        }
        return true;
    }

    public function handle_csv_upload()
    {

        $image_validate = $this->config->item('filecsv_validate');

        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {

            $file_type = $_FILES["file"]['type'];
            $file_size = $_FILES["file"]["size"];
            $file_name = $_FILES["file"]["name"];
            $allowed_extension = $image_validate['allowed_extension'];
            $ext = pathinfo($file_name, PATHINFO_EXTENSION);
            $allowed_mime_type = $image_validate['allowed_mime_type'];
            if ($files = filesize($_FILES['file']['tmp_name'])) {

                if (!in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_csv_upload', $this->lang->line('file_type_not_allowed'));
                    return false;
                }

                if (!in_array($ext, $allowed_extension) || !in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_csv_upload', $this->lang->line('extension_not_allowed'));
                    return false;
                }
                if ($file_size > $image_validate['upload_size']) {
                    $this->form_validation->set_message('handle_csv_upload', $this->lang->line('file_size_shoud_be_less_than') . number_format($image_validate['upload_size'] / 1048576, 2) . " MB");
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_csv_upload', $this->lang->line('file_type_extension_not_allowed'));
                return false;
            }

            return true;
        } else {
            $this->form_validation->set_message('handle_csv_upload', $this->lang->line('file_field_required'));
            return false;
        }
        return true;
    }

    // public function getOldPatient() {
    //     if (!$this->rbac->hasPrivilege('old_patient', 'can_view')) {
    //         access_denied();
    //     }
    //     $this->session->set_userdata('top_menu', 'OPD_Out_Patient');
    //     $setting = $this->setting_model->get();
    //     $data['setting'] = $setting;
    //     $data['title'] = 'old_patient';
    //     $opd_month = $setting[0]['opd_record_month'];
    //     $data["marital_status"] = $this->marital_status;
    //     $data["payment_mode"] = $this->payment_mode;
    //     $data["bloodgroup"] = $this->blood_group;
    //     $doctors = $this->staff_model->getStaffbyrole(3);
    //     $data["doctors"] = $doctors;
    //     $resultlist = $this->patient_model->searchFullText($opd_month, '');
    //     $data['organisation'] = $this->organisation_model->get();
    //     $i = 0;
    //     foreach ($resultlist as $visits) {
    //         $patient_id = $visits["id"];
    //         $total_visit = $this->patient_model->totalVisit($patient_id);
    //         $last_visit = $this->patient_model->lastVisit($patient_id);
    //         $resultlist[$i]["total_visit"] = $total_visit["total_visit"];
    //         $resultlist[$i]["last_visit"] = $last_visit["last_visit"];
    //         $i++;
    //     }
    //     $data["resultlist"] = $resultlist;
    //     $this->load->view('layout/header');
    //     $this->load->view('admin/patient/search.php', $data);
    //     $this->load->view('layout/footer');
    // }

    public function exportformat()
    {
        $this->load->helper('download');
        $filepath = "./backend/import/import_patient_sample_file.csv";
        $data = file_get_contents($filepath);
        $name = 'import_patient_sample_file.csv';

        force_download($name, $data);
    }

    public function import()
    {
        if (!$this->rbac->hasPrivilege('patient_import', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'patient/import');

        $fields = array('patient_name', 'guardian_name', 'gender', 'age', 'month', 'blood_group', 'marital_status', 'mobileno', 'email', 'identity_number', 'address', 'note', 'known_allergies');
        $data["fields"] = $fields;
        $this->form_validation->set_rules('file', $this->lang->line('file'), 'callback_handle_csv_upload');

        if ($this->form_validation->run() == FALSE) {

            $this->load->view('layout/header');
            $this->load->view('admin/patient/import', $data);
            $this->load->view('layout/footer');
        } else {

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);

                if ($ext == 'csv') {
                    $file = $_FILES['file']['tmp_name'];
                    $result = $this->csvreader->parse_file($file);

                    if (!empty($result)) {
                        $check_patient_id = $this->patient_model->getMaxId();
                        if (empty($check_patient_id)) {
                            $check_patient_id = 1000;
                        }
                        $patient_id = $check_patient_id + 1;

                        $count = 0;
                        $error_flag = false; // Initialize error flag
                        $error_messages = ''; // Collect error messages

                        for ($i = 1; $i <= count($result); $i++) {

                            $patient_data[$i] = array();
                            $n = 0;
                            foreach ($result[$i] as $key => $value) {

                                $patient_data[$i][$fields[$n]] = $this->encoding_lib->toUTF8($result[$i][$key]);
                                $patient_data[$i]['is_active'] = 'yes';
                                $patient_data[$i]['discharged'] = 'no';
                                $patient_data[$i]['image'] = 'uploads/patient_images/no_image.png';
                                if ($i == 0) {
                                    $uniqueid = $patient_id;
                                } else {
                                    $uniqueid = $patient_id + $i;
                                }

                                $patient_data[$i]['patient_unique_id'] = $uniqueid;
                                $n++;
                            }

                            $patient_name = $patient_data[$i]["patient_name"];
                            $guardian_name = $patient_data[$i]["guardian_name"];
                            $mobileno = $patient_data[$i]["mobileno"];

                            // Validate patient_name (not empty)
                            if (empty($patient_name)) {
                                $error_flag = true;
                                $error_messages .= "Row $i: Patient name cannot be empty.<br>";
                                continue; // Skip further processing for this row
                            }

                            // Validate guardian_name (not empty)
                            if (empty($guardian_name)) {
                                $error_flag = true;
                                $error_messages .= "Row $i: Guardian name cannot be empty.<br>";
                                continue; // Skip further processing for this row
                            }

                            // Validate mobileno (not empty, must be numeric and 10 digits)
                            if (empty($mobileno) || !is_numeric($mobileno) || strlen($mobileno) != 7) {
                                $error_flag = true;
                                $error_messages .= "Row $i: Mobile number must be 7 digits.<br>";
                                continue; // Skip further processing for this row
                            }

                            if (!empty($patient_name)) {
                                $insert_id = $this->patient_model->addImport($patient_data[$i]);
                            }

                            if (!empty($insert_id)) {
                                $data['csvData'] = $result;
                                $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">' . $this->lang->line('students_imported_successfully') . '</div>');
                                $count++;
                                $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Total ' . count($result) . " records found in CSV file. Total " . $count . ' records imported successfully.</div>');
                            } else {
                                $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">' . $this->lang->line('record_already_exists') . '</div>');
                            }

                            // Generate user login credentials
                            $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);
                            $data_patient_login = array(
                                'username' => $this->patient_login_prefix . $insert_id,
                                'password' => $user_password,
                                'user_id' => $insert_id,
                                'role' => 'patient'
                            );
                            $this->user_model->add($data_patient_login);
                        }

                        // If any errors, display them
                        if ($error_flag) {
                            $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">' . $error_messages . '</div>');
                        }
                    }
                }
                redirect('admin/patient/import');
            }
        }
    }

    public function import_old()
    {
        if (!$this->rbac->hasPrivilege('patient_import', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'patient/import');

        $fields = array('patient_name', 'guardian_name', 'gender', 'age', 'month', 'blood_group', 'marital_status', 'mobileno', 'email', 'identity_number', 'address', 'note', 'known_allergies');
        $data["fields"] = $fields;
        $this->form_validation->set_rules('file', $this->lang->line('file'), 'callback_handle_csv_upload');

        if ($this->form_validation->run() == FALSE) {

            $this->load->view('layout/header');
            $this->load->view('admin/patient/import', $data);
            $this->load->view('layout/footer');
        } else {


            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);

                if ($ext == 'csv') {
                    $file = $_FILES['file']['tmp_name'];
                    $result = $this->csvreader->parse_file($file);

                    if (!empty($result)) {
                        $check_patient_id = $this->patient_model->getMaxId();
                        if (empty($check_patient_id)) {
                            $check_patient_id = 1000;
                        }
                        $patient_id = $check_patient_id + 1;

                        $count = 0;
                        for ($i = 1; $i <= count($result); $i++) {

                            $patient_data[$i] = array();
                            $n = 0;
                            foreach ($result[$i] as $key => $value) {

                                $patient_data[$i][$fields[$n]] = $this->encoding_lib->toUTF8($result[$i][$key]);
                                $patient_data[$i]['is_active'] = 'yes';
                                $patient_data[$i]['discharged'] = 'no';
                                $patient_data[$i]['image'] = 'uploads/patient_images/no_image.png';
                                if ($i == 0) {
                                    $uniqueid = $patient_id;
                                } else {
                                    $uniqueid = $patient_id + $i;
                                }

                                $patient_data[$i]['patient_unique_id'] = $uniqueid;
                                $n++;
                            }

                            $patient_name = $patient_data[$i]["patient_name"];


                            if (!empty($patient_name)) {
                                $insert_id = $this->patient_model->addImport($patient_data[$i]);
                            }

                            if (!empty($insert_id)) {
                                $data['csvData'] = $result;
                                $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">' . $this->lang->line('students_imported_successfully') . '</div>');
                                $count++;
                                $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Total ' . count($result) . " records found in CSV file. Total " . $count . ' records imported successfully.</div>');
                            } else {

                                $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">' . $this->lang->line('record_already_exists') . '</div>');
                            }

                            $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);
                            $data_patient_login = array(
                                'username' => $this->patient_login_prefix . $insert_id,
                                'password' => $user_password,
                                'user_id' => $insert_id,
                                'role' => 'patient'
                            );
                            $this->user_model->add($data_patient_login);
                            // $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'), 'id' => $insert_id);
                        }
                    }
                }
                redirect('admin/patient/import');
            }
        }
    }

    function check_medicine_exists($medicine_name, $medicine_category_id)
    {

        $this->db->where(array('medicine_category_id' => $medicine_category_id, 'medicine_name' => $medicine_name));
        $query = $this->db->join("medicine_category", "medicine_category.id = pharmacy.medicine_category_id")->get('pharmacy');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function search()
    {

        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }

        //  ini_set('display_errors', 1);
        // ini_set('display_startup_errors', 1);
        // error_reporting(E_ALL);

        $moveopd_marker = $this->session->userdata('moveopd_marker');

        if ($moveopd_marker) {
            // If marker exists, retrieve and use the flashdata
            $opd_data = $this->session->flashdata('opd_data');
            $data['opd_data'] = $opd_data;

            // Clear the marker after it's been used
            $this->session->unset_userdata('moveopd_marker');
        } else {
            // If no marker, clear flashdata and don't set opd_data
            $this->session->unset_userdata('opd_data');
            $data['opd_data'] = null;
        }
        $data["title"] = 'opd_patient';
        $this->session->set_userdata('top_menu', 'OPD_Out_Patient');
        $setting = $this->setting_model->get();
        $data['setting'] = $setting;
        $opd_month = $setting[0]['opd_record_month'];
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"] = $this->payment_mode;
        $data["bloodgroup"] = $this->blood_group;
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
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
        $resultlist = $this->patient_model->searchFullText('1', '');
        // echo "<pre>";
        // print_r($resultlist);
        // echo "</pre>";
        // exit();
        $data['organisation'] = $this->organisation_model->get();
        $i = 0;
        foreach ($resultlist as $visits) {
            $patient_id = $visits["pid"];
            $total_visit = $this->patient_model->totalVisit($patient_id);
            $last_visit = $this->patient_model->lastVisit($patient_id);
            $opdno = $this->patient_model->lastVisitopdno($patient_id);
            $consultant = $this->patient_model->getConsultant($patient_id, $opd_month);
            $resultlist[$i]["total_visit"] = $total_visit["total_visit"];
            $resultlist[$i]["last_visit"] = $last_visit["last_visit"];
            $resultlist[$i]["opdno"] = $opdno['opdno'];
            $i++;
        }

        $data["resultlist"] = $resultlist;

        $this->load->view('layout/header');
        $this->load->view('admin/patient/search.php', $data);
        $this->load->view('layout/footer');
    }

    public function getPatientList()
    {
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        echo json_encode($patients);
    }

    public function ipdsearch($bedid = '', $bedgroupid = '')
    {
        if (!$this->rbac->hasPrivilege('ipd_patient', 'can_view')) {
            access_denied();
        }

        $moveipd_marker = $this->session->userdata('moveipd_marker');

        if ($moveipd_marker) {
            // If marker exists, retrieve and use the flashdata
            $ipd_data = $this->session->flashdata('ipd_data');
            $data['ipd_data'] = $ipd_data;

            // Clear the marker after it's been used
            $this->session->unset_userdata('moveipd_marker');
        } else {
            // If no marker, clear flashdata and don't set opd_data
            $this->session->unset_userdata('ipd_data');
            $data['ipd_data'] = null;
        }

        if (!empty($bedgroupid)) {
            $data["bedid"] = $bedid;
            $data["bedgroupid"] = $bedgroupid;
        }
        $this->session->set_userdata('top_menu', 'IPD_in_patient');
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"] = $this->payment_mode;
        $data["bloodgroup"] = $this->blood_group;
        $data['bed_list'] = $this->bed_model->bedNoType();
        $data['floor_list'] = $this->floor_model->floor_list();
        $data['bedlist'] = $this->bed_model->bed_list();
        $data['bedgroup_list'] = $this->bedgroup_model->bedGroupFloor();
        $doctors = $this->staff_model->getStaffbyrole(3);
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        $data["doctors"] = $doctors;

        $department = $this->staff_model->getHospitalDepartment();
        $data["department"] = $department;

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
        $setting = $this->setting_model->get();

        $data['setting'] = $setting;

        $data['resultlist'] = $this->patient_model->search_ipd_patients('');
        //echo $this->db->last_query();
        // exit;
        $i = 0;
        foreach ($data['resultlist'] as $key => $value) {
            $charges = $this->patient_model->getCharges($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["charges"] = $charges['charge'];
            $payment = $this->patient_model->getPayment($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["payment"] = $payment['payment'];
            $i++;
        }

        $data['organisation'] = $this->organisation_model->get();

        $this->load->view('layout/header');
        $this->load->view('admin/patient/ipdsearch.php', $data);
        $this->load->view('layout/footer');
    }

    public function discharged_patients()
    {
        if (!$this->rbac->hasPrivilege('discharged patients', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'IPD_in_patient');
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"] = $this->payment_mode;
        $data["bloodgroup"] = $this->blood_group;
        $data['bed_list'] = $this->bed_model->bedNoType();
        $data['bedgroup_list'] = $this->bedgroup_model->bedGroupFloor();
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $setting = $this->setting_model->get();
        $data['setting'] = $setting;
        $data['resultlist'] = $this->patient_model->search_ipd_patients('', $active = 'yes', $discharged = 'yes');

        $i = 0;
        foreach ($data['resultlist'] as $key => $value) {
            $charges = $this->patient_model->getCharges($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["charges"] = $charges['charge'];
            $payment = $this->patient_model->getPayment($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["payment"] = $payment['payment'];
            $discharge_details = $this->patient_model->getIpdBillDetails($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["discharge_date"] = $discharge_details['date'];
            $data['resultlist'][$i]["other_charge"] = $discharge_details['other_charge'];
            $data['resultlist'][$i]["tax"] = $discharge_details['tax'];
            $data['resultlist'][$i]["discount"] = $discharge_details['discount'];
            $data['resultlist'][$i]["net_amount"] = $discharge_details['net_amount'] + $payment['payment'];
            $i++;
        }
        $data['organisation'] = $this->organisation_model->get();
        $this->load->view('layout/header');
        $this->load->view('admin/patient/dischargedPatients.php', $data);
        $this->load->view('layout/footer');
    }

    public function visitDetails($id, $visitid)
    {

        if (!empty($id)) {

            $result = $this->patient_model->getDetails($id, $visitid);
            $data['result'] = $result;
            $data["id"] = $id;
            $billstatus = $this->patient_model->getBillstatus($result["id"], $visitid);
            $data["billstatus"] = $billstatus;

            //print_r($billstatus);
            //exit();
            $data['visit_id'] = $visitid;
            $opd_details = $this->patient_model->getOPDetails($id);
            $visit_details = $this->patient_model->getVisitDetails($id, $visitid);
            $data['visit_details'] = $visit_details;
            $revisit_details = $this->patient_model->getVisitDetailsByOPD($id, $visitid);
            $data['revisit_details'] = $revisit_details;
            $doctors = $this->staff_model->getStaffbyrole(3);
            $data["doctors"] = $doctors;
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
            $data['organisation'] = $this->organisation_model->get();
            $data["doctor_select"] = $doctorid;
            $data["disable_option"] = $disable_option;
            $data["marital_status"] = $this->marital_status;
            $data["payment_mode"] = $this->payment_mode;
            $data["bloodgroup"] = $this->blood_group;
            $data["charge_type"] = $this->charge_type;
            $paymentDetails = $this->payment_model->opdPaymentDetails($id, $visitid);
            $diagnosis_details = $this->patient_model->getDiagnosisDetails($id);
            $timeline_list = $this->timeline_model->getPatientTimeline($id, $timeline_status = '');
            $data["timeline_list"] = $timeline_list;
            $data['opd_details'] = $opd_details;
            $data["payment_details"] = $paymentDetails;
            $data['diagnosis_details'] = $diagnosis_details;
            $data['medicineCategory'] = $this->medicine_category_model->getMedicineCategory();
            $data['dosage'] = $this->medicine_dosage_model->getMedicineDosage();
            $data['medicineName'] = $this->pharmacy_model->getMedicineName();

            $charges = $this->charge_model->getOPDCharges($id, $visitid);
            $paymentDetails = $this->payment_model->opdPaymentDetails($id, $visitid);
            $data["charges_detail"] = $charges;
            $data["payment_details"] = $paymentDetails;
            $paid_amount = $this->payment_model->getOPDPaidTotal($id, $visitid);
            $data["paid_amount"] = $paid_amount["paid_amount"];
            // print_r($result);
            // exit();
            if ($result['status'] == 'paid') {
                $generate = $this->patient_model->getopdBillInfo($result["id"], $visitid);
                $data["bill_info"] = $generate;
            }
            $this->load->view("layout/header");
            $this->load->view("admin/patient/visitDetails", $data);
            $this->load->view("layout/footer");
        }
    }

    public function addvisitDetails()
    {
        if (!$this->rbac->hasPrivilege('revisit', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('appointment_date', $this->lang->line('appointment') . " " . $this->lang->line('date'), 'trim|required|xss_clean');

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'firstname' => form_error('name'),
                'appointment_date' => form_error('appointment_date'),
                'amount' => form_error('amount'),
                'cheque_no' => form_error('cheque_no'),
                'cheque_date' => form_error('cheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $chequedate = $this->input->post('cheque_date');
            if ($this->input->post('payment_mode') == "Cheque") {
                $cheque_date = date('Y-m-d', $this->customlib->datetostrtotime($chequedate));
                $cheque_no = $this->input->post('cheque_no');
            } else {
                $cheque_date = "";
                $cheque_no = "";
            }

            $check_patient_id = $this->patient_model->getMaxOPDId();

            if (empty($check_patient_id)) {
                $check_patient_id = 0;
            }

            $opdn_id = $check_patient_id + 1;

            $patient_id = $this->input->post('id');


            $appointment_date = $this->input->post('appointment_date');
            $opd_data = array(
                'patient_id' => $this->input->post('id'),
                'appointment_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                'opd_no' => $this->input->post('opd_no'),
                'opd_id' => $this->input->post('opd_id'),
                'height' => $this->input->post('height'),
                'weight' => $this->input->post('weight'),
                'bp' => $this->input->post('bp'),
                'case_type' => $this->input->post('revisit_case'),
                'symptoms' => $this->input->post('symptoms'),
                'known_allergies' => $this->input->post('known_allergies'),
                'refference' => $this->input->post('refference'),
                'cons_doctor' => $this->input->post('consultant_doctor'),
                'amount' => $this->input->post('amount'),
                'casualty' => $this->input->post('casualty'),
                'payment_mode' => $this->input->post('payment_mode'),
                'note' => $this->input->post('note_remark'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
                'cheque_no' => $cheque_no,
                'cheque_date' => $cheque_date,
            );
            $opd_id = $this->patient_model->addvisitDetails($opd_data);

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $opd_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $opd_id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->patient_model->addvisitDetails($data_img);
            }

            $sender_details = array('patient_id' => $patient_id, 'opd_no' => 'OPDN' . $opdn_id, 'contact_no' => $this->input->post('contact'), 'email' => $this->input->post('email'));

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function profile($id)
    {


        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }

        $opd_data = $this->session->flashdata('opd_data');
        $data['opd_data'] = $opd_data;
        $opdn_data = $this->session->flashdata('opdn_data');
        $data['opdn_data'] = $opdn_data;
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"] = $this->payment_mode;
        $data["bloodgroup"] = $this->blood_group;
        $data['medicineCategory'] = $this->medicine_category_model->getMedicineCategory();
        $data['dosage'] = $this->medicine_dosage_model->getMedicineDosage();
        $data['medicineName'] = $this->pharmacy_model->getMedicineName();
        $data["charge_type"] = $this->charge_type;
        $charges = $this->charge_model->getOPDCharges($id, '');
        $paymentDetails = $this->payment_model->paymentDetails($id, '');
        $data["charges_detail"] = $charges;
        $data["payment_details"] = $paymentDetails;
        $paid_amount = $this->payment_model->getPaidTotal($id, '');
        $data["paid_amount"] = $paid_amount["paid_amount"];

        $data["id"] = $id;
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
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
        $result = array();
        $diagnosis_details = array();
        $opd_details = array();
        $timeline_list = array();

        if (!empty($id)) {
            //print_r($id);
            // exit();
            $result = $this->patient_model->getDetails($id);


            if ($result['status'] == 'paid') {
                $generate = $this->patient_model->getBillInfo($result["id"]);
                $data["bill_info"] = $generate;
            }

            $opd_details = $this->patient_model->getOPDetails($id);
            $diagnosis_details = $this->patient_model->getDiagnosisDetails($id);
            $timeline_list = $this->timeline_model->getPatientTimeline($id, $timeline_status = '');
        }
        // exit();

        $data["result"] = $result;
        $data["diagnosis_detail"] = $diagnosis_details;
        //print_r($opd_details);
        //exit;
        $data["opd_details"] = $opd_details;
        $data["timeline_list"] = $timeline_list;
        $data['organisation'] = $this->organisation_model->get();
        $this->load->view("layout/header");
        $this->load->view("admin/patient/profile", $data);
        $this->load->view("layout/footer");
    }

    public function ipdprofile($id, $ipdid = '', $active = 'yes')
    {

        if (!$this->rbac->hasPrivilege('ipd_patient', 'can_view')) {
            access_denied();
        }
        if ($ipdid == '') {
            $ipdresult = $this->patient_model->search_ipd_patients($searchterm = '', $active = 'yes', $discharged = 'no', $id);
            $ipdid = $ipdresult["ipdid"];
        }
        $this->session->set_userdata('top_menu', 'IPD_in_patient');
        $bed_history = $this->bed_model->getBedHistory($id, $ipdid);
        $data["bed_history"] = $bed_history;

        $setting = $this->setting_model->get();
        $data['setting'] = $setting;
        $data['bed_list'] = $this->bed_model->bedNoType();
        $data['bedgroup_list'] = $this->bedgroup_model->bedGroupFloor();
        $data['medicineCategory'] = $this->medicine_category_model->getMedicineCategory();
        $data['dosage'] = $this->medicine_dosage_model->getMedicineDosage();
        $data['medicineName'] = $this->pharmacy_model->getMedicineName();
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"] = $this->payment_mode;
        $data["bloodgroup"] = $this->blood_group;
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        $data['organisation'] = $this->organisation_model->get();
        $data['hospital_deapartment_list'] = $this->Hospitaldepartment_model->get();
        $data["id"] = $id;
        $data["ipdid"] = $ipdid;
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
       
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

        $nurseid = "";
        if ($role_id == 6) {
            $disable_option = TRUE;
            $nurseid = $userdata['id'];
        }
        $data["nurse_select"] = $nurseid;
        $data["disable_option"] = $disable_option;
        $result = array();
        $diagnosis_details = array();
        $opd_details = array();
        $timeline_list = array();
        $nursenote_list = array();
        $charges = array();
        if (!empty($id)) {
            $result = $this->patient_model->getIpdDetails($id, $ipdid, $active);
            if ($result['status'] == 'paid') {
                $generate = $this->patient_model->getBillInfo($result["id"]);
                $data["bill_info"] = $generate;
            }

            $nurses = explode(',', $result['nurses']);
            $nurse = $this->staff_model->getSelectedNurses($nurses);
            $data["nurse"] = $nurse;
            $diagnosis_details = $this->patient_model->getDiagnosisDetails($id);
            $timeline_list = $this->timeline_model->getPatientTimeline($id, $timeline_status = '');
            $prescription_details = $this->prescription_model->getIpdPrescription($ipdid);

            $consultant_register = $this->patient_model->getPatientConsultant($id, $ipdid);
            $charges = $this->charge_model->getCharges($id, $ipdid);
            $paymentDetails = $this->payment_model->paymentDetails($id, $ipdid);
            $paid_amount = $this->payment_model->getPaidTotal($id, $ipdid);
            $data["paid_amount"] = $paid_amount["paid_amount"];
            $balance_amount = $this->payment_model->getBalanceTotal($id, $ipdid);
            $data["balance_amount"] = $balance_amount["balance_amount"];
            $data["payment_details"] = $paymentDetails;
            $data["consultant_register"] = $consultant_register;
            $data["result"] = $result;
            $data["diagnosis_detail"] = $diagnosis_details;
            $data["prescription_detail"] = $prescription_details;
            $data["opd_details"] = $opd_details;
            $data["timeline_list"] = $timeline_list;
            $data["charge_type"] = $this->charge_type;
            $data["charges"] = $charges;

            $treatment_history = $this->patient_model->getTreatmentHistory($id, $ipdid);
            $data["treatment_history"] = $treatment_history;
            $nursenote_list = $this->patient_model->getPatientNurseNote($id);
            $data["nursenote_list"] = $nursenote_list;          
        }

        $this->load->view("layout/header");
        $this->load->view("admin/patient/ipdprofile", $data);
        $this->load->view("layout/footer");
    }

    public function patientipddetails($patient_id)
    {

        $data['resultlist'] = $this->patient_model->patientipddetails($patient_id);
        $i = 0;
        foreach ($data['resultlist'] as $key => $value) {
            $charges = $this->patient_model->getCharges($value["id"]);
            $data['resultlist'][$i]["charges"] = $charges['charge'];
            $payment = $this->patient_model->getPayment($value["id"]);
            $data['resultlist'][$i]["payment"] = $payment['payment'];
            $i++;
        }
        $data['organisation'] = $this->organisation_model->get();

        $this->load->view('layout/header');
        $this->load->view('admin/patient/patientipddetails.php', $data);
        $this->load->view('layout/footer');
    }

    public function deleteIpdPatientCharge($pateint_id, $id)
    {
        if (!$this->rbac->hasPrivilege('charges', 'can_delete')) {
            access_denied();
        }
        $this->charge_model->deleteIpdPatientCharge($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Charges deleted successfully</div>');
        redirect('admin/patient/ipdprofile/' . $pateint_id . '#charges');
    }

    public function deleteOpdPatientCharge($pateint_id, $opdid, $id)
    {

        if (!$this->rbac->hasPrivilege('charges', 'can_delete')) {
            access_denied();
        }
        $this->charge_model->deleteOpdPatientCharge($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Charges deleted successfully</div>');
        redirect('admin/patient/visitDetails/' . $pateint_id . '/' . $opdid . '#charges');
    }

    public function deleteIpdPatientConsultant($pateint_id, $id)
    {
        if (!$this->rbac->hasPrivilege('consultant register', 'can_add')) {
            access_denied();
        }
        $this->patient_model->deleteIpdPatientConsultant($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Consultant deleted successfully</div>');
    }

    public function deleteIpdPatientDiagnosis($pateint_id, $id)
    {
        if (!$this->rbac->hasPrivilege('ipd diagnosis', 'can_delete')) {
            access_denied();
        }
        $this->patient_model->deleteIpdPatientDiagnosis($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Diagnosis deleted successfully</div>');
        redirect('admin/patient/ipdprofile/' . $pateint_id . '#diagnosis');
    }

    public function deleteIpdPatientPayment($pateint_id, $id)
    {
        if (!$this->rbac->hasPrivilege('payment', 'can_delete')) {
            access_denied();
        }
        $this->payment_model->deleteIpdPatientPayment($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Payment deleted successfully</div>');
        redirect('admin/patient/ipdprofile/' . $pateint_id . '#payment');
    }

    public function deleteOpdPatientPayment($pateint_id, $id, $opd_id)
    {
        if (!$this->rbac->hasPrivilege('payment', 'can_delete')) {
            access_denied();
        }
        $this->payment_model->deleteopdPatientPayment($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success">Patient Payment deleted successfully</div>');
        redirect('admin/patient/visitdetails/' . $pateint_id . '/' . $opd_id . '#payment');
    }

    public function deleteOpdPatientDiagnosis($pateint_id, $id)
    {
        if (!$this->rbac->hasPrivilege('opd diagnosis', 'can_delete')) {
            access_denied();
        }
        $this->patient_model->deleteIpdPatientDiagnosis($id);
    }

    public function report_download($doc)
    {
        $this->load->helper('download');
        $filepath = "./" . $this->uri->segment(4) . "/" . $this->uri->segment(5) . "/" . $this->uri->segment(6);
        $data = file_get_contents($filepath);
        $name = $this->uri->segment(6);
        force_download($name, $data);
    }

    public function getDetails()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("patient_id");

        $opdid = $this->input->post("opd_id");

        $visitid = $this->input->post("visitid");

        $result = $this->patient_model->getDetails($id, $opdid);
        //print_r($result);
        //  exit();


        if ((!empty($visitid))) {

            $result = $this->patient_model->getpatientDetailsByVisitId($id, $visitid);
        }

        $appointment_date = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['appointment_date']));

        $result["appointment_date"] = $appointment_date;

        echo json_encode($result);
    }

    public function getpatientDetails()
    {
        if (!$this->rbac->hasPrivilege('patient', 'can_view')) {
            access_denied();
        }

        $id = $this->input->post("id");

        $result = $this->patient_model->getpatientDetails($id);
        if (($result['dob'] == '') || ($result['dob'] == '0000-00-00') || ($result['dob'] == '1970-01-01')) {
            $result['dob'] = "";
        } else {
            $result['dob'] = date($this->customlib->getSchoolDateFormat(true, false), strtotime($result['dob']));
        }

        echo json_encode($result);
    }

    public function getIpdDetails()
    {
        if (!$this->rbac->hasPrivilege('ipd_patient', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("recordid");
        $ipdid = $this->input->post("ipdid");
        $active = $this->input->post("active");
        $result = $this->patient_model->getIpdDetails($id, $ipdid, $active);
        $result['date'] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date']));
        echo json_encode($result);
    }

      public function update()
    {
        if (!$this->rbac->hasPrivilege('patient', 'can_edit')) {
            access_denied();
        }
        $patient_type = $this->customlib->getPatienttype();
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('guardian_name', $this->lang->line('guardian_name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('emobileno', $this->lang->line('mobile_no'), 'trim|required|callback_valid_mobile_number');
        $this->form_validation->set_rules('file', $this->lang->line('image'), 'callback_handle_upload');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('name'),
                'guardian_name' => form_error('guardian_name'),
                'emobileno' => form_error('emobileno'),
                'file' => form_error('file'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('updateid');
            $dobdate = $this->input->post('dob');
            $dob = date("Y-m-d", $this->customlib->datetostrtotime($dobdate));
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('emobileno');
            $countryCode_altno = $this->input->post('countryCode_altno');
            $alternative_no = $this->input->post('alternative_no');
            $patient_data = array(
                'id' => $this->input->post('updateid'),
                'patient_name' => $this->input->post('name'),
                'mobileno' => $countryCode . $number,
                'marital_status' => $this->input->post('marital_status'),
                'blood_group' => $this->input->post('blood_group'),
                'email' => $this->input->post('email'),
                'dob' => $dob,
                'gender' => $this->input->post('gender'),
                'guardian_name' => $this->input->post('guardian_name'),
                'address' => $this->input->post('address'),
                'tpa' => $this->input->post('tpa'),
                'tpa_id' => $this->input->post('tpa_id'),
                'tpa_validity' => $this->input->post('tpa_validity'),
                'alternative_no' =>  $countryCode_altno . $alternative_no,
                'identity_number' => $this->input->post('identification_number'),
                'note' => $this->input->post('note'),
                'age' => $this->input->post('age'),
                'month' => $this->input->post('month'),
                'organisation' => $this->input->post('organisation'),
                'known_allergies' => $this->input->post('known_allergies'),
                'credit_limit' => $this->input->post('credit_limit'),
                'is_active' => 'yes',
            );

            $this->patient_model->add($patient_data);
            // String of all alphanumeric character 
            $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
            // Shufle the $str_result and returns substring 
            // of specified length 
            $alfa_no = substr(str_shuffle($str_result), 0, 5);
            $array = array('status' => 'success', 'error' => '', 'message' => "Record Updated Successfully");
            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $alfa_no . "_" . $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $id, 'image' => 'uploads/patient_images/' . $img_name);


                $this->patient_model->add($data_img);
            }
        }

        echo json_encode($array);
    }


    public function deactivePatient()
    {
        if (!$this->rbac->hasPrivilege('patient_deactive', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post('id');
        $patient_data = array(
            'id' => $id,
            'is_active' => 'no',
        );



        $this->patient_model->add($patient_data);
        $this->user_model->updateUser($id, 'no');
        $array = array('status' => 'success', 'error' => '', 'message' => "Record Deactive");
        echo json_encode($array);
    }

    public function activePatient()
    {
        if (!$this->rbac->hasPrivilege('patient_active', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post('activeid');

        $patientact_data = array(
            'id' => $id,
            'is_active' => 'yes',
        );

        $this->patient_model->add_patient($patientact_data);
        $this->user_model->updateUser($id, 'yes');
        $array = array('status' => 'success', 'error' => '', 'message' => "Record Active");
        echo json_encode($array);
    }

    public function ipd_update()
    {
        if (!$this->rbac->hasPrivilege('ipd_patient', 'can_edit')) {
            access_denied();
        }
        $patient_type = $this->customlib->getPatienttype();

        $this->form_validation->set_rules('cons_doctor', $this->lang->line('consultant') . " " . $this->lang->line('doctor'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('appointment_date', $this->lang->line('admission') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('bed_group_id', $this->lang->line('bed') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('bed_no', $this->lang->line('bed') . " " . $this->lang->line('number'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('file', $this->lang->line('image'), 'callback_handle_upload');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'patients_id' => form_error('patients_id'),
                'cons_doctor' => form_error('cons_doctor'),
                'appointment_date' => form_error('appointment_date'),
                'bed_group_id' => form_error('bed_group_id'),
                'bed_no' => form_error('bed_no'),
                'file' => form_error('file')
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('updateid');
            $appointment_date = $this->input->post('appointment_date');


            $patientid = $this->input->post('patient_id');
            $previous_bed_id = $this->input->post('previous_bed_id');
            $current_bed_id = $this->input->post('bed_no');
            if ($previous_bed_id != $current_bed_id) {
                $beddata = array('id' => $previous_bed_id, 'is_active' => 'yes');
                $this->bed_model->savebed($beddata);
            }
            $ipd_data = array(
                'id' => $this->input->post('ipdid'),
                'patient_id' => $patientid,
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                'bed' => $this->input->post('bed_no'),
                'bed_group_id' => $this->input->post('bed_group_id'),
                'height' => $this->input->post('height'),
                'bp' => $this->input->post('bp'),
                'pulse' => $this->input->post('pulse'),
                'temperature' => $this->input->post('temperature'),
                'respiration' => $this->input->post('respiration'),
                'pre_medical_issue' => $this->input->post('pmi'),
                'weight' => $this->input->post('weight'),
                'case_type' => $this->input->post('case_type'),
                'symptoms' => $this->input->post('symptoms'),
                'known_allergies' => $this->input->post('known_allergies'),
                'refference' => $this->input->post('refference'),
                'cons_doctor' => $this->input->post('cons_doctor'),
                'casualty' => $this->input->post('casualty'),
                'note' => $this->input->post('note'),
                'credit_limit' => $this->input->post('credit_limit'),
                'hospital_department' => $this->input->post('hospital_department'),
            );
            $bed_data = array('id' => $this->input->post('bed_no'), 'is_active' => 'no');
            $this->bed_model->savebed($bed_data);
            $ipd_id = $this->patient_model->add_ipd($ipd_data);
            $array = array('status' => 'success', 'error' => '', 'message' => "Patient Updated Successfully");
            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $id, 'image' => 'uploads/patient_images/' . $img_name);
                $this->patient_model->add($data_img);
            }
        }

        echo json_encode($array);
    }

    public function opd_detail_update()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post('opdid');
        $this->form_validation->set_rules('appointment_date', $this->lang->line('appointment') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('consultant') . " " . $this->lang->line('doctor'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('opdid', $this->lang->line('opd') . " " . $this->lang->line('id'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|xss_clean');

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }

        if ($this->form_validation->run() == TRUE) {
            $appointment_date = $this->input->post('appointment_date');

            $visitid = $this->input->post("visitid");
            $patient_data = array(
                'id' => $this->input->post('patientid'),
                'organisation' => $this->input->post('organisation'),
                'old_patient' => $this->input->post('old_patient'),
            );

            $chequedate = $this->input->post('cheque_date');
            if ($this->input->post('payment_mode') == "Cheque") {
                $cheque_date = date('Y-m-d', $this->customlib->datetostrtotime($chequedate));
                $cheque_no = $this->input->post('cheque_no');
            } else {
                $cheque_date = "";
                $cheque_no = "";
            }

            if (!empty($visitid)) {
                $opd_data = array(
                    'id' => $this->input->post('visitid'),
                    'appointment_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                    'case_type' => $this->input->post('case'),
                    'symptoms' => $this->input->post('symptoms'),
                    'known_allergies' => $this->input->post('known_allergies'),
                    'refference' => $this->input->post('refference'),
                    'cons_doctor' => $this->input->post('consultant_doctor'),
                    'amount' => $this->input->post('amount'),
                    'bp' => $this->input->post('bp'),
                    'pulse' => $this->input->post('epulse'),
                    'temperature' => $this->input->post('etemperature'),
                    'respiration' => $this->input->post('erespiration'),
                    'pre_medical_issue' => $this->input->post('epmi'),
                    'height' => $this->input->post('height'),
                    'weight' => $this->input->post('weight'),
                    'tax' => $this->input->post('tax'),
                    'casualty' => $this->input->post('casualty'),
                    'payment_mode' => $this->input->post('payment_mode'),
                    'note_remark' => $this->input->post('revisit_note'),
                    'cheque_no' => $cheque_no,
                    'cheque_date' => $cheque_date,
                );

                $opd_id = $this->patient_model->addvisitDetails($opd_data);

                if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                    $fileInfo = pathinfo($_FILES["document"]["name"]);
                    $img_name = $id . '.' . $fileInfo['extension'];
                    move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                    $data_img = array('id' => $id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                    $this->patient_model->add_opd($data_img);
                } else {
                    $data_img = array('id' => $id, 'payment_doc' => "");
                    $this->patient_model->addvisitDetails($data_img);
                }
            } else {
                $opd_data = array(
                    'id' => $this->input->post('opdid'),
                    'appointment_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                    'case_type' => $this->input->post('case'),
                    'symptoms' => $this->input->post('symptoms'),
                    'known_allergies' => $this->input->post('known_allergies'),
                    'refference' => $this->input->post('refference'),
                    'cons_doctor' => $this->input->post('consultant_doctor'),
                    'amount' => $this->input->post('amount'),
                    'bp' => $this->input->post('bp'),
                    'pulse' => $this->input->post('epulse'),
                    'temperature' => $this->input->post('etemperature'),
                    'respiration' => $this->input->post('erespiration'),
                    'pre_medical_issue' => $this->input->post('epmi'),
                    'height' => $this->input->post('height'),
                    'weight' => $this->input->post('weight'),
                    'tax' => $this->input->post('tax'),
                    'casualty' => $this->input->post('casualty'),
                    'payment_mode' => $this->input->post('payment_mode'),
                    'note_remark' => $this->input->post('revisit_note'),
                    'cheque_no' => $cheque_no,
                    'cheque_date' => $cheque_date,
                );

                $opd_id = $this->patient_model->add_opd($opd_data);
            }

            $this->patient_model->add($patient_data);

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->patient_model->add_opd($data_img);
            } else {
                $data_img = array('id' => $id, 'payment_doc' => "");
                $this->patient_model->add_opd($data_img);
            }

            $array = array('status' => 'success', 'error' => '', 'message' => "Record Updated Successfully");
        } else {

            $msg = array(
                'appointment_date' => form_error('appointment_date'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'opdid' => form_error('opdid'),
                'amount' => form_error('amount'),
                'cheque_no' => form_error('cheque_no'),
                'cheque_date' => form_error('cheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        }
        echo json_encode($array);
    }

    public function opd_details()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("recordid");
        $opdid = $this->input->post("opdid");
        $result = $this->patient_model->getOPDetails($id, $opdid);

        if (!empty($result['appointment_date'])) {
            $appointment_date = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['appointment_date']));
            $result["appointment_date"] = $appointment_date;
        }

        echo json_encode($result);
    }

    public function editvisitdetails()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("recordid");
        $visitid = $this->input->post("visitid");
        if ((!empty($visitid))) {

            $result = $this->patient_model->getpatientDetailsByVisitId($id, $visitid);
        }

        if (!empty($result['appointment_date'])) {
            $appointment_date = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['appointment_date']));
            $result["appointment_date"] = $appointment_date;
        }
        echo json_encode($result);
    }

    public function editDiagnosis()
    {

        if (!$this->rbac->hasPrivilege('opd editdiagnosis', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->patient_model->geteditDiagnosis($id);
        $result["report_date"] = date($this->customlib->getSchoolDateFormat(true, false), strtotime($result['report_date']));
        echo json_encode($result);
    }

    public function editTimeline()
    {

        if (!$this->rbac->hasPrivilege('opd timeline', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->timeline_model->geteditTimeline($id);

        echo json_encode($result);
    }

    public function editstaffTimeline()
    {

        if (!$this->rbac->hasPrivilege('staff_timeline', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");

        $result = $this->timeline_model->geteditstaffTimeline($id);

        echo json_encode($result);
    }

    public function add_diagnosis()
    {
        $this->form_validation->set_rules('report_type', $this->lang->line('report') . " " . $this->lang->line('type'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'report_type' => form_error('report_type'),
                'description' => form_error('description'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $report_date = $this->input->post('report_date');
            $data = array(
                'report_type' => $this->input->post("report_type"),
                'report_date' => date('Y-m-d', $this->customlib->datetostrtotime($report_date)),
                'patient_id' => $this->input->post("patient"),
                'description' => $this->input->post("description"),
            );
            $insert_id = $this->patient_model->add_diagnosis($data);
            if (isset($_FILES["report_document"]) && !empty($_FILES['report_document']['name'])) {
                $fileInfo = pathinfo($_FILES["report_document"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["report_document"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'document' => 'uploads/patient_images/' . $img_name);
                $this->patient_model->add_diagnosis($data_img);
            }
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Added Successfully.');
        }
        echo json_encode($array);
    }

    public function update_diagnosis()
    {
        $this->form_validation->set_rules('report_type', $this->lang->line('report') . " " . $this->lang->line('type'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'report_type' => form_error('report_type'),
                'description' => form_error('description'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $report_date = $this->input->post('report_date');
            $id = $this->input->post('diagnosis_id');
            $patientid = $this->input->post("diagnosispatient_id");
            $this->load->library('Customlib');
            $data = array(
                'id' => $id,
                'report_type' => $this->input->post("report_type"),
                'report_date' => date('Y-m-d', $this->customlib->datetostrtotime($report_date)),
                'patient_id' => $patientid,
                'description' => $this->input->post("description"),
            );
            $insert_id = $this->patient_model->add_diagnosis($data);
            if (isset($_FILES["report_document"]) && !empty($_FILES['report_document']['name'])) {
                $fileInfo = pathinfo($_FILES["report_document"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["report_document"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $id, 'document' => 'uploads/patient_images/' . $img_name);
                $this->patient_model->add_diagnosis($data_img);
            }
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Added Successfully.');
        }
        echo json_encode($array);
    }

    public function add_prescription()
    {
        if (!$this->rbac->hasPrivilege('prescription', 'can_add')) {
            access_denied();
        }
        //$this->form_validation->set_rules('medicine[]', $this->lang->line('medicine'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('medicine_cat[]', $this->lang->line('medicine') . " " . $this->lang->line('category'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('opd_no', $this->lang->line('opd_no'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                //'medicine' => form_error('medicine[]'),
                'medicine_cat' => form_error('medicine_cat[]'),
                'opd_no' => form_error('opd_no')
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $opd_id = $this->input->post('opd_no');


            $visit_id = $this->input->post('visit_id');

            $medicine = $this->input->post("medicine[]");
            $medicine_cat = $this->input->post("medicine_cat[]");
            $dosage = $this->input->post("dosage[]");
            $instruction = $this->input->post("instruction[]");
            $header_note = $this->input->post("header_note");
            $footer_note = $this->input->post("footer_note");
            $data_array = array();
            $i = 0;
            foreach ($medicine as $key => $value) {
                $inst = '';
                $do = '';
                $medicine_cat_value = '';
                if (!empty($dosage[$i])) {
                    $do = $dosage[$i];
                }
                if (!empty($instruction[$i])) {
                    $inst = $instruction[$i];
                }

                if (!empty($medicine_cat[$i])) {
                    $medicine_cat_value = $medicine_cat[$i];
                }
                $data = array('opd_id' => $opd_id, 'visit_id' => $visit_id, 'medicine' => $value, 'medicine_category_id' => $medicine_cat_value, 'dosage' => $do, 'instruction' => $inst);
                $data_array[] = $data;
                $i++;
            }
            $opd_array = array('id' => $opd_id, 'header_note' => $header_note, 'footer_note' => $footer_note);
            $this->patient_model->add_prescription($data_array);
            $this->patient_model->add_opd($opd_array);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }

        echo json_encode($array);
    }

    public function add_ipdprescription()
    {
        if (!$this->rbac->hasPrivilege('prescription', 'can_add')) {
            access_denied();
        }

        $this->form_validation->set_rules('ipd_no', $this->lang->line('ipd_no') . " " . $this->lang->line('category'), 'trim|required|xss_clean');
        //$this->form_validation->set_rules('medicine[]', $this->lang->line('medicine'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('medicine_cat[]', $this->lang->line('medicine') . " " . $this->lang->line('category'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                //'medicine' => form_error('medicine[]'),
                'medicine_cat' => form_error('medicine_cat[]'),
                'ipd_no' => form_error('ipd_no'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $ipd_id = $this->input->post('ipd_no');

            $visit_id = 1;
            $medicine = $this->input->post("medicine[]");
            $medicine_cat = $this->input->post("medicine_cat[]");
            $dosage = $this->input->post("dosage[]");
            $instruction = $this->input->post("instruction[]");
            $header_note = $this->input->post("header_note");
            $footer_note = $this->input->post("footer_note");

            $prefix = $this->setting_model->getPrefixSetting('ipd_prescription');
            $bill_no = $this->prescription_model->getMaxId();
            if (empty($bill_no)) {
                $bill_no = 0;
            }
            $bill = $bill_no + 1;
            if (empty($prefix)) {
                $prefix = "IPDP";
            }
            $pres_no = $prefix . $bill;

            $data_array = array();
            $ipd_basic_array = array('pres_no' => $pres_no, 'ipd_id' => $ipd_id, 'header_note' => $header_note, 'footer_note' => $footer_note, 'date' => date("Y-m-d"));
            $basic_id = $this->prescription_model->add_ipdprescriptionbasic($ipd_basic_array);

            $i = 0;
            foreach ($medicine as $key => $value) {
                $inst = '';
                $do = '';
                $medicine_cat_value = '';
                if (!empty($dosage[$i])) {
                    $do = $dosage[$i];
                }
                if (!empty($instruction[$i])) {
                    $inst = $instruction[$i];
                }

                if (!empty($medicine_cat[$i])) {
                    $medicine_cat_value = $medicine_cat[$i];
                }

                $data = array('basic_id' => $basic_id, 'ipd_id' => $ipd_id, 'medicine' => $value, 'dosage' => $do, 'medicine_category_id' => $medicine_cat_value, 'instruction' => $inst);
                $data_array[] = $data;
                $i++;
            }

            $this->prescription_model->add_ipdprescriptiondetail($data_array);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function update_prescription()
    {
        if (!$this->rbac->hasPrivilege('prescription', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('opd_id', $this->lang->line('opd_no'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'opd_id' => form_error('opd_id'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $opd_id = $this->input->post('opd_id');
            $visit_id = $this->input->post('visit_id');
            $medicine = $this->input->post("medicine[]");
            $medicine_cat = $this->input->post("medicine_cat[]");
            $prescription_id = $this->input->post("prescription_id[]");
            $previous_pres_id = $this->input->post("previous_pres_id[]");

            $dosage = $this->input->post("dosage[]");
            $instruction = $this->input->post("instruction[]");
            $header_note = $this->input->post("header_note");
            $footer_note = $this->input->post("footer_note");


            $data_array = array();
            $delete_arr = array();
            foreach ($previous_pres_id as $pkey => $pvalue) {
                if (in_array($pvalue, $prescription_id)) {
                } else {
                    $delete_arr[] = array('id' => $pvalue,);
                }
            }

            $i = 0;
            foreach ($medicine as $key => $value) {
                $inst = '';
                $do = '';
                $medicine_cat_value = '';
                if (!empty($dosage[$i])) {
                    $do = $dosage[$i];
                }
                if (!empty($instruction[$i])) {
                    $inst = $instruction[$i];
                }
                if (!empty($medicine_cat[$i])) {
                    $medicine_cat_value = $medicine_cat[$i];
                }
                if ($prescription_id[$i] == 0) {
                    $add_data = array('opd_id' => $opd_id, 'visit_id' => $visit_id, 'medicine' => $value, 'medicine_category_id' => $medicine_cat_value, 'dosage' => $do, 'instruction' => $inst);

                    $data_array[] = $add_data;
                } else {

                    $update_data = array('id' => $prescription_id[$i], 'medicine_category_id' => $medicine_cat_value, 'opd_id' => $opd_id, 'medicine' => $value, 'dosage' => $do, 'instruction' => $inst);

                    $this->prescription_model->update_prescription($update_data);
                }


                $i++;
            }

            $opd_array = array('id' => $opd_id, 'header_note' => $header_note, 'footer_note' => $footer_note);

            if (!empty($data_array)) {
                $this->patient_model->add_prescription($data_array);
            }
            if (!empty($delete_arr)) {

                $this->prescription_model->delete_prescription($delete_arr);
            }
            $this->patient_model->add_opd($opd_array);

            $array = array('status' => 'success', 'error' => '', 'message' => 'Prescription Added Successfully');
        }
        echo json_encode($array);
    }

    public function update_ipdprescription()
    {
        if (!$this->rbac->hasPrivilege('prescription', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('ipd_id', $this->lang->line('ipd_no'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('medicine_cat[]', $this->lang->line('medicine') . " " . $this->lang->line('category'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'medicine_cat' => form_error('medicine_cat[]'),
                'ipd_id' => form_error('ipd_id'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $ipd_id = $this->input->post('ipd_id');
            $visit_id = $this->input->post('visit_id');

            $medicine = $this->input->post("medicine[]");
            $medicine_cat = $this->input->post("medicine_cat[]");
            $prescription_id = $this->input->post("prescription_id[]");
            $previous_pres_id = $this->input->post("previous_pres_id[]");

            $dosage = $this->input->post("dosage[]");
            $instruction = $this->input->post("instruction[]");
            $header_note = $this->input->post("header_note");
            $footer_note = $this->input->post("footer_note");


            $data_array = array();
            $delete_arr = array();
            foreach ($previous_pres_id as $pkey => $pvalue) {
                if (in_array($pvalue, $prescription_id)) {
                } else {
                    $delete_arr[] = array('id' => $pvalue,);
                }
            }

            $i = 0;
            foreach ($medicine as $key => $value) {
                $inst = '';
                $do = '';
                $medicine_cat_value = '';
                if (!empty($dosage[$i])) {
                    $do = $dosage[$i];
                }
                if (!empty($instruction[$i])) {
                    $inst = $instruction[$i];
                }
                if (!empty($medicine_cat[$i])) {
                    $medicine_cat_value = $medicine_cat[$i];
                }
                if ($prescription_id[$i] == 0) {
                    $add_data = array('ipd_id' => $ipd_id, 'basic_id' => $visit_id, 'medicine' => $value, 'medicine_category_id' => $medicine_cat_value, 'dosage' => $do, 'instruction' => $inst);

                    $data_array[] = $add_data;
                } else {

                    $update_data = array('id' => $prescription_id[$i], 'medicine_category_id' => $medicine_cat_value, 'ipd_id' => $ipd_id, 'medicine' => $value, 'dosage' => $do, 'instruction' => $inst);

                    $this->prescription_model->update_ipdprescription($update_data);
                }


                $i++;
            }

            $ipd_array = array('id' => $visit_id, 'header_note' => $header_note, 'footer_note' => $footer_note);

            if (!empty($data_array)) {
                $this->patient_model->add_ipdprescription($data_array);
            }
            if (!empty($delete_arr)) {

                $this->prescription_model->delete_ipdprescription($delete_arr);
            }
            $this->patient_model->addipd($ipd_array);

            $array = array('status' => 'success', 'error' => '', 'message' => 'Prescription Added Successfully');
        }
        echo json_encode($array);
    }

    public function add_inpatient()
    {
        // if (!$this->rbac->hasPrivilege('ipd_patient', 'can_add')) {
        //     access_denied();
        // }
        $patient_type = $this->customlib->getPatienttype();

        $this->form_validation->set_rules('patient_id', $this->lang->line('patient'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('appointment_date', $this->lang->line('admission') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('consultant') . " " . $this->lang->line('doctor'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('bed_group_id', $this->lang->line('bed') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('bed_no', $this->lang->line('bed') . " " . $this->lang->line('number'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'patient_id' => form_error('patient_id'),
                'appointment_date' => form_error('appointment_date'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'bed_group_id' => form_error('bed_group_id'),
                'bed_no' => form_error('bed_no'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {


            $prefix = $this->setting_model->getPrefixSetting('ipd_no');
            $check_ipd_id = $this->patient_model->getMaxIPDId();
            $ipdnoid = $check_ipd_id + 1;
            if (empty($prefix)) {
                $prefix = "IPDN";
            }
            $ipdno = $prefix . $ipdnoid;

            $appointment_date = $this->input->post('appointment_date');
            $insert_id = $this->input->post('patient_id');
            $email = $this->input->post('email');
            $mobileno = $this->input->post('mobileno');
            $patient_name = $this->input->post('patient_name');

            $ipd_data = array(
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($appointment_date)),
                'ipd_no' => $ipdno,
                'bed' => $this->input->post('bed_no'),
                'bed_group_id' => $this->input->post('bed_group_id'),
                'height' => $this->input->post('height'),
                'weight' => $this->input->post('weight'),
                'bp' => $this->input->post('bp'),
                'pulse' => $this->input->post('pulse'),
                'temperature' => $this->input->post('temperature'),
                'respiration' => $this->input->post('respiration'),
                'pre_medical_issue' => $this->input->post('pmi'),
                'case_type' => $this->input->post('case'),
                'symptoms' => $this->input->post('symptoms'),
                'refference' => $this->input->post('refference'),
                'cons_doctor' => $this->input->post('consultant_doctor'),
                'patient_id' => $insert_id,
                'casualty' => $this->input->post('casualty'),
                'discharged' => 'no',
                'hospital_department' => $this->input->post('hospital_department'),
            );

            $ipdpatient_data = array(
                'id' => $insert_id,
                'organisation' => $this->input->post('organisation'),
            );
            $ipd_id = $this->patient_model->add_ipd($ipd_data);

            $bed_data = array('id' => $this->input->post('bed_no'), 'is_active' => 'no');
            $this->bed_model->savebed($bed_data);
            $updateData = array('id' => $insert_id, 'is_ipd' => 'yes', 'discharged' => 'no');
            $this->patient_model->add($updateData);
            $ipdid = $this->patient_model->add($ipdpatient_data);
            $array = array('status' => 'success', 'error' => '', 'message' => "Patient Added Successfully");
            if ($this->session->has_userdata("appointment_id")) {

                $appointment_id = $this->session->userdata("appointment_id");
                $updateData = array('id' => $appointment_id, 'is_ipd' => 'yes');
                $this->appointment_model->update($updateData);
                $this->session->unset_userdata('appointment_id');
            }

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/patient_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'image' => 'uploads/patient_images/' . $img_name);
                $this->patient_model->add($data_img);
            }

            $notificationurl = $this->notificationurl;
            $url_link = $notificationurl["ipd"];
            $url = base_url() . $url_link . '/' . $insert_id . '/' . $ipd_id;
            $this->ipdNotification($insert_id, $this->input->post('consultant_doctor'), $ipdno, $url);

            $sender_details = array('patient_id' => $insert_id, 'patient_name' => $patient_name, 'ipd_no' => $ipdno, 'contact_no' => $mobileno, 'email' => $email);
            $this->mailsmsconf->mailsms('ipd_patient_registration', $sender_details);
        }

        echo json_encode($array);
    }

    public function valid_patient()
    {
        $id = $this->input->post('patient_id');

        if ($id > 0) {
            $check_exists = $this->patient_model->valid_patient($id);
            if ($check_exists == TRUE) {
                $this->form_validation->set_message('valid_patient', 'Record already exists');
                return FALSE;
            }
        }
    }

    public function add_consultant_instruction()
    {
        if (!$this->rbac->hasPrivilege('consultant register', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('date[]', $this->lang->line('applied') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('doctor[]', $this->lang->line('consultant'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('instruction[]', $this->lang->line('instruction'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('insdate[]', $this->lang->line('instruction') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date' => form_error('date[]'),
                'doctor' => form_error('doctor[]'),
                'instruction' => form_error('instruction[]'),
                'datee' => form_error('insdate[]')
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $date = $this->input->post('date[]');
            $ins_date = $this->input->post('insdate[]');
            //$ins_time = $this->input->post('instime[]');
            $patient_id = $this->input->post('patient_id');
            $ipd_id = $this->input->post('ipdid');
            $doctor = $this->input->post('doctor[]');
            $instruction = $this->input->post('instruction[]');
            $data = array();
            $i = 0;
            foreach ($date as $key => $value) {
                $details = array(
                    'date' => date('Y-m-d', $this->customlib->datetostrtotime($date[$i])),
                    'patient_id' => $patient_id,
                    'ipd_id' => $ipd_id,
                    'ins_date' => date('Y-m-d', $this->customlib->datetostrtotime($ins_date[$i])),
                    'cons_doctor' => $doctor[$i],
                    'instruction' => $instruction[$i],
                );
                $data[] = $details;
                $i++;
            }
            $this->patient_model->add_consultantInstruction($data);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Added Successfully');
        }
        echo json_encode($array);
    }

    public function ipdCharge()
    {
        $code = $this->input->post('code');
        $org_id = $this->input->post('organisation_id');

        $patient_charge = $this->patient_model->ipdCharge($code, $org_id);
        $data['patient_charge'] = $patient_charge;
        echo json_encode($patient_charge);
    }

    public function opd_report()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_view')) {
            access_denied();
        }
        $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
        $data['doctorlist'] = $doctorlist;

        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/patient/opd_report');
        $this->session->set_userdata('top_menu', 'Reports');
        $select = 'opd_details.*,staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age,patients.month';
        $join = array(
            'JOIN staff ON opd_details.cons_doctor = staff.id',
            'JOIN patients ON opd_details.patient_id = patients.id',

        );
        $where = array();
        $doctorid = $this->input->post('doctor');

        if (!empty($doctorid)) {
            $where = array('opd_details.cons_doctor =' . $doctorid);
        }
        $table_name = "opd_details";

        $disable_option = FALSE;
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata['role_id'];
        $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
        if ($doctor_restriction == 'enabled') {
            if ($role_id == 3) {

                $user_id = $userdata["id"];
                $doctorid = $user_id;
                $where = array(
                    "opd_details.cons_doctor = " . $user_id,
                );
                $disable_option = TRUE;
            }
        }
        $data['disable_option'] = $disable_option;
        $data['doctor_select'] = $doctorid;
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

            $search_table = "opd_details";
            $search_column = "appointment_date";
            $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $where);
        }
        /* $resultList2 = $this->report_model->searchReport($select = 'opd_details.*,opd_patient_charges.apply_charge as amount, opd_patient_charges.created_at as payment_date,staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age,patients.month', $join = array(
            'JOIN staff ON opd_details.cons_doctor = staff.id',
            'JOIN patients ON opd_details.patient_id = patients.id',
            'JOIN opd_patient_charges ON opd_patient_charges.opd_id = opd_details.id',
                ), $table_name = 'opd_details', $search_type, $search_table = 'opd_patient_charges', $search_column = 'created_at', $where);
        // echo $this->db->last_query();  
        if (!empty($resultList2)) {
            array_push($resultlist, $resultList2[0]);
        }*/
        // echo "<pre>";
        // print_r($resultlist);
        // exit;
        $data["searchlist"] = $this->search_type;
        $data["search_type"] = $search_type;
        $data["resultlist"] = $resultlist;
        $i = 0;
        if (!empty($resultlist)) {
            foreach ($data['resultlist'] as $key => $value) {
                $charges = $this->patient_model->getOPDCharges($value["pid"], $value["id"]);
                if (!empty($charges))
                    $data['resultlist'][$i]["charges"] = $charges['charge'];
                $i++;
            }
        }


        $this->load->view('layout/header');
        $this->load->view('admin/patient/opdReport.php', $data);
        $this->load->view('layout/footer');
    }

    public function ipdReport()
    {
        if (!$this->rbac->hasPrivilege('ipd_report', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/patient/ipdreport');

        $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
        $data['doctorlist'] = $doctorlist;
        $status = 'no';
        $patient_status = $this->input->post("patient_status");
        if (empty($patient_status)) {
            $patient_status = 'on_bed';
        }
        if ($patient_status == 'all') {
            $status = '';
        } else if ($patient_status == 'on_bed') {
            $status = 'yes';
        } else if ($patient_status == 'discharged') {
            $status = 'no';
        }
        //  echo $patient_status."-".$status ;
        $select = 'ipd_details.*,ipd_details.discharged as ipd_discharge,payment.paid_amount, payment.date as payment_date, staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age,patients.month';
        $join = array(
            'JOIN staff ON ipd_details.cons_doctor = staff.id',
            'JOIN patients ON ipd_details.patient_id = patients.id',
            'LEFT JOIN payment ON payment.ipd_id = ipd_details.id',
        );
        $table_name = "ipd_details";

        $additional_where = array("patients.is_active = 'yes'", "ipd_details.discharged != '" . $status . "'");
        $doctorid = $this->input->post('doctor');

        if (!empty($doctorid)) {
            $additional_where = array("patients.is_active = 'yes' ", "ipd_details.cons_doctor ='" . $doctorid . "'", "ipd_details.discharged != '" . $status . "'");
        }
        $disable_option = FALSE;
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata['role_id'];

        $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
        if ($doctor_restriction == 'enabled') {
            if ($role_id == 3) {

                $user_id = $userdata["id"];
                $doctorid = $user_id;
                $additional_where = array(
                    "ipd_details.cons_doctor = " . $user_id,
                    "patients.discharged != 'yes'"
                );
                $disable_option = TRUE;
            }
        }
        $data['disable_option'] = $disable_option;
        $data['doctor_select'] = $doctorid;

        $search_type = $this->input->post("search_type");
        if (isset($search_type)) {
            $search_type = $this->input->post("search_type");
        } else {
            $search_type = "this_month";
        }

        if (empty($search_type)) {
            $search_type = "";
            $resultlist = $this->report_model->getReport($select, $join, $table_name, $additional_where);
        } else {

            $search_table = "ipd_details";
            $search_column = "date";
            $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
            //echo $this->db->last_query();
            //exit;
        }
        $resultList2 = $this->report_model->searchReport($select = 'ipd_details.*,ipd_details.discharged as ipd_discharge,ipd_billing.net_amount as paid_amount, ipd_billing.date as payment_date,staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age,patients.month', $join = array(
            'JOIN staff ON ipd_details.cons_doctor = staff.id',
            'JOIN patients ON ipd_details.patient_id = patients.id',
            'LEFT JOIN payment ON payment.patient_id = patients.id',
            'JOIN ipd_billing ON ipd_billing.ipd_id = ipd_details.id',
        ), $table_name = 'ipd_details', $search_type, $search_table = 'ipd_billing', $search_column = 'date', $additional_where);
        // echo $this->db->last_query();  
        if (!empty($resultList2)) {
            array_push($resultlist, $resultList2[0]);
        }
        // echo "<pre>";
        //print_r($resultlist);
        //   exit;
        $data["searchlist"] = $this->search_type;
        $data["search_type"] = $search_type;
        $data["resultlist"] = $resultlist;
        $i = 0;
        if (!empty($resultlist)) {
            foreach ($data['resultlist'] as $key => $value) {
                $charges = $this->patient_model->getCharges($value["pid"], $value["id"]);
                $data['resultlist'][$i]["charges"] = $charges['charge'];
                $i++;
            }
        }
        if (!empty($patient_status)) {
            $data['patient_status'] = $patient_status;
        } else {
            $data['patient_status'] = 'on_bed';
        }
        $this->load->view('layout/header');
        $this->load->view('admin/patient/ipdReport.php', $data);
        $this->load->view('layout/footer');
    }

  // public function dischargepatientReport()
    // {
    //     if (!$this->rbac->hasPrivilege('ipd_report', 'can_view')) {
    //         access_denied();
    //     }
    //     $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
    //     $data['doctorlist'] = $doctorlist;

    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $this->session->set_userdata('sub_menu', 'admin/patient/dischargepatientReport');
    //     $select = 'ipd_details.*,payment.paid_amount, payment.date as payment_date, staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age';
    //     $join = array(
    //         'JOIN staff ON ipd_details.cons_doctor = staff.id',
    //         'JOIN patients ON ipd_details.patient_id = patients.id',
    //         'LEFT JOIN payment ON payment.ipd_id = ipd_details.id',
    //     );
    //     $table_name = "ipd_details";
    //     $additional_where = array("ipd_details.discharged = 'yes'");
    //     $doctorid = $this->input->post('doctor');

    //     $disable_option = FALSE;
    //     $userdata = $this->customlib->getUserData();
    //     $role_id = $userdata['role_id'];

    //     $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
    //     if ($doctor_restriction == 'enabled') {
    //         if ($role_id == 3) {

    //             $user_id = $userdata["id"];
    //             $doctorid = $user_id;
    //             $additional_where = array(
    //                 "ipd_details.discharged = 'yes' ",
    //                 "ipd_details.cons_doctor = " . $user_id,
    //             );
    //             $disable_option = TRUE;
    //         }
    //     }
    //     $data['doctor_select'] = $doctorid;
    //     $data['disable_option'] = $disable_option;

    //     if (!empty($doctorid)) {
    //         $additional_where = array("patients.is_active = 'yes' ", "ipd_details.discharged = 'yes'", "ipd_details.cons_doctor ='" . $doctorid . "'");
    //     }
    //     $search_type = $this->input->post("search_type");
    //     if (isset($search_type)) {
    //         $search_type = $this->input->post("search_type");
    //     } else {
    //         $search_type = "this_month";
    //     }

    //     if (empty($search_type)) {
    //         $search_type = "";
    //         $resultlist = $this->report_model->getReport($select, $join, $table_name, $additional_where);
    //     } else {

    //         $search_table = "ipd_details";
    //         $search_column = "date";
    //         $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
    //     }

    //     $resultList2 = $this->report_model->searchReport($select = 'ipd_details.*,ipd_billing.net_amount as paid_amount, ipd_billing.date as payment_date,staff.name,staff.surname,patients.id as pid,patients.patient_name,patients.patient_unique_id,patients.guardian_name,patients.address,patients.admission_date,patients.gender,patients.mobileno,patients.age', $join = array(
    //         'JOIN staff ON ipd_details.cons_doctor = staff.id',
    //         'JOIN patients ON ipd_details.patient_id = patients.id',
    //         'LEFT JOIN payment ON payment.ipd_id = ipd_details.id',
    //         'JOIN ipd_billing ON ipd_billing.ipd_id = ipd_details.id',
    //     ), $table_name = 'ipd_details', $search_type, $search_table = 'ipd_billing', $search_column = 'date', $additional_where);
    //     if (!empty($resultList2)) {
    //         array_push($resultlist, $resultList2[0]);
    //     }


    //     $data["searchlist"] = $this->search_type;
    //     $data["search_type"] = $search_type;
    //     $data["resultlist"] = $resultlist;

    //     $i = 0;
    //     if (!empty($resultlist)) {
    //         foreach ($data['resultlist'] as $key => $value) {
    //             $charges = $this->patient_model->getCharges($value["pid"], $value["id"]);
    //             $data['resultlist'][$i]["charges"] = $charges['charge'];
    //             $discharge_details = $this->patient_model->getIpdBillDetails($value["pid"], $value["id"]);
    //             $payment = $this->patient_model->getPayment($value["pid"], $value["id"]);
    //             $data['resultlist'][$i]["discharge_date"] = $discharge_details['date'];
    //             $data['resultlist'][$i]["other_charge"] = $discharge_details['other_charge'];
    //             $data['resultlist'][$i]["tax"] = $discharge_details['tax'];
    //             $data['resultlist'][$i]["discount"] = $discharge_details['discount'];
    //             $data['resultlist'][$i]["net_amount"] = $discharge_details['net_amount'] + $payment['payment'];
    //             $i++;
    //         }
    //     }

    //     $this->load->view('layout/header');
    //     $this->load->view('admin/patient/dischargePatientReport.php', $data);
    //     $this->load->view('layout/footer');
    // }



    public function dischargepatientReport()
{
    if (!$this->rbac->hasPrivilege('ipd_report', 'can_view')) {
        access_denied();
    }

    // Get the doctor list for filtering
    $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
    $data['doctorlist'] = $doctorlist;

    $this->session->set_userdata('top_menu', 'Reports');
    $this->session->set_userdata('sub_menu', 'admin/patient/dischargepatientReport');

    // Check if form has been submitted
    if ($this->input->server('REQUEST_METHOD') == 'POST') {
        // Get search_type from POST
        $search_type = $this->input->post("search_type", true);
        $doctorid = $this->input->post("doctor", true);

        // Redirect to the same function to prevent resubmission on refresh
        redirect('admin/patient/dischargepatientReport?search_type=' . urlencode($search_type) . '&doctor=' . urlencode($doctorid));
    }

    // Get search_type and doctor_id from GET parameters
    $search_type = $this->input->get('search_type');
    $doctorid = $this->input->get('doctor');

    // Set default search_type if not provided
    if (empty($search_type)) {
        $search_type = "this_month"; // Default to "this month"
    }

    // SQL query details
    $select = 'ipd_details.*, payment.paid_amount, payment.date as payment_date, staff.name, staff.surname, patients.id as pid, patients.patient_name, patients.patient_unique_id, patients.guardian_name, patients.address, patients.admission_date, patients.gender, patients.mobileno, patients.age';
    $join = array(
        'JOIN staff ON ipd_details.cons_doctor = staff.id',
        'JOIN patients ON ipd_details.patient_id = patients.id',
        'LEFT JOIN payment ON payment.ipd_id = ipd_details.id',
    );
    $table_name = "ipd_details";
    $additional_where = array("ipd_details.discharged = 'yes'");

    // Handle doctor restrictions
    $disable_option = FALSE;
    $userdata = $this->customlib->getUserData();
    $role_id = $userdata['role_id'];
    $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];

    if ($doctor_restriction == 'enabled' && $role_id == 3) {
        $doctorid = $userdata["id"];
        $additional_where[] = "ipd_details.cons_doctor = " . $doctorid;
        $disable_option = TRUE;
    }

    $data['doctor_select'] = $doctorid;
    $data['disable_option'] = $disable_option;

    if (!empty($doctorid)) {
        $additional_where[] = "ipd_details.cons_doctor = '" . $doctorid . "'";
    }

    // Retrieve the result list based on search type
    if (empty($search_type)) {
        $resultlist = $this->report_model->getReport($select, $join, $table_name, $additional_where);
    } else {
        $search_table = "ipd_details";
        $search_column = "date";
        $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
    }

    // Additional result handling for billing data
    $resultList2 = $this->report_model->searchReport(
        'ipd_details.*, ipd_billing.net_amount as paid_amount, ipd_billing.date as payment_date, staff.name, staff.surname, patients.id as pid, patients.patient_name, patients.patient_unique_id, patients.guardian_name, patients.address, patients.admission_date, patients.gender, patients.mobileno, patients.age',
        array(
            'JOIN staff ON ipd_details.cons_doctor = staff.id',
            'JOIN patients ON ipd_details.patient_id = patients.id',
            'LEFT JOIN payment ON payment.ipd_id = ipd_details.id',
            'JOIN ipd_billing ON ipd_billing.ipd_id = ipd_details.id',
        ),
        'ipd_details',
        $search_type,
        'ipd_billing',
        'date',
        $additional_where
    );

    if (!empty($resultList2)) {
        array_push($resultlist, $resultList2[0]);
    }

    // Process the result list (charges, discharge details)
    $i = 0;
    if (!empty($resultlist)) {
        foreach ($resultlist as $key => $value) {
            $charges = $this->patient_model->getCharges($value["pid"], $value["id"]);
            $resultlist[$i]["charges"] = $charges['charge'];
            $discharge_details = $this->patient_model->getIpdBillDetails($value["pid"], $value["id"]);
            $payment = $this->patient_model->getPayment($value["pid"], $value["id"]);
            $resultlist[$i]["discharge_date"] = $discharge_details['date'];
            $resultlist[$i]["other_charge"] = $discharge_details['other_charge'];
            $resultlist[$i]["tax"] = $discharge_details['tax'];
            $resultlist[$i]["discount"] = $discharge_details['discount'];
            $resultlist[$i]["net_amount"] = $discharge_details['net_amount'] + $payment['payment'];
            $i++;
        }
    }

    // Prepare data for the view
    $data["searchlist"] = $this->search_type; // Assuming this is populated elsewhere
    $data["search_type"] = $search_type;
    $data["resultlist"] = $resultlist;

    // Load views
    $this->load->view('layout/header');
    $this->load->view('admin/patient/dischargePatientReport.php', $data);
    $this->load->view('layout/footer');
}


    public function revertBill()
    {
        $patient_id = $this->input->post('patient_id');
        $bill_id = $this->input->post('bill_id');
        $bed_id = $this->input->post('bed_id');
        $ipd_id = $this->input->post('ipdid');

        if ((!empty($patient_id)) && (!empty($bill_id))) {
            $patient_data = array('id' => $patient_id, 'discharged' => 'no');
            $this->patient_model->add($patient_data);

            $ipd_data = array('id' => $ipd_id, 'discharged' => 'no');
            $this->patient_model->add_ipd($ipd_data);

            $bed_data = array('id' => $bed_id, 'is_active' => 'no');
            $this->bed_model->savebed($bed_data);
            $revert = $this->payment_model->revertBill($patient_id, $bill_id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Updated Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => 'Record Not Updated.');
        }
        echo json_encode($array);
    }

    public function deleteOPD()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_delete')) {
            access_denied();
        }
        $opdid = $this->input->post('opdid');
        if (!empty($opdid)) {
            $this->patient_model->deleteOPD($opdid);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function deletePatient()
    {
        if (!$this->rbac->hasPrivilege('patient', 'can_delete')) {
            access_denied();
        }
        $id = $this->input->post('delid');
        if (!empty($id)) {
            $this->patient_model->deletePatient($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function deleteOPDPatient()
    {
        if (!$this->rbac->hasPrivilege('opd_patient', 'can_delete')) {
            access_denied();
        }
        $id = $this->input->post('id');
        if (!empty($id)) {
            $this->patient_model->deleteOPDPatient($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function patientCredentialReport()
    {
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/patient/patientcredentialreport');
        $credential = $this->patient_model->patientCredentialReport();
        $data["credential"] = $credential;
        $this->load->view("layout/header");
        $this->load->view("admin/patient/patientcredentialreport", $data);
        $this->load->view("layout/footer");
    }



    public function deleteIpdPatient($id)
    {
        if (!empty($id)) {
            $this->patient_model->deleteIpdPatient($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function getBedStatus()
    {


        $floor_list = $this->floor_model->floor_list();
        $bedlist = $this->bed_model->bed_list();
        //$bedactive = $this->bed_model->bed_active();
        $bedgroup_list = $this->bedgroup_model->bedGroupFloor();
        $data["floor_list"] = $floor_list;
        $data["bedlist"] = $bedlist;
        $data["bedgroup_list"] = $bedgroup_list;
        //$data['bedactive'] = $bedactive;


        //print_r($bedactive);
        //exit();
        $this->load->view("layout/bedstatusmodal", $data);
    }

    public function updateBed()
    {
        $this->form_validation->set_rules('bedgroup', $this->lang->line('bed') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('bedno', $this->lang->line('bed'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'bedgroup' => form_error('bedgroup'),
                'bedno' => form_error('bedno'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $data = array(
                'ipd_no' => $this->input->post('ipd_no'),
                'bed_group_id' => $this->input->post('bedgroup'),
                'bed' => $this->input->post('bedno'),
            );

            $this->patient_model->updatebed($data);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function moveipd($id)
    {


        $appointment_details = $this->patient_model->getDetails($id);
        $patient_name = $appointment_details['patient_name'];
        $patient_id = $appointment_details['id'];
        $gender = $appointment_details['gender'];
        $email = $appointment_details['email'];
        $phone = $appointment_details['mobileno'];
        $doctor = $appointment_details['cons_doctor'];
        $note = $appointment_details['note'];
        $appointment_date = $appointment_details['appointment_date'];
        $amount = $appointment_details['amount'];
        $patient_data = array(
            'patient_id' => $patient_id,
            'patient_name' => $patient_name,
            'gender' => $gender,
            'email' => $email,
            'phone' => $phone,
            'appointment_date' => $appointment_date,
            'cons_doctor' => $doctor,
        );
        $data['ipd_data'] = $patient_data;
        //print_r($patient_data);
        //exit();       
        $updateData = array('id' => $patient_id, 'is_ipd' => 'yes');
        $this->appointment_model->update($updateData);
        $this->session->set_flashdata('ipd_data', $data);
        $this->session->set_userdata('moveipd_marker', true);
        redirect("admin/patient/ipdsearch/");
    }

    public function deleteVisit($id)
    {
        $this->patient_model->deleteVisit($id);
        $json_array = array('status' => 'success',);
        echo json_encode($json_array);
    }

    public function editCharges()
    {

        if (!$this->rbac->hasPrivilege('charges', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->charge_model->geteditCharges($id);

        echo json_encode($result);
    }

    public function editPayment()
    {

        if (!$this->rbac->hasPrivilege('payment', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->payment_model->opdEditPaymentDetails($id);

        echo json_encode($result);
    }

    public function editIpdCharges()
    {

        if (!$this->rbac->hasPrivilege('charges', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->charge_model->geteditIpdCharges($id);

        echo json_encode($result);
    }

    public function editipdPayment()
    {

        if (!$this->rbac->hasPrivilege('payment', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $result = $this->payment_model->ipdEditPaymentDetails($id);

        echo json_encode($result);
    }

    public function multiplePatientdlt()
    {
        $patient_ids = $this->input->post('patient_ids');

        if (!empty($patient_ids)) {
            // Convert the array of IDs into a string for the SQL query
            $ids = implode(',', array_map('intval', $patient_ids));

            // Execute the delete query
            $this->db->where_in('id', $patient_ids);
            if ($this->db->delete('patients')) {
                // Return success response
                $json_array = array('status' => 'success');
            } else {
                // Return failure response
                $json_array = array('status' => 'fail', 'message' => 'Error deleting records.');
            }
        } else {
            // No records selected
            $json_array = array('status' => 'fail', 'message' => 'No records selected.');
        }


        // Send the JSON response
        echo json_encode($json_array);
    }

    public function patientvisit_old()
    {

        if (!$this->rbac->hasPrivilege('patient', 'can_view')) {
            access_denied();
        }

        $id = $this->input->post("id");

        $this->db->select('opd_details.*,  staff.id as staff_id, staff.name, staff.surname')
            ->from('opd_details')
            ->join('staff', 'staff.id = opd_details.cons_doctor', 'inner')
            ->join('patients', 'patients.id = opd_details.patient_id', 'inner')
            ->where('opd_details.patient_id', $id)
            ->order_by('opd_details.id', 'desc');

        $query = $this->db->get();
        $opddata = $query->result_array();

        //ipd details
        $this->db->select('ipd_details.*,  staff.id as staff_id, staff.name, staff.surname')
            ->from('ipd_details')
            ->join('staff', 'staff.id = ipd_details.cons_doctor', 'inner')
            ->join('patients', 'patients.id = ipd_details.patient_id', 'inner')
            ->where('ipd_details.patient_id', $id)
            ->order_by('ipd_details.id', 'desc');

        $query2 = $this->db->get();
        $ipddata = $query2->result_array();
        //Pharmacy Details
        $this->db->select('pharmacy_bill_basic.*, patients.patient_name')
            ->from('pharmacy_bill_basic')  // Added the 'from' method to specify the main table
            ->join('patients', 'patients.id = pharmacy_bill_basic.patient_id')
            ->where('patients.is_active', 'yes')
            ->where('pharmacy_bill_basic.patient_id', $id)
            ->order_by('pharmacy_bill_basic.id', 'desc');

        $query3 = $this->db->get();
        $pharmacy = $query3->result_array();

        //Pathology Details
        $this->db->select('pathology_report.*, 
                       pathology.id as pid, 
                       pathology.test_name, 
                       pathology.short_name, 
                       staff.name as staff_name, 
                       staff.surname as staff_surname, 
                       charges.id as cid, 
                       charges.charge_category, 
                       charges.standard_charge, 
                       patients.patient_name')
            ->from('pathology_report')
            ->join('pathology', 'pathology_report.pathology_id = pathology.id', 'inner')
            ->join('staff', 'staff.id = pathology_report.consultant_doctor', 'left')
            ->join('charges', 'charges.id = pathology.charge_id', 'inner')
            ->join('patients', 'patients.id = pathology_report.patient_id', 'inner')
            ->where('patients.is_active', 'yes')
            ->where('pathology_report.patient_id', $id);

        $query4 = $this->db->get();
        $pathology = $query4->result_array();

        //Radiology details
        $this->db->select('radiology_report.*, 
                       radio.id as rid, 
                       radio.test_name, 
                       radio.short_name, 
                       staff.name as staff_name, 
                       staff.surname as staff_surname, 
                       charges.id as cid, 
                       charges.charge_category, 
                       charges.standard_charge, 
                       patients.patient_name')
            ->from('radiology_report')
            ->join('radio', 'radiology_report.radiology_id = radio.id', 'inner')
            ->join('staff', 'staff.id = radiology_report.consultant_doctor', 'left')
            ->join('charges', 'charges.id = radio.charge_id', 'inner')
            ->join('patients', 'patients.id = radiology_report.patient_id', 'inner')
            ->where('patients.is_active', 'yes')
            ->where('radiology_report.patient_id', $id);

        $query5 = $this->db->get();
        $radiology = $query5->result_array();
        //Blood Issue details
        $this->db->select('blood_issue.*, 
                           patients.patient_name, 
                           patients.gender, 
                           blood_donor.donor_name as donor_name, 
                           blood_donor.blood_group')
            ->from('blood_issue')
            ->join('patients', 'patients.id = blood_issue.recieve_to', 'inner')
            ->join('blood_donor', 'blood_issue.donor_name = blood_donor.id', 'inner')
            ->where('blood_issue.recieve_to', $id)
            ->order_by('blood_issue.id', 'desc');

        $query6 = $this->db->get(); // Corrected variable name from 'quer6y' to 'query6'
        $blood_issues = $query6->result_array();
        //Ambulance 
        $this->db->select('ambulance_call.*, 
                   vehicles.vehicle_no, 
                   vehicles.vehicle_model, 
                   patients.patient_name as patient, 
                   patients.mobileno, 
                   patients.address, 
                   staff.name as staff_name, 
                   staff.surname as staff_surname, 
                   SUM(ambulance_payment.amount) as paidamo')
            ->from('ambulance_call')
            ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no', 'inner')
            ->join('patients', 'patients.id = ambulance_call.patient_name', 'inner')
            ->join('ambulance_payment', 'ambulance_payment.ambulance_call_id = ambulance_call.id', 'left')
            ->join('staff', 'staff.id = ambulance_call.generated_by', 'inner')
            ->where('ambulance_call.patient_name', $id)
            ->group_by('ambulance_call.id') // Group by ambulance_call.id or any unique identifier
            ->order_by('ambulance_call.date', 'desc');
        $query7 = $this->db->get();
        $ambulance = $query7->result_array();

        // onclick="tablesToExcel(array1, array2, array3, array4, array5, array6, array7, \'myfile.xls\')"

        $result = '
        <div class="box border0 clear" id="visit_report">
            <h4 class="mb0">' . $this->lang->line('patient') . " " . $this->lang->line('visit') . " " . $this->lang->line('report') . '</h4>
            <div class="ptt10">
                <a class="btn btn-default btn-xs pull-right" id="print" onclick="printDiv()"><i class="fa fa-print"></i></a> 
                <a class="btn btn-default btn-xs pull-right" id="btnExport" onclick="exportToExcelDirectly()"> <i class="fa fa-file-excel-o"></i> </a>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="1">
                    <caption><h4 class="bolds">' . $this->lang->line('opd') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('opd') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('doctor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . '</th>
                            <th>' . $this->lang->line('symptoms') . '</th>
                        </tr>
                    </thead>
                    <tbody>';

        foreach ($opddata as $value) {
            $result .= '
            <tr>
                <td>' . $value['opd_no'] . '</td>
                <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['appointment_date']))  . '</td>
                <td>' . $value['name'] . ' ' . $value['surname'] . '</td>
                <td>' . $value['refference'] . '</td>
                <td>' . $value['symptoms'] . '</td>
            </tr>';
        }

        $result .= '
                    </tbody>
                </table>
            </div>
    
            
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="2">
                    <caption><h4 class="bolds">' . $this->lang->line('ipd') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('ipd') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('doctor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . '</th>
                            <th>' . $this->lang->line('symptoms') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        foreach ($ipddata as $value) {
            $result .= '
            <tr>
                <td>' . $value['ipd_no'] . '</td>
                <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                <td>' . $value['name'] . ' ' . $value['surname'] . '</td>
                <td>' . $value['refference'] . '</td>
                <td>' . $value['symptoms'] . '</td>
            </tr>';
        }

        $result .= '</tbody>
                </table>
            </div>
    
    
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="3">
                    <caption><h4 class="bolds">' . $this->lang->line('pharmacy') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('patient') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('doctor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('total') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $pharmacy_total = 0;
        foreach ($pharmacy as $value) {
            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                        <td>' . $value['patient_name'] . '</td>
                        <td>' . $value['doctor_name'] . '</td>
                        <td>' . $value['net_amount'] . '</td>
                       
                    </tr>';
            $pharmacy_total += $value['net_amount'];
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                           
                            <th>' . $this->lang->line('total') . '</th>
                           <th>' . number_format($pharmacy_total, 2) . '</th>
                        </tr>
                  </tbody>
                    </table>
            </div>
    

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="4">
                    <caption><h4 class="bolds">' . $this->lang->line('pathology') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('patient') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('test') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . " " . $this->lang->line('doctor') . '</th>
                            <th>' . $this->lang->line('apply') . " " . $this->lang->line('charges') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $pathology_total = 0;
        foreach ($pathology as $value) {
            if (!empty($value['apply_charge'])) {
                $charges = $value['apply_charge'];
            } else {
                $charges = $value['standard_charge'];
            }
            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['reporting_date']))  . '</td>
                        <td>' . $value['patient_name'] . '</td>
                        <td>' . $value['test_name'] . '</td>
                        <td>' . $value['staff_name'] . '' . $value['staff_surname'] . '</td>
                        <td>' . $charges . ' </td>
                    </tr>';
            $pathology_total += $charges;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <th></th>
                            <th></th> <th></th>
                            <th></th>
                           
                            <th>' . $this->lang->line('total') . '</th>
                            <th>' . number_format($pathology_total, 2) . '</th>
                        </tr>
                  </tbody>
                </table>
            </div>
    
             <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="5">
                    <caption><h4 class="bolds">' . $this->lang->line('radiology') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('patient') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('test') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . " " . $this->lang->line('doctor') . '</th>
                            <th>' . $this->lang->line('apply') . " " . $this->lang->line('charges') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $radiology_total = 0;

        foreach ($radiology as $value) {
            if (!empty($value['apply_charge'])) {
                $charges = $value['apply_charge'];
            } else {
                $charges = $value['standard_charge'];
            }
            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['reporting_date']))  . '</td>
                        <td>' . $value['patient_name'] . '</td>
                        <td>' . $value['test_name'] . '</td>
                        <td>' . $value['staff_name'] . '' . $value['staff_surname'] . '</td>
                        <td>' . $charges . ' </td>
                    </tr>';
            $radiology_total += $charges;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <th></th>
                            <th></th> <th></th>
                            <th></th>
                           
                            <th>' . $this->lang->line('total') . '</th>
                            <th>' . number_format($radiology_total, 2) . '</th>
                        </tr>
                  </tbody>
              </table>
            </div>
      
           <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="6">
                    <caption><h4 class="bolds">' . $this->lang->line('blood_issue') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date_of_issue') . '</th>
                            <th>' . $this->lang->line('receive') . " " . $this->lang->line('to') . '</th>
                            <th>' . $this->lang->line('blood') . " " . $this->lang->line('group') . '</th>
                            <th>' . $this->lang->line('donor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('amount') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $blood_issues_total = 0;

        foreach ($blood_issues as $value) {
            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date_of_issue']))  . '</td>
                        <td>' . $value['patient_name'] . '</td>
                        <td>' . $value['blood_group'] . '</td>
                        <td>' . $value['donor_name'] . '</td>
                        <td>' . $value['amount'] . ' </td>
                    </tr>';
            $blood_issues_total += $value['amount'];
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <th></th>
                            <th></th> <th></th>
                            <th></th>
                           
                            <th>' . $this->lang->line('total') . '</th>
                            
                              <th>' . number_format($blood_issues_total, 2) . '</th>
                        </tr>
                  </tbody>
              </table>
            </div>
    
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="7">
                    <caption><h4 class="bolds">' . $this->lang->line('ambulance') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('patient') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('contact') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('vehicle') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('vehicle_model') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('driver_name') . '</th>
                            <th>' . $this->lang->line('amount') . '</th>
                              <th>' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . '</th>
                                <th>' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        $ambulance_total = 0;
        foreach ($ambulance as $value) {
            $balance_amout = $value['amount'] - $value['paidamo'];

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                        <td>' . $value['patient'] . '</td>
                        <td>' . $value['mobileno'] . '</td>
                        <td>' . $value['vehicle_no'] . '</td>
                        <td>' . $value['vehicle_model'] . ' </td>
                        <td>' . $value['driver'] . ' </td>
                        <td>' . $value['amount'] . ' </td>
                          <td>' . $value['paidamo'] . ' </td>
                          <td>' . number_format($balance_amout, 2) . ' </td>
                    </tr>';
            $ambulance_total += $balance_amout;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
        <tr>
            <th></th> <th></th> <th></th>
            <th></th> <th></th><th></th><th></th>
            <th></th>
           
            <th>' . $this->lang->line('total') . '</th>
             <th>' . number_format($ambulance_total, 2) . '</th>

        </tr>
  </tbody>
</table>
</div>
    
    
    
        </div>';

        echo json_encode($result);
    }


public function patientvisit()
    {

        if (!$this->rbac->hasPrivilege('patient', 'can_view')) {
            access_denied();
        }

        $id = $this->input->post("id");

        $this->db->select('opd_details.*,  staff.id as staff_id, staff.name, staff.surname')
            ->from('opd_details')
            ->join('staff', 'staff.id = opd_details.cons_doctor', 'inner')
            ->join('patients', 'patients.id = opd_details.patient_id', 'inner')
            ->where('opd_details.patient_id', $id)
            ->order_by('opd_details.id', 'desc');

        $query = $this->db->get();
        $opddata = $query->result_array();

        //ipd details
        $this->db->select('ipd_details.*,  staff.id as staff_id, staff.name, staff.surname')
            ->from('ipd_details')
            ->join('staff', 'staff.id = ipd_details.cons_doctor', 'inner')
            ->join('patients', 'patients.id = ipd_details.patient_id', 'inner')
            ->where('ipd_details.patient_id', $id)
            ->order_by('ipd_details.id', 'desc');

        $query2 = $this->db->get();
        $ipddata = $query2->result_array();
        //Pharmacy Details
        $this->db->select('pharmacy_bill_basic.*, patients.patient_name')
            ->from('pharmacy_bill_basic')  // Added the 'from' method to specify the main table
            ->join('patients', 'patients.id = pharmacy_bill_basic.patient_id')
            ->where('patients.is_active', 'yes')
            ->where('pharmacy_bill_basic.patient_id', $id)
            ->order_by('pharmacy_bill_basic.id', 'desc');

        $query3 = $this->db->get();
        $pharmacy = $query3->result_array();

        //Pathology Details
        $this->db->select('pathology_report.*, 
                       pathology.id as pid, 
                       pathology.test_name, 
                       pathology.short_name, 
                       staff.name as staff_name, 
                       staff.surname as staff_surname, 
                       charges.id as cid, 
                       charges.charge_category, 
                       charges.standard_charge, 
                       patients.patient_name')
            ->from('pathology_report')
            ->join('pathology', 'pathology_report.pathology_id = pathology.id', 'inner')
            ->join('staff', 'staff.id = pathology_report.consultant_doctor', 'left')
            ->join('charges', 'charges.id = pathology.charge_id', 'inner')
            ->join('patients', 'patients.id = pathology_report.patient_id', 'inner')
            ->where('patients.is_active', 'yes')
            ->where('pathology_report.patient_id', $id);

        $query4 = $this->db->get();
        $pathology = $query4->result_array();

        //Radiology details
        $this->db->select('radiology_report.*, 
                       radio.id as rid, 
                       radio.test_name, 
                       radio.short_name, 
                       staff.name as staff_name, 
                       staff.surname as staff_surname, 
                       charges.id as cid, 
                       charges.charge_category, 
                       charges.standard_charge, 
                       patients.patient_name')
            ->from('radiology_report')
            ->join('radio', 'radiology_report.radiology_id = radio.id', 'inner')
            ->join('staff', 'staff.id = radiology_report.consultant_doctor', 'left')
            ->join('charges', 'charges.id = radio.charge_id', 'inner')
            ->join('patients', 'patients.id = radiology_report.patient_id', 'inner')
            ->where('patients.is_active', 'yes')
            ->where('radiology_report.patient_id', $id);

        $query5 = $this->db->get();
        $radiology = $query5->result_array();

        //Operation Theatre details
        $this->db->select('operation_theatre.*')
->from('operation_theatre')
->join('staff', 'staff.id = operation_theatre.consultant_doctor', 'left')
->join('charges', 'charges.id = operation_theatre.charge_id', 'inner')
->join('patients', 'patients.id = operation_theatre.patient_id', 'inner')
->where('patients.is_active', 'yes')
->where('operation_theatre.patient_id', $id);

$query9 = $this->db->get();
$operation_theatre = $query9->result_array();
        //Blood Issue details
        $this->db->select('blood_issue.*, 
                           patients.patient_name, 
                           patients.gender, 
                           blood_donor.donor_name as donor_name, 
                           blood_donor.blood_group')
            ->from('blood_issue')
            ->join('patients', 'patients.id = blood_issue.recieve_to', 'inner')
            ->join('blood_donor', 'blood_issue.donor_name = blood_donor.id', 'inner')
            ->where('blood_issue.recieve_to', $id)
            ->order_by('blood_issue.id', 'desc');

        $query6 = $this->db->get(); // Corrected variable name from 'quer6y' to 'query6'
        $blood_issues = $query6->result_array();
        //Ambulance 
        $this->db->select('ambulance_call.*, 
                   vehicles.vehicle_no, 
                   vehicles.vehicle_model, 
                   patients.patient_name as patient, 
                   patients.mobileno, 
                   patients.address, 
                   staff.name as staff_name, 
                   staff.surname as staff_surname, 
                   SUM(ambulance_payment.amount) as paidamo')
            ->from('ambulance_call')
            ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no', 'inner')
            ->join('patients', 'patients.id = ambulance_call.patient_name', 'inner')
            ->join('ambulance_payment', 'ambulance_payment.ambulance_call_id = ambulance_call.id', 'left')
            ->join('staff', 'staff.id = ambulance_call.generated_by', 'inner')
            ->where('ambulance_call.patient_name', $id)
            ->group_by('ambulance_call.id') // Group by ambulance_call.id or any unique identifier
            ->order_by('ambulance_call.date', 'desc');
        $query7 = $this->db->get();
        $ambulance = $query7->result_array();

        // onclick="tablesToExcel(array1, array2, array3, array4, array5, array6, array7, \'myfile.xls\')"

        $result = '
        <div class="box border0 clear" id="visit_report">
            <h4 class="mb0">' . $this->lang->line('patient') . " " . $this->lang->line('visit') . " " . $this->lang->line('report') . '</h4>
            <div class="ptt10">
                <a class="btn btn-default btn-xs pull-right" id="print" onclick="printDiv()"><i class="fa fa-print"></i></a> 
                <a class="btn btn-default btn-xs pull-right" id="btnExport" onclick="exportToExcelDirectly()"> <i class="fa fa-file-excel-o"></i> </a>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="1">
                    <caption><h4 class="bolds">' . $this->lang->line('opd') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('opd') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('appointment') . " " .$this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('doctor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . '</th>
                            <th>' . $this->lang->line('symptoms') . '</th>
                        </tr>
                    </thead>
                    <tbody>';

        foreach ($opddata as $value) {
            $result .= '
            <tr>
                <td>' . $value['opd_no'] . '</td>
                <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['appointment_date']))  . '</td>
                <td>' . $value['name'] . ' ' . $value['surname'] . '</td>
                <td>' . $value['refference'] . '</td>
                <td>' . $value['symptoms'] . '</td>
            </tr>';
        }

        $result .= '
                    </tbody>
                </table>
            </div>
    
            
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="2">
                    <caption><h4 class="bolds">' . $this->lang->line('ipd') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('ipd') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('admission') . " " .$this->lang->line('date') . '</th>
                            <th>' . $this->lang->line('doctor') . " " . $this->lang->line('name') . '</th>
                            <th>' . $this->lang->line('reference') . '</th>
                            <th>' . $this->lang->line('symptoms') . '</th>
                        </tr>
                    </thead>
                    <tbody>';
        foreach ($ipddata as $value) {
            $result .= '
            <tr>
                <td>' . $value['ipd_no'] . '</td>
                <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                <td>' . $value['name'] . ' ' . $value['surname'] . '</td>
                <td>' . $value['refference'] . '</td>
                <td>' . $value['symptoms'] . '</td>
            </tr>';
        }

        $result .= '</tbody>
                </table>
            </div>
    
    
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="3">
                    <caption><h4 class="bolds">' . $this->lang->line('pharmacy')  . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('bill') . " " .$this->lang->line('date') . '</th>
                              <th style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                                <th style="text-align:right">' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                           <th style="text-align:right">' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                          
                        </tr>
                    </thead>
                    <tbody>';
        $pharmacy_total_amount = 0;
        $pharmacy_total_paid = 0;
        $pharmacy_total_balance = 0;
        foreach ($pharmacy as $value) {
            $paid_amount = $value['net_amount'];
            $balance_amount = $value['net_amount'] -  $paid_amount;
            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                        <td style="text-align:right">' . number_format($value['net_amount'], 2) . '</td>
                        <td style="text-align:right">' . number_format($paid_amount, 2) . '</td>
                        <td style="text-align:right">' . number_format($balance_amount, 2) . '</td>
                    </tr>';
            $pharmacy_total_amount += $value['net_amount'];
            $pharmacy_total_paid += $paid_amount;
            $pharmacy_total_balance += $balance_amount;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <th></th>
                            <th></th>
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pharmacy_total_amount, 2) . '</td>
                           
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pharmacy_total_paid, 2) . '</td>
                           <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pharmacy_total_balance, 2) . '</td>
                        </tr>
                  </tbody>
                    </table>
            </div>
    

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="4">
                    <caption><h4 class="bolds">' . $this->lang->line('pathology')  . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('reporting') . " " .$this->lang->line('date') . '</th>
                            <th style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('paid') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                          
                        </tr>
                    </thead>
                    <tbody>';
        $pathology_total = 0;
        $pathology_total_paid = 0;
        $pathology_total_balance = 0;
        foreach ($pathology as $value) {
            if (!empty($value['apply_charge'])) {
                $charges = $value['apply_charge'];
            } else {
                $charges = $value['standard_charge'];
            }
            $pathology_paid = $charges;
            $pathology_balance = $charges - $pathology_paid;

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['reporting_date']))  . '</td>
                        <td style="text-align:right">' . number_format($charges, 2) . '</td>
                        <td style="text-align:right">' . number_format($pathology_paid, 2) . '</td>
                        <td style="text-align:right">' . number_format($pathology_balance, 2)  . '</td>
                      
                    </tr>';
            $pathology_total += $charges;
            $pathology_total_paid += $pathology_paid;
            $pathology_total_balance += $pathology_balance;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <td></td>
                            <td></td>  <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pathology_total, 2) . '</td>
                           
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pathology_total_paid, 2) . '</td>
                           <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($pathology_total_balance, 2) . '</td>
                        </tr>
                  </tbody>
                </table>
            </div>
    
             <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="5">
                    <caption><h4 class="bolds">' . $this->lang->line('radiology')   . " " . $this->lang->line('details'). '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('reporting') . " " .$this->lang->line('date') . '</th>
                            <th style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('paid') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                        </tr>
                    </thead>
                    <tbody>';
        $radiology_total = 0;
        $radiology_total_paid = 0;
        $radiology_total_balance = 0;

        foreach ($radiology as $value) {
            if (!empty($value['apply_charge'])) {
                $charges = $value['apply_charge'];
            } else {
                $charges = $value['standard_charge'];
            }
            $radiology_paid = $charges;
            $radiology_balance = $charges - $radiology_paid;

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['reporting_date']))  . '</td>
                        <td style="text-align:right">' . number_format($charges, 2) . '</td>
                        <td style="text-align:right">' . number_format($radiology_paid, 2) . '</td>
                        <td style="text-align:right">' . number_format($radiology_balance, 2)  . '</td>
                    </tr>';
            $radiology_total += $charges;
            $radiology_total_paid += $radiology_paid;
            $radiology_total_balance += $radiology_balance;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <td></td>
                            <td></td>  <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($radiology_total, 2) . '</td>
                           
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($radiology_total_paid, 2) . '</td>
                           <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($radiology_total_balance, 2) . '</td>
                        </tr>
                  </tbody>
              </table>
            </div>
                    <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="5">
                    <caption><h4 class="bolds">' . $this->lang->line('operation_theatre')   . " " . $this->lang->line('details'). '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('date') . '</th>
                            <th style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('paid') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                        </tr>
                    </thead>
                    <tbody>';
        $operation_theatre_total = 0;
        $operation_theatre_total_paid = 0;
        $operation_theatre_total_balance = 0;

        foreach ($operation_theatre as $value) {
          
                $charges = $value['apply_charge'];
            
            $operation_theatre_paid = $charges;
            $operation_theatre_balance = $charges - $operation_theatre_paid;

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                        <td style="text-align:right">' . number_format($charges, 2) . '</td>
                        <td style="text-align:right">' . number_format($operation_theatre_paid, 2) . '</td>
                        <td style="text-align:right">' . number_format($operation_theatre_balance, 2)  . '</td>
                    </tr>';
            $operation_theatre_total += $charges;
            $operation_theatre_total_paid += $operation_theatre_paid;
            $operation_theatre_total_balance += $operation_theatre_balance;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                            <td></td>
                            <td></td>  <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($operation_theatre_total, 2) . '</td>
                           
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($operation_theatre_total_paid, 2) . '</td>
                           <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($operation_theatre_total_balance, 2) . '</td>
                        </tr>
                  </tbody>
              </table>
            </div>
           <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="6">
                    <caption><h4 class="bolds">' . $this->lang->line('blood_issue') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th>' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th>' . $this->lang->line('issue_date') . '</th>
                            <th>' . $this->lang->line('donor') . " " . $this->lang->line('name') . '</th>
                            <th>' . 'Bag' . ' ' . $this->lang->line('no') . '</th>
                             <th style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('paid') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                            <th style="text-align:right">' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                        </tr>
                    </thead>
                    <tbody>';
        $blood_issues_total = 0;
        $blood_issues_total_paid = 0;
        $blood_issues_total_balance = 0;

        foreach ($blood_issues as $value) {

            $blood_issues_paid = $value['amount'];
            $blood_issues_balance = $value['amount'] - $blood_issues_paid;

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date_of_issue']))  . '</td>
                         <td >' . $value['donor_name'] . '</td>
                        <td>' . $value['bag_no'] . '</td>
                       <td style="text-align:right">' . number_format($value['amount'], 2) . '</td>
                        <td style="text-align:right">' . number_format($blood_issues_paid, 2) . '</td>
                        <td style="text-align:right">' . number_format($blood_issues_balance, 2)  . '</td>
                    </tr>';
            $blood_issues_total += $value['amount'];
            $blood_issues_total_paid += $blood_issues_paid;
            $blood_issues_total_balance += $blood_issues_balance;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
                        <tr>
                           <td></td><td></td><td></td>
                            <td></td>  <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($blood_issues_total, 2) . '</td>
                           
                             <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($blood_issues_total_paid, 2) . '</td>
                           <td style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($blood_issues_total_balance, 2) . '</td>
                        </tr>
                  </tbody>
              </table>
            </div>
    
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover allajaxlist" id="7">
                    <caption><h4 class="bolds">' . $this->lang->line('ambulance') . " " . $this->lang->line('details') . '</h4></caption>
                    <thead>
                        <tr>
                            <th width="10%">' . $this->lang->line('bill') . " " . $this->lang->line('no') . '</th>
                            <th width="10%">' . $this->lang->line('date') . '</th>
                            <th width="10%">' . $this->lang->line('vehicle') . " " . $this->lang->line('no') . '</th>

                            <th width="10%"  style="text-align:right">' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                               <th width="10%"  style="text-align:right">' . $this->lang->line('discount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                              <th width="10%"  style="text-align:right">' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                                <th width="10%"  style="text-align:right">' . $this->lang->line('balance') . " " . $this->lang->line('amount') . '(' . $this->customlib->getSchoolCurrencyFormat() . ')</th>
                        </tr>
                    </thead>
                    <tbody>';
        $ambulance_total = 0;
        $ambulance_total_disc = 0;
        $ambulance_total_paid = 0;
        $ambulance_total_balance = 0;
        foreach ($ambulance as $value) {
            $balance_amout = $value['amount'] - $value['paidamo'];

            $result .= '
                    <tr>
                        <td>' . $value['bill_no'] . '</td>
                        <td>' . date($this->customlib->getSchoolDateFormat(true, true), strtotime($value['date']))  . '</td>
                        <td>' . $value['vehicle_no'] . '</td>
                        <td style="text-align:right">' . number_format($value['standard_charge'], 2)  . ' </td>
                          <td style="text-align:right">' . number_format($value['discount_amount'], 2)  . ' </td>
                          <td style="text-align:right">' . number_format($value['paidamo'], 2)  . ' </td>
                          <td style="text-align:right">' . number_format($balance_amout, 2) . ' </td>
                    </tr>';
            $ambulance_total_disc += $value['discount_amount'];
            $ambulance_total += $value['standard_charge'];
            $ambulance_total_paid += $value['paidamo'];
            $ambulance_total_balance += $balance_amout;
        }

        $result .= ' <tr style="border-top: 0.5px solid #F4F4F4; margin: 10px 0; width: 100%;"></tr>
             <tr>
            <td ></td> 
            <td></td>  
            <td></td>     
           
           
            <td  style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($ambulance_total, 2) . '</td>
            <td  style="text-align:right"> <b>' . $this->lang->line('total') . ' ' . $this->lang->line('discount') . ':</b>' . number_format($ambulance_total_disc, 2) . '</td>
                           
             <td  style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('paid') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($ambulance_total_paid, 2) . '</td>
             <td  style="text-align:right"><b>' . $this->lang->line('total') . ' ' . $this->lang->line('balance') . ' ' . $this->lang->line('amount') . ':</b>' . number_format($ambulance_total_balance, 2) . '</td>

        </tr>
 
  </tbody>
</table>
</div>
    
    
    
        </div>';

        echo json_encode($result);
    }
    public function status($id)
    {
        $data = array('discharge_status' => 'approved');
        $this->patient_model->status($id, $data);

        redirect('admin/patient/ipdsearch');
    }

    public function revertStatus($id)
    {
        $data = array('discharge_status' => 'under_review');
        $this->patient_model->status($id, $data);

        redirect('admin/patient/ipdsearch');
    }

    // 01-10-2024
    public function add_nurse_note()
    {
        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_add')) {
            access_denied();
        }

        $this->form_validation->set_rules('nurse_note_date', $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('nurse', $this->lang->line('nurse'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('comment', $this->lang->line('comment'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'nurse_note_date' => form_error('nurse_note_date'),
                'nurse' => form_error('nurse'),
                'note' => form_error('note'),
                'comment' => form_error('comment')
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $nurse_note_date = $this->input->post('nurse_note_date');
            $patient_id = $this->input->post('patient_id');
            $nursenote = array(
                'patient_id' => $patient_id,
                'nurse' => $this->input->post('nurse'),
                'note' => $this->input->post('note'),
                'nurse_note_date' => date("Y-m-d H:i:s", $this->customlib->datetostrtotime($nurse_note_date)),
                'comment' => $this->input->post('comment'),
                'date' => date('Y-m-d'),
            );

            $id = $this->patient_model->add_patient_nursenotes($nursenote);

            $msg = "Nurse Note Added Successfully";
            $array = array('status' => 'success', 'error' => '', 'message' => $msg);
        }
        echo json_encode($array);
    }

    public function delete_nursenote($id)
    {
        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_delete')) {
            access_denied();
        }

        if (!empty($id)) {

            $this->patient_model->delete_nursenote($id);
        }
    }

    public function editNursenote()
    {

        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_edit')) {
            access_denied();
        }

        $id = $this->input->post("id");
        $result = $this->patient_model->geteditNursenote($id);
        $result["nurse_note_date"] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['nurse_note_date']));

        echo json_encode($result);
    }

    public function edit_patient_nursenote()
    {
        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_edit')) {
            access_denied();
        }

        $this->form_validation->set_rules('nurse_note_date', $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('nurse', $this->lang->line('nurse'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('comment', $this->lang->line('comment'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'nurse_note_date' => form_error('nurse_note_date'),
                'nurse' => form_error('nurse'),
                'note' => form_error('note'),
                'comment' => form_error('comment')
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $nurse_note_date = $this->input->post('nurse_note_date');
            $nurse_note_id = $this->input->post('nurse_note_id');
            $patient_id = $this->input->post('patient_id');
            $nursenote = array(
                'id' => $nurse_note_id,
                'patient_id' => $patient_id,
                'nurse' => $this->input->post('nurse'),
                'note' => $this->input->post('note'),
                'nurse_note_date' => date("Y-m-d H:i:s", $this->customlib->datetostrtotime($nurse_note_date)),
                'comment' => $this->input->post('comment'),
                'date' => date('Y-m-d'),
            );

            $this->patient_model->add_patient_nursenotes($nursenote);

            $msg = "Timeline Updated Successfully";
            $array = array('status' => 'success', 'error' => '', 'message' => $msg);
        }
        echo json_encode($array);
    }

    public function add_comment_nursenote()
    {
        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_add')) {
            access_denied();
        }

        $this->form_validation->set_rules('comment_staff', $this->lang->line('comment'), 'required');

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'comment_staff' => form_error('comment_staff')
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $nurse_note_id = $this->input->post('nurse_note_id');
            $comment_nursenote = array(
                'nurse_note_id' => $nurse_note_id,
                'comment_staff' => $this->input->post('comment_staff')
            );

            $this->patient_model->add_comment_nursenote($comment_nursenote);

            $msg = "Comment Added Successfully";
            $array = array('status' => 'success', 'error' => '', 'message' => $msg);
        }
        echo json_encode($array);
    }

    public function delete_comment_nursenote($id)
    {
        if (!$this->rbac->hasPrivilege('ipd_nurse_note', 'can_delete')) {
            access_denied();
        }

        if (!empty($id)) {

            $this->patient_model->delete_comment_nursenote($id);
        }
    }
}
