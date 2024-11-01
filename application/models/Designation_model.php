<?php

class Designation_model extends CI_model {

    public function get($id = null) {
        if (!empty($id)) {
            $query = $this->db->select('staff_designation.*, roles.name as role_name')
                              ->from('staff_designation')
                              ->join('roles', 'roles.id = staff_designation.role','left')
                              ->where('staff_designation.id', $id)
                              ->get();
            return $query->row_array();
        } else {
            $query = $this->db->select('staff_designation.*, roles.name as role_name')
                              ->from('staff_designation')
                              ->join('roles', 'roles.id = staff_designation.role','left')
                              ->get();
            return $query->result_array();
        }
    }

    public function valid_designation() {

        $type = $this->input->post('type');
        $id = $this->input->post('designationid');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_designation_exists($type, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function check_designation_exists($name, $id) {

        if ($id != 0) {
            $data = array('id != ' => $id, 'designation' => $name);
            $query = $this->db->where($data)->get('staff_designation');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {

            $this->db->where('designation', $name);
            $query = $this->db->get('staff_designation');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    function deleteDesignation($id) {

        $this->db->where("id", $id)->delete("staff_designation");
    }

    function addDesignation($data) {

        if (isset($data["id"])) {

            $this->db->where("id", $data["id"])->update("staff_designation", $data);
        } else {

            $this->db->insert("staff_designation", $data);
        }
    }

}

?>