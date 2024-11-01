<?php

class Calendar_model extends CI_Model
{

    public function saveEvent($data)
    {
        if (isset($data["id"])) {

            $this->db->where("id", $data["id"])->update("events", $data);
        } else {

            $this->db->insert("events", $data);
        }
    }

    public function getEvents($id = null)
    {

        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get("events");
            return $query->row_array();
        } else {

            $query = $this->db->get("events");
            return $query->result_array();
        }
    }

    public function getStudentEvents($id = null)
    {

        $cond = "event_type = 'public' or event_type = 'task' ";
        $query = $this->db->where($cond)->get("events");
        return $query->result_array();
    }

    public function deleteEvent($id)
    {

        $this->db->where("id", $id)->delete("events");
    }

    public function getTask($limit = null, $offset = null, $id, $role_id)
    {


        $query = $this->db->where(array('event_type' => 'task', 'event_for' => $id, 'role_id' => $role_id))->order_by("is_active,start_date", "asc")->limit($limit, $offset)->get("events");

        return $query->result_array();
    }

    function countrows()
    {

        $query = $this->db->where("event_type", "task")->get("events");

        return $query->num_rows();
    }

    function countincompleteTask($id)
    {

        $query = $this->db->where("event_type", "task")->where("is_active", "no")->where("event_for", $id)->where("start_date", date("Y-m-d"))->get("events");

        return $query->num_rows();
    }

    function getincompleteTask($id)
    {


        $query = $this->db->where("event_type", "task")->where("is_active", "no")->where("event_for", $id)->where("start_date", date("Y-m-d"))->order_by("start_date", "asc")->get("events");

        return $query->result_array();
    }


    public function saveTask($data)
    {
        if (isset($data["id"])) {

            $this->db->where("id", $data["id"])->update("task", $data);
        } else {

            $this->db->insert("task", $data);
        }
    }
    public function getTasks($id = null)
    {

        if (!empty($id)) {
            $query = $this->db->where("id", $id)->get("task");
            return $query->row_array();
        } else {

            $query = $this->db->get("task");
            return $query->result_array();
        }
    }

    public function getTaskData()
    {
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata['role_id']; // Get the role of the logged-in user
        $staff_id = $userdata['id'];     // Get the staff_id of the logged-in user

        $this->db->select("task.*,roles.name as role_name,staff_designation.designation,department.department_name as department_name,staff.name,staff.surname");
        $this->db->from("task");
        $this->db->join("roles", "roles.id = task.role_id", "left");
        $this->db->join("staff_designation", "staff_designation.id = task.designation_id", "left");
        $this->db->join("department", "department.id = task.department_id", "left");
        $this->db->join("staff", "staff.id = task.staff_id", "left");

        // Only apply the staff_id filter if the user is not "Super Admin" (role_id 7 in your case)
        if ($role_id != 7) {
            $this->db->where("task.staff_id", $staff_id);
        }

        $query = $this->db->get();
        return $query->result_array();
    }

    function getTaskDatalist($staff_id, $role_id, $designation_id, $department_id)
    {

        $this->db->select("task.*,roles.name as role_name,staff_designation.designation,department.department_name as department_name,staff.name,staff.surname");
        $this->db->from("task");
        $this->db->join("roles", "roles.id = task.role_id", "left");
        $this->db->join("staff_designation", "staff_designation.id = task.designation_id", "left");
        $this->db->join("department", "department.id = task.department_id", "left");
        $this->db->join("staff", "staff.id = task.staff_id", "left");
        $this->db->where("task.role_id", $role_id);
        $this->db->where("task.designation_id", $designation_id);
        $this->db->where("task.department_id", $department_id);
        $this->db->where("task.staff_id", $staff_id);
        $query = $this->db->get();

        return $query->result_array();
    }

    function getUserTasks($id)
    {

        $this->db->select("task.*,roles.name as role_name,staff_designation.designation,department.department_name as department_name,staff.name,staff.surname");
        $this->db->from("task");
        $this->db->join("roles", "roles.id = task.role_id", "left");
        $this->db->join("staff_designation", "staff_designation.id = task.designation_id", "left");
        $this->db->join("department", "department.id = task.department_id", "left");
        $this->db->join("staff", "staff.id = task.staff_id", "left");
        $this->db->where("task.id", $id);
        $query = $this->db->get();

        return $query->row_array();
    }

    public function deleteTask($id)
    {

        $this->db->where("id", $id)->delete("task");
    }

    public function getFilteredTaskData($search_type, $role_id = null)
    {
        $userdata = $this->customlib->getUserData();
        $staff_id = $userdata['id'];  // Get logged-in staff ID

        $this->db->select("task.*, roles.name as role_name, staff_designation.designation, department.department_name, staff.name, staff.surname");
        $this->db->from("task");
        $this->db->join("roles", "roles.id = task.role_id", "left");
        $this->db->join("staff_designation", "staff_designation.id = task.designation_id", "left");
        $this->db->join("department", "department.id = task.department_id", "left");
        $this->db->join("staff", "staff.id = task.staff_id", "left");

        // Apply role filter if selected
        if (!empty($role_id)) {
            $this->db->where("task.role_id", $role_id);
        }

        // Apply search type filter
        if ($search_type == 'today') {
            $this->db->where('DATE(task.start_date)', date('Y-m-d 00:00:00'));
        } elseif ($search_type == 'this_week') {

            $this_week_start = strtotime('-1 week monday 00:00:00');
            $this_week_end = strtotime('sunday 23:59:59');

            $first_date = date('Y-m-d H:i:s', $this_week_start);
            $last_date = date('Y-m-d H:i:s', $this_week_end);

            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);


            //  $this->db->where('WEEK(task.start_date)', date('W'));
        } else if ($search_type == 'last_week') {

            $last_week_start = strtotime('-2 week monday 00:00:00');
            $last_week_end = strtotime('-1 week sunday 23:59:59');

            $first_date = date('Y-m-d H:i:s', $last_week_start);
            $last_date = date('Y-m-d H:i:s', $last_week_end);

            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } elseif ($search_type == 'this_month') {

            $first_date = date('Y-m-01');
            $last_date = date('Y-m-t 23:59:59.993');

            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } else if ($search_type == 'last_month') {
            $month = date("m", strtotime("-1 month"));
            $first_date = date('Y-' . $month . '-01');
            $last_date = date('Y-' . $month . '-' . date('t', strtotime($first_date)) . ' 23:59:59.993');

            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } else if ($search_type == 'last_3_month') {
            $month = date("m", strtotime("-2 month"));
            $first_date = date('Y-' . $month . '-01');
            $firstday = date('Y-' . 'm' . '-01');
            $last_date = date('Y-' . 'm' . '-' . date('t', strtotime($firstday)) . ' 23:59:59.993');

            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } else if ($search_type == 'last_6_month') {
            $month = date("m", strtotime("-5 month"));
            $first_date = date('Y-' . $month . '-01');
            $firstday = date('Y-' . 'm' . '-01');
            $last_date = date('Y-' . 'm' . '-' . date('t', strtotime($firstday)) . ' 23:59:59.993');
            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } else if ($search_type == 'last_12_month') {
            $first_date = date('Y-m' . '-01', strtotime("-11 month"));
            $firstday = date('Y-' . 'm' . '-01');
            $last_date = date('Y-' . 'm' . '-' . date('t', strtotime($firstday)) . ' 23:59:59.993');
            $this->db->where('DATE(task.start_date) >=', $first_date);
            $this->db->where('DATE(task.start_date) <=', $last_date);
        } elseif ($search_type == 'this_year') {
            $this->db->where('YEAR(task.start_date)', date('Y'));
        } else if ($search_type == 'last_year') {
            $this->db->where('YEAR(task.start_date)', date('Y', strtotime("-1 year")));
        } /*elseif ($search_type == 'period' ) {
            
             $from_date = $this->input->post('date_from');
                    $to_date = $this->input->post('date_to');
                    
            
              $date_from = date("Y-m-d", $this->customlib->datetostrtotime($from_date));
            $date_to = date("Y-m-d 23:59:59.993", $this->customlib->datetostrtotime($to_date));
                    
                    
            $this->db->where('DATE(task.start_date) >=', $date_from);
            $this->db->where('DATE(task.start_date) <=', $date_to);
        }
    */
        // Apply staff filter for non-super admin users
        if ($userdata['role_id'] != 7) {
            $this->db->where("task.staff_id", $staff_id);
        }
        $this->db->order_by("task.start_date", "desc");
        $query = $this->db->get();
        return $query->result_array();
    }
}
