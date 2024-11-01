<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lab extends Admin_Controller
{

    public function addlab()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addlab/index');
        $lab_id = $this->input->post("lab_id");

        $labName = $this->lab_model->getlabName();
        $data["labName"] = $labName;
        $this->form_validation->set_rules(
            'lab_name',
            $this->lang->line('category') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->lab_model, 'valid_lab_name'))
            )
        );
        $data["title"] = "Add Lab";
        if ($this->form_validation->run()) {
            $labName = $this->input->post("lab_name");
            $lab_id = $this->input->post("id");
            if (empty($lab_id)) {
                if (!$this->rbac->hasPrivilege('lab', 'can_add')) {
                    access_denied();
                }
            } else {
                if (!$this->rbac->hasPrivilege('lab', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($lab_id)) {
                $data = array('lab_name' => $labName, 'id' => $lab_id);
            } else {
                $data = array('lab_name' => $labName);
            }

            $insert_id = $this->lab_model->addLabName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/lab/addlab");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/radio/lab", $data);
            $this->load->view("layout/footer");
        }
    }

    public function add()
    {
        if (!$this->rbac->hasPrivilege('lab', 'can_add')) {
            access_denied();
        }
        $labName = $this->input->post("lab_name");
        $lab_id = $this->input->post("lab_id");
        $this->form_validation->set_rules(
            'lab_name',
            $this->lang->line('category') . " " . $this->lang->line('name'),
            array(
                'required',
                array('check_exists', array($this->lab_model, 'valid_lab_name'))
            )
        );
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'name' => form_error('lab_name'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $medicineCategory = $this->input->post("medicine_category");
            if (!empty($lab_id)) {
                $data = array('lab_name' => $labName, 'id' => $lab_id);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            } else {
                $data = array('lab_name' => $labName);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            }
            $insert_id = $this->lab_model->addLabName($data);
        }
        echo json_encode($array);
    }

    public function get()
    { //get product data and encode to be JSON object
        header('Content-Type: application/json');
        echo $this->lab_model->getall();
    }

    public function edit($id)
    {
        $result = $this->lab_model->getLabName($id);
        $data["result"] = $result;
        $data["title"] = "Edit Lab Name";
        $labName = $this->lab_model->getLabName();
        $data["labName"] = $labName;
        $this->load->view("layout/header");
        $this->load->view("admin/radio/lab", $data);
        $this->load->view("layout/footer");
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('lab', 'can_delete')) {
            access_denied();
        }
        $this->lab_model->delete($id);
    }

    public function get_data($id)
    {
        if (!$this->rbac->hasPrivilege('lab', 'can_view')) {
            access_denied();
        }
        $result = $this->lab_model->getLabName($id);
        echo json_encode($result);
    }

    //Unit

    public function unit()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addlab/index');
        $unit_id = $this->input->post("unit_id");

        $unitName = $this->lab_model->getUnitName();
        $data["unitName"] = $unitName;
        $this->form_validation->set_rules(
            'unit_name',
            'Unit Name',
            array(
                'required',
                array('check_exists', array($this->lab_model, 'valid_unit_name'))
            )
        );
        $data["title"] = "Add Units";
        if ($this->form_validation->run()) {
            $unitName = $this->input->post("unit_name");
            $unit_id = $this->input->post("id");
            if (empty($unit_id)) {

                if (!$this->rbac->hasPrivilege('lab', 'can_add')) {
                    access_denied();
                }
            } else {

                if (!$this->rbac->hasPrivilege('lab', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($unit_id)) {
                $data = array('unit_name' => $unitName, 'id' => $unit_id);
            } else {
                $data = array('unit_name' => $unitName);
            }

            $insert_id = $this->lab_model->addUnitName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/radio/addUnit");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/radio/radiologyUnit", $data);
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
                array('check_exists', array($this->lab_model, 'valid_unit_name'))
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
                if (!$this->rbac->hasPrivilege('lab', 'can_edit')) {
                    access_denied();
                }
                $data = array('unit_name' => $unitName, 'id' => $unit_id);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('lab', 'can_add')) {
                    access_denied();
                }
                $data = array('unit_name' => $unitName);
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            }
            $insert_id = $this->lab_model->addUnitName($data);
        }
        echo json_encode($array);
    }

    public function get_data_unit($id)
    {
        if (!$this->rbac->hasPrivilege('lab', 'can_view')) {
            access_denied();
        }
        $result = $this->lab_model->getUnitName($id);
        echo json_encode($result);
    }

    public function delete_unit($id)
    {
        if (!$this->rbac->hasPrivilege('lab', 'can_delete')) {
            access_denied();
        }
        $this->lab_model->delete_unit($id);
        redirect('admin/radio/unit');
    }


    //Radiology Parameter

    public function radioparameter()
    {
        $this->session->set_userdata('top_menu', 'setup');
        $this->session->set_userdata('sub_menu', 'addCategory/index');
        $radiology_parameter_id = $this->input->post("radiology_parameter_id");

        $data["units"]  = $this->lab_model->getUnits();
        $data["parameterName"] = $this->lab_model->getParameterName();

        $this->form_validation->set_rules('parameter_name', $this->lang->line('parameter') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('reference_range', $this->lang->line('reference') . " " . $this->lang->line('range'), 'required');
        $this->form_validation->set_rules('unit', $this->lang->line('unit'), 'required');
        /*$this->form_validation->set_rules('description', $this->lang->line('description'), 'required');*/

        $data["title"] = "Add Radiology Parameters";
        if ($this->form_validation->run()) {
            $parameter_name = $this->input->post("parameter_name");
            $reference_range = $this->input->post("reference_range");
            $unit = $this->input->post("unit");
            $description = $this->input->post("description");
            $radiology_parameter_id = $this->input->post("id");
            if (empty($radiology_parameter_id)) {
                if (!$this->rbac->hasPrivilege('radiology_category', 'can_add')) {
                    access_denied();
                }
            } else {
                if (!$this->rbac->hasPrivilege('radiology_category', 'can_edit')) {
                    access_denied();
                }
            }
            if (!empty($radiology_parameter_id)) {
                $data = array(
                    'parameter_name' => $parameter_name,
                    'reference_range' => $reference_range,
                    'unit' => $unit,
                    'description' => $description,
                    'id' => $radiology_parameter_id
                );
            } else {
                $data = array(
                    'parameter_name' => $parameter_name,
                    'reference_range' => $reference_range,
                    'unit' => $unit,
                    'description' => $description
                );
            }

            $insert_id = $this->lab_model->addUnitName($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record added Successfully</div>');
            redirect("admin/radio/addRadioparameter");
        } else {
            $this->load->view("layout/header");
            $this->load->view("admin/radio/radiologyParameter", $data);
            $this->load->view("layout/footer");
        }
    }


    public function addPathoparameter()
    {
        $radiology_parameter_id = $this->input->post("radiology_parameter_id");

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

            if (!empty($radiology_parameter_id)) {
                if (!$this->rbac->hasPrivilege('radiology_category', 'can_edit')) {
                    access_denied();
                }
                // Update data array to include all fields
                $data = array(
                    'parameter_name' => $parameterName,
                    'reference_range' => $referenceRange,
                    'unit' => $unit,
                    'description' => $description,
                    'id' => $radiology_parameter_id
                );
                $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                if (!$this->rbac->hasPrivilege('radiology_category', 'can_add')) {
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
            $insert_id = $this->lab_model->addRadioParameters($data);
        }
        echo json_encode($array);
    }

    public function get_data_parameter($id)
    {
        if (!$this->rbac->hasPrivilege('radiology_category', 'can_view')) {
            access_denied();
        }
        $result = $this->lab_model->getParameterName($id);
        echo json_encode($result);
    }

    public function delete_parameter($id)
    {
        if (!$this->rbac->hasPrivilege('radiology_category', 'can_delete')) {
            access_denied();
        }
        $this->lab_model->delete_parameter($id);
        redirect('admin/radio/radioparameter');
    }
}
