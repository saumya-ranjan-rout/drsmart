<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class appointpriority_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_session_name = $this->setting_model->getCurrentSessionName();
        $this->start_month = $this->setting_model->getStartMonth();
    }

    function add($appointpriority) {
        $this->db->insert('appointpriority', $appointpriority);
    }

   public function appointpriority_list($id = null) {
        $this->db->select()->from('appointpriority');
        if ($id != null) {
            $this->db->where('appointpriority.id', $id);
        } else {
            $this->db->order_by('appointpriority.id');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }




    public function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('appointpriority');
    }

    public function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('appointpriority', $data);
    }

}
