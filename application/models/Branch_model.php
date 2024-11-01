<?php

class Branch_model extends CI_model
{

    public function valid_branch_name($str)
    {
        $branch_name = $this->input->post('branch_name');
        $id = $this->input->post('branch_id');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_branch_exists($branch_name, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    public function check_branch_exists($name, $id)
    {
        if ($id != 0) {
            $data = array('id != ' => $id, 'branch_name' => $name);
            $query = $this->db->where($data)->get('branch');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            $this->db->where('branch_name', $name);
            $query = $this->db->get('branch');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    public function addBranchName($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('branch', $data);
        } else {
            $this->db->insert('branch', $data);
            return $this->db->insert_id();
        }
    }

    public function getbranchName($id = null)
    {
        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get('branch');
            return $query->row_array();
        } else {
            $query = $this->db->get("branch");
            return $query->result_array();
        }
    }

    public function delete($id)
    {
        $this->db->where("id", $id)->delete("branch");
    }
}