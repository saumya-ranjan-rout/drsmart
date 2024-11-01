

<?php
if (!defined('BASEPATH'))
exit('No direct script access allowed');

class Data_model extends CI_Model {
    
    public function getDataFromFirstDatabase($patientid) {
        $this->db->where('id', $patientid);
        $query = $this->db->get('patients');
       
            return $query->row_array();
    }
}
      