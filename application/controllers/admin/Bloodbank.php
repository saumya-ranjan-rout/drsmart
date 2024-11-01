<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Bloodbank extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->load->library('Enc_lib');
        $this->load->library('mailsmsconf');
        $this->marital_status = $this->config->item('marital_status');
        $this->payment_mode = $this->config->item('payment_mode');
        $this->search_type = $this->config->item('search_type');
        $this->blood_group = $this->config->item('bloodgroup');
        $this->charge_type = $this->config->item('charge_type');
        $data["charge_type"] = $this->charge_type;
        $this->patient_login_prefix = "pat";
    }

    public function unauthorized()
    {
        $data = array();
        $this->load->view('layout/header', $data);
        $this->load->view('unauthorized', $data);
        $this->load->view('layout/footer', $data);
    }

    public function add()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('donor_name', $this->lang->line('donor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('dob', $this->lang->line('date_of_birth'), 'required');
        $this->form_validation->set_rules('gender', $this->lang->line('gender'), 'required');
        $this->form_validation->set_rules('blood_group', $this->lang->line('blood') . " " . $this->lang->line('group'), 'required');
        $this->form_validation->set_rules('number', $this->lang->line('mobile_no'), 'trim|required|callback_valid_mobile_number');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'donor_name' => form_error('donor_name'),
                'dob' => form_error('dob'),
                'age' => form_error('age'),
                'blood_group' => form_error('blood_group'),
                'gender' => form_error('gender'),
                'father_name' => form_error('father_name'),
                'number' => form_error('number'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('number');
            $dobdate = $this->input->post('dob');
            // $dob =   date("Y-m-d H:i:s", $this->customlib->datetostrtotime($dobdate));
            if ($dobdate == "") {
                $dob = "";
            } else {
                $dob = date('Y-m-d', $this->customlib->datetostrtotime($dobdate));
            }
            $blooddonor = array(
                'donor_name' => $this->input->post('donor_name'),
                'dob' => $dob,
                'age' => $this->input->post('age'),
                'month' => $this->input->post('month'),
                'blood_group' => $this->input->post('blood_group'),
                'gender' => $this->input->post('gender'),
                'father_name' => $this->input->post('father_name'),
                'address' => $this->input->post('address'),
                'contact_no' => $countryCode . $number,


            );
            $this->blooddonor_model->add($blooddonor);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
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

    public function search()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
            access_denied();
        }
        $data["bloodgroup"] = $this->blood_group;
        $data['resultlist'] = $this->blooddonor_model->searchFullText();
        $result = $this->blooddonor_model->getBloodBank();
        $data['result'] = $result;
        $this->load->view('layout/header');
        $this->load->view('admin/bloodbank/search.php', $data);
        $this->load->view('layout/footer');
    }

    public function getDetails()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("blood_donor_id");
        $result = $this->blooddonor_model->getDetails($id);

        if (($result['dob'] == '') || ($result['dob'] == '0000-00-00') || ($result['dob'] == '1970-01-01')) {
            $result['dob'] = "";
        } else {
            $result['dob'] = date($this->customlib->getSchoolDateFormat(true, false), strtotime($result['dob']));
        }

        echo json_encode($result);
    }

    public function update()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('donor_name', $this->lang->line('donor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('dob', $this->lang->line('date_of_birth'), 'required');
        $this->form_validation->set_rules('blood_group', $this->lang->line('blood') . " " . $this->lang->line('group'), 'required');
        $this->form_validation->set_rules('number2', $this->lang->line('mobile_no'), 'trim|required|callback_valid_mobile_number');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'donor_name' => form_error('donor_name'),
                'dob' => form_error('dob'),
                'age' => form_error('age'),
                'blood_group' => form_error('blood_group'),
                'gender' => form_error('gender'),
                'father_name' => form_error('father_name'),
                'number2' => form_error('number2'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('id');
            $countryCode = $this->input->post('countryCode2');
            $number = $this->input->post('number2');
            $dobdate = $this->input->post('dob');
            $dob = date("Y-m-d", $this->customlib->datetostrtotime($dobdate));
            $blooddonor = array(
                'id' => $id,
                'donor_name' => $this->input->post('donor_name'),
                'dob' => $dob,
                'age' => $this->input->post('age'),
                'month' => $this->input->post('month'),
                'blood_group' => $this->input->post('blood_group'),
                'gender' => $this->input->post('gender'),
                'father_name' => $this->input->post('father_name'),
                'address' => $this->input->post('address'),
                'contact_no' => $countryCode . $number
            );
            $this->blooddonor_model->update($blooddonor);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_delete')) {
            access_denied();
        }
        if (!empty($id)) {
            $this->blooddonor_model->deleteBloodDonor($id);

            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function getBloodBank()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post('blood_donor_id');
        $result = $this->blooddonor_model->getBloodBank($id);
        echo json_encode($result);
    }

  public function addIssue()
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('date_of_issue', $this->lang->line('issue') . " " . $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('recieve_to', $this->lang->line('patient'), 'required');
        $this->form_validation->set_rules('donor_name', $this->lang->line('donor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('doctor', $this->lang->line('doctor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required|numeric');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('hospital') . " " . $this->lang->line('doctor'), 'required');

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date_of_issue' => form_error('date_of_issue'),
                'recieve_to' => form_error('recieve_to'),
                'doctor' => form_error('doctor'),
                'donor_name' => form_error('donor_name'),
                'consultant_doctor' => form_error('consultant_doctor'),
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
            $prefix = $this->setting_model->getPrefixSetting('blood_bank_bill');
            $bill_no = $this->bloodissue_model->getMaxId();
            if (empty($bill_no)) {
                $bill_no = 0;
            }
            $bill = $bill_no + 1;


            if (empty($prefix)) {
                $prefix = "BIB";
            }
            $ref_no = $prefix . $bill;


            $issue_date = $this->input->post('date_of_issue');
            $patient_id = $this->input->post('recieve_to');
            $bloodissue = array(
                'date_of_issue' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($issue_date)),
                'bill_no' => $bill,
                'ref_no' => $ref_no,
                'recieve_to' => $patient_id,
                'doctor' => $this->input->post('doctor'),
                'technician' => $this->input->post('technician'),
                'amount' => $this->input->post('amount'),
                'donor_name' => $this->input->post('donor_name'),
                'lot' => $this->input->post('lot'),
                'bag_no' => $this->input->post('bag_no'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
                'remark' => $this->input->post('remark'),
                'payment_mode' => $this->input->post('payment_mode'),
                'cheque_no' => $cheque_no,
                'cheque_date' => $cheque_date,
            );

            $insert_id = $this->bloodissue_model->add($bloodissue);

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $insert_id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->bloodissue_model->add($data_img);
            }

            $array = array('status' => 'success', 'id' => $insert_id, 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function issue()
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_view')) {
            access_denied();
        }
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        $blooddonar = $this->patient_model->getBlooddonarListall();
        $data["blooddonar"] = $blooddonar;
        $data["bloodgroup"] = $this->blood_group;
        $data['resultlist'] = $this->bloodissue_model->searchFullText();
        $result = $this->bloodissue_model->getBloodIssue();
        $data['result'] = $result;
        $data["payment_mode"] = $this->payment_mode;
        $this->load->view('layout/header');
        $this->load->view('admin/bloodbank/bloodissue.php', $data);
        $this->load->view('layout/footer');
    }

    public function getBillDetails($id)
    {
        if (!$this->rbac->hasPrivilege('bloodissue bill', 'can_view')) {
            access_denied();
        }
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details = $this->printing_model->get('', 'bloodbank');
        $data['print_details'] = $print_details;
        $result = $this->bloodissue_model->getBillDetails($id);
        $data['result'] = $result;
        $detail = $this->bloodissue_model->getAllBillDetails($id);
        $data['detail'] = $detail;
        $this->load->view('admin/bloodbank/printBill', $data);
    }

     public function getIssueDetails()
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("bloodissue_id");
        $result = $this->bloodissue_model->getDetails($id);

        if (!empty($result['date_of_issue'])) {
            $date_of_issue = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date_of_issue']));
            $result["date_of_issue"] = $date_of_issue;
        }
       
        echo json_encode($result);
    }

  public function updateIssue()
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('date_of_issue', $this->lang->line('issue') . " " . $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('recieve_to', $this->lang->line('receive') . " " . $this->lang->line('to'), 'required');

        $this->form_validation->set_rules('doctor', $this->lang->line('doctor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required');
        $this->form_validation->set_rules('donor_name', $this->lang->line('donor') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('hospital') . " " . $this->lang->line('doctor'), 'required');
  
        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'trim|required|xss_clean');
        }

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date_of_issue' => form_error('date_of_issue'),
                'recieve_to' => form_error('recieve_to'),
                'doctor' => form_error('doctor'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'amount' => form_error('amount'),
                'donor_name' => form_error('donor_name'),
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

            $id = $this->input->post('id');
            $issue_date = $this->input->post("date_of_issue");
            $patient_id = $this->input->post('recieve_to');
            $bloodissue = array(
                'id' => $id,
                'date_of_issue' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($issue_date)),
                'recieve_to' => $patient_id,
                'doctor' => $this->input->post('doctor'),
                'technician' => $this->input->post('technician'),
                'amount' => $this->input->post('amount'),
                'donor_name' => $this->input->post('donor_name'),
                'lot' => $this->input->post('lot'),
                'bag_no' => $this->input->post('bag_no'),
                'remark' => $this->input->post('remark'),
                'payment_mode' => $this->input->post('payment_mode'),
                'cheque_no' => $cheque_no,
                'cheque_date' => $cheque_date,
            );

            $this->bloodissue_model->update($bloodissue);

            if (isset($_FILES["document"]) && !empty($_FILES['document']['name'])) {
                $fileInfo = pathinfo($_FILES["document"]["name"]);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["document"]["tmp_name"], "./uploads/payment_document/" . $img_name);
                $data_img = array('id' => $id, 'payment_doc' => 'uploads/payment_document/' . $img_name);
                $this->bloodissue_model->update($data_img);
            } else {
                $data_img = array('id' => $id, 'payment_doc' => '');
                $this->bloodissue_model->update($data_img);
            }

            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Saved Successfully.');
        }
        echo json_encode($array);
    }


    public function deleteIssue($id)
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_delete')) {
            access_denied();
        }
        if (!empty($id)) {

            $this->bloodissue_model->delete($id);
            $array = array('status' => 'success', 'error' => '', 'message' => '');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function getBloodIssue()
    {
        if (!$this->rbac->hasPrivilege('blood_issue', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post('bloodissue_id');
        $result = $this->bloodissue_model->getBloodIssue($id);
        echo json_encode($result);
    }

    public function donorCycle()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('blood_donor_id', $this->lang->line('blood') . " " . $this->lang->line('donor') . " " . $this->lang->line('id'), 'required');
        $this->form_validation->set_rules('bag_no', $this->lang->line('bag_no'), 'required');
        $this->form_validation->set_rules('quantity', $this->lang->line('quantity'), 'required');
        $this->form_validation->set_rules('donate_date', $this->lang->line('donate') . " " . $this->lang->line('date'), 'required');
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'donate_date' => form_error('donate_date'),
                'blood_donor_id' => form_error('blood_donor_id'),
                'bag_no' => form_error('bag_no'),
                'quantity' => form_error('quantity'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('blood_donor_id');
            $donate_date = $this->input->post('donate_date');
            $donor_cycle = array(
                'blood_donor_id' => $id,
                'institution' => $this->input->post('institution'),
                'lot' => $this->input->post('lot'),
                'bag_no' => $this->input->post('bag_no'),
                'quantity' => $this->input->post('quantity'),
                'donate_date' => date('Y-m-d', $this->customlib->datetostrtotime($donate_date))
            );
            $this->blood_donorcycle_model->donorCycle($donor_cycle);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function getDonorBloodBatch()
    {
        if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("blood_donor_id");
        $data["id"] = $id;
        $result = $this->blood_donorcycle_model->getDonorBloodBatch($id);
        $data["result"] = $result;
        $this->load->view('admin/bloodbank/donorbloodbatch', $data);
    }

  
    // public function bloodDonorReport()
    // {
    //     if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
    //         access_denied();
    //     }
    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $this->session->set_userdata('sub_menu', 'admin/bloodbank/blooddonorreport');
    //     $select = 'blood_donor_cycle.*,blood_donor.id as bdid,blood_donor.donor_name,blood_donor.age,blood_donor.blood_group,blood_donor.gender';
    //     $join = array(
    //         'LEFT JOIN blood_donor_cycle ON blood_donor_cycle.blood_donor_id =blood_donor.id',
    //     );
    //     $table_name = "blood_donor";

    //     $search_type = $this->input->post("search_type");
    //     if (isset($search_type)) {
    //         $search_type = $this->input->post("search_type");
    //     } else {
    //         $search_type = "this_month";
    //     }

    //     if (empty($search_type)) {
    //         $search_type = "";
    //         $resultlist = $this->report_model->getReport($select, $join, $table_name, $where = array());
    //     } else {

    //         $search_table = "blood_donor";
    //         $search_column = "created_at";
    //         $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $where = array());
    //     }

    //     $data["searchlist"] = $this->search_type;
    //     $data["search_type"] = $search_type;
    //     $data["resultlist"] = $resultlist;
    //     $this->load->view('layout/header');
    //     $this->load->view('admin/bloodbank/blooddonorreport.php', $data);
    //     $this->load->view('layout/footer');
    // }

    public function bloodDonorReport()
{
    if (!$this->rbac->hasPrivilege('blood_donor', 'can_view')) {
        access_denied();
    }

    $this->session->set_userdata('top_menu', 'Reports');
    $this->session->set_userdata('sub_menu', 'admin/bloodbank/blooddonorreport');
    
    $select = 'blood_donor_cycle.*,blood_donor.id as bdid,blood_donor.donor_name,blood_donor.age,blood_donor.blood_group,blood_donor.gender';
    $join = array(
        'LEFT JOIN blood_donor_cycle ON blood_donor_cycle.blood_donor_id = blood_donor.id',
    );
    $table_name = "blood_donor";

    // Handle POST request and redirect to avoid form resubmission
    if ($this->input->server('REQUEST_METHOD') == 'POST') {
        $search_type = $this->input->post("search_type", true);
        // Redirect with search_type in URL to avoid form resubmission
        redirect('admin/bloodbank/blooddonorreport?search_type=' . urlencode($search_type));
    }

    // Handle GET request after redirection
    $search_type = $this->input->get('search_type');

    // Set default value if no search_type is provided
    if (empty($search_type)) {
        $search_type = "this_month"; // Default search type
    }

    // Retrieve data based on search type
    if ($search_type == "") {
        $resultlist = $this->report_model->getReport($select, $join, $table_name, $where = array());
    } else {
        $search_table = "blood_donor";
        $search_column = "created_at";
        $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $where = array());
    }

    // Prepare data for the view
    $data["searchlist"] = $this->search_type;
    $data["search_type"] = $search_type;
    $data["resultlist"] = $resultlist;

    // Load views
    $this->load->view('layout/header');
    $this->load->view('admin/bloodbank/blooddonorreport.php', $data);
    $this->load->view('layout/footer');
}
     // public function bloodIssueReport()
    // {
    //     if (!$this->rbac->hasPrivilege('blood_issue_report', 'can_view')) {
    //         access_denied();
    //     }
    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $this->session->set_userdata('sub_menu', 'admin/bloodbank/bloodissuereport');
    //     $select = 'blood_issue.*,patients.patient_name,patients.gender,patients.blood_group,blood_donor.donor_name';
    //     $join = array('JOIN patients ON patients.id =blood_issue.recieve_to', 'JOIN blood_donor ON blood_donor.id =blood_issue.donor_name');
    //     $table_name = "blood_issue";

    //     $search_type = $this->input->post("search_type");
    //     if (isset($search_type)) {
    //         $search_type = $this->input->post("search_type");
    //     } else {
    //         $search_type = "this_month";
    //     }

    //     if (empty($search_type)) {
    //         $search_type = "";
    //         $resultlist = $this->report_model->getReport($select, $join, $table_name, $where = array());
    //     } else {

    //         $search_table = "blood_issue";
    //         $search_column = "created_at";
    //         $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $where = array());
    //     }
    //     $data["searchlist"] = $this->search_type;
    //     $data["search_type"] = $search_type;
    //     $data["resultlist"] = $resultlist;
    //     $this->load->view('layout/header');
    //     $this->load->view('admin/bloodbank/bloodissuereport.php', $data);
    //     $this->load->view('layout/footer');
    // }
    public function bloodIssueReport()
    {
        if (!$this->rbac->hasPrivilege('blood_issue_report', 'can_view')) {
            access_denied();
        }
    
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/bloodbank/bloodissuereport');
    
        // Handle POST request and redirect to avoid form resubmission
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $search_type = $this->input->post("search_type", true);
            // Redirect to avoid form resubmission
            redirect('admin/bloodbank/bloodissuereport?search_type=' . urlencode($search_type));
        }
    
        // Get search parameters from the URL
        $search_type = $this->input->get('search_type');
        // Set default search type if not provided
        if (empty($search_type)) {
            $search_type = "this_month"; // Default search type
        }
    
        // SQL Select and Join clauses
        $select = 'blood_issue.*, patients.patient_name, patients.gender, patients.blood_group, blood_donor.donor_name';
        $join = array(
            'JOIN patients ON patients.id = blood_issue.recieve_to',
            'JOIN blood_donor ON blood_donor.id = blood_issue.donor_name'
        );
        $table_name = "blood_issue";
    
        // Determine search table and column
        $search_table = "blood_issue";
        $search_column = "created_at";
    
        // Get result list based on search type
        if ($search_type === "") {
            $resultlist = $this->report_model->getReport($select, $join, $table_name);
        } else {
            $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column);
        }
    
        // Prepare data for the view
        $data["searchlist"] = $this->search_type; // Assuming $this->search_type is populated somewhere else
        $data["search_type"] = $search_type;
        $data["resultlist"] = $resultlist;
    
        // Load views
        $this->load->view('layout/header', $data);
        $this->load->view('admin/bloodbank/bloodissuereport', $data);
        $this->load->view('layout/footer', $data);
    }
    public function deleteDonorCycle($id)
    {
        if (!empty($id)) {
            $this->blood_donorcycle_model->deleteCycle($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record deleted Successfully');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    public function getDonorBloodgroup()
    {
        $donor_id = $this->input->post("donor_id");
        $result = $this->blooddonor_model->getDonorBloodgroup($donor_id);
        echo json_encode($result);
    }
}
