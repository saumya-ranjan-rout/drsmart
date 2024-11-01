<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Medicinecategory extends Admin_Controller
{

    public function medicine()
    {


        if (!$this->rbac->hasPrivilege('medicine_category', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'medicine/index');
        $this->session->set_userdata('sub_sidebar_menu', 'admin/medicinecategory/medicine');
        $medicinecategoryid = $this->input->post("medicinecategoryid");
        $data["title"] = "Add Medicine Category";
        $medicineCategory = $this->medicine_category_model->getMedicineCategory();
        $data["medicineCategory"] = $medicineCategory;
        $this->form_validation->set_rules(
            'medicine_category',
            'Medicine Category',
            array(
                'required',
                array('check_exists', array($this->medicine_category_model, 'valid_medicine_category'))
            )
        );
        if ($this->form_validation->run()) {

            $medicineCategory = $this->input->post("medicine_category");
            $medicinecategoryid = $this->input->post("id");
            if (empty($medicinecategoryid)) {
                if (!$this->rbac->hasPrivilege('medicine_category', 'can_add')) {
                    access_denied();
                }
            } else {
                if (!$this->rbac->hasPrivilege('medicine_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($medicinecategoryid)) {
                $data = array('medicine_category' => $medicineCategory, 'id' => $medicinecategoryid);
            } else {

                $data = array('medicine_category' => $medicineCategory);
            }

            $insert_id = $this->medicine_category_model->addMedicineCategory($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/medicinecategory/medicine");
        } else {

            $this->load->view("layout/header");
            $this->load->view("admin/pharmacy/medicine_category", $data);
            $this->load->view("layout/footer");
        }
    }

    public function supplier()
    {
        if (!$this->rbac->hasPrivilege('medicine_supplier', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'medicine/index');
        $this->session->set_userdata('sub_sidebar_menu', 'admin/medicinecategory/supplier');
        $medicinecategoryid = $this->input->post("medicinecategoryid");
        $data["title"] = "Add Supplier";
        $supplierCategory = $this->medicine_category_model->getSupplierCategoryPat();
        $data["supplierCategory"] = $supplierCategory;
        $this->form_validation->set_rules(
            'supplier_category',
            $this->lang->line('supplier') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->medicine_category_model, 'valid_supplier_category'))
            )
        );
        if ($this->form_validation->run()) {
            $supplierCategory = $this->input->post("supplier_category");
            $suppliercategoryid = $this->input->post("id");
            if (empty($suppliercategoryid)) {
                if (!$this->rbac->hasPrivilege('supplier_category', 'can_add')) {
                    access_denied();
                }
            } else {
                if (!$this->rbac->hasPrivilege('supplier_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($suppliercategoryid)) {
                $data = array('supplier_category' => $supplierCategory, 'id' => $suppliercategoryid);
            } else {

                $data = array('supplier_category' => $supplierCategory);
            }

            $insert_id = $this->medicine_category_model->addMedicineCategory($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/medicinecategory/supplier");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/pharmacy/supplier_category", $data);
            $this->load->view("layout/footer");
        }
    }

    public function add()
    {
        if ((!$this->rbac->hasPrivilege('medicine_category', 'can_add')) || (!$this->rbac->hasPrivilege('medicine_category', 'can_edit'))) {
            access_denied();
        }
        $medicinecategoryid = $this->input->post("medicinecategoryid");
        $this->form_validation->set_rules(
            'medicine_category',
            $this->lang->line('medicine') . " " . $this->lang->line('category'),
            array(
                'required',
                array('check_exists', array($this->medicine_category_model, 'valid_medicine_category'))
            )
        );
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('medicine_category'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $medicineCategory = $this->input->post("medicine_category");
            if (!empty($medicinecategoryid)) {
                $data = array('medicine_category' => $medicineCategory, 'id' => $medicinecategoryid);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                $data = array('medicine_category' => $medicineCategory);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->medicine_category_model->addMedicineCategory($data);
        }
        echo json_encode($array);
    }

    public function addsupplier()
    {
        if ((!$this->rbac->hasPrivilege('medicine_supplier', 'can_add')) || (!$this->rbac->hasPrivilege('medicine_supplier', 'can_edit'))) {
            access_denied();
        }

        $suppliercategoryid = $this->input->post("suppliercategoryid");

        // Set form validation rules
        $this->form_validation->set_rules(
            'supplier_category',
            $this->lang->line('supplier') . " " . $this->lang->line('name'),
            array('required', array('check_exists', array($this->medicine_category_model, 'valid_supplier_category')))
        );

        if (empty($suppliercategoryid)) {
            // Adding new supplier
            $this->form_validation->set_rules('number', $this->lang->line('contact_person_phone'), 'trim|required|callback_valid_mobile_number');
            $this->form_validation->set_rules('number3', $this->lang->line('supplier') . " " . $this->lang->line('contact'), 'trim|required|callback_valid_mobile_number');
        } else {
            // Editing existing supplier
            $this->form_validation->set_rules('number2', $this->lang->line('contact_person_phone'), 'trim|required|callback_valid_mobile_number');
            $this->form_validation->set_rules('number4', $this->lang->line('supplier') . " " . $this->lang->line('contact'), 'trim|required|callback_valid_mobile_number');
        }

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'supplier_category' => form_error('supplier_category'),
                //'contact' => form_error('contact'),
                'supplier_person' => form_error('supplier_person'),
                'number' => form_error('number'),
                'number2' => form_error('number2'),
                'number3' => form_error('number3'),
                'number4' => form_error('number4'),
                'address' => form_error('address'),
                'supplier_drug_licence' => form_error('supplier_drug_licence'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $supplierCategory = $this->input->post("supplier_category");
            //$contact = $this->input->post('contact');
            $supplierperson = $this->input->post('supplier_person');
            $supplier_drug_licence = $this->input->post('supplier_drug_licence');
            $address = $this->input->post('address');

            if (empty($suppliercategoryid)) {
                // Handle adding a new supplier
                $countryCode = $this->input->post('countryCode');
                $number = $this->input->post('number');
                $supplierpersoncontact = $countryCode . $number;

                $countryCode3 = $this->input->post('countryCode3');
                $number3 = $this->input->post('number3');
                $contact = $countryCode3 . $number3;



                $data = array(
                    'supplier_category' => $supplierCategory,
                    'contact' => $contact,
                    'supplier_person' => $supplierperson,
                    'supplier_person_contact' => $supplierpersoncontact,
                    'supplier_drug_licence' => $supplier_drug_licence,
                    'address' => $address
                );

                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            } else {
                // Handle editing an existing supplier
                $countryCode2 = $this->input->post('countryCode2');
                $number2 = $this->input->post('number2');
                $supplierpersoncontact2 = $countryCode2 . $number2;

                $countryCode4 = $this->input->post('countryCode4');
                $number4 = $this->input->post('number4');
                $contact = $countryCode4 . $number4;

                $data = array(
                    'supplier_category' => $supplierCategory,
                    'id' => $suppliercategoryid,
                    'contact' => $contact,
                    'supplier_person' => $supplierperson,
                    'supplier_person_contact' => $supplierpersoncontact2,
                    'supplier_drug_licence' => $supplier_drug_licence,
                    'address' => $address
                );

                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            }

            // Insert or update data
            $insert_id = $this->medicine_category_model->addSupplierCategory($data);
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

    public function get()
    { //get product data and encode to be JSON object
        header('Content-Type: application/json');
        echo $this->medicine_category_model->getall();
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('medicine_category', 'can_view')) {
            access_denied();
        }
        $result = $this->medicine_category_model->getMedicineCategory($id);
        $data["result"] = $result;
        $data["title"] = "Edit Category";
        $medicineCategory = $this->medicine_category_model->getMedicineCategory();
        $data["medicineCategory"] = $medicineCategory;
        $this->load->view("layout/header");
        $this->load->view("admin/pharmacy/medicine_category", $data);
        $this->load->view("layout/footer");
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('medicine_category', 'can_delete')) {
            access_denied();
        }
        $this->medicine_category_model->delete($id);
        redirect('admin/medicinecategory/medicine');
    }

    public function deletesupplier($id)
    {
        if (!$this->rbac->hasPrivilege('medicine_category', 'can_delete')) {
            access_denied();
        }

        $this->medicine_category_model->deletesupplier($id);
        redirect('admin/medicinecategory/supplier');
    }

    public function get_data($id)
    {
        if (!$this->rbac->hasPrivilege('medicine_category', 'can_view')) {
            access_denied();
        }
        $result = $this->medicine_category_model->getMedicineCategory($id);
        echo json_encode($result);
    }

    public function get_datasupplier($id)
    {
        if (!$this->rbac->hasPrivilege('medicine_category', 'can_view')) {
            access_denied();
        }
        $result = $this->medicine_category_model->getSupplierCategory($id);
        echo json_encode($result);
    }
}
