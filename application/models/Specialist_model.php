<?php

class Specialist_model extends CI_model {

    public function valid_specialist($str) {
        $type = $this->input->post('type');
        $id = $this->input->post('specialisttypeid');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_specialist_exists($type, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function getall() {
        $this->datatables->select('id,specialist_name,is_active');
        $this->datatables->from('specialist');
        $this->datatables->add_column('view', '<a onclick="get($1)" class="btn btn-default btn-xs" data-target="#editmyModal" data-toggle="tooltip" title="" data-original-title=' . $this->lang->line('edit') . '> <i class="fa fa-pencil"></i></a><a  class="btn btn-default btn-xs" onclick="deleterecord($1)" data-toggle="tooltip" title=""  data-original-title=' . $this->lang->line('delete') . '>
                                                        <i class="fa fa-trash"></i>
                                                    </a>', 'id,is_active');
        return $this->datatables->generate();
    }

    function check_specialist_exists($name, $id) {

        if ($id != 0) {
            $data = array('id != ' => $id, 'specialist_name' => $name);
            $query = $this->db->where($data)->get('specialist');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {

            $this->db->where('specialist_name', $name);
            $query = $this->db->get('specialist');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    function deleteSpecialist($id) {

        $this->db->where("id", $id)->delete("specialist");
    }

    function getSpecialistType($id = null) {

        if (!empty($id)) {

            $query = $this->db->where("id", $id)->get('specialist');
            return $query->row_array();
        } else {

            $query = $this->db->get("specialist");
            return $query->result_array();
        }
    }

    public function addSpecialistType($data) {

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('specialist', $data);
        } else {
            $this->db->insert('specialist', $data);
            return $this->db->insert_id();
        }
    }

}

?>