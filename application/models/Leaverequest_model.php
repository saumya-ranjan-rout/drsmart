<?php

class Leaverequest_model extends CI_model {

    public function staff_leave_request($id = null) {

        if ($id != null) {
            $this->db->where("staff_leave_request.staff_id", $id);
        }

        $query = $this->db->select('staff.name,staff.surname,staff.employee_id,staff_leave_request.*,leave_types.type')->join("staff", "staff.id = staff_leave_request.staff_id")->join("leave_types", "leave_types.id = staff_leave_request.leave_type_id")->where("staff.is_active", "1")->order_by("staff_leave_request.id", "desc")->get("staff_leave_request");

        return $query->result_array();
    }

    public function user_leave_request($id = null) {


        $query = $this->db->select('staff.name,staff.surname,staff.employee_id,staff_leave_request.*,leave_types.type')->join("staff", "staff.id = staff_leave_request.staff_id")->join("leave_types", "leave_types.id = staff_leave_request.leave_type_id")->where("staff.is_active", "1")->where("staff.id", $id)->order_by("staff_leave_request.id", "desc")->get("staff_leave_request");

        return $query->result_array();
    }

    public function allotedLeaveType($id) {

        $query = $this->db->select('staff_leave_details.*,leave_types.type,leave_types.id as typeid')->where(array('staff_id' => $id))->join("leave_types", "staff_leave_details.leave_type_id = leave_types.id")->get("staff_leave_details");

        return $query->result_array();
    }

    public function countLeavesData($staff_id, $leave_type_id) {

        $query1 = $this->db->select('sum(leave_days) as approve_leave')->where(array('staff_id' => $staff_id, 'status' => 'approve', 'leave_type_id' => $leave_type_id))->get("staff_leave_request");
        return $query1->row_array();
    }

    public function countLeavesDataa($staff_id, $leave_type_id) {
        $this->db->select('SUM(leave_days) as approve_leave');
        $this->db->where('staff_id', $staff_id);
        $this->db->where('status', 'approve');
        $this->db->where('leave_type_id', $leave_type_id);
        $this->db->where('YEAR(date)', date('Y'));
        
        $query1 = $this->db->get("staff_leave_request");
        return $query1->row_array();
    }

    public function countPendingLeaves($staff_id) {

        $query = $this->db->select('count(id) as pending_leave')
                          ->where(array('staff_id' => $staff_id, 'status' => 'pending'))
                          ->get("staff_leave_request");
        
        $result = $query->row_array(); // Fetch a single row as an associative array
        return $result['pending_leave'] ?? 0; // Return the count or 0 if not set
    }

    /*public function changeLeaveStatus($data, $staff_id) {


        $this->db->where("id", $staff_id)->update("staff_leave_request", $data);
    }*/
    
    public function changeLeaveStatus($data, $leave_request_id, $staff_id, $leave_type_id, $days_count) {
        // Fetch the allotted leave for the staff member and leave type
        $leaves = $this->db->select('alloted_leave')
                           ->from('staff_leave_details')
                           ->where('staff_id', $staff_id)
                           ->where('leave_type_id', $leave_type_id)
                           ->get()
                           ->row_array(); // Assuming there's only one row per staff and leave type
        
        // Fetch the number of approved leave requests for this staff member and leave type
        $approve_leave = $this->db->select_sum('leave_days') // Sum the leave_days column
                                   ->from('staff_leave_request')
                                   ->where('staff_id', $staff_id)
                                   ->where('leave_type_id', $leave_type_id)
                                   ->where('status', 'approve') // Filter by the 'approve' status
                                   ->get()
                                   ->row()
                                   ->leave_days; // Get the sum of leave_days
    
       //echo $approve_leave.'------'.$leaves['alloted_leave'];
        // Calculate the remaining leave
        $remaining_leave = $leaves['alloted_leave'] - $approve_leave;
    
        // Compare the remaining leave with the days count
        if ($remaining_leave >= $days_count || $data['status']=='pending' || $data['status']=='disapprove') {
            // If the remaining leave is sufficient, update the leave request
            $this->db->where("id", $leave_request_id)->update("staff_leave_request", $data);
            return true; // Indicate success
        } else {
            // If the remaining leave is not enough, return false
            return false;
        }
    }

    public function getLeaveSummary() {

        $query = $this->db->select('*')->get("staff");

        return $query->result_array();
    }

    function addLeaveRequest($data) {

        if (isset($data['id'])) {

            $this->db->where("id", $data["id"]);
            $this->db->update("staff_leave_request", $data);
        } else {

            $this->db->insert("staff_leave_request", $data);
        }
    }

}

?>