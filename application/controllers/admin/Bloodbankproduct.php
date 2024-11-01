<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Bloodbankproduct extends Admin_Controller {

    public function products() {

        if (!$this->rbac->hasPrivilege('blood_bank_product', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'blood_bank');
        $data['title'] = 'Blood Bank Products';
        $bloodProduct = $this->bloodbankproduct_model->getBloodProduct();
        $data["bloodProduct"] = $bloodProduct;

        $this->load->view("layout/header");
        $this->load->view("admin/bloodbank/bloodbankproducts", $data);
        $this->load->view("layout/footer");
    }

    public function add() {
        if (!$this->rbac->hasPrivilege('blood_bank_product', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'blood_bank');
        $this->session->set_userdata('sub_menu', 'admin/bloodbankproduct/products');
        $bloodproductid = $this->input->post("bloodproductid");

        $this->form_validation->set_rules('type', $this->lang->line('type'), 'required');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'required');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'type' => form_error('type'),
                'name' => form_error('name'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $bloodproducttype = $this->input->post("type");
            $bloodproductname = $this->input->post("name");
            if (!empty($bloodproductid)) {
                $data = array(
                    'type' => $bloodproducttype,
                    'name' => $bloodproductname,
                    'id' => $bloodproductid
                );
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            } else {
                $data = array(
                    'type' => $bloodproducttype,
                    'name' => $bloodproductname
                );
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            }
            $insert_id = $this->bloodbankproduct_model->addBloodProduct($data);
        }

        echo json_encode($array);  // This line was corrected
    }


    public function get_data($id) {
        if (!$this->rbac->hasPrivilege('blood_bank_product', 'can_view')) {
            access_denied();
        }
        $result = $this->bloodbankproduct_model->getProductName($id);
        echo json_encode($result);
    }

    public function delete($id) {
        if (!$this->rbac->hasPrivilege('blood_bank_product', 'can_view')) {
            access_denied();
        }
        if (!empty($id)) {
            $this->bloodbankproduct_model->delete($id);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record deleted Successfully');
        } else {
            $array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($array);
    }

    

}

?>