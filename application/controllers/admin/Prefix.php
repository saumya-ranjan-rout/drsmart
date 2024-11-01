<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Prefix extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('prefix_setting', 'can_edit')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'schsettings/index');
        $this->session->set_userdata('inner_menu', 'admin/prefix');

        $prefixlist = $this->prefixsetting_model->get();

        if (empty($prefixlist)) {
            $prefixlist = new stdClass();
            $prefixlist->ipd_no = "";
            $prefixlist->opd_no = "";
            $prefixlist->ipd_prescription = "";
            $prefixlist->opd_prescription = "";
            $prefixlist->appointment = "";
            $prefixlist->pharmacy_bill = "";
            $prefixlist->operation_reference_no = "";
            $prefixlist->blood_bank_bill = "";
            $prefixlist->ambulance_call_bill = "";
            $prefixlist->radiology_bill = "";
            $prefixlist->pathology_bill = "";
            $prefixlist->opd_checkup_id = "";
            $prefixlist->pharmacy_purchase_no = "";
            $prefixlist->transaction_id = "";
            $prefixlist->birth_record_reference_no = "";
            $prefixlist->death_record_reference_no = "";
        }
        $data['prefixlist'] = $prefixlist;

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            
            $data['title'] = 'Prefix Setting List';
            $data_insert = array(
                'ipd_no' => $this->input->post('ipd_no'),
                'opd_no' => $this->input->post('opd_no'),
                'ipd_prescription' => $this->input->post('ipd_prescription'),
                'opd_prescription' => $this->input->post('opd_prescription'),
                'appointment' => $this->input->post('appointment'),
                'pharmacy_bill' => $this->input->post('pharmacy_bill'),
                'operation_reference_no' => $this->input->post('operation_reference_no'),
                'blood_bank_bill' => $this->input->post('blood_bank_bill'),
                'ambulance_call_bill' => $this->input->post('ambulance_call_bill'),
                'radiology_bill' => $this->input->post('radiology_bill'),
                'pathology_bill' => $this->input->post('pathology_bill'),
                'opd_checkup_id' => $this->input->post('opd_checkup_id'),
                'pharmacy_purchase_no' => $this->input->post('pharmacy_purchase_no'),
                'transaction_id' => $this->input->post('transaction_id'),
                'birth_record_reference_no' => $this->input->post('birth_record_reference_no'),
                'death_record_reference_no' => $this->input->post('death_record_reference_no'),
            );
            $this->prefixsetting_model->add($data_insert);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">' . $this->lang->line('update_message') . '</div>');
            redirect('admin/prefix');
        } else {
            $data['title'] = 'Prefix Setting List';
            $this->load->view('layout/header', $data);
            $this->load->view('admin/prefix_setting/prefixSettingList', $data);
            $this->load->view('layout/footer', $data);
        }
    }
}
