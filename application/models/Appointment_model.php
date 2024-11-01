<?php

class Appointment_model extends CI_Model
{

//========================================================================================
public function get_task_details($staffid) {
    // date_default_timezone_set('Asia/Kolkata');
    $current_time = date('Y-m-d H:i:s');
    
    $this->db->select('*');
    $this->db->from('task');
    $this->db->where('task_reminder', '1');
    $this->db->where('staff_id', $staffid);
    $this->db->where_in('status', ['pending', 'notstarted', 'hold', 'inprogress']);
    $this->db->where("TIMESTAMPDIFF(MINUTE, start_date, '$current_time') >=", 'task_int_min', FALSE);
    
    $query = $this->db->get();

    $task_details = "";
    if ($query->num_rows() > 0) {
         $count = 1; 
        foreach ($query->result_array() as $row) {
            // Determine label class based on status
            $status_label = "";
            switch ($row['status']) {
                case 'inprogress':
                    $status_label = "class='label label-primary'";
                    break;
                case 'notstarted':
                    $status_label = "class='label label-info'";
                    break;
                case 'hold':
                    $status_label = "class='label label-warning'";
                    break;
                case 'pending':
                    $status_label = "class='label bg-purple'";
                    break;
            }
             $priority_label = "";
            switch ($row['priority']) {
                case 'High':
                    $priority_label =  "style='color: #007bff;'";
                    break;
                case 'Medium':
                    $priority_label =  "style='color: #17a2b8;'";
                    break;
                case 'Low':
                    $priority_label =  "style='color: #ffc107;'";
                    break;
                case 'Critical':
                    $priority_label = "style='color: #6f42c1;'";
                    break;
                case 'Urgent':
                    $priority_label =  "style='color: #ea4f9b;'";
                    break;
            }

            // Format task title and status
           $task_details .= "<strong>" . $count . ". Task Title:</strong> " . htmlspecialchars($row["task_title"]) . ", ";
            $task_details .= "<strong>Priority:</strong> <span $priority_label>" . htmlspecialchars($row["priority"]) . ",</span>";
          //  $task_details .= "<strong>Priority:</strong><u> " . htmlspecialchars($row["priority"]) . "</u>, ";
            $task_details .= "<strong>Status:</strong> <span $status_label>" . htmlspecialchars($row["status"]) . "</span><br>";
             $count++;  // Increment counter
        }
    } else {
        $task_details = "No tasks to display.";
    }

    return $task_details;
}
    public function add($appointment)
    {
        $this->db->insert('appointment', $appointment);
        return $this->db->insert_id();
    }

    public function searchFullTextDashboard()
{
    $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
    $userdata           = $this->customlib->getUserData();
    $role_id            = $userdata['role_id'];

    if ($doctor_restriction == 'enabled') {
        if ($role_id == 3) {
            $user_id  = $userdata["id"];
            $doctorid = $user_id;
            $this->db->where('appointment.doctor', $user_id);
        }
    }

    // Get current date and time
    $current_datetime = date('Y-m-d H:i:s');

    // Selecting fields from appointment, staff, and patients
    $this->db->select('
        appointment.*, 
        staff.name, 
        IFNULL(patients.patient_name, appointment.patient_name) as patient_name,
        IFNULL(patients.gender, appointment.gender) as gender, 
        IFNULL(patients.email, appointment.email) as email, 
        IFNULL(patients.mobileno, appointment.mobileno) as mobileno,
        staff.surname,
        department.department_name,
        staff_designation.designation
    ');

    // Joining staff, patients, department, and staff_designation tables
    $this->db->join('staff', 'appointment.doctor = staff.id', "inner");
    $this->db->join('patients', 'appointment.patient_id = patients.id', "left");
    $this->db->join('department', 'staff.department = department.id', "left");
    $this->db->join('staff_designation', 'staff.designation = staff_designation.id', "left");

    // Filter for upcoming appointments only
    $this->db->where('appointment.date >=', $current_datetime);

    // Ordering by appointment date and time in ascending order
    $this->db->order_by('appointment.date', 'asc');

    // Executing the query
    $query = $this->db->get('appointment');
    return $query->result_array();
}


//=========================================================================================
    public function searchFullText()
{
    $doctor_restriction = $this->session->userdata['hospitaladmin']['doctor_restriction'];
    $userdata           = $this->customlib->getUserData();
    $role_id            = $userdata['role_id'];
    if ($doctor_restriction == 'enabled') {
        if ($role_id == 3) {
            $user_id  = $userdata["id"];
            $doctorid = $user_id;
            $this->db->where('appointment.doctor', $user_id);
        }
    }
    $this->db->select('appointment.*,staff.name, IFNULL(patients.patient_name, appointment.patient_name) as patient_name,IFNULL(patients.gender, appointment.gender) as gender, IFNULL(patients.email, appointment.email) as email, IFNULL(patients.mobileno, appointment.mobileno) as mobileno,staff.surname,appointpriority.appointpriority as appointment_priority');
    $this->db->join('staff', 'appointment.doctor = staff.id', "inner");
    $this->db->join('patients', 'appointment.patient_id = patients.id', "left");
    $this->db->join('appointpriority', 'appointment.appointpriority = appointpriority.id', "left");
    $this->db->where('`appointment`.`doctor`=`staff`.`id`');
    $this->db->order_by('`appointment`.`date`', 'desc');
    $query = $this->db->get('appointment');
    return $query->result_array();
}

//==========================================================================================

    public function getMaxId()
    {
        $query  = $this->db->select('max(id) as maxid')->get("`appointment`");
        $result = $query->row_array();
        return $result["maxid"];
    }

//==========================================================================================
public function getDetails($id)
{
    $this->db->select('appointment.*, staff.name, staff.surname,department.department_name,
        IFNULL(patients.patient_name, appointment.patient_name) as patient_name,IF(patients.gender = "" OR patients.gender IS NULL, appointment.gender, patients.gender) as gender,
        IFNULL(patients.email, appointment.email) as email, 
        IFNULL(patients.mobileno, appointment.mobileno) as mobileno,
        appointpriority.appointpriority as appointment_priority,
        patients.address as patient_address,patients.age,collector.name as collector_name, collector.surname as collector_surname');

    $this->db->join('staff', 'appointment.doctor = staff.id', "inner");
    $this->db->join('patients', 'appointment.patient_id = patients.id', "left");
    $this->db->join('appointpriority', 'appointment.appointpriority = appointpriority.id', "left");
    $this->db->join('department', 'staff.department = department.id', "left");
    $this->db->join('staff as collector', 'appointment.collected_by = collector.id', 'left');
 
    
    $this->db->where('appointment.id', $id);
    
    $query = $this->db->get('appointment');
    return $query->row_array();
}

public function getAppointmentpriorities($id = null) {
   
    $query = $this->db->select('*')->get("appointpriority");
    return $query->result_array();

}

//=========================================================================================
    public function update($appointment)
    {
        $query = $this->db->where('id', $appointment['id'])
            ->update('appointment', $appointment);
    }

//=========================================================================================
    public function delete($id)
    {
        $this->db->where("id", $id)->delete('appointment');
    }

//=========================================================================================
    public function getAppointment($id = null)
    {
        $query = $this->db->order_by('id', 'desc')->get('appointment');
        return $query->result_array();
    }

//=========================================================================================
    public function status($id, $data)
    {
        $this->db->where("id", $id)->update("appointment", $data);
    }

    public function move($id, $data)
    {
        $this->db->where("id", $id)->update("appointment", $data);
    }

    public function getpatientDetails($id)
    {
        $query = $this->db->select('patients.*')
        // ->join('opd_details', 'patients.id = opd_details.patient_id')
            ->where('patients.patient_unique_id', $id)
            ->get('patients');
        if ($query->num_rows() > 0) {

            return $query->row_array();
        }
        return false;
    }
///////////////////////////////Added by Nalini 05-06-2024/////////////////////////////////////////
 
     public function getShifts($id = null) {
          // $this->db->where("is_active", '1');
        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get('shift');
            return $query->row_array();
        } else {
            $query = $this->db->get("shift");
            return $query->result_array();
        }
    }
     public function getShiftsActive($id = null) {
           $this->db->where("is_active", '1');
        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get('shift');
            return $query->row_array();
        } else {
            $query = $this->db->get("shift");
            return $query->result_array();
        }
    }
     public function valid_shift($str) {
        $id = $this->input->post('id');
        $name = $this->input->post('name');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_category_exists($id, $name)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }
     public function check_category_exists($id, $name) {
        if ($id != 0) {
            $data = array('id != ' => $id, 'name' => $name);
            $query = $this->db->where($data)->get('shift');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            $this->db->where('name', $name);
            $query = $this->db->get('shift');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }
      public function addShift($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('shift', $data);
        } else {
            $this->db->insert('shift', $data);
            return $this->db->insert_id();
     
    
    }
    
    }
      public function delete_shift($id)
    {
        $this->db->where("id", $id)->delete('shift');
    }
    
     public function getShiftNameById($shift_id) {
        $this->db->select('name');
        $this->db->from('shift');
        $this->db->where('id', $shift_id);
        $query = $this->db->get();

        if ($query->num_rows() == 1) {
            return $query->row()->name; // Return shift name in lowercase
        } else {
            return false;
        }
    }

    public function updateDoctorShiftStatus($doctor_id, $shift_name, $status) {
        $this->db->where('id', $doctor_id);
        return $this->db->update('staff', [$shift_name => $status]);
    }
}
