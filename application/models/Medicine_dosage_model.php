<?php

/**
 * 
 */
class Medicine_dosage_model extends CI_model
{

    public function addMedicineDosage($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('medicine_dosage', $data);
        } else {
            $this->db->insert('medicine_dosage', $data);
            return $this->db->insert_id();
        }
    }

    public function getMedicineDosage($id = null)
    {

        if (!empty($id)) {
            $query = $this->db->select('medicine_dosage.*,medicine_category.medicine_category')
                ->join('medicine_category', 'medicine_dosage.medicine_category_id = medicine_category.id')
                ->where('medicine_dosage.id', $id)
                ->get('medicine_dosage');
            return $query->row_array();
        } else {
            $query = $this->db->select('medicine_dosage.*,medicine_category.medicine_category')
                ->join('medicine_category', 'medicine_dosage.medicine_category_id = medicine_category.id')
                ->get('medicine_dosage');

            return $query->result_array();
        }
    }

    public function getDosageByMedicine($medicine) {}

    public function delete($id)
    {
        $this->db->where("id", $id)->delete("medicine_dosage");
    }

    //Dosage Interval

    public function addDosageInterval($data)
    {
        $this->db->insert('dose_interval', $data);
        return $this->db->insert_id(); // Return the insert ID if needed
    }

    public function updateDosageInterval($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('dose_interval', $data);
    }

    public function getMedicineDosageInterval($id = null)
    {
        if (!empty($id)) {
            // Fetching a single record based on the provided id
            $query = $this->db->select('*')  // You can specify the columns you need here
                ->where('id', $id)
                ->get('dose_interval');
            return $query->row_array();  // Returns a single row as an associative array
        } else {
            // Fetching all records when id is not provided
            $query = $this->db->select('*')  // You can specify the columns you need here
                ->get('dose_interval');
            return $query->result_array();  // Returns an array of rows
        }
    }

    public function deleteinterval($id)
    {
        $query = $this->db->where('id', $id)
            ->delete('dose_interval');
    }

    //Dosage Duration

    public function addDosageDuration($data)
    {
        $this->db->insert('dose_duration', $data);
        return $this->db->insert_id(); // Return the insert ID if needed
    }

    public function updateDosageDuration($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('dose_duration', $data);
    }

    public function getMedicineDosageDuration($id = null)
    {
        if (!empty($id)) {
            // Fetching a single record based on the provided id
            $query = $this->db->select('*')  // You can specify the columns you need here
                ->where('id', $id)
                ->get('dose_duration');
            return $query->row_array();  // Returns a single row as an associative array
        } else {
            // Fetching all records when id is not provided
            $query = $this->db->select('*')  // You can specify the columns you need here
                ->get('dose_duration');
            return $query->result_array();  // Returns an array of rows
        }
    }

    public function deleteduration($id)
    {
        $query = $this->db->where('id', $id)
            ->delete('dose_duration');
    }
}
