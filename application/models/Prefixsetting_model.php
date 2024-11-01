<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Prefixsetting_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function get($id = null)
    {
        $this->db->select()->from('prefix_setting');
        $this->db->order_by('id');
        $query = $this->db->get();
        return $query->row();     
    }

    public function add($data)
    {
        $this->db->select()->from('prefix_setting');
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            $result = $q->row();
            $this->db->where('id', $result->id);
            $this->db->update('prefix_setting', $data);
        } else {
            $this->db->insert('prefix_setting', $data);
            return $this->db->insert_id();
        }
    }
}
