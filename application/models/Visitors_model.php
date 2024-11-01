<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class visitors_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_session_name = $this->setting_model->getCurrentSessionName();
        $this->start_month = $this->setting_model->getStartMonth();
    }

    function add($data) {
        $this->db->insert('visitors_book', $data);
        return $query = $this->db->insert_id();
    }

    public function getPurpose() {
        $this->db->select('*');
        $this->db->from('visitors_purpose');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function visitors_list($id = null) {
        $this->db->select('visitors_book.*, 
                           staff.name as staff_name, 
                           staff.surname as staff_surname, 
                           staff.employee_id,
                           patients.patient_name,
                           GROUP_CONCAT(DISTINCT ipd_details.ipd_no SEPARATOR ", ") as ipd_no,
                           GROUP_CONCAT(DISTINCT opd_details.opd_no SEPARATOR ", ") as opd_no');
        $this->db->from('visitors_book');
        
        // Join with the staff table
        $this->db->join('staff', 'staff.id = visitors_book.ipd_opd_staff', 'left');
        
        // Join with the patient table
        $this->db->join('patients', 'patients.id = visitors_book.ipd_opd_staff', 'left');
        
        // Join with IPD and OPD details, with grouping to avoid duplicates
        $this->db->join('ipd_details', 'ipd_details.patient_id = patients.id', 'left');
        $this->db->join('opd_details', 'opd_details.patient_id = patients.id', 'left');
        
        if ($id != null) {
            $this->db->where('visitors_book.id', $id);
        } else {
            $this->db->order_by('visitors_book.id', 'desc');
        }
        
        // Group the results to avoid duplicates
        $this->db->group_by('visitors_book.id');
        
        $query = $this->db->get();
        
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    public function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('visitors_book');
        $this->session->set_flashdata('msg', '<div class="alert alert-success"> Visitor deleted successfully</div>');
        redirect('admin/visitors');
    }

    public function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('visitors_book', $data);
    }

    public function image_add($visitor_id, $image) {
        $array = array('id' => $visitor_id);
        $this->db->set('image', $image);
        $this->db->where($array);
        $this->db->update('visitors_book');
    }

    public function image_update($visitor_id, $image) {
        $array = array('id' => $visitor_id);
        $this->db->set('image', $image);
        $this->db->where($array);
        $this->db->update('visitors_book');
    }

    public function image_delete($id, $img_name) {
        $file = "./uploads/front_office/visitors/" . $img_name;
        unlink($file);
        $this->db->where('id', $id);
        $this->db->delete('visitors_book');
        $controller_name = $this->uri->segment(2);
        $this->session->set_flashdata('msg', '<div class="alert alert-success"> ' . ucfirst($controller_name) . ' deleted successfully</div>');
        redirect('admin/' . $controller_name);
    }

    public function getStaff($type) {
        if($type == 'staff'){
            $this->db->select('*');
            $this->db->from('staff');
            // Add any additional conditions or joins as needed
            $query = $this->db->get();
            return $query->result_array();
        } else if($type == 'opd_patient'){
            $this->db->select('opd_details.*, patients.patient_name,patients.id as pid');  // Select required fields
            $this->db->from('opd_details');
            $this->db->join('patients', 'patients.id = opd_details.patient_id');
             $this->db->where('patients.is_active', 'yes');  // Join with patients table
            // Add any additional conditions or joins as needed
            $query = $this->db->get();
            return $query->result_array();
        } else if($type == 'ipd_patient'){
            $this->db->select('ipd_details.*, patients.patient_name,patients.id as pid');  // Select required fields
            $this->db->from('ipd_details');
            $this->db->join('patients', 'patients.id = ipd_details.patient_id');
            $this->db->where('patients.is_active', 'yes');  // Join with patients table
            // Add any additional conditions or joins as needed
            $query = $this->db->get();
            return $query->result_array();
        } else {
            return [];  // Return an empty array if the type doesn't match any known category
        }
    }

}

?>