<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Vehicle extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->load->library('Enc_lib');
        $this->load->library('mailsmsconf');
        $this->marital_status = $this->config->item('marital_status');
        $this->payment_mode = $this->config->item('payment_mode');
        $this->search_type = $this->config->item('search_type');
        $this->blood_group = $this->config->item('bloodgroup');

        $this->charge_type = $this->config->item('charge_type');
        $data["charge_type"] = $this->charge_type;
        $this->patient_login_prefix = "pat";
    }

    public function search()
    {
        if (!$this->rbac->hasPrivilege('ambulance', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Transport');
        $this->session->set_userdata('sub_menu', 'vehicle/index');
        $data['title'] = 'Add Vehicle';
        $listVehicle = $this->vehicle_model->get();
        $data['listVehicle'] = $listVehicle;
        $this->load->view('layout/header');
        $this->load->view('admin/vehicle/search', $data);
        $this->load->view('layout/footer');
    }

    public function add()
    {
        if (!$this->rbac->hasPrivilege('ambulance', 'can_add')) {
            access_denied();
        }
        $this->form_validation->set_rules('vehicle_no', $this->lang->line('vehicle_no'), 'required');
        $this->form_validation->set_rules('vehicle_model', $this->lang->line('vehicle_model'), 'required');
        $this->form_validation->set_rules('driver_name', $this->lang->line('driver_name'), 'trim|required');
        $this->form_validation->set_rules('vehicle_type', $this->lang->line('vehicle') . " " . $this->lang->line('type'), 'required');
        $this->form_validation->set_rules('number', $this->lang->line('driver_contact'), 'trim|required|callback_valid_mobile_number');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'vehicle_no' => form_error('vehicle_no'),
                'vehicle_model' => form_error('vehicle_model'),
                'driver_name' => form_error('driver_name'),
                'vehicle_type' => form_error('vehicle_type'),
                'number' => form_error('number'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $manufacture_year = $this->input->post('manufacture_year');
            $countryCode = $this->input->post('countryCode');
            $number = $this->input->post('number');
            $data = array(
                'vehicle_no' => $this->input->post('vehicle_no'),
                'vehicle_model' => $this->input->post('vehicle_model'),
                'driver_name' => $this->input->post('driver_name'),
                'driver_licence' => $this->input->post('driver_licence'),
                //'driver_contact' => $this->input->post('driver_contact'),
                'driver_contact' => $countryCode . $number,
                'vehicle_type' => $this->input->post('vehicle_type'),
                'note' => $this->input->post('note'),
            );
            ($manufacture_year != "") ? $data['manufacture_year'] = $manufacture_year : '';
            $this->vehicle_model->add($data);
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

    public function edit()
    {
        if (!$this->rbac->hasPrivilege('ambulance', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $listVehicle = $this->vehicle_model->getDetails($id);
        echo json_encode($listVehicle);
    }

    public function update()
    {
        if (!$this->rbac->hasPrivilege('ambulance', 'can_edit')) {
            access_denied();
        }
        $this->form_validation->set_rules('vehicle_no', $this->lang->line('vehicle_no'), 'required');
        $this->form_validation->set_rules('vehicle_model', $this->lang->line('vehicle_model'), 'required');
        $this->form_validation->set_rules('driver_name', $this->lang->line('driver_name'), 'trim|required');
        $this->form_validation->set_rules('vehicle_type', $this->lang->line('vehicle') . " " . $this->lang->line('type'), 'required');
        $this->form_validation->set_rules('number2', $this->lang->line('driver_contact'), 'trim|required|callback_valid_mobile_number');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'vehicle_no' => form_error('vehicle_no'),
                'vehicle_model' => form_error('vehicle_model'),
                'driver_name' => form_error('driver_name'),
                'vehicle_type' => form_error('vehicle_type'),
                'number2' => form_error('number2'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('id');
            $manufacture_year = $this->input->post('manufacture_year');
            $countryCode = $this->input->post('countryCode2');
            $number = $this->input->post('number2');
            $data = array(
                'id' => $id,
                'vehicle_no' => $this->input->post('vehicle_no'),
                'vehicle_model' => $this->input->post('vehicle_model'),
                'driver_name' => $this->input->post('driver_name'),
                'driver_licence' => $this->input->post('driver_licence'),
                //'driver_contact' => $this->input->post('driver_contact'),
                'driver_contact' => $countryCode . $number,
                'vehicle_type' => $this->input->post('vehicle_type'),
                'note' => $this->input->post('note'),
            );
            ($manufacture_year != "") ? $data['manufacture_year'] = $manufacture_year : '';
            $this->vehicle_model->add($data);
            $array = array('status' => 'success', 'error' => '', 'message' => 'Record Saved Successfully.');
        }
        echo json_encode($array);
    }

    function delete($id)
    {
        if (!$this->rbac->hasPrivilege('ambulance', 'can_delete')) {
            access_denied();
        }
        $this->vehicle_model->remove($id);
        redirect('admin/Vehicle/search');
    }




    public function getBillDetails($id)
    {
        if (!$this->rbac->hasPrivilege('bloodissue bill', 'can_view')) {
            access_denied();
        }
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details = $this->printing_model->get('', 'ambulance');
        $data['print_details'] = $print_details;
        $result = $this->vehicle_model->getBillDetails($id);
        $data['result'] = $result;
        $detail = $this->vehicle_model->getAllBillDetails($id);
        $data['detail'] = $detail;
        $this->load->view('admin/vehicle/printBill', $data);
    }

    public function getCallAmbulance()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Transport');
        $this->session->set_userdata('sub_menu', 'vehicle/getcallambulance');
        $data['title'] = 'Add Vehicle';
        $patients = $this->patient_model->getPatientListall();
        $data["patients"] = $patients;
        $listCall = $this->vehicle_model->getCallAmbulance();
        $vehiclelist = $this->vehicle_model->get();
        $ambulanceCategory = $this->charge_model->getAmbulanceCategory();
        $data['listCall'] = $listCall;
        $data['vehiclelist'] = $vehiclelist;
        $data['ambulanceCategory'] = $ambulanceCategory;
        $this->load->view('layout/header');
        $this->load->view('admin/vehicle/ambulance_call', $data);
        $this->load->view('layout/footer');
    }

    public function editCall()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $listCall = $this->vehicle_model->getCallDetails($id);
        $date = date($this->customlib->getSchoolDateFormat(true, true), strtotime($listCall['date']));
        $listCall["date"] = $date;
        echo json_encode($listCall);
    }


    function deleteCallAmbulance($id)
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_delete')) {
            access_denied();
        }
        $this->vehicle_model->delete($id);
        redirect('admin/Vehicle/getcallambulance');
    }

    public function getVehicleDetail()
    {
        $id = $this->input->post('id');
        $result = $this->vehicle_model->getDetails($id);
        echo json_encode($result);
    }

   // public function ambulancereport()
    // {
    //     if (!$this->rbac->hasPrivilege('ambulance_call', 'can_view')) {
    //         access_denied();
    //     }

    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $this->session->set_userdata('sub_menu', 'admin/vehicle/ambulancereport');
    //     $this->session->set_userdata('top_menu', 'Reports');
    //     $select = 'ambulance_call.*,vehicles.vehicle_model,vehicles.vehicle_no,patients.patient_name';
    //     $join = array(
    //         'JOIN vehicles ON ambulance_call.vehicle_no = vehicles.id',
    //         'JOIN patients ON patients.id = ambulance_call.patient_name',
    //     );
    //     $table_name = "ambulance_call";

    //     $search_type = $this->input->post("search_type");
    //     if (isset($search_type)) {
    //         $search_type = $this->input->post("search_type");
    //     } else {
    //         $search_type = "this_month";
    //     }

    //     if (empty($search_type)) {

    //         $search_type = "";
    //         $resultlist = $this->report_model->getReport($select, $join, $table_name);
    //     } else {

    //         $search_table = "ambulance_call";
    //         $search_column = "date";
    //         $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column);
    //     }

    //     $data["searchlist"] = $this->search_type;
    //     $data["search_type"] = $search_type;
    //     $data["listCall"] = $resultlist;

    //     $this->load->view('layout/header');
    //     $this->load->view('admin/vehicle/ambulancereport.php', $data);
    //     $this->load->view('layout/footer');
    // }


    public function ambulancereport() {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_view')) {
            access_denied();
        }
    
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'admin/vehicle/ambulancereport');
    
        // Check if the request method is POST
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            // Capture search type from the POST request
            $search_type = $this->input->post("search_type");
    
            // Redirect to avoid form resubmission
            redirect('admin/vehicle/ambulancereport?search_type=' . urlencode($search_type));
        }
    
        // Handle GET request
        $search_type = $this->input->get("search_type");
        if (empty($search_type)) {
            $search_type = "this_month"; // Default value
        }
    
        // Prepare data for report fetching
        $select = 'ambulance_call.*, vehicles.vehicle_model, vehicles.vehicle_no, patients.patient_name';
        $join = array(
            'JOIN vehicles ON ambulance_call.vehicle_no = vehicles.id',
            'JOIN patients ON patients.id = ambulance_call.patient_name',
        );
        $table_name = "ambulance_call";
    
        // Fetch report based on search type
        if ($search_type) {
            $search_table = "ambulance_call";
            $search_column = "date";
            $resultlist = $this->report_model->searchReport($select, $join, $table_name, $search_type, $search_table, $search_column);
        } else {
            $resultlist = $this->report_model->getReport($select, $join, $table_name);
        }
    
        // Pass data to the view
        $data["searchlist"] = $this->search_type;
        $data["search_type"] = $search_type;
        $data["listCall"] = $resultlist;
    
        // Load views
        $this->load->view('layout/header');
        $this->load->view('admin/vehicle/ambulancereport.php', $data);
        $this->load->view('layout/footer');
    }
    public function addPaymentACall()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_view')) {
            access_denied();
        }
        $id = $this->input->post("id");
        $listCall = $this->vehicle_model->getPayDetails($id);
        $translist = $this->vehicle_model->getTransDetails($id);
        $date = date($this->customlib->getSchoolDateFormat(true, true), strtotime($listCall['date']));

        $table = '<table class="table table-hover">
                <thead>
                   <tr>
                    <th>' . $this->lang->line('transaction') . " " . $this->lang->line('no') . '</th>
                    <th>' . $this->lang->line('date') . '</th>
                    <th>' . $this->lang->line('payment')." ".$this->lang->line('mode') . '</th>
                    <th>' . $this->lang->line('amount') . '</th>
                    <th>' . $this->lang->line('action') . '</th>
                </tr>  
                </thead>

                <tbody>';
        foreach ($translist as $tdata) {
            $table .= '<tr>
                        <td>' . $tdata['trans_number'] . '</td>
                        <td>' . date('Y-m-d H:i:s', $this->customlib->datetostrtotime($tdata['date'])) . '</td>
                        <td>' . $tdata['mood'] . '</td>
                        <td>' . $tdata['amount'] . '</td>
                        <td>';
            if ($listCall["first_transc_id"] != $tdata["id"]) {

                $table .= '<a class="btn btn-default btn-xs"  data-toggle="tooltip" title="delete" onclick="delete_transId(' . $tdata['id'] . ',' . $id . ')"><i class="fa fa-trash"></i></a>';
            }


            $table .= '<a href="#" data-toggle="tooltip" onclick="printTransaction(' . $tdata['id'] . ')" data-original-title="' . $this->lang->line('print') . '" class="btn btn-default btn-xs print_receipt"><i class="fa fa-print"></i></a>
                        </td>
                    </tr>';
        }
        $table .= '</tbody>

            </table>';

        $listCall["date"] = $date;
        $listCall["table"] = $table;
        echo json_encode($listCall);
    }

    public function delete_trans($id)
    {
        $response = array();

        // Ensure ID is valid before attempting deletion
        if (!empty($id)) {
            // Assuming deleteTransaction method returns true on successful deletion
            if ($this->vehicle_model->deleteTransaction($id)) {
                $response['status'] = 1;
                $response['msg'] = 'Transaction deleted successfully.';
            } else {
                $response['status'] = 0;
                $response['msg'] = 'Failed to delete transaction. Please try again.';
            }
        } else {
            $response['status'] = 0;
            $response['msg'] = 'Invalid Transaction ID.';
        }

        // Send response in JSON format
        echo json_encode($response);
    }

    public function addCallAmbulance()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_add')) {
            access_denied();
        }

        if ($this->input->post('payment_mode') == 'Cheque') {
            $this->form_validation->set_rules('pcheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'required');
            $this->form_validation->set_rules('pcheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'required');
        }
        $this->form_validation->set_rules('patient_name', $this->lang->line('patient') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('vehicle_no', $this->lang->line('vehicle_model'), 'required');
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'required');
        // $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required');
        $this->form_validation->set_rules('driver', $this->lang->line('driver_name'), 'trim|required');

        $this->form_validation->set_rules('charge_category', $this->lang->line('charge_category'), 'required');
        $this->form_validation->set_rules('standard_charge', $this->lang->line('standard') . " " . $this->lang->line('charge'), 'required');
        $this->form_validation->set_rules('payment_amount', $this->lang->line('payment') . " " . $this->lang->line('amount'), 'required');


        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'patient_name' => form_error('patient_name'),
                'vehicle_no' => form_error('vehicle_no'),
                'date' => form_error('date'),
                //'amount' => form_error('amount'),
                'driver' => form_error('driver'),

                'charge_category' => form_error('charge_category'),
                'standard_charge' => form_error('standard_charge'),
                'payment_amount' => form_error('payment_amount'),
                'pcheque_no' => form_error('pcheque_no'),
                'pcheque_date' => form_error('pcheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $picture = '';
            if (isset($_FILES["pcheque_documnet"]) && !empty($_FILES['pcheque_documnet']['name'])) {


                $fileInfo = pathinfo($_FILES["pcheque_documnet"]["name"]);
                $picture = rand() . '_ambulance.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["pcheque_documnet"]["tmp_name"], "./uploads/payment_document/" . $picture);
            }
            $prefix = $this->setting_model->getPrefixSetting('ambulance_call_bill');
            if (empty($prefix)) {
                $prefix = "ACB";
            }

            $check_id = $this->vehicle_model->getMaxId();
            if (empty($check_id)) {
                $check_id = 0;
            }

            $max_id = $check_id + 1;
            $bill = $prefix . $max_id;



            $date = $this->input->post("date");
            $patient_id = $this->input->post('patient_name');
            $data = array(
                'bill_no' => $bill,
                'patient_name' => $patient_id,
                'vehicle_no' => $this->input->post('vehicle_no'),
                'vehicle_model' => $this->input->post('vehicle_model'),
                'driver' => $this->input->post('driver'),
                'charge_category' => $this->input->post('charge_category'),
                'standard_charge' => $this->input->post('standard_charge'),
                'discount_per' => $this->input->post('disc_percentage'),
                'discount_amount' => $this->input->post('discount'),
                'tax_per' => $this->input->post('tax_percentage'),
                'tax_amount' => $this->input->post('tax'),
                'payment_mode' => $this->input->post('payment_mode'),
                'paid_amount' => $this->input->post('payment_amount'),
                'amount' => $this->input->post('net_amount'),
                'generated_by' => $this->session->userdata('hospitaladmin')['id'],
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($date))
            );

            $numeric_part = substr(time(), -5); // Get the last 5 digits of the timestamp
            $transaction_id = 'TRANS' . $numeric_part;

            $dataa = array(
                // 'ambulance_call_id' => $id,
                'trans_number' => $transaction_id,
                'mood' => $this->input->post('payment_mode'),
                'amount' => $this->input->post('payment_amount'),
                'cheque_no' => $this->input->post('pcheque_no'),
                'cheque_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($this->input->post('pcheque_date'))),
                'document' => $picture,
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($date))
            );


            $insert_id = $this->vehicle_model->addCallAmbulance($data, $dataa);
            $array = array('status' => 'success', 'id' => $insert_id, 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }



    public function updateCallAmbulance()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_edit')) {
            access_denied();
        }

        if ($this->input->post('epayment_mode') == 'Cheque') {
            $this->form_validation->set_rules('epcheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'required');
            $this->form_validation->set_rules('epcheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'required');
        }
        $this->form_validation->set_rules('patient_name', $this->lang->line('patient') . " " . $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('vehicle_no', $this->lang->line('vehicle_no'), 'required');
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'required');
        // $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required');
        $this->form_validation->set_rules('driver_name', $this->lang->line('driver_name'), 'trim|required');
        $this->form_validation->set_rules('echarge_category', $this->lang->line('charge_category'), 'required');
        $this->form_validation->set_rules('estandard_charge', $this->lang->line('standard') . " " . $this->lang->line('charge'), 'required');
        $this->form_validation->set_rules('epayment_amount', $this->lang->line('payment') . " " . $this->lang->line('amount'), 'required');

        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'patient_name' => form_error('patient_name'),
                'vehicle_no' => form_error('vehicle_no'),
                'date' => form_error('date'),
                //'amount' => form_error('amount'),
                'driver_name' => form_error('driver_name'),
                'charge_category' => form_error('echarge_category'),
                'standard_charge' => form_error('estandard_charge'),
                'payment_amount' => form_error('epayment_amount'),
                'pcheque_no' => form_error('epcheque_no'),
                'pcheque_date' => form_error('epcheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $id = $this->input->post('id');
            $date = $this->input->post('date');

            $data = array(
                'id' => $id,
                'patient_name' => $this->input->post('patient_name'),
                'address' => $this->input->post('address'),
                'vehicle_no' => $this->input->post('vehicle_no'),
                'driver' => $this->input->post('driver_name'),
                'charge_category' => $this->input->post('echarge_category'),
                'standard_charge' => $this->input->post('estandard_charge'),
                'tax_per' => $this->input->post('etax_percentage'),
                'tax_amount' => $this->input->post('etax'),
                'discount_per' => $this->input->post('ediscount_percentage'),
                'discount_amount' => $this->input->post('ediscount'),

                'payment_mode' => $this->input->post('epayment_mode'),
                'paid_amount' => $this->input->post('epayment_amount'),
                'amount' => $this->input->post('enet_amount'),
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($date))
            );

            if (isset($_FILES["epcheque_documnet"]) && !empty($_FILES['epcheque_documnet']['name'])) {


                $fileInfo = pathinfo($_FILES["epcheque_documnet"]["name"]);
                $picture = rand() . '_ambulance.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["epcheque_documnet"]["tmp_name"], "./uploads/payment_document/" . $picture);
            } else {

                $first_transc_id = $this->db->select('first_transc_id')->where('id', $id)->get('ambulance_call')->row_array()['first_transc_id'];
                $picture = $this->db->select('document')->where('id', $first_transc_id)->get('ambulance_payment')->row_array()['document'];
            }
            $dataa = array(
                'mood' => $this->input->post('epayment_mode'),
                'amount' => $this->input->post('epayment_amount'),
                'cheque_no' => $this->input->post('epcheque_no'),
                'cheque_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($this->input->post('epcheque_date'))),
                'document' => $picture,
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($date))
            );
            $this->vehicle_model->addCallAmbulance($data, $dataa);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
        }
        echo json_encode($array);
    }

    public function paymentupdatecallambulance()
    {
        if (!$this->rbac->hasPrivilege('ambulance_call', 'can_edit')) {
            access_denied();
        }

        if ($this->input->post('apayment_mode') == 'Cheque') {
            $this->form_validation->set_rules('cheque_no', $this->lang->line('cheque') . " " . $this->lang->line('no'), 'required');
            $this->form_validation->set_rules('cheque_date', $this->lang->line('cheque') . " " . $this->lang->line('date'), 'required');
        }
        $this->form_validation->set_rules('adate', $this->lang->line('date'), 'required');
        $this->form_validation->set_rules('apayment_amount', $this->lang->line('payment') . " " . $this->lang->line('amount'), 'required');
        $this->form_validation->set_rules('netAmount', $this->lang->line('net') . " " . $this->lang->line('amount'), 'required|greater_than[0]', array('greater_than' => $this->lang->line('net_amount_greater_than_zero')));
        if ($this->form_validation->run() == FALSE) {
            $msg = array(
                'date' => form_error('adate'),
                'payment_amount' => form_error('apayment_amount'),
                'netAmount' => form_error('netAmount'),
                'cheque_no' => form_error('cheque_no'),
                'cheque_date' => form_error('cheque_date'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            $picture = '';
            if (isset($_FILES["cheque_documnet"]) && !empty($_FILES['cheque_documnet']['name'])) {


                $fileInfo = pathinfo($_FILES["cheque_documnet"]["name"]);
                $picture = rand() . '_ambulance.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["cheque_documnet"]["tmp_name"], "./uploads/payment_document/" . $picture);
            }

            $id = $this->input->post('id');
            $date = $this->input->post('adate');
            $numeric_part = substr(time(), -5); // Get the last 5 digits of the timestamp
            $transaction_id = 'TRANS' . $numeric_part;
            $data = array(
                'ambulance_call_id' => $id,
                'trans_number' => $transaction_id,
                'mood' => $this->input->post('apayment_mode'),
                'amount' => $this->input->post('apayment_amount'),
                'cheque_no' => $this->input->post('cheque_no'),
                'cheque_date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($this->input->post('cheque_date'))),
                'document' => $picture,
                'date' => date('Y-m-d H:i:s', $this->customlib->datetostrtotime($date))
            );
            $this->vehicle_model->addPayCallAmbulance($data);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('update_message'));
        }
        echo json_encode($array);
    }


    public function getTransBillDetails($id)
    {
        if (!$this->rbac->hasPrivilege('bloodissue bill', 'can_view')) {
            access_denied();
        }
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details = $this->printing_model->get('', 'ambulance');
        $data['print_details'] = $print_details;
        $result = $this->vehicle_model->getTransBillDetails($id);
        $data['result'] = $result;
        $this->load->view('admin/vehicle/printTransaction', $data);
    }
}
