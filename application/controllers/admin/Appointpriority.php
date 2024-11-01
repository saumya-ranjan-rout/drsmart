<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Appointpriority extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('setup_front_office', 'can_view')) {
            access_denied();
        }
        
     
        
        
        $this->form_validation->set_rules('appointpriority', $this->lang->line('appointpriority'), 'required');

        if ($this->form_validation->run() == FALSE) {
            $data['appointpriority_list'] = $this->appointpriority_model->appointpriority_list();

            $this->load->view('layout/header');
            $this->load->view('admin/frontoffice/appointpriorityview', $data);
            $this->load->view('layout/footer');
        } else {

            $appointpriority = array(
                'appointpriority' => $this->input->post('appointpriority'),
               
            );
            $this->appointpriority_model->add($appointpriority);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">' . $this->lang->line('success_message') . '</div>');
            redirect('admin/appointpriorityview');
        }
    }

    function add() {

        if (!$this->rbac->hasPrivilege('setup_front_office', 'can_add')) {
            access_denied();
        }

        $this->form_validation->set_rules('appointpriority', $this->lang->line('appointpriority'), 'required');

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('appointpriority'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $appointpriority = array(
                'appointpriority' => $this->input->post('appointpriority')
                
            );

            $this->appointpriority_model->add($appointpriority);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }

        echo json_encode($array);
    }


    function edit() {
        $id = $this->input->post('id');
        if (!$this->rbac->hasPrivilege('setup_front_office', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('appointpriority', $this->lang->line('appointpriority'), 'required');

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('appointpriority'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $appointpriority = array(
                'appointpriority' => $this->input->post('appointpriority')
                
            );
            $this->appointpriority_model->update($id, $appointpriority);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
        }

        echo json_encode($array);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('setup_front_office', 'can_delete')) {
            access_denied();
        }
        $this->appointpriority_model->delete($id);
        $this->session->set_flashdata('msg', '<div class="alert alert-success"> Appointpriority deleted successfully</div>');
        redirect('admin/appointpriorityview');
    }

    function get_data($id) {

        $result = $this->appointpriority_model->appointpriority_list($id);
        echo json_encode($result);
    }

}

?>