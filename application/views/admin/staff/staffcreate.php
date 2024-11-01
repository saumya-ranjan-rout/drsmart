<style>
 

    .ms-options-wrap button {
    width: 100%;
    background-color: #ffffff; /* Background color */
    color: #333; /* Text color */
    border: 1px solid #ccc; /* Border styling */
    border-radius: 4px; /* Rounded corners */
    /* padding: 8px 35px 8px 10px; Add padding */
    cursor: pointer; /* Pointer cursor */
    text-align: left; /* Align text to the left */
    position: relative; /* For positioning the arrow */
}

.ms-options-wrap button:after {
    content: "▼"; /* Dropdown arrow */
    position: absolute; /* Position it absolutely */
    right: 10px; /* Align to the right */
    top: 50%; /* Center vertically */
    transform: translateY(-50%); /* Adjust for centering */
    font-size: 12px; /* Size of the arrow */
    color: #c7c7c7; /* Color of the arrow */
}

    /* Options container styling */
    /* .ms-options {
        position: absolute; 
        background-color: #f9f9f9;
        width: 100%;
        border: 1px solid #ddd;
        z-index: 1;
        display: none;
        max-height: 150px;
        overflow-y: auto;
    } */
    .ms-options {
    position: absolute; /* Position dropdown absolutely */
    top: 100%; /* Position it right below the button */
    left: 0; /* Align to the left of the button */
    background-color: #f9f9f9;
    width: 100%;
    border: 1px solid #ddd;
    z-index: 10; /* Ensure it appears on top of other elements */
    max-height: 150px;
    overflow-y: auto;
    display: none; /* Initially hidden */
}

    /* Search box styling */
    .ms-search input {
        width: 100%;
        padding: 5px;
        margin-bottom: 5px;
        border: 1px solid #ddd;
    }

    /* Option items styling */
    .ms-options ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .ms-options ul li label {
        display: flex;
        align-items: center;
        padding: 5px;
        cursor: pointer;
    }

    .ms-options ul li label:hover {
        background-color: #e0e0e0;
    }
</style>





<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">

                    <form id="form1" action="<?php echo site_url('admin/staff/create') ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                        <div class="box-body">
                            <!-- <div class="alert alert-info">
                                <?php echo $this->lang->line('add_staff_message'); ?>
                            </div> -->
                            <div class="tshadow mb25 bozero">

                                <h4 class="pagetitleh2"><?php echo $this->lang->line('basic_information'); ?> </h4>


                                <div class="around10">
                                    <?php if ($this->session->flashdata('msg')) { ?>
                                        <?php echo $this->session->flashdata('msg') ?>
                                    <?php } ?>
                                    <?php echo $this->customlib->getCSRF(); ?>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('staff_id'); ?></label><small class="req"> *</small>
                                                <input autofocus="" id="employee_id" name="employee_id" placeholder="" type="text" class="form-control" value="<?php echo $Staff_id; ?>" readonly />
                                                <span class="text-danger"><?php echo form_error('employee_id'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('role'); ?></label><small class="req"> *</small>
                                                <select id="role" name="role" class="form-control" onchange="getDesignation(this.value)">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                    <?php
                                                    foreach ($roles as $key => $role) {
                                                    ?>
                                                        <option value="<?php echo $role['id'] ?>" <?php echo set_select('role', $role['id'], set_value('role')); ?>><?php echo $role["name"] ?></option>
                                                    <?php }
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('role'); ?></span>
                                            </div>
                                        </div>
                                        

                                        <div class="col-md-2" id="nurses_div" style="display: none;">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Nurses</label>
                                              <input type="hidden" class="form-control" id="nurses" name="nurses" value="" readonly>
                                                                                                    
                                                                                                    <div class="ms-options-wrap" style="position: relative;">
                                                                                                        <button class="form-control" type="button" >Select Nurses</button>
                                                                                                        <div class="ms-options" style="min-height: 100px; max-height: 100px; overflow: auto; display: none;">
                                                                                                            <div class="ms-search">
                                                                                                                <input type="text" value="" placeholder="Search">
                                                                                                            </div>
                                                                                                            <ul style="column-count: 1; column-gap: 0px; padding-left: 0px;">
                                                                                                            <?php
                                                                                         foreach ($nurses as $key => $nurse) {
                                                                                                        ?>
                                                                                                                <li class="">
                                                                                                                    <label for="ms-opt-1" style="padding-left: 23px;"><input type="checkbox" value="<?php echo $nurse["id"]; ?>" title="<?php echo $nurse["name"]." ".$nurse["surname"]; ?>" id="ms-opt-1"><?php echo $nurse["name"]." ".$nurse["surname"]; ?></label>
                                                                                                                </li>
                                                                                                                <?php }
                                                                                                                    ?> 
                                                                                                </ul>
                                                                                            </div>
                                                                                        </div> 
                                                                                        <span class="text-danger"><?php echo form_error('nurses'); ?></span>
                                            </div>
                                        </div>



                                        <div class="col-md-3" id="designation_div">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('designation'); ?></label>

                                                <select id="designation" name="designation" placeholder="" type="text" class="form-control">
                                                    <option value=""><?php echo $this->lang->line('select') ?></option>

                                                </select>
                                              
                                            </div>
                                        </div>

                                        <div class="col-md-3" id="department_div">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('department'); ?></label>
                                                <select id="department" name="department" placeholder="" type="text" class="form-control">
                                                    <option value=""><?php echo $this->lang->line('select') ?></option>
                                                    <?php foreach ($department as $key => $value) {
                                                    ?>
                                                        <option value="<?php echo $value["id"] ?>" <?php echo set_select('department', $value['id'], set_value('department')); ?>><?php echo $value["department_name"] ?></option>
                                                    <?php }
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('department'); ?></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('first_name'); ?></label><small class="req"> *</small>
                                                <input id="name" name="name" placeholder="" type="text" class="form-control" value="<?php echo set_value('name') ?>" />
                                                <span class="text-danger"><?php echo form_error('name'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('last_name'); ?></label>
                                                <input id="surname" name="surname" placeholder="" type="text" class="form-control" value="<?php echo set_value('surname') ?>" />
                                                <span class="text-danger"><?php echo form_error('surname'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('email'); ?></label>
                                                <input id="email" name="email" placeholder="" type="email" class="form-control" value="<?php echo set_value('email') ?>" />
                                                <span class="text-danger"><?php echo form_error('email'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('username'); ?></label><small class="req"> *</small>
                                                <input type="text" id="username" name="username" placeholder="" class="form-control" value="<?php echo set_value('username') ?>" />
                                                <span class="text-danger"><?php echo form_error('username'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('password'); ?></label><small class="req"> *</small>
                                                <input  type="text"  id="password" name="password" placeholder="" class="form-control" value="<?php echo set_value('password') ?>" />
                                                <span class="text-danger"><?php echo form_error('password'); ?></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('father_name'); ?></label>
                                                <input id="father_name" name="father_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('father_name') ?>" />
                                                <span class="text-danger"><?php echo form_error('father_name'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('mother_name'); ?></label>
                                                <input id="mother_name" name="mother_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('mother_name') ?>" />
                                                <span class="text-danger"><?php echo form_error('mother_name'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputFile"> <?php echo $this->lang->line('gender'); ?></label><small class="req"> *</small>
                                                <select class="form-control" name="gender">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                    <?php
                                                    foreach ($genderList as $key => $value) {
                                                    ?>
                                                        <option value="<?php echo $key; ?>" <?php echo set_select('gender', $key, set_value('gender')); ?>><?php echo $value; ?></option>
                                                    <?php
                                                    }
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('gender'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('marital_status'); ?></label>
                                                <select class="form-control" name="marital_status">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                    <?php foreach ($marital_status as $makey => $mavalue) {
                                                    ?>
                                                        <option value="<?php echo $mavalue ?>" <?php echo set_select('marital_status', $mavalue, set_value('marital_status')); ?>><?php echo $mavalue; ?></option>

                                                    <?php } ?>

                                                </select>
                                                <span class="text-danger"><?php echo form_error('marital_status'); ?></span>
                                            </div>
                                        </div>
                                        <!--div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('date_of_joining'); ?></label>
                                                <input id="date_of_joining" name="date_of_joining" placeholder="" type="text" class="form-control"  value="<?php echo set_value('date_of_joining') ?>" />
                                                <span class="text-danger"><?php echo form_error('date_of_joining'); ?></span>
                                            </div>
                                        </div-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('blood_group'); ?></label>
                                                <select class="form-control" name="blood_group">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                    <?php foreach ($bloodgroup as $bgkey => $bgvalue) {
                                                    ?>
                                                        <option value="<?php echo $bgvalue ?>" <?php echo set_select('blood_group', $bgvalue, set_value('blood_group')); ?>><?php echo $bgvalue ?></option>

                                                    <?php } ?>

                                                </select>
                                                <span class="text-danger"><?php echo form_error('marital_status'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('date_of_birth'); ?></label><small class="req"> *</small>
                                                <input id="dob" name="dob" placeholder="" type="text" class="form-control datee" value="<?php echo set_value('dob') ?>" />
                                                <span class="text-danger"><?php echo form_error('dob'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('date_of_joining'); ?></label>
                                                <input id="date_of_joining" name="date_of_joining" placeholder="" type="text" class="form-control date" value="<?php echo set_value('date_of_joining') ?>" />
                                                <span class="text-danger"><?php echo form_error('date_of_joining'); ?></span>
                                            </div>
                                        </div>
                                        <!--<div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('phone'); ?></label>
                                                <input id="mobileno" name="contactno" placeholder="" type="text" class="form-control"  value="<?php echo set_value('contactno') ?>" />
                                                <span class="text-danger"><?php echo form_error('contactno'); ?></span>
                                            </div>
                                        </div> -->
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('phone'); ?></label><small class="req"> *</small>
                                                <div class="input-group" style="display:flex;">
                                                    <div class="input-group-prepend">
                                                        <select id="countryCode" name="countryCode" class="form-control" style="padding: 0px;width: 58px;">
                                                            <option value="+965">+965</option>
                                                            <option value="+962">+962</option>
                                                        </select>
                                                    </div>
                                                    <input id="contactno" autocomplete="off" name="contactno" type="text" placeholder="" class="form-control" value="<?php echo set_value('contactno') ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />

                                                </div>
                                                <span class="text-danger"><?php echo form_error('contactno'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('emergency_contact'); ?></label>

                                                <div class="input-group" style="display:flex;">
                                                    <div class="input-group-prepend">
                                                        <select id="countryCode1" name="countryCode1" class="form-control" style="padding: 0px;width: 58px;">
                                                            <option value="+965">+965</option>
                                                            <option value="+962">+962</option>
                                                        </select>
                                                    </div>
                                                    <input id="emg_contact" autocomplete="off" name="emg_contact" type="text" placeholder="" class="form-control" value="<?php echo set_value('emg_contact') ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />

                                                </div>
                                                <span class="text-danger"><?php echo form_error('emg_contact'); ?></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputFile"><?php echo $this->lang->line('photo') . " ( " . $this->lang->line('jpg_jpeg_png') . " )"; ?></label>
                                                <div><input class="filestyle form-control" type='file' name='file' id="file" size='20' />
                                                </div>
                                                <span class="text-danger"><?php echo form_error('file'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('pan') . "  " . $this->lang->line('number'); ?></label>
                                                <input id="pan_number" name="pan_number" placeholder="" type="text" class="form-control" value="<?php echo set_value('pan_number') ?>" />

                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('national_identification_number'); ?></label>
                                                <input id="nin" name="nin" placeholder="" type="text" class="form-control" value="<?php echo set_value('nin') ?>" />

                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('local_identification_number'); ?></label>
                                                <input id="lin" name="lin" placeholder="" type="text" class="form-control" value="<?php echo set_value('lin') ?>" />

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputFile"><?php echo $this->lang->line('current'); ?> <?php echo $this->lang->line('address'); ?></label>
                                                <div><textarea name="address" class="form-control"><?php echo set_value('address'); ?></textarea>
                                                </div>
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputFile"><?php echo $this->lang->line('permanent_address'); ?></label>
                                                <div><textarea name="permanent_address" class="form-control"><?php echo set_value('permanent_address'); ?></textarea>
                                                </div>
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('qualification'); ?></label>
                                                <textarea id="qualification" name="qualification" placeholder="" class="form-control"><?php echo set_value('qualification') ?></textarea>
                                                <span class="text-danger"><?php echo form_error('qualification'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1"><?php echo $this->lang->line('work_experience'); ?></label>
                                                <textarea id="work_exp" name="work_exp" placeholder="" class="form-control"><?php echo set_value('work_exp') ?></textarea>
                                                <span class="text-danger"><?php echo form_error('work_exp'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputFile"><?php echo $this->lang->line('specialization'); ?></label>
                                                <div><textarea name="specialization" class="form-control"><?php echo set_value('specialization'); ?></textarea>
                                                </div>
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputFile"><?php echo $this->lang->line('note'); ?></label>
                                                <div><textarea name="note" class="form-control"><?php echo set_value('note'); ?></textarea>
                                                </div>
                                                <span class="text-danger"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box-group collapsed-box">
                                <div class="panel box box-success collapsed-box">
                                    <div class="box-header with-border">
                                        <a data-widget="collapse" data-original-title="Collapse" class="collapsed btn boxplus">
                                            <i class="fa fa-fw fa-plus"></i><?php echo $this->lang->line('add_more_details'); ?>
                                        </a>
                                    </div>

                                    <div class="box-body" style="padding: 0;">
                                        <div class="tshadow-new">
                                            <h4 class="pagetitleh2"><?php echo $this->lang->line('payroll'); ?>
                                            </h4>

                                            <div class="row around10">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('epf_no'); ?></label>
                                                        <input id="epf_no" name="epf_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('epf_no') ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                                                        <span class="text-danger"><?php echo form_error('epf_no'); ?></span>
                                                    </div>
                                                </div>


                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('basic_salary'); ?></label>
                                                        <input type="text" class="form-control" name="basic_salary" value="<?php echo set_value('basic_salary') ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('contract_type'); ?></label>
                                                        <select class="form-control" name="contract_type">
                                                            <option value=""><?php echo $this->lang->line('select') ?></option>
                                                            <?php foreach ($contract_type as $key => $value) { ?>
                                                                <option value="<?php echo $key ?>" <?php echo set_select('contract_type', $key, set_value('contract_type')); ?>><?php echo $value ?></option>

                                                            <?php } ?>


                                                        </select>
                                                        <span class="text-danger"><?php echo form_error('contract_type'); ?></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('work_shift'); ?></label>
                                                        <input id="shift" name="shift" placeholder="" type="text" class="form-control" value="<?php echo set_value('shift') ?>" />
                                                        <span class="text-danger"><?php echo form_error('shift'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">

                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('work_location'); ?></label>
                                                        <input id="location" name="location" placeholder="" type="text" class="form-control" value="<?php echo set_value('location') ?>" />
                                                        <span class="text-danger"><?php echo form_error('location'); ?></span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="tshadow-new">
                                            <h4 class="pagetitleh2"><?php echo $this->lang->line('leaves'); ?>
                                            </h4>

                                            <div class="row around10">
                                                <?php
                                                foreach ($leavetypeList as $key => $leave) {
                                                    # code...
                                                ?>

                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1"><?php echo $leave["type"]; ?></label>

                                                            <input name="leave_type[]" type="hidden" readonly class="form-control" value="<?php echo $leave['id'] ?>" />
                                                            <input name="alloted_leave_<?php echo $leave['id'] ?>" placeholder="<?php echo $this->lang->line('number_of_leaves'); ?>" value="<?php echo set_value('alloted_leave_' . $leave['id']); ?>" type="text" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />

                                                            <span class="text-danger"><?php echo form_error('alloted_leave'); ?></span>
                                                        </div>
                                                    </div>



                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="tshadow-new">
                                            <h4 class="pagetitleh2"><?php echo $this->lang->line('bank_account_details'); ?>
                                            </h4>

                                            <div class="row around10">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('account_title'); ?></label>
                                                        <input id="account_title" name="account_title" placeholder="" type="text" class="form-control" value="<?php echo set_value('account_title') ?>" />
                                                        <span class="text-danger"><?php echo form_error('account_title'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('bank_account_no'); ?></label>
                                                        <input id="bank_account_no" name="bank_account_no" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, '');" type="text" class="form-control" value="<?php echo set_value('bank_account_no') ?>" />
                                                        <span class="text-danger"><?php echo form_error('bank_account_no'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('bank_name'); ?></label>
                                                        <input id="bank_name" name="bank_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('bank_name') ?>" />
                                                        <span class="text-danger"><?php echo form_error('bank_name'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('ifsc_code'); ?></label>
                                                        <input id="ifsc_code" name="ifsc_code" placeholder="" type="text" class="form-control" value="<?php echo set_value('ifsc_code') ?>" />
                                                        <span class="text-danger"><?php echo form_error('ifsc_code'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('bank_branch_name'); ?></label>
                                                        <input id="bank_branch" name="bank_branch" placeholder="" type="text" class="form-control" value="<?php echo set_value('bank_branch') ?>" />
                                                        <span class="text-danger"><?php echo form_error('bank_branch'); ?></span>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="tshadow-new">
                                            <h4 class="pagetitleh2"><?php echo $this->lang->line('social_media'); ?>
                                            </h4>

                                            <div class="row around10">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('facebook_url'); ?></label>
                                                        <input id="bank_account_no" name="facebook" placeholder="" type="text" class="form-control" value="<?php echo set_value('facebook') ?>" />
                                                        <span class="text-danger"><?php echo form_error('facebook'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('twitter_url'); ?></label>
                                                        <input id="bank_account_no" name="twitter" placeholder="" type="text" class="form-control" value="<?php echo set_value('twitter') ?>" />
                                                        <span class="text-danger"><?php echo form_error('twitter_profile'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('linkedin_url'); ?></label>
                                                        <input id="bank_name" name="linkedin" placeholder="" type="text" class="form-control" value="<?php echo set_value('linkedin') ?>" />
                                                        <span class="text-danger"><?php echo form_error('linkedin'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('instagram_url'); ?></label>
                                                        <input id="instagram" name="instagram" placeholder="" type="text" class="form-control" value="<?php echo set_value('instagram') ?>" />

                                                    </div>
                                                </div>

                                            </div>


                                        </div>
                                        <div id='upload_documents_hide_show'>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="tshadow-new">
                                                        <h4 class="pagetitleh2"><?php echo $this->lang->line('upload_documents'); ?></h4>

                                                        <div class="row around10">
                                                            <div class="col-md-6">
                                                                <table class="table">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th style="width: 10px">#</th>
                                                                            <th><?php echo $this->lang->line('title'); ?></th>
                                                                            <th><?php echo $this->lang->line('documents'); ?></th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>1.</td>
                                                                            <td><?php echo $this->lang->line('resume'); ?></td>
                                                                            <td>
                                                                                <input class="filestyle form-control" type='file' name='first_doc' id="doc1">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>3.</td>
                                                                            <td><?php echo $this->lang->line('other_documents'); ?><input type="hidden" name='fourth_title' class="form-control" placeholder="Other Documents"></td>
                                                                            <td>
                                                                                <input class="filestyle form-control" type='file' name='fourth_doc' id="doc4">
                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <table class="table">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th style="width: 10px">#</th>
                                                                            <th><?php echo $this->lang->line('title'); ?></th>
                                                                            <th><?php echo $this->lang->line('documents'); ?></th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>2.</td>
                                                                            <td><?php echo $this->lang->line('joining_letter'); ?></td>
                                                                            <td>
                                                                                <input class="filestyle form-control" type='file' name='second_doc' id="doc2">
                                                                            </td>
                                                                        </tr>


                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
</section>
</div>
<!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->


<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script>
    $(document).ready(function () {
        // Toggle options dropdown visibility
        $(".ms-options-wrap button").on("click", function () {
            $(this).siblings(".ms-options").toggle();
        });

        // Filter options based on search input
        $(".ms-search input").on("input", function () {
            const searchTerm = $(this).val().toLowerCase();
            $(this)
                .closest(".ms-options")
                .find("ul li")
                .each(function () {
                    const label = $(this).text().toLowerCase();
                    $(this).toggle(label.includes(searchTerm));
                });
        });

        // Update button text with selected options
        $(".ms-options input[type='checkbox']").on("change", function () {
    const selectedOptions = [];
    $(".ms-options input[type='checkbox']:checked").each(function () {
        var label = $(this).closest("li").find("label").text(); // Change this line
       // alert(label); // Now this should show the correct label text
        selectedOptions.push(label.trim());
    });

   // alert(selectedOptions);
    const button = $(this).closest(".ms-options-wrap").find("button");
    button.text(selectedOptions.length ? selectedOptions.join(", ") : "Select Specialist");
});


        // Close dropdown if clicked outside
        $(document).on("click", function (e) {
            if (!$(e.target).closest(".ms-options-wrap").length) {
                $(".ms-options").hide();
            }
        });
    });
</script> -->


<script>
$(document).ready(function () {
    // Toggle options dropdown visibility
    $(".ms-options-wrap button").on("click", function () {
        $(this).siblings(".ms-options").toggle();
    });

    // Filter options based on search input
    $(".ms-search input").on("input", function () {
        const searchTerm = $(this).val().toLowerCase();
        $(this)
            .closest(".ms-options")
            .find("ul li")
            .each(function () {
                const label = $(this).text().toLowerCase();
                $(this).toggle(label.includes(searchTerm));
            });
    });

    // Update button text with selected options
    $(".ms-options input[type='checkbox']").on("change", function () {
        const selectedCheckboxes = $(".ms-options input[type='checkbox']:checked"); // Get all checked checkboxes
        const selectedOptionsCount = selectedCheckboxes.length; // Count of selected checkboxes
        const button = $(this).closest(".ms-options-wrap").find("button");
        const nursesInput = $("#nurses"); // Get the nurses input field

        if (selectedOptionsCount > 0) {
            const selectedLabels = selectedCheckboxes.map(function () {
                return $(this).closest("li").find("label").text().trim();
            }).get(); // Get the labels of the selected options

            const selectedValues = selectedCheckboxes.map(function () {
                return $(this).val().trim(); // Get the values of the selected checkboxes
            }).get(); 
            
            if (selectedOptionsCount > 2) {
                // Show the first 2 selected options and the count
                button.text(`${selectedLabels[0]}, ${selectedLabels[1]} + ${selectedOptionsCount - 2} more selected`);
            } else {
                // Show all selected options if 2 or less are selected
                button.text(selectedLabels.join(", "));
            }
            nursesInput.val(selectedValues.join(", "));

        } else {
            button.text("Select Specialist");
            nursesInput.val("");
        }
    });

    // Close dropdown if clicked outside
    $(document).on("click", function (e) {
        if (!$(e.target).closest(".ms-options-wrap").length) {
            $(".ms-options").hide();
        }
    });
});


</script>




<script type="text/javascript">




    $(document).ready(function() {
        var role = $('#role').val();
        var selectedDesignation = '<?php echo set_value('designation'); ?>'; // Fetch the previously selected designation from PHP

        if (role !== '') {
            getDesignation(role, selectedDesignation);
        }
    });

    function getDesignation(roleId, selectedDesignation) {

        if (roleId == 3) {
    $('#nurses_div').show();
    $('#designation_div').removeClass('col-md-3').addClass('col-md-2');
    $('#department_div').removeClass('col-md-3').addClass('col-md-2');
} else {
    $('#nurses_div').hide();
    $('#designation_div').removeClass('col-md-2').addClass('col-md-3');
    $('#department_div').removeClass('col-md-2').addClass('col-md-3');
}

        var url = '<?php echo base_url(); ?>admin/staff/getDesignation/';
        $.ajax({
            url: url,
            type: 'POST',
            data: {
                role: roleId,
                selected_designation: selectedDesignation
            },
            dataType: 'json',
            success: function(response) {
                $('#designation').html(response.options); // Populate the designation dropdown

                // Set the selected value, if provided
                if (response.selected) {
                    $('#designation').val(response.selected);
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ', status, error);
            }
        });
    }
</script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/js/savemode.js"></script>