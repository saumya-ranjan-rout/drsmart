<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
$genderList = $this->customlib->getGender();

?>
<style type="text/css">
#easySelectable {/*display: flex; flex-wrap: wrap;*/}
#easySelectable li {}
#easySelectable li.es-selected {background: #2196F3; color: #fff;}
.easySelectable {-webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 5px 0;}
    </style>
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="row">
    <div class="col-md-12">
    <div class="box box-primary">
    <div class="box-header with-border">
    <h3 class="box-title titlefix"><?php echo $this->lang->line('appointment') . " " . $this->lang->line('details'); ?></h3>
    <div class="box-tools pull-right">
    <?php if ($this->rbac->hasPrivilege('appointment', 'can_add')) { ?>
        <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm"> <i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('appointment'); ?></a>
        <?php } ?> 
        <?php if ($this->rbac->hasPrivilege('visitor_book', 'can_add')) { ?>
            <a  href="<?php echo base_url(); ?>admin/visitors" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('visitor_book'); ?></a>
            <?php } ?> 
<?php if ($this->rbac->hasPrivilege('doctor_wise', 'can_add')) { ?>
                                <a  href="<?php echo base_url(); ?>admin/appointment/doctorwise" class="btn btn-primary btn-sm"> <i class="fa fa-reorder"></i> <?php echo'Doctor Wise'; ?></a>
                            <?php } ?>  
            <?php if ($this->rbac->hasPrivilege('phone_call_log', 'can_add')) { ?>
                <a  href="<?php echo base_url(); ?>admin/generalcall" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('phone_call_log'); ?></a> 
                <?php } if (($this->rbac->hasPrivilege('postal_dispatch', 'can_add')) || ($this->rbac->hasPrivilege('postal_receive', 'can_add'))) { ?>
                    <button type="button" class="btn btn-primary btn-sm dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                    <i class="fa fa-reorder"></i> <?php echo $this->lang->line('postal'); ?> <span class="caret"></span>
                    </button>
                    
                    <ul class="dropdown-menu multi-level pull-right width300" role="menu" aria-labelledby="dropdownMenu1" id="easySelectable">
                    <?php if ($this->rbac->hasPrivilege('postal_receive', 'can_add')) { ?>
                        <li><a href="<?php echo base_url(); ?>admin/receive"><?php echo $this->lang->line('receive'); ?></a></li> 
                        <?php } if ($this->rbac->hasPrivilege('postal_dispatch', 'can_add')) { ?>
                            <li><a href="<?php echo base_url(); ?>admin/dispatch"><?php echo $this->lang->line('dispatch'); ?></a></li> 
                            <?php } ?>   
                            </ul>
                            
                            <?php } if ($this->rbac->hasPrivilege('complain', 'can_add')) { ?>
                                <a  href="<?php echo base_url(); ?>admin/complaint" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('complain'); ?></a> 
                                <?php } ?>
                                </div>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                <div class="download_label"><?php echo $this->lang->line('appointed_patient_list'); ?></div>
                                <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                <th><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></th>
                                <th><?php echo $this->lang->line('appointment') . " " . $this->lang->line('no'); ?></th>
                                
                                <th><?php echo $this->lang->line('date'); ?></th>
                                <th><?php echo $this->lang->line('phone'); ?></th>
                                <th><?php echo $this->lang->line('gender'); ?></th>
                                <th><?php echo $this->lang->line('doctor'); ?></th>
                                <th><?php echo $this->lang->line('doctor')." "."Fee"; ?></th>
                                <th><?php echo $this->lang->line('source'); ?></th>
                                <th><?php echo $this->lang->line('appointment')." "."Priority"; ?></th>
                                <th><?php echo $this->lang->line('status'); ?></th>
                                <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                if (empty($resultlist)) {
                                    ?>
                                    <?php
                                } else {
                                    $count = 1;
                                    $label = " ";
                                    foreach ($resultlist as $appointment) {
                                        if ($appointment["appointment_status"] == "approved") {
                                            $label = "class='label label-success'";
                                        } else if ($appointment["appointment_status"] == "pending") {
                                            $label = "class='label label-warning'";
                                        } else if ($appointment["appointment_status"] == "cancel") {
                                            $label = "class='label label-danger'";
                                        }
                                        
                                        $given_datetime = $appointment['date'];
                                        $given_date = DateTime::createFromFormat('Y-m-d H:i:s', $given_datetime)->format('Y-m-d');
                                        $current_date = date('Y-m-d');
                                        
                                        ?>
                                        <tr class="" <?php if ($given_date == $current_date) { ?> style="background-color: #E4E4C9;" <?php } ?>>
                                        
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>>
                                        <a href="#" 
                                        onclick="viewDetail('<?php echo $appointment['id'] ?>')"
                                        
                                        data-target="#viewModal"  >
                                        <?php echo $appointment['patient_name']; ?>
                                        </a> 
                                        
                                        </td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php
                                        if ($appointment['appointment_status'] == 'approved') {
                                            echo $appointment['appointment_no'];
                                        } else {
                                            echo $this->lang->line($appointment['appointment_status']);
                                            
                                        }
                                        ?></td>
                                        
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($appointment['date'])) ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo $appointment['mobileno']; ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo $appointment['gender']; ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo $appointment['name'] . " " . $appointment['surname']; ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo number_format($appointment['doctor_fee'], 2); ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo $appointment['source']; ?></td>
                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>><?php echo $appointment['appointment_priority']; ?></td>
                                        <td><small <?php echo $label ?> ><?php echo $this->lang->line($appointment['appointment_status']); ?></small></td>
                                        <td class="text-right">
                                        <?php
                                        if ($appointment['appointment_status'] == 'pending') {
                                            if ($this->rbac->hasPrivilege('appointment_approve', 'can_view')) {
                                                ?>
                                                <a href="<?php echo base_url(); ?>admin/appointment/status/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="" onclick="return confirm('<?php echo $this->lang->line('approve') . " " . $this->lang->line('appointment'); ?>');" data-original-title="<?php echo $this->lang->line('approve') . " " . $this->lang->line('appointment'); ?>">
                                                
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                                <?php
                                            }
                                        }
                                        ?>
                                        
                                        <?php
                                        if ($appointment['appointment_status'] == 'approved' and $appointment['is_opd'] != 'yes') {
                                            if ($this->rbac->hasPrivilege('appointment_approve', 'can_view')) {
                                                if ($this->rbac->hasPrivilege('move_patient_in_opd', 'can_view')) {
                                                    ?>
                                                    <a href="<?php echo base_url(); ?>admin/appointment/moveopd/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="" onclick="return confirm('<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('opd'); ?>');" data-original-title="<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('opd'); ?>">
                                                    
                                                    <i class="fas fa-share-square" aria-hidden="true"></i>
                                                    <?php
                                                }
                                            }
                                        }
                                        ?>
                                        <?php
                                        if ($appointment['appointment_status'] == 'approved' and $appointment['is_ipd'] != 'yes') {
                                            if ($this->rbac->hasPrivilege('appointment_approve', 'can_view')) {
                                                if ($this->rbac->hasPrivilege('move_patient_in_ipd', 'can_view')) {
                                                    ?>
                                                    <a href="<?php echo base_url(); ?>admin/appointment/moveipd/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="" onclick="return confirm('<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('ipd'); ?>');" data-original-title="<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('ipd'); ?>">
                                                    
                                                    <i class="fas fa-share-square" aria-hidden="true"></i>
                                                    <?php
                                                }
                                            }
                                        }
                                        ?>
                                        <a href="#"
                                                    onclick="printData(<?php echo $appointment['id'] ?>)"
                                                    class="btn btn-default btn-xs" data-toggle="tooltip"
                                                    title="<?php echo $this->lang->line('print'); ?>">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                        <a href="#" 
                                        onclick="viewDetail('<?php echo $appointment['id'] ?>')"
                                        class="btn btn-default btn-xs"  data-toggle="tooltip"
                                        data-target="#viewModal" title="<?php echo $this->lang->line('show'); ?>" >
                                        <i class="fa fa-reorder"></i>
                                        </a>
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
                                <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content modal-media-content">
                                <div class="modal-header modal-media-header">
                                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                                
                                <div class="row">
                                <div class="col-sm-6 col-xs-6">
                                <div class="form-group15">
                                <div>
                                    <!--  -->
                                <select  onchange="get_PatientDetails(this.value)" style="width:100%" class="form-control select2"  name='' id="add_patient_report_id" >
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
                                    
                                    </div><!-- ./row -->  
                                    </div>
                                    <form id="formadd" accept-charset="utf-8"  method="post" class="ptt10">
                                    <div class="modal-body pt0 pb0">
                                    <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                    
                                    <input type="hidden" name="patient_id" id="patientid" class="form-control">
                                    <div class="row">
                                    <div class="col-sm-4">
                                    <div class="form-group">
                                    <label><?php echo $this->lang->line('appointment')." ".$this->lang->line('date'); ?></label>
                                    <small class="req"> *</small> 
                                    <input type="text" id="date" name="date" class="form-control datetime">
                                    <span class="text-danger"><?php echo form_error('date'); ?></span>
                                    </div>
                                    </div> 
                                    
                                    
                                    <div class="col-sm-4">
                                    <div class="form-group">
                                    <label><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></label>
                                    <small class="req">*</small> 
                                    <input type="text" name="patient_name" id="patient_name" class="form-control">
                                    <span class="text-danger"><?php echo form_error('patient_name'); ?></span>
                                    </div>
                                    </div>
                                    <div class="col-md-4">
                                    <div class="form-group">
                                    <label> <?php echo $this->lang->line('gender'); ?></label>
                                    <select class="form-control" id="gender" name="gender">
                                    <option value="<?php echo set_value('gender'); ?>"><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                    foreach ($genderList as $key => $value) {
                                        ?>
                                        <option value="<?php echo $key; ?>" <?php if (set_value('gender') == $key) echo "selected"; ?>><?php echo $value; ?></option>
                                        <?php
                                    }
                                    ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('gender'); ?></span>
                                    </div>
                                    </div>
                                    <div class="col-sm-4">
                                    <div class="form-group">
                                    <label><?php echo $this->lang->line('email'); ?></label>
                                    <input type="email" name="email" id="email"  class="form-control">
                                    </div>
                                    </div>
                                    <!--<div class="col-sm-4">
                                    <div class="form-group">
                                    <label><?php echo $this->lang->line('phone'); ?></label>
                                    <small class="req">*</small> 
                                    <input type="text" name="mobileno" id="phone" class="form-control">
                                    <span class="text-danger"><?php echo form_error('mobileno'); ?></span>
                                    </div>
                                    </div>-->
                                    
                                    <div class="col-md-4">
                                    <div class="form-group">
                                    <label> <?php echo $this->lang->line('appointment') . " " . 'Priority'; ?></label>
                                    <select class="form-control" id="appointment_priority" name="appointment_priority">
                                    <option value="<?php echo set_value('appointment_priority'); ?>"><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                    foreach ($appointmentPriorityList as $key => $value) {
                                        ?>
                                        <option value="<?php echo $value["id"]; ?>" <?php if (set_value('appointment_priority') == $key) echo "selected"; ?>><?php echo $value["appointpriority"]; ?></option>
                                        <?php
                                    }
                                    ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('appointment_priority'); ?></span>
                                    </div>
                                    </div>
                                    <div class="col-sm-4">
                                    
                                    <div class="form-group">
                                    <label><?php echo $this->lang->line('phone'); ?></label>  <small class="req">*</small> 
                                    <div class="input-group" style="display:flex;">
                                    <div class="input-group-prepend">
                                    <select id="countryCode" name="countryCode" class="form-control" style="padding: 0px;width: 58px;">
                                    <option value="+965">+965</option>
                                    <option value="+962">+962</option>
                                    </select>
                                    </div>
                                    <input id="mobileno" autocomplete="off" name="mobileno"  type="text" placeholder="" class="form-control"  value="<?php echo set_value('mobileno'); ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                    />
                                    </div>
                                    </div>
                                    </div> 
                                    <div class="col-sm-4">
                                    <div class="form-group">
                                    <label for="exampleInputFile"><?php echo $this->lang->line('doctor'); ?></label>
                                    <small class="req"> *</small> 
                                    <div>
                                    <select class="form-control select2" <?php
                                    if ((isset($disable_option)) && ($disable_option == true)) {
                                        echo 'disabled';
                                    }
                                    ?> name='doctor' style="width:100%" onchange="getDoctorFee(this.value)">
                                    <option value="<?php echo set_value('doctor'); ?>"><?php echo $this->lang->line('select') ?></option>
                                    <?php foreach ($doctors as $dkey => $dvalue) {
                                        ?>
                                        <option value="<?php echo $dvalue["id"]; ?>" <?php
                                        if ($doctor_select == $dvalue['id']) {
                                            echo 'selected';
                                        }
                                        ?>><?php echo $dvalue["name"] . " " . $dvalue["surname"] ?></option>   
                                        <?php } ?>
                                        </select>
                                        </div>
                                        <?php if ((isset($disable_option)) && ($disable_option == true)) { ?>
                                            <input type="hidden" name="doctor" value="<?php echo $doctor_select; ?>">
                                            <?php } ?>
                                            <span class="text-danger"><?php echo form_error('doctor'); ?></span>
                                            </div>
                                            </div> 
                                            <div class="col-sm-4">
                                            <div class="form-group">
                                            <label for="doctor_fee"><?php echo $this->lang->line('doctor')." ".'Fee'; ?></label> 
                                            <!--   <small class="req">*</small> -->
                                            <input type="text" name="doctor_fee" id="doctor_fee" class="form-control" readonly>
                                            <!--  <span class="text-danger"><?php echo form_error('doctor_fee'); ?>
                                            </span>-->
                                            </div> 
                                            </div>

                                            <div class="col-sm-4">
                                            <div class="form-group">
                                            <label for="appointment_status"><?php echo $this->lang->line('status'); ?></label>
                                            
                                            <select name="appointment_status" class="form-control">
                                            <?php foreach ($appointment_status as $appointment_status_key => $appointment_status_value) {
                                                ?>
                                                <option value="<?php echo $appointment_status_key ?>"><?php echo $appointment_status_value ?></option>
                                                <?php } ?>
                                                </select>
                                                </div>
                                                <span class="text-danger"><?php echo form_error('appointment_status'); ?></span>
                                                </div> 
                                            <div class="col-sm-8">
                                            <div class="form-group">
                                            <label for="message"><?php echo $this->lang->line('message'); ?></label> 
                                            <!--   <small class="req">*</small> -->
                                            <textarea name="message" id="note" class="form-control" ></textarea>
                                            <!--  <span class="text-danger"><?php echo form_error('message'); ?>
                                            </span>-->
                                            </div> 
                                            </div>
                                    
                                                </div><!--./row-->   
                                                </div><!--./col-md-12-->       
                                                </div><!--./row--> 
                                                </div><!--./modal-body-->
                                                <div class="box-footer">
                                                <div class="pull-right">  
                                                <button type="submit" id="formaddbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info"><?php echo $this->lang->line('save'); ?></button>
                                                </div>  
                                                </div>
                                                </form> 
                                                </div>
                                                </div>    
                                                </div>
                                                <!-- dd -->
                                                <div class="modal fade" id="myModaledit"  role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog modal-lg" role="document">
                                                <div class="modal-content modal-media-content">
                                                <div class="modal-header modal-media-header">
                                                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                                                <div class="row">
                                                <div class="col-sm-6 col-xs-8">
                                                <div class="form-group15">                                     
                                                <div>
                                                    <!-- onchange="get_ePatientDetails(this.value)" -->
                                                <select  class="form-control select2" <?php
                                                if ($disable_option == true) {
                                                    echo "disabled";
                                                }
                                                ?> style="width:100%" id="eaddpatient_id" name='' >
                                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                <?php foreach ($patients as $dkey => $dvalue) { ?>
                                                    <option value="<?php echo $dvalue["id"]; ?>" <?php
                                                    if ((isset($patient_select)) && ($patient_select == $dvalue["id"])) {
                                                        echo "selected";
                                                    }
                                                    ?>><?php echo $dvalue["patient_name"] . " (" . $dvalue["patient_unique_id"] . ")" ?>
                                                    </option>   
                                                    <?php } ?>
                                                    </select>
                                                    </div>
                                                    <span class="text-danger"><?php echo form_error('refference'); ?></span>
                                                    </div>
                                                    </div><!--./col-sm-6 col-xs-8 -->
                                                    
                                                    </div><!--./row-->
                                                    </div>
                                                    <form id="formedit" accept-charset="utf-8"  method="post" class="ptt10">
                                                    <div class="modal-body pt0 pb0">
                                                    <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                    <input type="hidden" name="id" id="id" value="<?php echo set_value('id'); ?>">
                                                    <div class="col-sm-4">
                                                    <div class="form-group">
                                                    <label><?php echo $this->lang->line('appointment') . " " . $this->lang->line('date') ?></label>
                                                    <small class="req"> *</small> 
                                                    <input type="text" id="dates" name="date" class="form-control datetime" value="<?php echo set_value('dates'); ?>">
                                                    <span class="text-danger"><?php echo form_error('date'); ?></span>
                                                    </div>
                                                    </div>
                                                    
                                                    <input type="hidden" name="patient_id" id="edit_patient_id" class="form-control" value="<?php echo set_value('patient_id'); ?>">
                                                    <div class="col-sm-4">
                                                    <div class="form-group">
                                                    <label><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></label>
                                                    <small class="req"> *</small> 
                                                    <input type="text" name="patient_name" id="edit_patient_name" class="form-control" value="<?php echo set_value('patient_name'); ?>" readonly>
                                                    <span class="text-danger"><?php echo form_error('patient_name'); ?></span>
                                                    </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <div class="form-group">
                                                    <label> <?php echo $this->lang->line('gender'); ?></label>
                                                    <select class="form-control" id="edit_gender" name="gender" readonly>
                                                    <option value="<?php echo set_value('gender'); ?>"><?php echo $this->lang->line('select'); ?></option>
                                                    <?php
                                                    foreach ($genderList as $key => $value) {
                                                        ?>
                                                        <option value="<?php echo $key; ?>" <?php if (set_value('gender') == $key) echo "selected"; ?>><?php echo $value; ?></option>
                                                        <?php
                                                    }
                                                    ?>
                                                    </select>
                                                    </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                    <div class="form-group">
                                                    <label><?php echo $this->lang->line('email'); ?></label>
                                                    <input type="text" name="email" id="edit_email" class="form-control" value="<?php echo set_value('email'); ?>" readonly>
                                                    </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <div class="form-group">
                                                    <label> <?php echo $this->lang->line('appointment') . " " . 'Priority'; ?></label>
                                                    <select class="form-control" id="edit_appointment_priority" name="edit_appointment_priority">
                                                    <option value="<?php echo set_value('edit_appointment_priority'); ?>"><?php echo $this->lang->line('select'); ?></option>
                                                    <?php
                                                    foreach ($appointmentPriorityList as $key => $value) {
                                                        ?>
                                                                                                               <option value="<?php echo $value["id"]; ?>" <?php if (set_value('edit_appointment_priority') == $value["id"]) echo "selected"; ?>><?php echo $value["appointpriority"]; ?></option>

                                                        <?php
                                                    }
                                                    ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo form_error('edit_appointment_priority'); ?></span>
                                                    </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                    <div class="form-group">
                                                    <label><?php echo $this->lang->line('phone'); ?></label>
                                                    <small class="req">*</small> 
                                                    <!--<input type="text" name="mobileno" id="edit_phone" class="form-control" value="<?php echo set_value('mobileno'); ?>">-->
                                                    <div class="input-group" style="display:flex;" >
                                                    <div class="input-group-prepend">
                                                    <select id="countryCode2" name="countryCode" class="form-control" style="padding: 0px;width: 58px;" readonly>
                                                    <option value="+965">+965</option>
                                                    <option value="+962">+962</option>
                                                    </select>
                                                    </div>
                                                    <input id="edit_phone" autocomplete="off" name="mobileno"  type="text" placeholder="" class="form-control"  value="<?php echo set_value('mobileno'); ?>" readonly>
                                                    </div>
                                                    <span class="text-danger"><?php echo form_error('mobileno'); ?></span>
                                                    </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                    <div class="form-group">
                                                    <label for="exampleInputFile">
                                                    <?php echo $this->lang->line('doctor'); ?></label>
                                                    <small class="req"> *</small> 
                                                    <div>
                                                    <select class="form-control select2" name='doctor' style="width:100%" id="doctor" onchange="getDoctorFee(this.value)">
                                                    <option value="<?php echo set_value('doctor'); ?>"><?php echo $this->lang->line('select') ?></option>
                                                    <?php foreach ($doctors as $dkey => $dvalue) {
                                                        ?>
                                                        <option value="<?php echo $dvalue["id"]; ?>"><?php echo $dvalue["name"] . " " . $dvalue["surname"] ?></option>   
                                                        <?php } ?>
                                                        </select>
                                                        </div>
                                                        </div>
                                                        </div> 
                                                        <div class="col-sm-3">
                                            <div class="form-group">
                                            <label for="doctor_fee"><?php echo $this->lang->line('doctor')." ".'Fee'; ?></label> 
                                            <!--   <small class="req">*</small> -->
                                            <input type="text" name="doctor_fee" id="edoctor_fee" class="form-control" readonly>
                                            <!--  <span class="text-danger"><?php echo form_error('doctor_fee'); ?>
                                            </span>-->
                                            </div> 
                                            </div>
                                            <div class="col-sm-4" style="display:none;">
                                                        <div class="form-group" >
                                                        <label for="appointment_status"><?php echo $this->lang->line('status'); ?></label> 
                                                        <select name="appointment_status" class="form-control" id="appointment_status">
                                                        <?php foreach ($appointment_status as $appointment_status_key => $appointment_status_value) {
                                                            ?>
                                                            <option value="<?php echo $appointment_status_key ?>"><?php echo $appointment_status_value ?></option>
                                                            <?php } ?>
                                                            </select>
                                                            </div>
                                                            </div> 
                                                        <div class="col-sm-6">
                                                        <div class="form-group">
                                                        <label for="message"><?php echo $this->lang->line('message'); ?></label> 
                                                        <!--<small class="req"> *</small> -->
                                                        <textarea name="message" id="message" class="form-control" ><?php echo set_value('message'); ?></textarea>
                                                        <!--<span class="text-danger"><?php echo form_error('message'); ?></span>-->
                                                        </div> 
                                                        </div>
                                         
                                                            </div><!--./row-->   
                                                            
                                                            </div><!--./col-md-12-->       
                                                            
                                                            </div><!--./row--> 
                                                            
                                                            </div><!--./modal-body-->
                                                            <div class="box-footer">
                                                            <div class="pull-right">
                                                            <button type="submit" id="formeditbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info" ><?php echo $this->lang->line('save'); ?></button>
                                                            
                                                            </div>
                                                            </div>
                                                            </form> 
                                                            </div>
                                                            </div>    
                                                            </div>
                                                            <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                            <div class="modal-dialog modal-lg" role="document">
                                                            <div class="modal-content modal-media-content">
                                                            <div class="modal-header modal-media-header">
                                                            <button type="button" class="close" data-toggle="tooltip" data-original-title="Close" data-dismiss="modal">&times;</button>
                                                            <div class="modalicon"> 
                                                            <div id="edit_delete"><a href="#" data-target="#editModal" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a><a href="#" data-toggle="tooltip" onclick="delete_recordById('<?php echo base_url(); ?>admin/appointment/delete/#', '<?php echo $this->lang->line('success_message') ?>')" data-original-title="Delete"><i class="fa fa-trash" ></i></a></div>
                                                            </div>
                                                            <h4 class="box-title"><?php echo $this->lang->line('appointment') . " " . $this->lang->line('information'); ?></h4> 
                                                            </div>
                                                            <div class="modal-body pt0 pb0">
                                                            <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <form id="view" accept-charset="utf-8" method="get" class="pt5 pb5">
                                                            <div class="table-responsive">
                                                            <table class="table mb0 table-striped table-bordered examples">
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></th>
                                                            <td width="35%"><span id='patient_names'></span></td>
                                                            <th width="15%"><?php echo $this->lang->line('appointment') . " " . $this->lang->line('no'); ?></th>
                                                            <td width="35%"><span id="appointmentno"></span>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('age'); ?></th>
                                                            <td width="35%"><span id='age'></span></td>
                                                            <th width="15%"><?php echo $this->lang->line('appointment') . " S." . $this->lang->line('no'); ?></th>
                                                            <td width="35%"><span id="appointmentsno"></span>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('email'); ?></th>
                                                            <td width="35%"><span id='emails'></span></td>
                                                            <th width="15%"><?php echo $this->lang->line('appointment') . " " .$this->lang->line('date'); ?></th>
                                                            <td width="35%"><span id='dating'></span></td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('phone'); ?></th>
                                                            <td width="35%"><span id="phones"></span>
                                                            </td>
                                                            <th width="15%"><?php echo $this->lang->line('appointment'). " Priority"; ?></th>
                                                            <td width="35%"><span id='appointpriority'></span></td>
                                                           
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('gender'); ?></th>
                                                            <td width="35%"><span id="genders"></span>
                                                            <th width="15%"><?php echo $this->lang->line('source'); ?></th>
                                                            <td width="35%"><span id="source"></span>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('doctor'); ?></th>
                                                            <td width="35%"><span id='doctors'></span></td>
                                                            <th width="15%"><?php echo $this->lang->line('status'); ?></th>
                                                            <td width="35%"><span id='status' style="text-transform: capitalize;"></span></td>
                                                            
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('department'); ?></th>
                                                            <td width="35%"><span id="departmentt"></span>
                                                            <th width="15%"><?php echo $this->lang->line('amount'); ?></th>
                                                            <td width="35%"><span id="amount"></span>
                                                            
                                                            
                                                            </tr>
                                                          
                                                            <tr>
                                                            <th width="15%"><?php echo $this->lang->line('collected_by'); ?></th>
                                                            <td width="35%"><span id="collected_by"></span>

                                                            <th width="15%"><?php echo $this->lang->line('message'); ?></th>
                                                            <td width="35%"><span id="messages"></span>
                                                            
                                                            
                                                            
                                                            </tr>
                                                            <tr><th width="15%"><?php echo $this->lang->line('address'); ?></th>
                                                            <td width="35%"><span id="address"></span></tr>
                                                            </table>
                                                            </div>
                                                            </form>           
                                                            </div><!--./col-md-12-->       
                                                            </div><!--./row--> 
                                                            </div>
                                                            <!--<div class="box-footer">
                                                            <div class="pull-right paddA10">
                                                            <a  onclick="saveEnquiry()" class="btn btn-info pull-right"><?php //echo $this->lang->line('save');     ?></a> 
                                                            </div>-->
                                                            </div>
                                                            
                                                            </div>
                                                            </div>    
                                                            </div>
                                                            <script type="text/javascript">
                                                            $(function () {
                                                                $('#easySelectable').easySelectable();
                                                                
                                                            })



  function getDoctorFee(doctor_id) {
    var base_url = '<?php echo base_url() ?>';
    
    if (!doctor_id) { // Check if doctor_id is empty or null
        $("#doctor_fee").val(0);
        $("#edoctor_fee").val(0);
        return; // Stop further execution if doctor_id is empty
    }

    $.ajax({
        url: base_url + 'admin/appointment/getDoctorFee/' + doctor_id,
        type: 'POST',
        dataType: 'json',
        success: function(result) {
            // alert(doctor_id); // Alert doctor_id for debugging purposes
            // alert(result);    // Alert result to check the response
            
            // Set the doctor fees in the respective fields
            $("#doctor_fee").val(result);
            $("#edoctor_fee").val(result);
        }
    });
}


function printData(insert_id) {
        // alert(insert_id);

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/appointment/getBillDetails/' + insert_id,
            type: 'POST',
            data: {
                id: insert_id,
                print: 'yes'
            },
            success: function(result) {
                // $("#testdata").html(result);
                popup(result);
            }
        });
    }

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
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
            window.location.reload(true);
        }, 500);


        return true;
    }

                                                            </script>
                                                            
                                                            
                                                            <script type="text/javascript">
                                                            
                                                            $(function () {
                                                                
                                                                $('.select2').select2()
                                                            });
                                                            
                                                            function holdModal(modalId) {
                                                                $('#' + modalId).modal({
                                                                    backdrop: 'static',
                                                                    keyboard: false,
                                                                    show: true
                                                                });
                                                            }
                                                            
                                                            (function ($) {
                                                                
                                                                //selectable html elements
                                                                $.fn.easySelectable = function (options) {
                                                                    var el = $(this);
                                                                    var options = $.extend({
                                                                        'item': 'li',
                                                                        'state': true,
                                                                        onSelecting: function (el) {
                                                                            
                                                                        },
                                                                        onSelected: function (el) {
                                                                            
                                                                        },
                                                                        onUnSelected: function (el) {
                                                                            
                                                                        }
                                                                    }, options);
                                                                    el.on('dragstart', function (event) {
                                                                        event.preventDefault();
                                                                    });
                                                                    el.off('mouseover');
                                                                    el.addClass('easySelectable');
                                                                    if (options.state) {
                                                                        el.find(options.item).addClass('es-selectable');
                                                                        el.on('mousedown', options.item, function (e) {
                                                                            $(this).trigger('start_select');
                                                                            var offset = $(this).offset();
                                                                            var hasClass = $(this).hasClass('es-selected');
                                                                            var prev_el = false;
                                                                            el.on('mouseover', options.item, function (e) {
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
                                                                        $(document).on('mouseup', function () {
                                                                            el.off('mouseover');
                                                                        });
                                                                    } else {
                                                                        el.off('mousedown');
                                                                    }
                                                                };
                                                            })(jQuery);
                                                            </script>
                                                            
                                                            <script type="text/javascript">
                                                            $(document).ready(function (e) {
                                                                $("#formadd").on('submit', (function (e) {
                                                                    $("#formaddbtn").button('loading');
                                                                    e.preventDefault();
                                                                    $.ajax({
                                                                        url: '<?php echo base_url(); ?>admin/appointment/add',
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
                                                                                window.location.reload(true);
                                                                            }
                                                                            $("#formaddbtn").button('reset');
                                                                        },
                                                                        error: function () {
                                                                              alert("Fail")
                                                                        }
                                                                    });
                                                                }));
                                                            });
                                                            $(document).ready(function (e) {
                                                                $("#formedit").on('submit', (function (e) {
                                                                    $("#formeditbtn").button('loading');
                                                                    e.preventDefault();
                                                                    $.ajax({
                                                                        url: '<?php echo base_url(); ?>admin/appointment/update',
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
                                                                                window.location.reload(true);
                                                                            }
                                                                            $("#formeditbtn").button('reset');
                                                                        },
                                                                        error: function () {
                                                                            //  alert("Fail")
                                                                        }
                                                                    });
                                                                }));
                                                            });
                                                            
                                                            /**/
                                                            
                                                            
                                                            function get_PatientDetails(id) {
                                                                $("#patient_name").html("patient_name");
                                                          
                                                                //$("#schedule_charge").html("schedule_charge");
                                                                
                                                                $.ajax({
                                                                    url: '<?php echo base_url(); ?>admin/patient/patientDetails',
                                                                    type: "POST",
                                                                    data: {id: id},
                                                                    dataType: 'json',
                                                                    success: function (res) {
                                                                        console.log(res);
                                                                        if (res) {
                                                                           
                                                                            var mobileno = res.mobileno;
                                                                            var modifiedMobileno = mobileno.substring(4);
                                                                            var countryCode = mobileno.substring(0,4);
                                                                            //$('#patient_unique_id').val(res.patient_unique_id);
                                                                            $('#patient_name').val(res.patient_name);
                                                                            $('#patientid').val(res.id);
                                                                            $('#guardian_name').html(res.guardian_name);
                                                                            $('#mobileno').val(modifiedMobileno);
                                                                            $('#countryCode').val(countryCode);
                                                                            $('#email').val(res.email);
                                                                            $("#age").html(res.age);
                                                                            $("#bp").html(res.bp);
                                                                            $("#month").html(res.month);
                                                                            $("#symptoms").html(res.symptoms);
                                                                            $("#known_allergies").html(res.known_allergies);
                                                                            $("#address").html(res.address);
                                                                            // $("#note").val(res.note);
                                                                            $("#height").html(res.height);
                                                                            $("#weight").html(res.weight);
                                                                            //$("#genders").html(res.gender);
                                                                            $("#marital_status").html(res.marital_status);
                                                                            //$("#blood_group").html(res.gender);
                                                                            $('select[id="gender"] option[value="' + res.gender + '"]').attr("selected", "selected");
                                                                            //$('select[id="marital_status"] option[value="' + res.marital_status + '"]').attr("selected", "selected");
                                                                            // $('select[id="blood_group"] option[value="' + res.blood_group + '"]').attr("selected", "selected");
                                                                        } else {
                                                                            $('#patient_name').val('');
                                                                            $('#phone').val("");
                                                                            $('#email').val("");
                                                                            $("#note").val("");
                                                                            $("#gender").val("")
                                                                            //$('select[id="gender"] option[value="' '"]').attr("selected", "selected");
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                            
                                                            function getRecord(id) {
                                                                // alert(id);
                                                                $("#viewModal").modal('hide');
                                                                $('#myModaledit').modal('show');
                                                                $.ajax({
                                                                    url: '<?php echo base_url(); ?>admin/appointment/getDetails',
                                                                    type: "POST",
                                                                    data: {appointment_id: id},
                                                                    dataType: 'json',
                                                                    success: function (data) {
                                                                    // alert(data.gender);
                                                                        var mobileno = data.mobileno;
                                                                        var modifiedMobileno = mobileno.substring(4);
                                                                        var countryCode = mobileno.substring(0,4);
                                                                        $("#id").val(data.id);
                                                                        $("#dates").val(data.date);
                                                                        $("#edit_patient_id").val(data.patient_id);
                                                                        $("#edit_patient_name").val(data.patient_name);
                                                                        $("#edit_gender").val(data.gender);
                                                                        $("#edit_appointment_priority").val(data.appointpriority);
                                                                        $("#edit_email").val(data.email);
                                                                        $("#edit_phone").val(modifiedMobileno);
                                                                        $("#countryCode2").val(countryCode);
                                                                        $("#doctor").val(data.doctor);
                                                                        $("#edoctor_fee").val(data.doctor_fee);
                                                                        $(".select2").select2().select2('val', data.doctor);
                                                                        $("#message").val(data.message);
                                                                        $("#appointment_status").val(data.appointment_status);
                                                                        $("#eaddpatient_id").select2().select2('val', data.patient_id);
                                                                        $('select[id="edit_gender"] option[value="' + data.gender + '"]').attr("selected", "selected");
                                                                        $('select[id="edit_appointment_priority"] option[value="' + data.appointpriority + '"]').attr("selected", "selected");
                                                                        $('select[id="doctor"] option[value="' + data.doctor + '"]').attr("selected", "selected");
                                                                        $('select[id="appointment_status"] option[value="' + data.appointment_status + '"]').attr("selected", "selected");
                                                                        $("#eaddpatient_id").attr('onchange', 'get_ePatientDetails(this.value)');
                                                                        
                                                                    },
                                                                })
                                                            }
                                                            function get_ePatientDetails(id) {
                                                                
                                                                
                                                                $.ajax({
                                                                    url: '<?php echo base_url(); ?>admin/patient/patientDetails',
                                                                    type: "POST",
                                                                    data: {id: id},
                                                                    dataType: 'json',
                                                                    success: function (res) {
                                                                        // console.log(res);
                                                                      //  alert(res.gender);
                                                                        if (res['id']>0) {
                                                                            $("#edit_patient_name").val(res.patient_name);
                                                                            $("#edit_patient_id").val(res.id);
                                                                            $("#edit_gender").val(res.gender);
                                                                          //  $("#edit_appointment_priority").val(res.appointpriority);
                                                                            $("#edit_email").val(res.email);
                                                                            $('#eemail').val(res.email);
                                                                            $('select[id="edit_gender"] option[value="' + res.gender + '"]').attr("selected", "selected");
                                                                            //$('select[id="edit_appointment_priority"] option[value="' + res.appointpriority + '"]').attr("selected", "selected");
                                                                            
                                                                        } else {
                                                                            
                                                                            
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                            function viewDetail(id) {
                                                                $('#viewModal').modal('show');
                                                                
                                                                $.ajax({
                                                                    url: '<?php echo base_url(); ?>admin/appointment/getDetails',
                                                                    type: "POST",
                                                                    data: {appointment_id: id},
                                                                    dataType: 'json',
                                                                    success: function (data) {
                                                                      // alert(data.department_name);
                                                                        $("#dating").html(data.date);
                                                                        $("#patient_ids").html(data.patient_id);
                                                                        $("#appointmentno").html(data.appointment_no);
                                                                        $("#appointmentsno").html(data.id);
                                                                        $("#patient_names").html(data.patient_name);
                                                                        $("#age").html(data.age);
                                                                        $("#genders").html(data.gender);
                                                                        $("#emails").html(data.email);
                                                                        $("#phones").html(data.mobileno);
                                                                        $("#doctors").html(data.name + " " + data.surname);
                                                                        $("#appointpriority").html(data.appointment_priority);
                                                                        $("#amount").html(data.doctor_fee);
                                                                        $("#departmentt").html(data.department_name);
                                                                        $("#collected_by").html(data.collector_name + " " + data.collector_surname);
                                                                        $("#source").html(data.source);
                                                                        $("#messages").html(data.message);
                                                                        $("#address").html(data.patient_address);
                                                                        
                                                                        var label = "";
                                                                        if (data.appointment_status == "approved") {
                                                                            var label = "class='label label-success'";
                                                                        } else if (data.appointment_status == "pending") {
                                                                            var label = "class='label label-warning'";
                                                                        } else if (data.appointment_status == "cancel") {
                                                                            var label = "class='label label-danger'";
                                                                        }
                                                                        
                                                                        $("#status").html("<small " + label + " >" + data.appointment_status + "</small>");
                                                                        
                                                                        $("#edit_delete").html("<a href='#'' onclick='getRecord(" + id + ")' data-target='#editModal' data-toggle='tooltip'  data-original-title='<?php echo $this->lang->line('edit'); ?>'><i class='fa fa-pencil'></i></a><a href='#' data-toggle='tooltip'  onclick='delete_record(" + id + ")' data-original-title='<?php echo $this->lang->line('delete'); ?>'><i class='fa fa-trash'></i></a>");
                                                                        
                                                                    },
                                                                });
                                                            }
                                                            
                                                            function delete_record(id) {
                                                                if (confirm(<?php echo "'" . $this->lang->line('delete_conform') . "'"; ?>)) {
                                                                    $.ajax({
                                                                        url: '<?php echo base_url(); ?>admin/appointment/delete/' + id,
                                                                        type: "POST",
                                                                        data: {patient_id: id},
                                                                        dataType: 'json',
                                                                        success: function (res) {
                                                                            if (res.status == 'success') {
                                                                                successMsg(res.message);
                                                                                window.location.reload(true);
                                                                            }
                                                                        }
                                                                    })
                                                                }
                                                                
                                                            }
                                                            function getpatientDetails() {
                                                                var id = $("#patient_id").val();
                                                                $.ajax({
                                                                    url: '<?php echo base_url(); ?>admin/appointment/getpatientDetails',
                                                                    type: "POST",
                                                                    data: {patient_id: id},
                                                                    dataType: 'json',
                                                                    success: function (data) {
                                                                        console.log(data)
                                                                        $("#patient_name").val(data.patient_name);
                                                                        $("#gender").val(data.gender);
                                                                        $("#email").val(data.email);
                                                                        $("#phone").val(data.mobileno);
                                                                    }
                                                                })
                                                            }
                                                            </script>
                                                            