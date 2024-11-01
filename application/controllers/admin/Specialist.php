<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Specialist extends Admin_Controller {

    function __construct() {

        parent::__construct();
        $this->load->library('datatables');
        $this->load->helper('file');
        $this->config->load("payroll");
    }

    function index() {

        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'hr/index');

        $this->form_validation->set_rules(
                'type', 'Specialist Name', array('required',
            array('check_exists', array($this->specialist_model, 'valid_specialist'))
                )
        );

        $data["title"] = "Add Specialist";
        if ($this->form_validation->run()) {

            $type = $this->input->post("type");
            $specialisttypeid = $this->input->post("specialisttypeid");
            $status = $this->input->post("status");
            if (empty($specialisttypeid)) {

                if (!$this->rbac->hasPrivilege('specialist', 'can_add')) {
                    access_denied();
                }
            } else {

                if (!$this->rbac->hasPrivilege('specialist', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($specialisttypeid)) {
                $data = array('specialist_name' => $type, 'is_active' => 'yes', 'id' => $specialisttypeid);
            } else {

                $data = array('specialist_name' => $type, 'is_active' => 'yes');
            }
            $insert_id = $this->specialist_model->addSpecialistType($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/specialist");
        } else {

            $this->load->view("layout/header");
            $this->load->view("admin/staff/specialistType", $data);
            $this->load->view("layout/footer");
        }
    }

    public function add() {
        $this->form_validation->set_rules(
                'type', $this->lang->line('specialist') . " " . $this->lang->line('name'), array('required',
            array('check_exists', array($this->specialist_model, 'valid_specialist'))
                )
        );
        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('type'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $type = $this->input->post("type");
            $data = array('specialist_name' => $type, 'is_active' => 'yes');
            $insert_id = $this->specialist_model->addSpecialistType($data);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }

        echo json_encode($array);
    }

    function get() { //get product data and encode to be JSON object
        header('Content-Type: application/json');
        echo $this->specialist_model->getall();
    }

    function get_data($id) {
        $result = $this->specialist_model->getSpecialistType($id);
        echo json_encode($result);
    }

    function edit() {
        $this->form_validation->set_rules(
                'type', $this->lang->line('specialist') . " " . $this->lang->line('name'), array('required',
            array('check_exists', array($this->specialist_model, 'valid_specialist'))
                )
        );
        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('type'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $specialisttypeid = $this->input->post("specialisttypeid");
            $type = $this->input->post("type");
            $data = array('specialist_name' => $type, 'is_active' => 'yes', 'id' => $specialisttypeid);
            $this->specialist_model->addSpecialistType($data);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
        }

        echo json_encode($array);
    }

    function specialistdelete($id) {

        if (!empty($id)) {
            $this->specialist_model->deleteSpecialist($id);
        }
        redirect("admin/specialist");
    }

}

?>