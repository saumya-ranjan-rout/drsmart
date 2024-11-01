<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Vehicle_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function add($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('vehicles', $data);
        } else {
            $this->db->insert('vehicles', $data);
            return $this->db->insert_id();
        }
    }

    public function get($id = null)
    {
        $this->db->select()->from('vehicles');
        if ($id != null) {
            $this->db->where('vehicles.id', $id);
        } else {
            $this->db->order_by('vehicles.id', 'desc');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row();
        } else {
            return $query->result_array();
        }
    }

    public function getDetails($id)
    {
        $query = $this->db->select('vehicles.*')->where('id', $id)->get('vehicles');
        return $query->row_array();
    }

    public function remove($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('vehicles');
    }

    public function addCallAmbulance($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('ambulance_call', $data);
        } else {
            $this->db->insert('ambulance_call', $data);
            return $this->db->insert_id();
        }
    }

    public function getBillDetails($id)
    {
        $this->db->select('ambulance_call.*,vehicles.vehicle_no,vehicles.vehicle_model,patients.patient_name as patientname,staff.name,staff.surname');
        $this->db->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no');
        $this->db->join('staff', 'staff.id = ambulance_call.generated_by');
        $this->db->join('patients', 'patients.id = ambulance_call.patient_name');
        $this->db->where('ambulance_call.id', $id);
        $query = $this->db->get('ambulance_call');
        return $query->row_array();
    }

    function getMaxId()
    {
        $query = $this->db->select('max(id) as bill_no')->get("ambulance_call");
        $result = $query->row_array();
        return $result["bill_no"];
    }

    public function getAllBillDetails($id)
    {
        $query = $this->db->select('ambulance_call.*')
            ->where('ambulance_call.id', $id)
            ->get('ambulance_call');
        return $query->result_array();
    }

    public function getCallAmbulance()
    {
        $query = $this->db->select('ambulance_call.*,vehicles.vehicle_no,vehicles.vehicle_model,patients.patient_name as patient,patients.mobileno,patients.address,staff.name,staff.surname')
            ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no')
            ->join('patients', 'patients.id = ambulance_call.patient_name')
            ->join('staff', 'staff.id = ambulance_call.generated_by')
            ->order_by('ambulance_call.date', 'desc')
            ->get('ambulance_call');
        return $query->result_array();
    }

    public function getCallAmbulancepat($patient_id)
    {
        $query = $this->db->select('ambulance_call.*,vehicles.vehicle_no,vehicles.vehicle_model,vehicles.driver_name,vehicles.driver_contact,patients.patient_name as patient,patients.mobileno,patients.address')
            ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no')
            ->join('patients', 'patients.id = ambulance_call.patient_name')
            ->where('ambulance_call.patient_name', $patient_id)
            ->get('ambulance_call');
        return $query->result_array();
    }

    public function getBillDetailsAmbulance($id)
    {
        $query = $this->db->select('ambulance_call.*,vehicles.vehicle_no,vehicles.vehicle_model,vehicles.driver_name,vehicles.driver_contact,patients.patient_name as patient,patients.mobileno,patients.address')
            ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no')
            ->join('patients', 'patients.id = ambulance_call.patient_name')
            ->where('ambulance_call.id', $id)
            ->get('ambulance_call');
        return $query->row_array();
    }

    public function getCallDetails($id)
    {
        $query = $this->db->select('ambulance_call.*')->where('id', $id)->get('ambulance_call');
        return $query->row_array();
    }

    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('ambulance_call');
    }

     public function getPayDetails($id){
          $query = $this->db->select('ambulance_call.*,vehicles.vehicle_no,vehicles.vehicle_model,vehicles.driver_name,vehicles.driver_contact,patients.patient_name as patient,patients.mobileno,patients.address,SUM(ambulance_payment.amount) as paidamo')
                ->join('vehicles', 'vehicles.id = ambulance_call.vehicle_no')
                ->join('patients', 'patients.id = ambulance_call.patient_name')
                ->join('ambulance_payment', 'ambulance_payment.ambulance_call_id = ambulance_call.id', 'left')
                ->group_by('ambulance_call.id')
                ->where('ambulance_call.id', $id)
                ->get('ambulance_call');
        return $query->row_array();
     }


    public function addPayCallAmbulance($data) {
         // print_r($data);
            $this->db->insert('ambulance_payment', $data);
            return $this->db->insert_id();
    }

    public function deleteTransaction($id) {
        // First, check if the record exists
        $this->db->where('id', $id);
        $query = $this->db->get('ambulance_payment');
    
        if ($query->num_rows() > 0) {
            // Record exists, proceed to delete
            $this->db->where('id', $id);
            if ($this->db->delete('ambulance_payment')) {
                return true;  // Successfully deleted
            } else {
                return false; // Failed to delete (DB error)
            }
        } else {
            // Record not found
            return false;
        }
    }

    public function getTransBillDetails($id) {
        $this->db->select('ambulance_payment.*,patients.patient_name');
        $this->db->join('ambulance_call', 'ambulance_call.id = ambulance_payment.ambulance_call_id');
        $this->db->join('patients','patients.id = ambulance_call.patient_name');
        $this->db->where('ambulance_payment.id', $id);
        $query = $this->db->get('ambulance_payment');
        return $query->row_array();
    }
  public function getTransDetails($id) {
        $query = $this->db->select('ambulance_payment.*')->where('ambulance_call_id', $id)->get('ambulance_payment');
        return $query->result_array();
    }
}
