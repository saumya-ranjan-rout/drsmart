<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Userlog extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->config->load("payroll");

        $this->search_type = $this->config->item('search_type');
    }

 public function index() {
    $this->session->set_userdata('top_menu', 'Reports');
    $this->session->set_userdata('sub_menu', 'userlog/index');
    
    $select = 'userlog.*';
    $join = array();
    $table_name = "userlog";
    $additional = array(
        " role != 'Parent' ",
        " role != 'Student' ",
        " role != 'Patient' "
    );
    $additional_where = array(
        " role = 'Patient' "
    );

    if ($this->input->server('REQUEST_METHOD') == 'POST') {
        // Capture form data (search_type)
        $search_type = $this->input->post('search_type');
        // Redirect to avoid form resubmission on back/refresh
        redirect('admin/userlog/index?search_type=' . $search_type);
    }

    // Handle GET request
    if ($this->input->get('search_type')) {
        $search_type = $this->input->get('search_type');
    } else {
        $search_type = 'today';
    }

    // Fetch the data based on the search type
    if (empty($search_type)) {
        $resultlist = $this->report_model->getReport($select, $join, $table_name);
        $stafflist = $this->report_model->getReport($select, $join, $table_name, $additional);
        $patientlist = $this->report_model->getReport($select, $join, $table_name, $additional_where);
    } else {
        $search_table = "userlog";
        $search_column = "login_datetime";

        $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column);
        $stafflist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional);
        $patientlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
    }

    // Prepare data for the view
    $data['userlogList'] = $resultlist;
    $data['userlogStaffList'] = $stafflist;
    $data['userlogPatientList'] = $patientlist;
    $data['searchlist'] = $this->search_type;
    $data['search_type'] = $search_type;

    // Load the view
    $this->load->view('layout/header', $data);
    $this->load->view('admin/userlog/userlogList', $data);
    $this->load->view('layout/footer', $data);
}

}

?>