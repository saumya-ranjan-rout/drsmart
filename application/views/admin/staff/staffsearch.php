<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();

$userdata = $this->customlib->getUserData();

$logged_in_User = $this->customlib->getLoggedInUserData();
$logged_in_User_Role = json_decode($this->customlib->getStaffRole());
$uid = $userdata["id"];




?>
<style type="text/css">
    .staffinfo-box {
        width: 100%;
        height: 220px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        text-align: center;
        background: #f8f8f8;
        border: 1px solid #ddd;
        box-sizing: border-box;
    }

    .staffleft-box {
        width: 100%;
        height: 115px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #eaeaea;

    }

    .staffleft-box img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }

    .staffleft-content {
        flex-grow: 1;
        overflow: hidden;
        text-align: center;
        font-size: 10px;
        padding: 2px;
    }


    .staffleft-content h5,
    .staffleft-content p {
        margin: 2px 0;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .staffleft-box img {
        width: 100px;
        height: 100px;
        position: relative;
        z-index: 0;
        background: #fff;
    }

    .stafficons a {
        display: inline-block;
        text-align: center;
        color: #fff;
        font-size: 24px;
        padding-right: 110px;
        padding-left: 0px;
        line-height: 100px;
    }


    /* .fixed-width {
            display: inline-block; 
           width: 70px;
            white-space: nowrap; 
            overflow: hidden; 
            vertical-align: top; 
            transition: font-size 0.3s ease;
        } */
</style>

<div class="content-wrapper" style="min-height: 946px;">

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"> <?php echo $this->lang->line('staff_directory'); ?></h3>

                        <small class="pull-right">
                            <?php if ($this->rbac->hasPrivilege('staff', 'can_add')) { ?>
                                <div class="btn-group" style="margin-left:4px;">

                                    <a href="<?php echo site_url('admin/staff/create'); ?>" style="border-radius:2px 0px 0px 2px" class="btn btn-primary btn-sm"><?php echo $this->lang->line('add_staff'); ?></a>
                                    <?php if ($this->rbac->hasPrivilege('disable_staff', 'can_view')) { ?>
                                        <button type="button" style="border-left: 1px solid #2e6da4;" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">

                                            <li><a href="<?php echo base_url('admin/staff/disablestafflist'); ?>">
                                                    <?php echo $this->lang->line('disabled_staff'); ?>
                                                </a></li>


                                        </ul>
                                    <?php } ?>
                                </div>
                            <?php } ?>

                                <?php if ($this->rbac->hasPrivilege('assign_task', 'can_view')) { ?>
                                    <a href="<?php echo base_url(); ?>admin/calendar/task" class="btn btn-primary btn-sm">
                                       <i class="fa fa-tasks"></i> <?php echo $this->lang->line('task'); ?>
                                    </a>
                                      <?php } ?>
                                

                            <?php if ($this->rbac->hasPrivilege('staff_attendance', 'can_add')) { ?>
                                <a href="<?php echo base_url(); ?>admin/staffattendance" class="btn btn-primary btn-sm">
                                    <i class="fa fa-clock-o"></i> <?php echo $this->lang->line('staff_attendance'); ?>
                                </a>
                            <?php } ?>
                            <?php if ($this->rbac->hasPrivilege('staff_import', 'can_add')) { ?>
                                <a href="<?php echo base_url(); ?>admin/staffattendance/import" class="btn btn-primary btn-sm">
                                    <i class="fa fa-clock-o"></i> <?php echo "Import Staff"; ?>
                                </a>
                            <?php } ?>
                            <?php if ($this->rbac->hasPrivilege('staff_payroll', 'can_add')) { ?>
                                <a href="<?php echo base_url(); ?>admin/payroll" class="btn btn-primary btn-sm">
                                    <i class="fa fa-money"></i> <?php echo $this->lang->line('payroll'); ?>
                                </a>
                            <?php } ?>
                            <?php if ($this->rbac->hasPrivilege('apply_leave', 'can_add')) { ?>
                                <a href="<?php echo base_url(); ?>admin/staff/leaverequest" class="btn btn-primary btn-sm">
                                    <i class="fa fa-calendar"></i> <?php echo $this->lang->line('leaves'); ?>
                                </a>
                            <?php } ?>
                        </small>
                        <?php //} 
                        ?>
                    </div>

                    <div class="box-body">
                        <?php


                        if ($this->session->flashdata('msg')) { ?> <?php echo $this->session->flashdata('msg');
                                                                    $this->session->unset_userdata('msg'); ?> <?php }


                                        if ($logged_in_User_Role->id == 7 || $logged_in_User_Role->id == 1) { ?>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <form role="form" action="<?php echo site_url('admin/staff') ?>" method="post" class="">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label><?php echo $this->lang->line("role"); ?></label><small class="req"> *</small>
                                                    <select name="role" class="form-control">
                                                        <option value=""><?php echo $this->lang->line("select"); ?></option>
                                                        <?php foreach ($role as $key => $role_value) {
                                                        ?>
                                                            <option <?php
                                                                    if ($role_id == $role_value["type"]) {
                                                                        echo "selected";
                                                                    }
                                                                    ?> value="<?php echo $role_value['type'] ?>"><?php echo $role_value['type'] ?></option>
                                                        <?php }
                                                        ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo form_error('role'); ?></span>
                                                </div>
                                            </div>


                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm pull-right checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <form role="form" action="<?php echo site_url('admin/staff') ?>" method="post" class="">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label><?php echo $this->lang->line('search_by_keyword'); ?></label>
                                                    <input type="text" name="search_text" class="form-control" placeholder="<?php echo $this->lang->line('search_by_staff'); ?>">
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <button type="submit" name="search" value="search_full" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        <?php } ?>
                    </div>
                    <?php
                    if (isset($resultlist)) {
                    ?>
                        <div class="box border0">
                            <div class="box-header ptbnull"></div>
                            <div class="nav-tabs-custom border0">
                                <ul class="nav nav-tabs">

                                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false"><i class="fa fa-newspaper-o"></i> <?php echo $this->lang->line('card'); ?> <?php echo $this->lang->line('view'); ?></a></li>

                                    <?php if ($logged_in_User_Role->id == 7 || $logged_in_User_Role->id == 1 || $logged_in_User_Role->id == 2) { ?>
                                        <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true"><i class="fa fa-list"></i> <?php echo $this->lang->line('list'); ?> <?php echo $this->lang->line('view'); ?></a></li>

                                    <?php } ?>

                                </ul>
                                <div class="tab-content">
                                    <div class="download_label"><?php echo $title; ?></div>
                                    <div class="tab-pane table-responsive no-padding" id="tab_2">
                                        <table class="table table-striped table-bordered table-hover" id="servertable" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th><?php echo $this->lang->line('staff_id'); ?></th>
                                                    <th><?php echo $this->lang->line('name'); ?></th>
                                                    <th><?php echo $this->lang->line('role'); ?></th>
                                                    <th><?php echo $this->lang->line('department'); ?></th>
                                                    <th><?php echo $this->lang->line('designation'); ?></th>
                                                    <th><?php echo $this->lang->line('username'); ?></th>
                                                    <th><?php echo $this->lang->line('password'); ?></th>
                                                    <th><?php echo $this->lang->line('mobile_no'); ?></th>
                                                    <th><?php echo $this->lang->line('action'); ?></th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($resultlist as $key => $staff) {
                                                ?>

                                                    <tr>
                                                        <td><?php echo $staff["employee_id"] ?></td>
                                                        <td><?php echo $staff["name"] . " " . $staff["surname"] ?></td>
                                                        <td><?php echo $staff["user_type"] ?></td>
                                                        <td><?php echo $staff["department"] ?></td>
                                                        <td><?php echo $staff["designation"] ?></td>
                                                        <td><?php echo $staff["username"] ." <br>(". $staff["email"] .")"?></td>
                                                        <td><?php echo $staff["pwd"] ?></td>
                                                        <td><?php echo $staff["contact_no"] ?></td>
                                                        <td> <?php
                                                                if ($this->rbac->hasPrivilege('can_see_other_users_profile', 'can_view')) {

                                                                    $a = false;
                                                                    if ($staff['id'] == $logged_in_User['id']) {
                                                                        $a = true;
                                                                    } elseif ($logged_in_User_Role->id == 7 && $logged_in_User_Role->name == "Super Admin") {
                                                                        /* if ($staff["role_id"] == 7 && $staff['id'] != $logged_in_User['id']) {
                                                        $a = false;
                                                        } else {
                                                        $a = true;
                                                        }*/
                                                                        $a = true;
                                                                    }

                                                                    if ($this->rbac->hasPrivilege('staff', 'can_edit')) {
                                                                        if ($a) {
                                                                ?>
                                                                        <a href="<?php echo base_url() . "admin/staff/edit/" . $staff['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                                            <i class="fa fa-pencil"></i>
                                                                        </a> <?php }
                                                                        }
                                                                    }
                                                                                ?>
                                                            <a href="<?php echo base_url() . "admin/staff/profile/" . $staff['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('show'); ?>">
                                                                <i class="fa fa-reorder"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                <?php } ?>
                                            </tbody>

                                        </table>
                                    </div>
                                    <div class="tab-pane active" id="tab_1">
                                        <div class="mediarow">
                                            <div class="row">
                                                <?php if (empty($resultlist)) {
                                                ?>
                                                    <div class="alert alert-info"><?php echo $this->lang->line('no_record_found'); ?></div>
                                                    <?php
                                                } else {
                                                    $count = 1;
                                                    foreach ($resultlist as $staff) {
                                                    ?>

                                                        <?php //if ($logged_in_User_Role->id == 7 || $logged_in_User_Role->id == 1 || $logged_in_User_Role->id == 2 ) {
                                                        ?>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 img_div_modal">
                                                            <div class="staffinfo-box">
                                                                <div class="staffleft-box">
                                                                    <?php
                                                                    if (!empty($staff["image"])) {
                                                                        $image = $staff["image"];
                                                                    } else {
                                                                        $image = "no_image.png";
                                                                    }
                                                                    ?>
                                                                    <img src="<?php echo base_url() . "uploads/staff_images/" . $image ?>" />
                                                                </div>
                                                                <div class="staffleft-content">
                                                                    <h5><span data-toggle="tooltip" title="<?php echo $this->lang->line('name'); ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["name"] . " " . $staff["surname"]; ?></span></h5>
                                                                    <p>
                                                                        <font data-toggle="tooltip" title="<?php echo "Employee Id"; ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["employee_id"] ?></font>
                                                                    </p>
                                                                    <p>
                                                                        <font data-toggle="tooltip" title="<?php echo "Contact Number"; ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["contact_no"] ?></font>
                                                                    </p>
                                                                    <p>
                                                                        <font data-toggle="tooltip" title="<?php echo 'Location'; ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php
                                                                                                                                                                                                                    if (!empty($staff["location"])) {
                                                                                                                                                                                                                        echo $staff["location"] . ",";
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    ?></font>
                                                                        <font data-toggle="tooltip" title="<?php echo 'Department'; ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $staff["department"]; ?></font>
                                                                    </p>
                                                                    <p class="staffsub">
                                                                        <?php if (!empty($staff["user_type"])) { ?>
                                                                            <span class="fixed-width" data-toggle="tooltip" title="<?php echo $this->lang->line('role'); ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["user_type"] ?></span>
                                                                        <?php } ?>
                                                                        <?php if (!empty($staff["designation"])) { ?>
                                                                            <span class="fixed-width" data-toggle="tooltip" title="<?php echo 'Designation'; ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["designation"] ?></span>
                                                                        <?php } ?>
                                                                    </p>
                                                                </div>
                                                                <div class="overlay3">
                                                                    <div class="stafficons">
                                                                        <?php if ($this->rbac->hasPrivilege('can_see_other_users_profile', 'can_view')) { ?>
                                                                            <a title="<?php echo $this->lang->line('show') ?>" href="<?php echo base_url() . "admin/staff/profile/" . $staff["id"] ?>"><i class="fa fa-navicon"></i></a>
                                                                        <?php }
                                                                        $a = false;
                                                                        if ($staff['id'] == $logged_in_User['id']) {
                                                                            $a = true;
                                                                        } elseif ($logged_in_User_Role->id == 7 && $logged_in_User_Role->name == "Super Admin") {
                                                                            if ($staff["role_id"] == 7 && $staff['id'] != $logged_in_User['id']) {
                                                                                $a = false;
                                                                            } else {
                                                                                $a = true;
                                                                            }
                                                                        }

                                                                        ?>
                                                                        <?php if ($a) {
                                                                            if ($this->rbac->hasPrivilege('staff', 'can_edit')) { ?>
                                                                                <a title="<?php echo $this->lang->line('edit') ?>" href="<?php echo base_url() . "admin/staff/edit/" . $staff["id"] ?>"><i class=" fa fa-pencil"></i></a>
                                                                        <?php }
                                                                        } ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <?php // }
                                                        ?>


                                                <?php
                                                    }
                                                }
                                                ?>


                                            </div><!--./col-md-3-->
                                        </div><!--./row-->
                                    </div><!--./mediarow-->


                                </div>
                            </div>
                        </div>

                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
</div>
</section>
</div>
<script type="text/javascript">
    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }
    $(document).ready(function() {
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        getSectionByClass(class_id, section_id);
        $(document).on('change', '#class_id', function(e) {
            $('#section_id').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        });
    });

    // $(document).ready(function () {

    //     $('#servertable').DataTable({
    //         "processing": true,
    //         "serverSide": true,

    //         "ajax":{
    //          "url": "<?php //echo base_url('admin/staff/server_data')     
                        ?>",
    //          "dataType": "json",
    //          "type": "POST",
    //         //"data":{  '<?php //echo $this->security->get_csrf_token_name();     
                            ?>' : '<?php //echo $this->security->get_csrf_hash();     
                                                                                            ?>' }
    //                        },
    //     "columns": [
    //               { "data": "employee_id" },
    //               { "data": "name" },
    //               { "data": "user_type" },
    //               { "data": "department" },
    //               { "data": "designation" },
    //               { "data": "contact_no" }

    //            ]     

    //     });
    //        //console.log(data); 
    // });
    //         function adjustFontSize() {
    //     const elements = document.querySelectorAll('.fixed-width');
    //     elements.forEach(el => {
    //         let fontSize = 10; // Initial font size
    //         el.style.fontSize = fontSize + 'px';

    //         while (el.scrollWidth > el.offsetWidth && fontSize > 8) {
    //             fontSize -= 1;
    //             el.style.fontSize = fontSize + 'px';
    //         }
    //     });
    // }

    // Run the function after the content is loaded
    //document.addEventListener('DOMContentLoaded', adjustFontSize);
</script>