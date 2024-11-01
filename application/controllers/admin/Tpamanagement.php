<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tpamanagement extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->search_type = $this->config->item('search_type');
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('organisation', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'tpa_management');
        $data['title'] = 'TPA Management';
        $data['resultlist'] = $this->organisation_model->get();

        $this->load->view('layout/header');
        $this->load->view('admin/tpamanagement/index', $data);
        $this->load->view('layout/footer');
    }

    function add_oragnisation()
    {
        if (!$this->rbac->hasPrivilege('organisation', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('code', $this->lang->line('code'), 'required');
        $this->form_validation->set_rules('number', $this->lang->line('contact_no'), 'trim|required|callback_valid_mobile_number');
        //  $this->form_validation->set_rules('number3', 'Contact Person Phone', 'trim|required|callback_valid_mobile_number');
        $this->form_validation->set_rules('number3', $this->lang->line('contact_person_phone'), array(array('valid_emg_contact', array($this->staff_model, 'valid_emg_contact'))));
        if ($this->form_validation->run() == FALSE) {

            $msg = array(
                'name' => form_error('name'),
                'code' => form_error('code'),
                'number' => form_error('number'),
                'number3' => form_error('number3'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('number');
            $countryCode3 = $this->input->post('countryCode3');
            $number3 = $this->input->post('number3');
            $organigation = array(
                'organisation_name' => $this->input->post('name'),
                'code' => $this->input->post('code'),
                'contact_no' => $countryCode . $number,
                'address' => $this->input->post('address'),
                'contact_person_name' => $this->input->post('contact_person_name'),
                //'contact_person_phone' => $this->input->post('contact_person_phone'),
                'contact_person_phone' => $countryCode3 . $number3,
            );
            $this->organisation_model->add($organigation);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function valid_mobile_number($number)
    {
        // Remove any non-digit characters
        $cleaned_number = preg_replace('/\D/', '', $number);

        // Debugging: Output the cleaned number
        log_message('debug', 'Cleaned Number: ' . $cleaned_number);

        // Check if the cleaned number contains exactly 7 digits
        if (preg_match('/^\d{7}$/', $cleaned_number)) {
            return TRUE;
        } else {
            $this->form_validation->set_message('valid_mobile_number', $this->lang->line('valid_mobile_number'));
            return FALSE;
        }
    }

    function get_data($id)
    {
        if (!$this->rbac->hasPrivilege('organisation', 'can_view')) {
            access_denied();
        }
        $org = $this->organisation_model->get($id);
        $array = array(
            'id' => $org['id'],
            'ename' => $org['organisation_name'],
            'ecode' => $org['code'],
            'econtact_number' => $org['contact_no'],
            'eaddress' => $org['address'],
            'econtact_persion_name' => $org['contact_person_name'],
            'econtact_persion_phone' => $org['contact_person_phone'],
        );
        echo json_encode($array);
    }

    function edit()
    {
        if (!$this->rbac->hasPrivilege('organisation', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('ename', $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('ecode', $this->lang->line('code'), 'required');
        //    $this->form_validation->set_rules('number2', 'Mobile Number', 'trim|required|callback_valid_mobile_number');
        //    $this->form_validation->set_rules('number4', 'Mobile Number', 'trim|required|callback_valid_mobile_number');
        $this->form_validation->set_rules('number2', $this->lang->line('contact_no'), 'trim|required|callback_valid_mobile_number');
        $this->form_validation->set_rules('number4', $this->lang->line('contact_person_phone'), array(array('valid_emg_contact', array($this->staff_model, 'valid_emg_contact'))));
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'e1' => form_error('ename'),
                'e2' => form_error('ecode'),
                'number2' => form_error('number2'),
                'e4' => form_error('eaddress'),
                'e5' => form_error('econtact_persion_name'),
                'number4' => form_error('number4'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $countryCode = $this->input->post('countryCode2');
            $number = $this->input->post('number2');
            $countryCode4 = $this->input->post('countryCode4');
            $number4 = $this->input->post('number4');
            $organigation = array(
                'id' => $this->input->post('org_id'),
                'organisation_name' => $this->input->post('ename'),
                'code' => $this->input->post('ecode'),
                'contact_no' => $countryCode . $number,
                'address' => $this->input->post('eaddress'),
                'contact_person_name' => $this->input->post('econtact_persion_name'),
                //'contact_person_phone' => $this->input->post('econtact_persion_phone'),
                'contact_person_phone' => $countryCode4 . $number4,
            );
            $this->organisation_model->add($organigation);
            $array = array('status' => 'suucess', 'error' => '', 'message' => $this->lang->line('update_message'));
        }
        echo json_encode($array);
    }

    function delete($id)
    {
        if (!$this->rbac->hasPrivilege('organisation', 'can_delete')) {
            access_denied();
        }
        $this->organisation_model->delete($id);
        redirect('admin/tpamanagement');
    }

   // public function tpareport()
    // {

    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $this->session->set_userdata('sub_menu', 'admin/tpamanagement/tpareport');

    //     $doctorlist = $this->staff_model->getEmployeeByRoleID(3);
    //     $data['doctorlist'] = $doctorlist;
    //     $data['organisation'] = $this->organisation_model->get();
    //     $search_type = $this->input->post("search_type");
    //     if (isset($search_type)) {
    //         $search_type = $this->input->post("search_type");
    //     } else {
    //         $search_type = "this_month";
    //     }

    //     $parameter = array(
    //         'OPD' => array(
    //             'label' => 'OPD',
    //             'table' => 'opd_details',
    //             'search_table' => 'opd_details',
    //             'search_column' => 'appointment_date',
    //             'select' => 'opd_details.*,opd_details.appointment_date as date,opd_details.opd_no as reff, patients.id as pid,patients.patient_name,patients.patient_unique_id,staff.name,staff.surname,organisation.organisation_name',
    //             'join' => array(
    //                 'JOIN staff ON opd_details.cons_doctor = staff.id',
    //                 'JOIN patients ON opd_details.patient_id = patients.id',
    //                 'JOIN organisation ON organisation.id = patients.organisation'
    //             )
    //         ),
    //         'IPD' => array(
    //             'label' => 'IPD',
    //             'table' => 'ipd_details',
    //             'search_table' => 'payment',
    //             'search_column' => 'date',
    //             'select' => 'ipd_details.ipd_no,payment.date,payment.paid_amount as amount,patients.id as pid,patients.patient_name,ipd_details.ipd_no as reff,patients.patient_unique_id,staff.name,staff.surname,organisation.organisation_name',
    //             'join' => array(
    //                 'JOIN staff ON ipd_details.cons_doctor = staff.id',
    //                 'JOIN patients ON ipd_details.patient_id = patients.id',
    //                 'JOIN payment ON payment.patient_id = patients.id',
    //                 'JOIN organisation ON organisation.id = patients.organisation'
    //             ),
    //         ),
    //         'Operation_Theatre' => array(
    //             'label' => 'Operation Theatre',
    //             'table' => 'operation_theatre',
    //             'search_table' => 'operation_theatre',
    //             'search_column' => 'date',
    //             'select' => 'operation_theatre.*,patients.id as pid,patients.patient_unique_id,patients.patient_name,charges.id as cid,charges.charge_category,charges.code,charges.description,charges.standard_charge, operation_theatre.apply_charge as amount,staff.name,staff.surname,organisation.organisation_name',
    //             'join' => array(
    //                 'JOIN patients ON operation_theatre.patient_id=patients.id',
    //                 'JOIN staff ON staff.id = operation_theatre.consultant_doctor',
    //                 'JOIN charges ON operation_theatre.charge_id = charges.id',
    //                 'JOIN organisation ON organisation.id = patients.organisation'
    //             )
    //         ),
    //     );


    //     $i = 0;
    //     $data["parameter"] = $parameter;
    //     foreach ($parameter as $key => $value) {

    //         $select = $parameter[$key]['select'];
    //         $join = $parameter[$key]['join'];
    //         $table_name = $parameter[$key]['table'];


    //         $additional_where = array("patients.organisation !=' '");
    //         $orgnid = $this->input->post('organisation');
    //         $data['tpa_select'] = $orgnid;
    //         if (!empty($orgnid)) {
    //             $additional_where = array("patients.organisation = '" . $orgnid . "' ");
    //         }
    //         $doctorid = $this->input->post('doctor');

    //         if ((!empty($doctorid)) && ($key == 'OPD')) {
    //             $additional_where[] = "opd_details.cons_doctor =" . $doctorid;
    //         }
    //         if ((!empty($doctorid)) && ($key == 'IPD')) {
    //             $additional_where[] = "ipd_details.cons_doctor =" . $doctorid;
    //         }

    //         if ((!empty($doctorid)) && ($key == 'Operation_Theatre')) {
    //             $additional_where[] = "operation_theatre.consultant_doctor =" . $doctorid;
    //         }

    //         if (empty($search_type)) {
    //             $search_type = "";
    //             $resultList = $this->report_model->getReport($select, $join, $table_name, $additional_where);
    //         } else {

    //             $search_table = $parameter[$key]['search_table'];
    //             $search_column = $parameter[$key]['search_column'];
    //             $additional = array();

    //             $resultList = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
    //         }

    //         $rd[$parameter[$key]['label']] = $resultList;
    //         $data['parameter'][$key]['resultList'] = $resultList;

    //         $i++;
    //     }
    //     $ipd_additional_where = array();
    //     if (!empty($doctorid)) {
    //         $ipd_additional_where = array('ipd_details.cons_doctor =' . $doctorid);
    //     }

    //     $resultList2 = $this->report_model->searchReport($select = 'ipd_details.ipd_no,ipd_billing.date,ipd_billing.net_amount as amount,patients.id as pid,patients.patient_name,ipd_details.ipd_no as reff,patients.patient_unique_id,staff.name,staff.surname,organisation.organisation_name', $join = array(
    //         'JOIN staff ON ipd_details.cons_doctor = staff.id',
    //         'JOIN patients ON ipd_details.patient_id = patients.id',
    //         'JOIN payment ON payment.patient_id = patients.id',
    //         'JOIN ipd_billing ON ipd_billing.patient_id = patients.id',
    //         'JOIN organisation ON organisation.id = patients.organisation'
    //     ), $table_name = 'ipd_details', $search_type, $search_table = 'ipd_billing', $search_column = 'date', $ipd_additional_where);

    //     if (!empty($resultList2)) {

    //         array_push($rd["IPD"], $resultList2[0]);
    //         array_push($data['parameter']["IPD"]['resultList'], $resultList2[0]);
    //     }

    //     $data["resultlist"] = $rd;
    //     $data["searchlist"] = $this->search_type;
    //     $data["search_type"] = $search_type;
    //     $data["doctor_select"] = $doctorid;
    //     $this->load->view('layout/header', $data);
    //     $this->load->view('admin/tpamanagement/tpareport', $data);
    //     $this->load->view('layout/footer', $data);
    // }


    public function tpareport()
{
    $this->session->set_userdata('top_menu', 'Reports');
    $this->session->set_userdata('sub_menu', 'admin/tpamanagement/tpareport');

    // Fetch data
    $data['doctorlist'] = $this->staff_model->getEmployeeByRoleID(3);
    $data['organisation'] = $this->organisation_model->get();

    // Handle POST request and redirect to avoid form resubmission
    if ($this->input->server('REQUEST_METHOD') == 'POST') {
        $search_type = $this->input->post("search_type", true);
        $doctorid = $this->input->post("doctor");
        $orgnid = $this->input->post("organisation");
        // Redirect to avoid form resubmission
        redirect('admin/tpamanagement/tpareport?search_type=' . urlencode($search_type) . '&doctor=' . urlencode($doctorid) . '&organisation=' . urlencode($orgnid));
    }

    // Get search parameters from the URL
    $search_type = $this->input->get('search_type');
    $doctorid = $this->input->get('doctor');
    $orgnid = $this->input->get('organisation');

    // Set default value if no search_type is provided
    if (empty($search_type)) {
        $search_type = "this_month"; // Default search type
    }

    $data['tpa_select'] = $orgnid;
    $data['doctor_select'] = $doctorid;
    $data['search_type'] = $search_type;

    $parameter = array(
        'OPD' => array(
            'label' => 'OPD',
            'table' => 'opd_details',
            'search_table' => 'opd_details',
            'search_column' => 'appointment_date',
            'select' => 'opd_details.*,opd_details.appointment_date as date,opd_details.opd_no as reff, patients.id as pid,patients.patient_name,patients.patient_unique_id,staff.name,staff.surname,organisation.organisation_name',
            'join' => array(
                'JOIN staff ON opd_details.cons_doctor = staff.id',
                'JOIN patients ON opd_details.patient_id = patients.id',
                'JOIN organisation ON organisation.id = patients.organisation'
            )
        ),
        'IPD' => array(
            'label' => 'IPD',
            'table' => 'ipd_details',
            'search_table' => 'payment',
            'search_column' => 'date',
            'select' => 'ipd_details.ipd_no,payment.date,payment.paid_amount as amount,patients.id as pid,patients.patient_name,ipd_details.ipd_no as reff,patients.patient_unique_id,staff.name,staff.surname,organisation.organisation_name',
            'join' => array(
                'JOIN staff ON ipd_details.cons_doctor = staff.id',
                'JOIN patients ON ipd_details.patient_id = patients.id',
                'JOIN payment ON payment.patient_id = patients.id',
                'JOIN organisation ON organisation.id = patients.organisation'
            ),
        ),
        'Operation_Theatre' => array(
            'label' => 'Operation Theatre',
            'table' => 'operation_theatre',
            'search_table' => 'operation_theatre',
            'search_column' => 'date',
            'select' => 'operation_theatre.*,patients.id as pid,patients.patient_unique_id,patients.patient_name,charges.id as cid,charges.charge_category,charges.code,charges.description,charges.standard_charge, operation_theatre.apply_charge as amount,staff.name,staff.surname,organisation.organisation_name',
            'join' => array(
                'JOIN patients ON operation_theatre.patient_id=patients.id',
                'JOIN staff ON staff.id = operation_theatre.consultant_doctor',
                'JOIN charges ON operation_theatre.charge_id = charges.id',
                'JOIN organisation ON organisation.id = patients.organisation'
            )
        ),
    );

    // Fetch and filter data for each parameter (OPD, IPD, Operation Theatre)
    $resultData = array();
    foreach ($parameter as $key => $value) {
        $select = $value['select'];
        $join = $value['join'];
        $table_name = $value['table'];
        $additional_where = array("patients.organisation !=' '");

        if (!empty($orgnid)) {
            $additional_where = array("patients.organisation = '" . $orgnid . "' ");
        }

        if (!empty($doctorid)) {
            if ($key == 'OPD') {
                $additional_where[] = "opd_details.cons_doctor =" . $doctorid;
            } elseif ($key == 'IPD') {
                $additional_where[] = "ipd_details.cons_doctor =" . $doctorid;
            } elseif ($key == 'Operation_Theatre') {
                $additional_where[] = "operation_theatre.consultant_doctor =" . $doctorid;
            }
        }

        if ($search_type == "") {
            $resultList = $this->report_model->getReport($select, $join, $table_name, $additional_where);
        } else {
            $search_table = $value['search_table'];
            $search_column = $value['search_column'];
            $resultList = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column, $additional_where);
        }

        $resultData[$value['label']] = $resultList;
        $data['parameter'][$key]['resultList'] = $resultList;
    }

    $data["resultlist"] = $resultData;

    // Load views
    $this->load->view('layout/header', $data);
    $this->load->view('admin/tpamanagement/tpareport', $data);
    $this->load->view('layout/footer', $data);
}
}
