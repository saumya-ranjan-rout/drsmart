<?php

class Hospitaldepartment_model extends CI_model {

    public function valid_department($str) {
        $type = $this->input->post('type');
        $id = $this->input->post('departmenttypeid');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_department_exists($type, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function getall() {
        $this->datatables->select('id,department_name,is_active');
        $this->datatables->from('hospital_department');
        $this->datatables->add_column('view', '<a onclick="get($1)" class="btn btn-default btn-xs" data-target="#editmyModal" data-toggle="tooltip" title="" data-original-title=' . $this->lang->line('edit') . '> <i class="fa fa-pencil"></i></a><a  class="btn btn-default btn-xs" onclick="deleterecord($1)" data-toggle="tooltip" title=""  data-original-title=' . $this->lang->line('delete') . '>
                                                        <i class="fa fa-trash"></i>
                                                    </a>', 'id,is_active');
        return $this->datatables->generate();
    }

    function check_department_exists($name, $id) {

        if ($id != 0) {
            $data = array('id != ' => $id, 'department_name' => $name);
            $query = $this->db->where($data)->get('hospital_department');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {

            $this->db->where('department_name', $name);
            $query = $this->db->get('hospital_department');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    function deleteDepartment($id) {

        $this->db->where("id", $id)->delete("hospital_department");
    }

    function getDepartmentType($id = null) {

        if (!empty($id)) {

            $query = $this->db->where("id", $id)->get('hospital_department');
            return $query->row_array();
        } else {

            $query = $this->db->get("hospital_department");
            return $query->result_array();
        }
    }

    public function addDepartmentType($data) {

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('hospital_department', $data);
        } else {
            $this->db->insert('hospital_department', $data);
            return $this->db->insert_id();
        }
    }
  public function get($id = null) {
        $this->db->select()->from('hospital_department');
        if ($id != null) {
            $this->db->where('id', $id);
        } else {
            $this->db->order_by('id', 'desc');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

}

?>