<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pathologycategory extends Admin_Controller
{

    public function addCategory()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addCategory/index');
        $pathology_category_id = $this->input->post("pathology_category_id");

        $categoryName = $this->pathology_category_model->getcategoryName();
        $data["categoryName"] = $categoryName;
        $this->form_validation->set_rules(
            'category_name',
            'Category Name',
            array(
                'required',
                array('check_exists', array($this->pathology_category_model, 'valid_category_name'))
            )
        );
        $data["title"] = "Add Pathology Categories";
        if ($this->form_validation->run()) {
            $categoryName = $this->input->post("category_name");
            $pathology_category_id = $this->input->post("id");
            if (empty($pathology_category_id)) {

                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
            } else {

                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($pathology_category_id)) {
                $data = array('category_name' => $categoryName, 'id' => $pathology_category_id);
            } else {
                $data = array('category_name' => $categoryName);
            }

            $insert_id = $this->pathology_category_model->addCategoryName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/pathologycategory/addCategory");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/pathology/category", $data);
            $this->load->view("layout/footer");
        }
    }

    public function add()
    {
        $pathology_category_id = $this->input->post("pathology_category_id");
        $this->form_validation->set_rules(
            'category_name',
            $this->lang->line('category') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->pathology_category_model, 'valid_category_name'))
            )
        );
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('category_name'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $categoryName = $this->input->post("category_name");
            if (!empty($pathology_category_id)) {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
                $data = array('category_name' => $categoryName, 'id' => $pathology_category_id);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
                $data = array('category_name' => $categoryName);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->pathology_category_model->addCategoryName($data);
        }
        echo json_encode($array);
    }

    public function get()
    { //get product data and encode to be JSON object
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_view')) {
            access_denied();
        }
        header('Content-Type: application/json');
        echo $this->lab_model->getall();
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_view')) {
            access_denied();
        }
        $result = $this->pathology_category_model->getCategoryName($id);
        $data["result"] = $result;
        $data["title"] = "Edit Category Name";
        $categoryName = $this->pathology_category_model->getCategoryName();
        $data["categoryName"] = $categoryName;
        $this->load->view("layout/header");
        $this->load->view("admin/pathology/category", $data);
        $this->load->view("layout/footer");
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_delete')) {
            access_denied();
        }
        $this->pathology_category_model->delete($id);
        redirect('admin/pathologycategory/addCategory');
    }

    public function get_data($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_view')) {
            access_denied();
        }
        $result = $this->pathology_category_model->getCategoryName($id);
        echo json_encode($result);
    }

    //Unit

    public function unit()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addCategory/index');
        $unit_id = $this->input->post("unit_id");

        $unitName = $this->pathology_category_model->getUnitName();
        $data["unitName"] = $unitName;
        $this->form_validation->set_rules(
            'unit_name',
            'Unit Name',
            array(
                'required',
                array('check_exists', array($this->pathology_category_model, 'valid_unit_name'))
            )
        );
        $data["title"] = "Add Units";
        if ($this->form_validation->run()) {
            $unitName = $this->input->post("unit_name");
            $unit_id = $this->input->post("id");
            if (empty($unit_id)) {

                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
            } else {

                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($unit_id)) {
                $data = array('unit_name' => $unitName, 'id' => $unit_id);
            } else {
                $data = array('unit_name' => $unitName);
            }

            $insert_id = $this->pathology_category_model->addUnitName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/pathologycategory/addUnit");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/pathology/unit", $data);
            $this->load->view("layout/footer");
        }
    }

    public function addUnit()
    {
        $unit_id = $this->input->post("unit_id");

        $this->form_validation->set_rules(
            'unit_name',
            $this->lang->line('unit') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->pathology_category_model, 'valid_unit_name'))
            )
        );
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'unit_name' => form_error('unit_name'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $unitName = $this->input->post("unit_name");
            if (!empty($unit_id)) {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
                $data = array('unit_name' => $unitName, 'id' => $unit_id);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
                $data = array('unit_name' => $unitName);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->pathology_category_model->addUnitName($data);
        }
        echo json_encode($array);
    }

    public function get_data_unit($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_view')) {
            access_denied();
        }
        $result = $this->pathology_category_model->getUnitName($id);
        echo json_encode($result);
    }

    public function delete_unit($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_delete')) {
            access_denied();
        }
        $this->pathology_category_model->delete_unit($id);
        redirect('admin/pathologycategory/unit');
    }

    //Pathology Parameter

    public function pathoparameter()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addCategory/index');
        $pathology_parameter_id = $this->input->post("pathology_parameter_id");

        $data["units"]  = $this->pathology_category_model->getUnits();
        $data["parameterName"] = $this->pathology_category_model->getParameterName();

        $this->form_validation->set_rules('parameter_name', $this->lang->line('parameter') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('reference_range', $this->lang->line('reference') . " " . $this->lang->line('range'), 'required');
        $this->form_validation->set_rules('unit', $this->lang->line('unit'), 'required');
        /*$this->form_validation->set_rules('description', $this->lang->line('description'), 'required');*/

        $data["title"] = "Add Pathology Parameters";
        if ($this->form_validation->run()) {
            $parameter_name = $this->input->post("parameter_name");
            $reference_range = $this->input->post("reference_range");
            $unit = $this->input->post("unit");
            $description = $this->input->post("description");
            $pathology_parameter_id = $this->input->post("id");
            if (empty($pathology_parameter_id)) {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
            } else {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($pathology_parameter_id)) {
                $data = array(
                    'parameter_name' => $parameter_name,
                    'reference_range' => $reference_range,
                    'unit' => $unit,
                    'description' => $description,
                    'id' => $pathology_parameter_id
                );
            } else {
                $data = array(
                    'parameter_name' => $parameter_name,
                    'reference_range' => $reference_range,
                    'unit' => $unit,
                    'description' => $description
                );
            }

            $insert_id = $this->pathology_category_model->addUnitName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/pathologycategory/addPathoparameter");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/pathology/pathologyParameter", $data);
            $this->load->view("layout/footer");
        }
    }


    public function addPathoparameter()
    {
        $pathology_parameter_id = $this->input->post("pathology_parameter_id");

        // Set validation rules for all fields
        $this->form_validation->set_rules('parameter_name', $this->lang->line('parameter') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('reference_range', $this->lang->line('reference') . " " . $this->lang->line('range'), 'required');
        $this->form_validation->set_rules('unit', $this->lang->line('unit'), 'required');
        /* $this->form_validation->set_rules('description', $this->lang->line('description'), 'required');*/

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'parameter_name' => form_error('parameter_name'),
                'reference_range' => form_error('reference_range'),
                'unit' => form_error('unit'),
                'description' => form_error('description'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $parameterName = $this->input->post("parameter_name");
            $referenceRange = $this->input->post("reference_range");
            $unit = $this->input->post("unit");
            $description = $this->input->post("description");

            if (!empty($pathology_parameter_id)) {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_edit')) {
                    access_denied();
                }
                // Update data array to include all fields
                $data = array(
                    'parameter_name' => $parameterName,
                    'reference_range' => $referenceRange,
                    'unit' => $unit,
                    'description' => $description,
                    'id' => $pathology_parameter_id
                );
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('pathology_category', 'can_add')) {
                    access_denied();
                }
                // Insert data array to include all fields
                $data = array(
                    'parameter_name' => $parameterName,
                    'reference_range' => $referenceRange,
                    'unit' => $unit,
                    'description' => $description
                );
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->pathology_category_model->addPathoParameters($data);
        }
        echo json_encode($array);
    }

    public function get_data_parameter($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_view')) {
            access_denied();
        }
        $result = $this->pathology_category_model->getParameterName($id);
        echo json_encode($result);
    }

    public function delete_parameter($id)
    {
        if (!$this->rbac->hasPrivilege('pathology_category', 'can_delete')) {
            access_denied();
        }
        $this->pathology_category_model->delete_parameter($id);
        redirect('admin/pathologycategory/pathoparameter');
    }
}
