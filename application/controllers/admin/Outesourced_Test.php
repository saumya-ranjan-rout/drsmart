<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Outesourced_Test extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->load->library('Enc_lib');
        $this->load->library('mailsmsconf');
        $this->load->model('Outesourced_Test_model');
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

   

    public function outsourcedPathologyTest()
    {
        if (!$this->rbac->hasPrivilege('pathology test', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'pathology');
        $categoryName = $this->pathology_category_model->getcategoryName();
        $data["categoryName"] = $categoryName;

        $data["title"] = 'pathology';

        $data['charge_category'] = $this->pathology_model->getChargeCategoryPathology();
        $doctors = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;

        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;

        $data['resultlist'] = $this->Outesourced_Test_model->getOutsourcedPathology();
        $result = $this->pathology_model->getPathology();
        $data['result'] = $result;
        $data["payment_mode"] = $this->payment_mode;

        $this->load->view('layout/header');
        $this->load->view('admin/outsourced_test/outsourcedPathologyTest.php', $data);
        $this->load->view('layout/footer');
    }


    public function addoutsourcedPathologyTest()
    {
        // if (!$this->rbac->hasPrivilege('pathology test', 'can_add')) {
        //     access_denied();
        // }
        $this->form_validation->set_rules('patient_id', $this->lang->line('patient'), 'required');
        $this->form_validation->set_rules('report_date', $this->lang->line('report') . " " . $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('consultant_doctor', $this->lang->line('refferal') . " " . $this->lang->line('doctor'), 'required');
        $this->form_validation->set_rules('test_name', $this->lang->line('test') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('short_name', $this->lang->line('short') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('test_type', $this->lang->line('test') . " " . $this->lang->line('type'), 'required');
        $this->form_validation->set_rules('pathology_category_id', $this->lang->line('category') . " " . $this->lang->line('name'), 'required');
      


        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'patient_id' => form_error('patient_id'),
                'report_date' => form_error('report_date'),
                'consultant_doctor' => form_error('consultant_doctor'),
                'test_name' => form_error('test_name'),
                'short_name' => form_error('short_name'),
                'test_type' => form_error('test_type'),
                'pathology_category_id' => form_error('pathology_category_id'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $patient_id = $this->input->post('patient_id');
            $report_date = $this->input->post("report_date");

            $report_batch = array(
                'patient_id' => $patient_id,
                'report_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($report_date)),
                'consultant_doctor' => $this->input->post('consultant_doctor'),
                'test_name' => $this->input->post('test_name'),
                'short_name' => $this->input->post('short_name'),
                'test_type' => $this->input->post('test_type'),
                'pathology_category_id' => $this->input->post('pathology_category_id'),
                'unit' => $this->input->post('unit'),
                'sub_category' => $this->input->post('sub_category'),
                'method' => $this->input->post('method'),
                'description' => $this->input->post('description'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
               
            );
            $insert_id = $this->Outesourced_Test_model->outsourcedPathologyTest($report_batch);
           

        

            $array = array('status' => 'success', 'id' => $insert_id, 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }
    public function getOutsourcedTestBill($id)
    {

        if (!$this->rbac->hasPrivilege('pathology test', 'can_view')) {
            access_denied();
        }

        $print_details = $this->printing_model->get('', 'pathology');
        $data['print_details'] = $print_details;
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }

        $result = $this->Outesourced_Test_model->getOutsourcedPathology($id);
        $data['result'] = $result;
        $detail = $this->pathology_model->getAllBillDetails($id);
        $data['detail'] = $detail;
        $this->load->view('admin/outsourced_test/printOutsourcedpathologyBill', $data);
    }

    public function outsourcedpathologydelete($id)
    {
        if (!$this->rbac->hasPrivilege('pathology test', 'can_delete')) {
            access_denied();
        }
        if (!empty($id)) {
            $this->db->where("id", $id)->delete('outsourced_pathology_test');
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Deleted Successfully.');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }
   
}
