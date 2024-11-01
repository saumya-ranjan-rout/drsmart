<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Branch extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'branch/index');

        $branchName = $this->branch_model->getbranchName();
        $data["branchName"] = $branchName;


        $data['title'] = 'Branches List';
        $this->load->view('layout/header', $data);
        $this->load->view('admin/branch/branchesList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function add()
    {
        $branch_id = $this->input->post("branch_id");

        $this->form_validation->set_rules(
            'branch_name',
            $this->lang->line('branch') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->branch_model, 'valid_branch_name'))
            )
        );

        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('branch_name'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');

        } else {
            $branchName = $this->input->post("branch_name");
            $otherDetails = $this->input->post("other_details");

            if (!empty($branch_id)) {

                if (!$this->rbac->hasPrivilege('branch', 'can_edit')) {
                    access_denied();
                }

                $data = array('branch_name' => $branchName, 'other_details' => $otherDetails, 'id' => $branch_id);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('branch', 'can_add')) {
                    access_denied();
                }

                $data = array(
                    'branch_name' => $branchName,
                    'other_details' => $otherDetails
                );
                
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->branch_model->addBranchName($data);
        }
        echo json_encode($array);
    }

    public function get_data($id)
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_view')) {
            access_denied();
        }
        $result = $this->branch_model->getbranchName($id);
        echo json_encode($result);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_delete')) {
            access_denied();
        }
        $this->branch_model->delete($id);
        redirect('admin/branch/index');
    }
}
