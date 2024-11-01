<?php

class Outesourced_Test_model extends CI_Model {

    public function outsourcedPathologyFullText() {
        $this->db->select('outsourced_pathology_test.*,pathology_category.category_name,patients.patient_name,patients.patient_type,staff.name as doctorname,staff.surname as doctorsurname');
        $this->db->join('pathology_category', 'outsourced_pathology_test.pathology_category_id = pathology_category.id', 'left');
        $this->db->join('patients', 'patients.id = outsourced_pathology_test.patient_id');
        $this->db->join('staff', 'staff.id = outsourced_pathology_test.consultant_doctor','left');
        $this->db->order_by('outsourced_pathology_test.id', 'desc');
        $query = $this->db->get('outsourced_pathology_test');
        return $query->result_array();
    }
    public function getOutsourcedPathology($id = null) {
        if (!empty($id)) {
            $this->db->where("outsourced_pathology_test.id", $id);
        }
        $query = $this->db->select('outsourced_pathology_test.*,pathology_category.category_name,patients.patient_name,patients.patient_type,staff.name as doctorname,staff.surname as doctorsurname')->join('pathology_category', 'outsourced_pathology_test.pathology_category_id = pathology_category.id', 'left')->join('patients', 'patients.id = outsourced_pathology_test.patient_id')->join('staff', 'staff.id = outsourced_pathology_test.consultant_doctor','left')->get('outsourced_pathology_test');
        if (!empty($id)) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }
    public function outsourcedPathologyTest($report_batch) {
        if (isset($report_batch["id"])) {
            $this->db->where("id", $report_batch["id"])->update('outsourced_pathology_test', $report_batch);
        } else {
            $this->db->insert('outsourced_pathology_test', $report_batch);
            return $this->db->insert_id();
        }
    }

}

?>