<?php

class Bloodbankproduct_model extends CI_model {

    public function getBloodProduct($id = null) {
        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get('blood_bank_products');
            return $query->row_array();
        } else {
            $query = $this->db->get("blood_bank_products");
            return $query->result_array();
        }
    }

    

    public function getProductName($id = null) {
        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get('blood_bank_products');
            return $query->row_array();
        } else {
            $query = $this->db->get("blood_bank_products");
            return $query->result_array();
        }
    }


    public function addBloodProduct($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('blood_bank_products', $data);
        } else {
            $this->db->insert('blood_bank_products', $data);
            return $this->db->insert_id();
        }
    }

    public function delete($id) {
        $query = $this->db->where('id', $id)
                ->delete('blood_bank_products');
    }

    

}
