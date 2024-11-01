<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
$genderList = $this->customlib->getGender();
?>
<style type="text/css">
    #easySelectable {
        /*display: flex; flex-wrap: wrap;*/
    }

    #easySelectable li {}

    #easySelectable li.es-selected {
        background: #2196F3;
        color: #fff;
    }

    .easySelectable {
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
    }
</style>
<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('ambulance_call_list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php if ($this->rbac->hasPrivilege('ambulance_call', 'can_add')) { ?>
                                <a data-toggle="modal" onclick="holdModal('myModal')" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('ambulance_call'); ?></a>
                            <?php } ?>
                        </div>
                    </div><!-- /.box-header -->

                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('ambulance_call_list'); ?>

                        </div>
                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo $this->lang->line('ambulance_call') . " " . $this->lang->line('no'); ?></th>
                                    <th><?php echo $this->lang->line('date'); ?></th>
                                    <th><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></th>
                                    <th><?php echo $this->lang->line('contact') . " " . $this->lang->line('no'); ?></th>
                                    <th><?php echo $this->lang->line('vehicle_no'); ?></th>
                                    <th><?php echo $this->lang->line('vehicle_model'); ?></th>
                                    <th><?php echo $this->lang->line('driver_name'); ?></th>
                                    <th><?php echo $this->lang->line('patient') . " " . $this->lang->line('address'); ?></th>
                                    <th class="text-right"><?php echo $this->lang->line('amount') . " (" . $currency_symbol . ")"; ?>
                                    </th>
                                    <th class="text-right">
                                        <?php echo $this->lang->line('paid') . " " . $this->lang->line('amount') . " (" . $currency_symbol . ")"; ?>
                                    </th>
                                    <th class="text-right">
                                        <?php echo $this->lang->line('balance') . " " . $this->lang->line('amount') . " (" . $currency_symbol . ")"; ?>
                                    </th>
                                    <th class="text-right"><?php echo $this->lang->line('action'); ?></th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php if (empty($listCall)) {
                                ?>
                                    <?php
                                } else {
                                    $count = 1;
                                    foreach ($listCall as $data) {
                                        $amount = isset($data['amount']) ? (float)$data['amount'] : 0;
                                        $paid_amount = isset($data['paid_amount']) ? (float)$data['paid_amount'] : 0;
                                        $balance = $amount - $paid_amount;
                                    ?>
                                        <tr class="">
                                            <td><?php echo $data['bill_no']; ?></td>
                                            <td><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($data['date'])); ?></td>
                                            <td>
                                                <?php echo $data['patient'] ?>                                                
                                            </td>
                                            <td><?php echo $data['mobileno'] ?></td>
                                            <td><?php echo $data['vehicle_no'] ?></td>
                                            <td><?php echo $data['vehicle_model']; ?></td>
                                            <td><?php echo $data['driver']; ?></td>
                                            <td><?php echo $data['address']; ?></td>

                                            <td class="text-right"><?php echo $amount; ?></td>
                                            <td class="text-right"><?php echo $paid_amount; ?></td>
                                            <td class="text-right"><?php echo $balance; ?></td>
                                            <td class="text-right">
                                                             <?php
                                                    if ($this->rbac->hasPrivilege('ambulance_call', 'can_edit')) {
                                                        ?>
                                                        <a href="#" onclick="getPayRecord('<?php echo $data['id'] ?>')" class="btn btn-default btn-xs" data-target="#addPayment" data-toggle="tooltip" title="Add Payment">
                                                            <i class="fa fa-plus"></i>
                                                        </a>     
                                                    <?php } ?>

                                                    <?php
                                                    if ($this->rbac->hasPrivilege('ambulance bill', 'can_view')) {
                                                    ?>
                                                        <a href="#" onclick="viewDetailBill('<?php echo $data['id'] ?>')" class="btn btn-default btn-xs" data-target="#editModal" data-toggle="tooltip" title="<?php echo $this->lang->line('show'); ?>">
                                                            <i class="fa fa-reorder"></i>
                                                        </a>
                                                    <?php } ?>
                                                    <?php if ($this->rbac->hasPrivilege('ambulance_call', 'can_delete')) { ?>
                                                        <a class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="delete_recordById('<?php echo base_url(); ?>admin/vehicle/deletecallambulance/<?php echo $data['id'] ?>', '<?php echo $this->lang->line('delete_message') ?>')">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    <?php } ?>
                                            </td>
                                        </tr>
                                <?php
                                        $count++;
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content modal-media-content" style="width:700px;">
            <div class="modal-header modal-media-header">
                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                <div class="row">
                    <div class="col-sm-6 col-xs-8">
                        <div class="form-group15">
                            <div>
                                <select onchange="get_PatientDetails(this.value)" style="width:100%" class="form-control select2" name='patient_id' id="addpatient_id">
                                    <option value=""><?php echo $this->lang->line('select') . " " . $this->lang->line('patient') ?></option>
                                    <?php foreach ($patients as $dkey => $dvalue) {
                                    ?>
                                        <option value="<?php echo $dvalue["id"]; ?>" <?php
                                                                                        if ((isset($patient_select)) && ($patient_select == $dvalue["id"])) {
                                                                                            echo "selected";
                                                                                        }
                                                                                        ?>><?php echo $dvalue["patient_name"] . " (" . $dvalue["patient_unique_id"] . ')' ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <span class="text-danger"><?php echo form_error('refference'); ?></span>
                        </div>
                    </div><!--./col-sm-8-->
                    <div class="col-sm-4 col-xs-3">
                        <div class="form-group15">
                            <?php if ($this->rbac->hasPrivilege('patient', 'can_add')) { ?>
                                <a data-toggle="modal" id="add" onclick="holdModal('myModalpa')" class="modalbtnpatient"><i class="fa fa-plus"></i> <span><?php echo $this->lang->line('new') . " " . $this->lang->line('patient') ?></span></a>
                            <?php } ?>

                        </div>
                    </div><!--./col-sm-4-->
                </div><!-- ./row -->
            </div>
            <form id="formcall" method="post" accept-charset="utf-8">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                        <div class="row">
                            <input name="patient_name" id="patientid" type="hidden" class="form-control" />
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('vehicle_model'); ?></label><small class="req"> *</small>
                                    <select name="vehicle_no" id="vehicle_no" class="form-control" onchange="getVehicleDetail(this.value)">
                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                        <?php foreach ($vehiclelist as $key => $vehicle) {
                                        ?>
                                            <option value="<?php echo $vehicle["id"] ?>"><?php echo $vehicle["vehicle_model"] . " - " . $vehicle["vehicle_no"] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('vehicle_no'); ?></span>
                                </div>
                            </div>
                            <!-- <div class="col-sm-4">
                              <div class="form-group">
                                  <label for="exampleInputEmail1"><?php echo $this->lang->line('vehicle_model'); ?></label>
                                  <input name="vehicle_model" id="vehicle_model_search" readonly type="text" class="form-control" />
                              </div>
                            </div> -->
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('driver_name'); ?></label><small class="req"> *</small>
                                    <input name="driver" id="driver_search" type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input name="date" type="text" class="form-control datetimer" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('charge_category'); ?></label><small class="req"> *</small>
                                    <select onchange="get_ambulancecharges(this.value)" style="width: 100%" class="form-control select2" id="" name="charge_category">
                                        <option value="">Select Category</option>
                                        <?php foreach ($ambulanceCategory as $dkey => $dvalue) { ?>
                                            <option value="<?php echo $dvalue['name']; ?>"><?php echo $dvalue["name"]; ?></option>
                                        <?php } ?>
                                    </select>

                                </div>
                            </div>
                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo "Charge Name"; ?></label><small class="req"></small>
                                    <select style="width: 100%" class="form-control select2" id="" name=''>
                                        <option value="">Select Charges</option>

                                    </select>
                                </div>
                            </div> -->
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputFile"><?php echo $this->lang->line('standard') . " " . $this->lang->line('charge') . " (" . $currency_symbol . ")"; ?>
                                    </label><small class="req"> *</small>
                                    <div>
                                        <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" class="form-control" name="standard_charge" id="standard_charge" autocomplete="off">
                                    </div>
                                    <span class="text-danger"></span>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <table class="printablea4">
                                    <tbody>
                                        <tr>
                                            <th width="40%"><?php echo $this->lang->line('total') . " (" . $currency_symbol . ")"; ?></th>
                                            <td width="60%" colspan="2" class="text-right ipdbilltable">
                                                <input type="text" placeholder="Total" value="0" name="total" id="total" style="width: 30%; float: right" class="form-control total" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo $this->lang->line('tax') . " (" . $currency_symbol . ")"; ?></th>
                                            <td class="text-right ipdbilltable">
                                                <h4 style="float: right;font-size: 12px; padding-left: 5px;"> %</h4>
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" placeholder="Tax" name="tax_percentage" id="tax_percentage" class="form-control" style="width: 70%; float: right;font-size: 12px;">
                                            </td>
                                            <td class="text-right ipdbilltable">
                                                <input type="text" placeholder="Tax" name="tax" value="0" id="tax" style="width: 50%; float: right" class="form-control tax" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo $this->lang->line('net_amount') . " (" . $currency_symbol . ")"; ?></th>
                                            <td colspan="2" class="text-right ipdbilltable">
                                                <input type="text" placeholder="Net Amount" value="0" name="net_amount" id="net_amount" style="width: 30%; float: right" class="form-control" readonly="">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo $this->lang->line('payment') . " " . $this->lang->line('mode'); ?></label>
                                            <select class="form-control" name="payment_mode">
                                                <option value="Cash">Cash</option>
                                                <option value="Cheque">Cheque</option>
                                                <option value="transfer_to_bank_account">Transfer to Bank Account</option>
                                                <option value="UPI">UPI</option>
                                                <option value="Other">Other</option>
                                                <option value="Online">Online</option>
                                            </select>
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo $this->lang->line('payment') . " " . $this->lang->line('amount') . " (" . $currency_symbol . ")"; ?></label><small class="req"> *</small>
                                            <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" name="payment_amount" id="payment_amount" class="form-control payment_amount text-right">
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="formcallbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                    <div class="pull-right" style="margin-right:10px;">
                        <button type="button" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right printsavebtn"><?php echo $this->lang->line('save') . " & " . $this->lang->line('print'); ?></button>
                    </div>
                </div>

            </form>


        </div>
    </div>
</div>

<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                <div class="row">
                    <div class="col-sm-8">
                        <div>
                            <select onchange="get_PatienteditDetails(this.value)" style="width: 100%" class="form-control select2" id="addpatientid" name='patient_id'>
                                <option value=""><?php echo $this->lang->line('select') . " " . $this->lang->line('patient') ?></option>
                                <?php foreach ($patients as $dkey => $dvalue) { ?>
                                    <option value="<?php echo $dvalue["id"]; ?>" <?php
                                                                                    if ((isset($patient_select)) && ($patient_select == $dvalue["id"])) {
                                                                                        echo "selected";
                                                                                    }
                                                                                    ?>><?php echo $dvalue["patient_name"] . " ( " . $dvalue["patient_unique_id"] . ")" ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div><!--./col-sm-9-->
                    <!--<div class="col-sm-3">
<?php if ($this->rbac->hasPrivilege('patient', 'can_add')) { ?>
                                <a data-toggle="modal" id="add" onclick="holdModal('myModalpa')" class="btn btn-default btn-sm" style="height: 28px;padding-top: 6px"><i class="fa fa-plus"></i>  <?php echo $this->lang->line('new') . " " . $this->lang->line('patient') ?></a> 
<?php } ?> 
                    </div>--><!--./col-sm-3-->


                </div><!--./row-->
            </div>
            <form id="formedit" method="post" accept-charset="utf-8">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                        <div class="row">

                            <input name="patient_name" id="patienteditid" type="hidden" class="form-control" value="<?php echo set_value('patient_name'); ?>" />
                            <input name="id" id="id" type="hidden" class="form-control" value="<?php echo set_value('id'); ?>" />
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('vehicle_no'); ?></label><small class="req"> *</small>
                                    <select name="vehicle_no" style="width: 100%" id="vehicleno" class="form-control" onchange="getVehicleDetail(this.value, 'vehicle_model', 'driver_name')">
                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                        <?php foreach ($vehiclelist as $key => $vehicle) {
                                        ?>
                                            <option value="<?php echo $vehicle["id"] ?>"><?php echo $vehicle["vehicle_model"] . " - " . $vehicle["vehicle_no"] ?></option>
                                        <?php } ?>
                                    </select>

                                    <span class="text-danger"><?php echo form_error('vehicle_model'); ?></span>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('driver_name'); ?></label><small class="req"> *</small>
                                    <input name="driver_name" id="driver_name" type="text" class="form-control" value="<?php echo set_value('vehicle_model'); ?>" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input name="date" id="edit_date" type="text" class="form-control datetimer" value="<?php echo set_value('amount'); ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('charge_category'); ?></label><small class="req"> *</small>
                                    <select onchange="get_ambulancecharges(this.value)" style="width: 100%" class="form-control select2" id="echarge_category" name="echarge_category">
                                        <option value="">Select Category</option>
                                        <?php foreach ($ambulanceCategory as $dkey => $dvalue) { ?>
                                            <option value="<?php echo $dvalue['name']; ?>"><?php echo $dvalue["name"]; ?></option>
                                        <?php } ?>
                                    </select>

                                </div>
                            </div>
                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo "Charge Name"; ?></label><small class="req"></small>
                                    <select onchange="get_chargess(this.value)" style="width: 100%" class="form-control select2" id="" name=''>
                                        <option value="">Select Charges</option>

                                    </select>
                                </div>
                            </div> -->
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputFile"><?php echo $this->lang->line('standard') . " " . $this->lang->line('charge') . " (" . $currency_symbol . ")"; ?>
                                    </label><small class="req">*</small>
                                    <div>
                                        <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" class="form-control" name="estandard_charge" id="estandard_charge" autocomplete="off" value="<?php echo set_value('amount'); ?>">
                                    </div>
                                    <span class="text-danger"></span>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <table class="printablea4">
                                    <tbody>
                                        <tr>
                                            <th width="40%"><?php echo $this->lang->line('total') . " (" . $currency_symbol . ")"; ?></th>
                                            <td width="60%" colspan="2" class="text-right ipdbilltable">
                                                <input type="text" placeholder="Total" value="0" name="etotal" id="etotal" style="width: 30%; float: right" class="form-control total" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo $this->lang->line('tax') . " (" . $currency_symbol . ")"; ?></th>
                                            <td class="text-right ipdbilltable">
                                                <h4 style="float: right;font-size: 12px; padding-left: 5px;"> %</h4>
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"  placeholder="Tax" name="etax_percentage" id="etax_percentage" class="form-control" style="width: 70%; float: right;font-size: 12px;">
                                            </td>
                                            <td class="text-right ipdbilltable">
                                                <input type="text" placeholder="Tax" name="etax" value="0" id="etax" style="width: 50%; float: right" class="form-control tax" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo $this->lang->line('net_amount') . " (" . $currency_symbol . ")"; ?></th>
                                            <td colspan="2" class="text-right ipdbilltable">
                                                <input type="text" placeholder="Net Amount" value="0" name="enet_amount" id="enet_amount" style="width: 30%; float: right" class="form-control" readonly="">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo $this->lang->line('payment') . " " . $this->lang->line('mode'); ?></label>
                                            <select class="form-control text-left" name="epayment_mode" id="epayment_mode">
                                                <option value="Cash">Cash</option>
                                                <option value="Cheque">Cheque</option>
                                                <option value="transfer_to_bank_account">Transfer to Bank Account</option>
                                                <option value="UPI">UPI</option>
                                                <option value="Other">Other</option>
                                                <option value="Online">Online</option>
                                            </select>
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo $this->lang->line('payment') . " " . $this->lang->line('amount') . " (" . $currency_symbol . ")"; ?></label><small class="req"> *</small>
                                            <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"  name="epayment_amount" id="epayment_amount" class="form-control payment_amount text-right">
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="formeditbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>


            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="viewModalBill" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-toggle="tooltip" title="<?php echo $this->lang->line('clase'); ?>" data-dismiss="modal">&times;</button>
                <div class="modalicon">
                    <div id='edit_deletebill'>
                        <a href="#" data-target="#edit_prescription" data-toggle="modal" title="" data-original-title="<?php echo $this->lang->line('edit'); ?>"><i class="fa fa-pencil"></i></a>

                        <a href="#" data-toggle="tooltip" title="" data-original-title="<?php echo $this->lang->line('delete'); ?>"><i class="fa fa-trash"></i></a>
                    </div>
                </div>
                <h4 class="box-title"><?php echo $this->lang->line('bill') . " " . $this->lang->line('details'); ?></h4>
            </div>
            <div class="modal-body pt0 pb0">
                <div id="reportdata"></div>
            </div>
        </div>
    </div>
</div>

<!-----add payment modal----------->
<div class="modal fade" id="addPayment" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog pup100" role="document" >
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                
                  <h4 style="color: white;">Payments</h4>
           
              
            </div>
            <form  id="addformedit" method="post" accept-charset="utf-8">    
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                        <div class="row">

                            <input name="patient_name" id="apatienteditid" type="hidden" class="form-control" value="<?php echo set_value('patient_name'); ?>"/>
                            <input  name="id" id="aid" type="hidden" class="form-control" value="<?php echo set_value('id'); ?>" />
                            <input type="hidden" name="apaid_amount" id="apaid_amount">
                            <div class="col-sm-5">                     
                                <table class="table table-hover table-sm">
                                    <tbody>                    
                                    <tr>                                  
                                        <th width="35%">Received To</th>
                                        <td id="apatient"></td>
                                    </tr>
                                    <tr>    
                                        <th>Vehicle Number</th>
                                        <td id="avn"></td>
                                    </tr>
                                    <tr>
                                        <th>Vehicle Model</th>
                                        <td id="avm"></td>
                                    </tr>
                                    <tr>    
                                        <th>Driver Name</th>
                                        <td id="adn"></td>
                                    </tr>            
                                    <tr>
                                        <th>Driver Contact</th>
                                        <td id="adc"></td>
                                    </tr>    
                                    <tr>
                                        <th>Date</th>
                                        <td id="adt"></td>
                                    </tr>
                                    <tr>
                                        <th>Patient Address</th>
                                        <td colspan="3" id="aadrs"></td>
                                    </tr>    
                                </tbody>
                               </table>
                            </div>
                            <div class="col-sm-4">
                                <table class="table table-hover table-sm">
                                    <tbody>
                                    <tr>
                                        <th>Amount</th>
                                        <td class="text text-right amo"></td>
                                    </tr>
                                    <tr>
                                        <th>Tax (%)</th>
                                    <td class="text text-right atax">                        </td>
                                    </tr> 
                                    <tr>                   
                                        <th>Net Amount</th>
                                        <td class="text text-right ana"></td>  
                                    </tr>
                                    <tr>
                                        <th>Paid Amount</th>
                                        <td class="text text-right apa"></td>
                                    </tr>
                                    <tr>    
                                        <th>Balance Amount</th>
                                        <td class="text text-right aba"></td>
                                    </tr>           
                                </tbody>
                               </table>
                            </div>    

                            <div class="col-sm-3">
                              
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Date</label><small class="req"> *</small>
                                               <input name="adate" id="adate" type="text" class="form-control datetime" value="<?php echo set_value('amount'); ?>"/>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Payment Mode</label>
                                                <select class="form-control text-left" name="apayment_mode" id="apayment_mode">
                                                    <option value="Cash">Cash</option>
                                                    <option value="Cheque">Cheque</option>
                                                    <option value="transfer_to_bank_account">Transfer to Bank Account</option>
                                                    <option value="UPI">UPI</option>
                                                    <option value="Other">Other</option>
                                                    <option value="Online">Online</option>
                                                </select>
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Amount</label><small class="req"> *</small>
                                                <input type="text" name="apayment_amount" id="apayment_amount" class="form-control payment_amount text-left"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1'); checkAmount(this.value)">
                                                 <input type="hidden" name="netAmount" id="netAmount" class="form-control payment_amount text-right" value="">
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                </div>   
                <div class="box-footer">
                    <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="addformeditbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>


            </form> 
            <h4 class="box-title">Transaction History</h4>
            <hr>
            <div id="trans_details">
                
            </div>
            <div class="box-footer" style="clear: both;">
                   

                </div>
        </div>    
    </div>
</div>


<script type="text/javascript">
    $(function() {
        $('#easySelectable').easySelectable();
        $('.select2').select2()
        //stopPropagation();
    })

    function checkAmount(amount) {
    // Convert values to float to handle decimal amounts
    var balance_amount = parseFloat($('#netAmount').val());
    var entered_amount = parseFloat(amount);
    
    // Alert to check values (for debugging)
    // alert(entered_amount);
    // alert(balance_amount);
    
    // Ensure both amounts are valid numbers before proceeding
    if (isNaN(entered_amount) || isNaN(balance_amount)) {
        errorMsg("Invalid input. Please enter valid numeric values.");
        $('#apayment_amount').val(''); // Clear the input field
        return; // Stop execution if input is invalid
    }

    // Check if the entered amount is greater than the balance amount
    if (entered_amount > balance_amount) {
        errorMsg("Amount should not be greater than Balance amount");
        $('#apayment_amount').val(''); // Clear the input field if validation fails
    } else {
        $('#apayment_amount').val(entered_amount); // Set the valid amount
    }
}
</script>
<script type="text/javascript">
    /*
             Author: mee4dy@gmail.com
             */
    (function($) {
        //selectable html elements
        $.fn.easySelectable = function(options) {
            var el = $(this);
            var options = $.extend({
                'item': 'li',
                'state': true,
                onSelecting: function(el) {

                },
                onSelected: function(el) {

                },
                onUnSelected: function(el) {

                }
            }, options);
            el.on('dragstart', function(event) {
                event.preventDefault();
            });
            el.off('mouseover');
            el.addClass('easySelectable');
            if (options.state) {
                el.find(options.item).addClass('es-selectable');
                el.on('mousedown', options.item, function(e) {
                    $(this).trigger('start_select');
                    var offset = $(this).offset();
                    var hasClass = $(this).hasClass('es-selected');
                    var prev_el = false;
                    el.on('mouseover', options.item, function(e) {
                        if (prev_el == $(this).index())
                            return true;
                        prev_el = $(this).index();
                        var hasClass2 = $(this).hasClass('es-selected');
                        if (!hasClass2) {
                            $(this).addClass('es-selected').trigger('selected');
                            el.trigger('selected');
                            options.onSelecting($(this));
                            options.onSelected($(this));
                        } else {
                            $(this).removeClass('es-selected').trigger('unselected');
                            el.trigger('unselected');
                            options.onSelecting($(this))
                            options.onUnSelected($(this));
                        }
                    });
                    if (!hasClass) {
                        $(this).addClass('es-selected').trigger('selected');
                        el.trigger('selected');
                        options.onSelecting($(this));
                        options.onSelected($(this));
                    } else {
                        $(this).removeClass('es-selected').trigger('unselected');
                        el.trigger('unselected');
                        options.onSelecting($(this));
                        options.onUnSelected($(this));
                    }
                    var relativeX = (e.pageX - offset.left);
                    var relativeY = (e.pageY - offset.top);
                });
                $(document).on('mouseup', function() {
                    el.off('mouseover');
                });
            } else {
                el.off('mousedown');
            }
        };
    })(jQuery);
</script>
<script type="text/javascript">
    $(document).ready(function(e) {

        $(".printsavebtn").on('click', (function(e) {
            // $(this).submit();
            var form = $(this).parents('form').attr('id');
            var str = $("#" + form).serializeArray();
            var postData = new FormData();
            $.each(str, function(i, val) {
                postData.append(val.name, val.value);
            });
            //  $("#"+form).submit();

            $(".printsavebtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: '<?php echo base_url(); ?>admin/vehicle/addCallAmbulance',
                type: "POST",
                data: postData,
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function(index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        //var insertid = insert_id;
                        //console.log(insert_id);
                        successMsg(data.message);
                        printData(data.id);

                        // window.location.reload(true);
                    }
                    $(".printsavebtn").button('reset');
                },
                error: function() {
                    errorMsg("Failed");
                    $(".printsavebtn").button('reset');
                }
            });


        }));
    });

    function printData(id) {

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/vehicle/getBillDetails/' + id,
            type: 'POST',
            data: {
                id: id,
                print: 'yes'
            },
            success: function(result) {
                //alert(result);
                // $("#testdata").html(result);
                popup(result);
            }
        });
    }

    // function popup(data)
    // {
    //     var base_url = '<?php echo base_url() ?>';
    //     var frame1 = $('<iframe />');
    //     frame1[0].name = "frame1";
    //     frame1.css({"position": "absolute", "top": "-1000000px"});
    //     $("body").append(frame1);
    //     var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
    //     frameDoc.document.open();
    //     //Create a new HTML document.
    //     frameDoc.document.write('<html>');
    //     frameDoc.document.write('<head>');
    //     frameDoc.document.write('<title></title>');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
    //     frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
    //     frameDoc.document.write('</head>');
    //     frameDoc.document.write('<body >');
    //     frameDoc.document.write(data);
    //     frameDoc.document.write('</body>');
    //     frameDoc.document.write('</html>');
    //     frameDoc.document.close();
    //     setTimeout(function () {
    //         window.frames["frame1"].focus();
    //         window.frames["frame1"].print();
    //         frame1.remove();
    //         window.location.reload(true);
    //     }, 500);


    //     return true;
    // }
    function popup(data) {
        var base_url = '<?php echo base_url() ?>';
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({
            "position": "absolute",
            "top": "-1000000px"
        });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;

        frameDoc.document.open();
        // Create a new HTML document.
        frameDoc.document.write('<html>');
        frameDoc.document.write('<head>');
        frameDoc.document.write('<title></title>');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
        frameDoc.document.write('</head>');
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();

        var isPrintDialogClosed = false;

        function checkIfPrintDialogClosed() {
            // If the print dialog was closed, reload the page
            if (isPrintDialogClosed) {
                frame1.remove();
                window.location.reload(true); // Reload the page
            } else {
                setTimeout(checkIfPrintDialogClosed, 500); // Check again after 500ms
            }
        }

        setTimeout(function() {
            var printWindow = window.frames["frame1"];
            printWindow.focus();
            printWindow.print();

            // Start the check after some delay
            setTimeout(function() {
                isPrintDialogClosed = true;
                window.focus(); // Try to focus back to the original window
            }, 500);

            // Start checking if the print dialog is closed
            checkIfPrintDialogClosed();

        }, 500);

        return true;
    }




    $(document).ready(function(e) {
        $("#formcall").on('submit', (function(e) {
            $("#formcallbtn").button('loading');
            e.preventDefault();          
        
            $.ajax({
                url: '<?php echo base_url(); ?>admin/vehicle/addCallAmbulance',
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {
                    //alert(data.status);
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function(index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#formcallbtn").button('reset');
                },
                error: function() {
                    errorMsg("failed");
                    $("#formcallbtn").button('reset');
                }
            });
        }));
    });

    function get_PatientDetails(id) {

        $.ajax({
            url: '<?php echo base_url(); ?>admin/patient/patientDetails',
            type: "POST",
            data: {
                id: id
            },
            dataType: 'json',
            success: function(res) {
                //console.log(res);
                if (res) {
                    $('#patientid').val(res.id);
                    //$('#patientname').val(res.patient_name);

                }
            }
        });
    }

    function viewDetailBill(id) {
        $.ajax({
            url: '<?php echo base_url() ?>admin/vehicle/getBillDetails/' + id,
            type: "GET",
            data: {
                id: id
            },
            success: function(data) {
                $('#reportdata').html(data);
                $('#edit_deletebill').html("<?php if ($this->rbac->hasPrivilege('ambulance bill', 'can_view')) { ?><a href='#' data-toggle='tooltip' onclick='printData(" + id + ")'   data-original-title='<?php echo $this->lang->line('print'); ?>'><i class='fa fa-print'></i></a> <?php } ?><?php if ($this->rbac->hasPrivilege('ambulance bill', 'can_edit')) { ?><a href='#'' onclick='getRecord(" + id + ")' data-toggle='tooltip'  data-original-title='<?php echo $this->lang->line('edit'); ?>'><i class='fa fa-pencil'></i></a><?php } ?><?php if ($this->rbac->hasPrivilege('ambulance bill', 'can_edit')) { ?><a onclick='delete_bill(" + id + ")'  href='#'  data-toggle='tooltip'  data-original-title='<?php echo $this->lang->line('delete'); ?>'><i class='fa fa-trash'></i></a><?php } ?>");
                holdModal('viewModalBill');
            },
        });
    }

    function getRecord(id) {

        $.ajax({
            url: '<?php echo base_url(); ?>admin/vehicle/editCall',
            type: "POST",
            data: {
                id: id
            },
            dataType: 'json',
            success: function(data) {
                var patientDestroy = $('#addpatientid').select2();
                var vehicleDestroy = $('#vehicleno').select2();
                var chrgcategory = $('#echarge_category').select2();
                var chrgmood = $('#epayment_mode');
                var per = data.tax_amount * 100 / data.standard_charge;
                patientDestroy.val(data.patient_name).select2('').select2();
                vehicleDestroy.val(data.vehicle_no).select2('').select2();
                chrgcategory.val(data.charge_category).select2('').select2();
                chrgmood.val(data.payment_mode);
                $("#id").val(data.id);
                //$("#vehicle_no").val(data.id);
                //$("#vehicleno").val(data.vehicle_model);
                $("#driver_name").val(data.driver);
                $("#patienteditid").val(data.patient_name);
                $("#contact_no").val(data.contact_no);
                $("#edit_date").val(data.date);
                $("#address").val(data.address);

                $("#estandard_charge").val(data.standard_charge);
                $("#etotal").val(data.standard_charge);
                $("#etax_percentage").val(per);
                $("#etax").val(data.tax_amount);
                $("#enet_amount").val(data.amount);
                $("#epayment_amount").val(data.paid_amount);


                $("#viewModalBill").modal('hide');
                $('#editModal').modal('show');
                $('#addPayment').modal('hide');
            },
        });
    }

    function getVehicleDetail(id, vh = 'vehicle_model_search', dr = 'driver_search') {
        $("#" + dr).val("");
        $("#" + vh).val("");
        $.ajax({
            url: '<?php echo base_url(); ?>admin/vehicle/getVehicleDetail',
            type: "POST",
            data: {
                id: id
            },
            dataType: 'json',
            success: function(data) {
                //console.log(data)
                $("#" + dr).val(data.driver_name);
                $("#" + vh).val(data.vehicle_model);
            },
        });
    }



    function get_PatienteditDetails(id) {

        $.ajax({
            url: '<?php echo base_url(); ?>admin/patient/patientDetails',
            type: "POST",
            data: {
                id: id
            },
            dataType: 'json',
            success: function(res) {
                //console.log(res);

                if (res) {
                    $('#patienteditid').val(res.id);
                    //console.log(res.id);

                }
            }
        });
    }

    $(document).ready(function(e) {
        $("#formedit").on('submit', (function(e) {
            $("#formeditbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: '<?php echo base_url(); ?>admin/vehicle/updatecallambulance',
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function(index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#formeditbtn").button('reset');
                },
                error: function() {
                    errorMsg("Failed");
                    $("#formeditbtn").button('reset');
                }
            });
        }));
    });

    // $(document).ready(function (e) {
    //     var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'DD', 'm' => 'MM', 'Y' => 'YYYY',]) ?>';
    //     $('#report_dayssport_date,#report_date').datetimepicker();
    // });

    function holdModal(modalId) {

        $('#' + modalId).modal({
            backdrop: 'static',
            keyboard: false,
            show: true
        });
    }
    // action="<?php //echo site_url('admin/vehicle/edit/' . $id)     
                ?>"

    $(document).ready(function() {
        var datetime_format = 'DD-MM-YYYY h:mm A';
        $('.datetime').datetimepicker({
            format: datetime_format,
            maxDate: moment().endOf('day').toDate(), // Restricts future dates
            useCurrent: false // Prevents setting default value to the current date/time
        });
    });

    function addTotal(value) {

        var total = parseFloat(value);
        total = isNaN(total) ? 0 : total;
        $("#total").val(total.toFixed(2));

        var tax_percent = parseFloat($("#tax_percentage").val());
        tax_percent = isNaN(tax_percent) ? 0 : tax_percent;

        var tax = (total * tax_percent) / 100;
        $("#tax").val(tax.toFixed(2));

        var net_amount = total + tax;
        $("#net_amount").val(net_amount.toFixed(2));

        //edit

        $("#etotal").val(total.toFixed(2));

        var tax_percent = parseFloat($("#etax_percentage").val());
        tax_percent = isNaN(tax_percent) ? 0 : tax_percent;

        var tax = (total * tax_percent) / 100;
        $("#etax").val(tax.toFixed(2));

        var net_amount = total + tax;
        $("#enet_amount").val(net_amount.toFixed(2));

    }

    function calculateAmounts() {
        var total = parseFloat($('#standard_charge').val());
        total = isNaN(total) ? 0 : total;
        $("#total").val(total.toFixed(2));

        var tax_percent = parseFloat($("#tax_percentage").val());
        tax_percent = isNaN(tax_percent) ? 0 : tax_percent;

        var tax = (total * tax_percent) / 100;
        $("#tax").val(tax.toFixed(2));

        var net_amount = total + tax;
        $("#net_amount").val(net_amount.toFixed(2));

        //edit
        var total = parseFloat($('#estandard_charge').val());
        total = isNaN(total) ? 0 : total;
        $("#etotal").val(total.toFixed(2));

        var tax_percent = parseFloat($("#etax_percentage").val());
        tax_percent = isNaN(tax_percent) ? 0 : tax_percent;

        var tax = (total * tax_percent) / 100;
        $("#etax").val(tax.toFixed(2));

        var net_amount = total + tax;
        $("#enet_amount").val(net_amount.toFixed(2));

    }

    $("#standard_charge").keyup(function() {

        calculateAmounts();
    });

    $("#tax_percentage").keyup(function() {

        calculateAmounts();
    });
    //edit
    $("#estandard_charge").keyup(function() {

        calculateAmounts();
    });

    $("#etax_percentage").keyup(function() {

        calculateAmounts();
    });

    function getPayRecord(id) {



                $.ajax({
                    url: '<?php echo base_url(); ?>admin/vehicle/addPaymentACall',
                    type: "POST",
                    data: {id: id},
                    dataType: 'json',
                    success: function (data) {
                        
                        var per=data.tax_amount*100/data.standard_charge;
                        var tax='('+per+'.00)'+data.tax_amount;
                        $("#aid").val(data.id);
                        $("#apatienteditid").val(data.patient_name);
                        $("#apaid_amount").val(data.paidamo);
                        $("#apatient").html(data.patient);
                        $("#avn").html(data.vehicle_no);
                        $("#avm").html(data.vehicle_model);
                        
                        $("#adn").html(data.driver);
                        $("#adc").html(data.driver_contact);
                        $("#adt").html(data.date);
                        $("#aadrs").html(data.address);
                        $("#enet_amount").val(data.amount);
                        $("#epayment_amount").val(data.paidamo);


                        $(".amo").html(data.standard_charge);
                        $(".atax").html(tax);
                        $(".ana").html(data.amount);
                        var amount = parseFloat(data.amount);
                        var paidAmount = parseFloat(data.paidamo);

                        // Validate numbers
                        amount = isNaN(amount) ? 0 : amount;
                        paidAmount = isNaN(paidAmount) ? 0 : paidAmount;

                        // Calculate balance
                        var balance = amount - paidAmount;

                        // Format and update HTML content
                        $(".apa").html(paidAmount.toFixed(2));
                        $(".aba").html(balance.toFixed(2));
                        $("#apayment_amount").val(balance.toFixed(2));
                         $("#netAmount").val(balance.toFixed(2));
                        

                        $("#viewModalBill").modal('hide');
                        $('#editModal').modal('hide');
                        $('#addPayment').modal('show');
                        $('#trans_details').html(data.table);
                    },
                });
            }
    function get_ambulancecharges(id) {

        $.ajax({
            url: '<?php echo base_url(); ?>admin/charges/getAmbulanceCharges',
            type: "POST",
            data: {
                id: id.toString()
            },
            dataType: 'json',
            success: function(res) {

                if (res) {
                    $('#standard_charge').val(res.standard_charge);
                    $('#estandard_charge').val(res.standard_charge);
                    //console.log(res.id);
                    addTotal(res.standard_charge)
                }

            }
        });
    }


            $(document).ready(function (e) {
                $("#addformedit").on('submit', (function (e) {
                    $("#addformeditbtn").button('loading');
                    e.preventDefault();
                    $.ajax({
                        url: '<?php echo base_url(); ?>admin/vehicle/paymentupdatecallambulance',
                        type: "POST",
                        data: new FormData(this),
                        dataType: 'json',
                        contentType: false,
                        cache: false,
                        processData: false,
                        success: function (data) {
                            if (data.status == "fail") {
                                var message = "";
                                $.each(data.error, function (index, value) {
                                    message += value;
                                });
                                errorMsg(message);
                            } else {
                                successMsg(data.message);
                                setTimeout(function() {
    window.location.reload(true);
}, 2000); // 2000 milliseconds = 2 seconds

                            }
                            $("#addformeditbtn").button('reset');
                        },
                        error: function () {
                            //  alert("Fail")
                        }
                    });
                }));
            });


function delete_transId(id,main_id) {
    if (confirm('Are you sure you want to delete?')) {
        $.ajax({
            url: '<?php echo base_url(); ?>admin/vehicle/delete_trans/' + id,
            type: 'POST', // Ensuring the correct HTTP method is used (POST for deletion)
            dataType: 'json',
            success: function (res) {
              //  alert(res.status);
                if (res.status == 1) {
                    successMsg(res.msg); // Display success message
                  
                    getPayRecord(main_id);
                } else {
                    errorMsg(res.msg); // Display error message if deletion fails
                }
            },
            error: function (xhr) { // In case of AJAX failure
                alert('Something went wrong during the request.');
            }
        });
    }
}

//printTransaction
   function printTransaction(id) {

                var base_url = '<?php echo base_url() ?>';
                $.ajax({
                    url: base_url + 'admin/vehicle/getTransBillDetails/' + id,
                    type: 'POST',
                    data: {id: id, print: 'yes'},
                    success: function (result) {
                        // $("#testdata").html(result);
                        popup2(result);
                    }
                });
            }

            function popup2(data)
            {
                var base_url = '<?php echo base_url() ?>';
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({"position": "absolute", "top": "-1000000px"});
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html>');
                frameDoc.document.write('<head>');
                frameDoc.document.write('<title></title>');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
                frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
                frameDoc.document.write('</head>');
                frameDoc.document.write('<body >');
                frameDoc.document.write(data);
                frameDoc.document.write('</body>');
                frameDoc.document.write('</html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                    window.location.reload(true);
                }, 500);


                return true;
            }

</script>
<?php $this->load->view('admin/patient/patientaddmodal') ?>