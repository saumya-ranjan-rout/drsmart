<?php
$logged_in_User_Role = json_decode($this->customlib->getStaffRole());
?>
<style>
    .ui-accordion {
        border: 1px solid #f4f4f4;
    }

    .panel-heading {
        padding: 0;
        border: 0;
    }

    .panel-title>a,
    .panel-title>a:active {
        display: block;
        padding: 15px;
        color: #555;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1px;
        word-spacing: 3px;
        text-decoration: none;
    }

    .panel-heading a:before {
        font-family: 'FontAwesome';
        content: "\f106";
        float: right;
        transition: all 0.5s;
    }

    .panel-heading.active a:before {
        -webkit-transform: rotate(180deg);
        -moz-transform: rotate(180deg);
        transform: rotate(180deg);
    }

    .accordianheader {
        color: #000;
        background: #fff;
        padding: 10px 10px;
        margin-bottom: 0px;
        border-top: 1px solid #ddd;
        position: relative;
        overflow: hidden;
        outline: 0;
        cursor: pointer;
    }

    .accordianbody {
        background: #f4f4f4;
    }

    /*.accordianbody ul {
      margin: 0;
      list-style: none;
      padding: 0;
    }
    .accordianbody ul li {
      padding: 10px;
      border-bottom: 1px solid lightgrey;
    }*/

    .accordianbody i {
        color: #000 !important;
        right: 20px;
        top: 14px;

        -webkit-transition: all 300ms ease-in 0s;
        -moz-transition: all 300ms ease-in 0s;
        -o-transition: all 300ms ease-in 0s;
        transition: all 300ms ease-in 0s;
    }

    .ui-state-active i {
        color: #000;
        -webkit-transform: rotate(180deg);
        -moz-transform: rotate(180deg);
        -o-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        transform: rotate(180deg);
        -webkit-transition: all 300ms ease-in 0s;
        -moz-transition: all 300ms ease-in 0s;
        -o-transition: all 300ms ease-in 0s;
        transition: all 300ms ease-in 0s;
    }


    .notigybg {
        background: #fafafa;
        padding: 10px;
        overflow: hidden;
        font-weight: bold;
    }

    .notifyleft {
        width: 5%;
        float: left;
    }

    .notifymiddle {
        width: 13%;
        float: left;
    }

    .notifyright {
        width: 13%;
        float: left;
    }

    .noteangle {
        position: absolute;
        right: 20px;
        font-size: 18px;
        top: 20px;
    }

    .note-content {
        padding: 10px 0px 15px 5.5%
    }

    .noteDM10 {
        padding-top: 10px;
    }

    .unreadbg {
        background: #e1eeff;
    }

    .readbg {
        background: #fff;
    }

    .accordianheader {
        -webkit-transition: all 0.5s ease 0s;
        -moz-transition: all 0.5s ease 0s;
        -ms-transition: all 0.5s ease 0s;
        -o-transition: all 0.5s ease 0s;
        transition: all 0.5s ease 0s;
    }

    .accordianheader:focus,
    .accordianheader:visited,
    .accordianheader:hover {
        background: #f5f5f5;
    }

    @media(max-width:767px) {
        .notifyleft {
            width: 60px;
        }

        .notifymiddle {
            width: 40%;
        }

        .notifyright {
            width: 20%;
        }

        .noteDM10 {
            padding-top: 0px;
        }

        .note-content {
            padding-left: 70px;
        }
    }
</style>

<script>
    function updateStatus(id) {
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/systemnotification/updateStatus/',
            type: 'POST',
            data: {
                id: id
            },
            dataType: "json",
            success: function(res) {
                // $("#ajaxbedstatus").html(res);
                // $("#bed").modal('show');
                // $("#beddata").button('reset');
            }
        })
    }

    $(function() {
        $(".accordianheader").click(function() {
            var id = $(this).attr("data-noticeid");
            $(this).addClass('readbg');
            updateStatus(id);
            //alert(id);
        });
    });
</script>
<?php

$data = json_decode($role, true);
$loginrole = $data['name'];
?>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title titlefix"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('task') . " " . $this->lang->line('list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php
                            if ($this->rbac->hasPrivilege('assign_task', 'can_add')) {
                            ?>

                                <button class="btn btn-primary btn-sm pull-right" onclick="add_task()"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('task'); ?></button>
                            <?php } ?>
                        </div>
                    </div>
                    <form role="form" action="<?php echo site_url('admin/calendar/task') ?>" method="post" class="">
                        <div class="box-body">
                            <div class="row">
                                <?php echo $this->customlib->getCSRF(); ?>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('search') . " " . $this->lang->line('type'); ?></label>

                                        <select class="form-control" name="search_type" onchange="showdate(this.value)" autocomplete="off">
                                            <option value="">All</option>
                                            <option value="today" <?php echo set_select('search_type', 'today', ($search_type == 'today')); ?>>Today</option>
                                            <option value="this_week" <?php echo set_select('search_type', 'this_week', ($search_type == 'this_week')); ?>>This Week</option>
                                            <option value="last_week" <?php echo set_select('search_type', 'last_week', ($search_type == 'last_week')); ?>>Last Week</option>
                                            <option value="this_month" <?php echo set_select('search_type', 'this_month', ($search_type == 'this_month')); ?>>This Month</option>
                                            <option value="last_month" <?php echo set_select('search_type', 'last_month', ($search_type == 'last_month')); ?>>Last Month</option>
                                            <option value="last_3_month" <?php echo set_select('search_type', 'last_3_month', ($search_type == 'last_3_month')); ?>>Last 3 Months</option>
                                            <option value="last_6_month" <?php echo set_select('search_type', 'last_6_month', ($search_type == 'last_6_month')); ?>>Last 6 Months</option>
                                            <option value="last_12_month" <?php echo set_select('search_type', 'last_12_month', ($search_type == 'last_12_month')); ?>>Last 12 Months</option>
                                            <option value="this_year" <?php echo set_select('search_type', 'this_year', ($search_type == 'this_year')); ?>>This Year</option>
                                            <option value="last_year" <?php echo set_select('search_type', 'last_year', ($search_type == 'last_year')); ?>>Last Year</option>

                                            <!-- <option value="period" <?php echo set_select('search_type', 'period', ($search_type == 'period')); ?>>Period</option>-->
                                        </select>


                                        <span class="text-danger"><?php echo form_error('search_type'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-md-3" id="fromdate" style="display: none">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('date_from'); ?></label><small class="req"> *</small>
                                        <input id="date_from" name="date_from" placeholder="" type="text" class="form-control date" value="<?php echo set_value('date_from', date($this->customlib->getSchoolDateFormat())); ?>" />
                                        <span class="text-danger"><?php echo form_error('date_from'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-md-3" id="todate" style="display: none">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('date_to'); ?></label><small class="req"> *</small>
                                        <input id="date_to" name="date_to" placeholder="" type="text" class="form-control date" value="<?php echo set_value('date_to', date($this->customlib->getSchoolDateFormat())); ?>" />
                                        <span class="text-danger"><?php echo form_error('date_to'); ?></span>
                                    </div>
                                </div>
                                <?php if ($logged_in_User_Role->id == 7) {  ?>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label><?php echo $this->lang->line('role'); ?></label>


                                            <select id="roleid" name="roleid" class="form-control">
                                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                <?php
                                                foreach ($roles as $key => $role) {
                                                ?>
                                                    <option value="<?php echo $role['id'] ?>" <?php echo set_select('roleid', $role['id'], ($roleid == $role['id'])); ?>>
                                                        <?php echo $role["name"] ?>
                                                    </option>
                                                <?php }
                                                ?>
                                            </select>

                                            <span class="text-danger"><?php echo form_error('role'); ?></span>
                                        </div>
                                    </div>
                                <?php }
                                ?>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                        </div>
                    </form>
                    <div class="box-body">
                        <div id="accordion" class="accordionclick">
                            <div class="notigybg">
                                <div class="notifyleft" style=""><?php echo $this->lang->line('type'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('staff') . " " . $this->lang->line('name'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('role'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('designation'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('department'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('interval') . " " . $this->lang->line('minute'); ?></div>
                                <div class="notifymiddle" style=""><?php echo $this->lang->line('status'); ?></div>
                                <div class="notifyright" style=""><?php echo $this->lang->line('date'); ?></div>
                            </div>
                            <!-- yeah, yeah, I spelled Accordion wrong,  do something about it.  - G  -->
                            <?php if (empty($notifications)) { ?>
                                <?php
                            } else {
                                $count = 1;
                                $color = "";
                                $label = " ";
                                foreach ($notifications as $result) {

                                    if ($result["status"] == "completed") {
                                        $label = "class='label label-success'";
                                    } else if ($result["status"] == "in_progress") {
                                        $label = "class='label label-primary'";
                                    } else if ($result["status"] == "not_started") {
                                        $label = "class='label label-info'";
                                    } else if ($result["status"] == "cancelled") {
                                        $label = "class='label label-danger'";
                                    } else if ($result["status"] == "hold") {
                                        $label = "class='label label-warning'";
                                    } else if ($result["status"] == "pending") {
                                        $label = "class='label bg-purple'";
                                        // $label = "class='label bg-fuchsia'";
                                    }

                                    if ($result["priority"] == "high") {
                                        $priority =  "style='color: #007bff;'";
                                    } else  if ($result["priority"] == "medium") {
                                        $priority =  "style='color: #17a2b8;'";
                                    } else  if ($result["priority"] == "low") {
                                        $priority = "style='color: #ffc107;'";
                                    } else  if ($result["priority"] == "critical") {
                                        $priority = "style='color: #6f42c1;'";
                                    } else  if ($result["priority"] == "urgent") {
                                        $priority =  "style='color: #ea4f9b;'";
                                    }


                                ?>
                                    <div class="accordianheader  <?php echo $class ?>" data-noticeid="<?php echo $result['id'] ?>">
                                        <div class="notifyleft" style="width:5%;">
                                            <div class="media-left">
                                                <input type="checkbox"
                                                    <?php
                                                    if ($result["is_active"] == 'yes') {
                                                        echo "checked";
                                                    }
                                                    ?> id="check<?php echo $result["id"] ?>" onclick="taskmarkcomplete('<?php echo $result['id'] ?>')" name="eventcheck" value="<?php echo $result["id"]; ?>">
                                            </div>
                                        </div><!--./notifyleft-->

                                        <div class="notifymiddle noteDM10"><?php echo $result['name'] . " " . $result['surname']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['role_name']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['designation']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['department_name']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['task_int_min']; ?></div>
                                        <div class="notifymiddle noteDM10"><small <?php echo $label ?>><?php echo $this->lang->line($result['status']); ?></small><br>
                                            <?php echo $this->lang->line('priority') . " : "; ?><small <?php echo $priority ?>><?php echo $this->lang->line($result['priority']); ?></small></div>

                                        <div class="notifyright noteDM10"><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['start_date'])); ?></div>
                                        <div class="noteangle" style=""><i class="fa fa-angle-down"></i>
                                        </div>
                                    </div>
                                    <div class="accordianbody" style="position: relative;">
                                        <div class="note-content">
                                            <h4><?php echo $this->lang->line('task') . " " . $this->lang->line('title') . ": "; ?><small> <?php echo $result['task_title']; ?></small></h4>
                                            <h4><?php echo $this->lang->line('task') . " " . $this->lang->line('description') . ": "; ?><small> <?php echo $result['task_description']; ?></small></h4>
                                            <div>
                                                <a onclick="taskedit('<?php echo $result['id']; ?>')" class="btn btn-default btn-xs" data-toggle="tooltip" title="" data-original-title="<?php echo $this->lang->line('edit'); ?>">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <?php
                                                if ($logged_in_User_Role->id == 7) {
                                                ?>
                                                    <a onclick="taskdelete('<?php echo $result['id']; ?>')" class="btn btn-default btn-xs" data-toggle="tooltip" title="" data-original-title="<?php echo $this->lang->line('delete'); ?>">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                <?php
                                                }
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                            <?php
                                    $count++;
                                }
                            }
                            ?>

                        </div><!--.#accordion-->
                        <br /> <br />
                        <!-- <ul class="pagination">
                            <?php echo $this->pagination->create_links(); ?>
                        </ul> -->
                    </div>
                </div>
            </div><!--./row-->
    </section>
</div>

<!--------------Add Task modal------------->
<div id="newTask" class="modal fade " role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title" id="modal-title"></h4>
            </div>
            <form role="form" id="addtodo_form" method="post" enctype="multipart/form-data" action="">
                <div class="modal-body pt0 pb0">

                    <div class="row ptt10">
                        <div class="form-group col-md-4">
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

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('designation'); ?></label><small class="req"> *</small>

                            <select id="designation" name="designation" placeholder="" type="text" class="form-control">
                                <option value=""><?php echo $this->lang->line('select') ?></option>

                            </select>
                            <span class="text-danger"><?php echo form_error('designation'); ?></span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('department'); ?></label><small class="req"> *</small>
                            <select id="department" name="department" class="form-control" onchange="getStaffName(this.value)">
                                <option value=""><?php echo $this->lang->line('select') ?></option>
                                <?php foreach ($department as $key => $value) {
                                ?>
                                    <option value="<?php echo $value["id"] ?>" <?php echo set_select('department', $value['id'], set_value('department')); ?>><?php echo $value["department_name"] ?></option>
                                <?php }
                                ?>
                            </select>
                            <span class="text-danger"><?php echo form_error('department'); ?></span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('staff'); ?></label><small class="req"> *</small>
                            <select id="staff_id" name="staff_id" placeholder="" type="text" class="form-control" onchange="get_Name(this.value, this.options[this.selectedIndex].text)">
                                <option value=""><?php echo $this->lang->line('select') ?></option>

                            </select>
                            <span class="text-danger"><?php echo form_error('staff'); ?></span>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('staff') . " " . $this->lang->line('name'); ?></label>
                            <input type="text" name="staff_name" id="staff_name" class="form-control" readonly>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?><small class="req"> *</small></label>
                            <input class="form-control" name="task_title" id="task-title">
                            <span class="text-danger"><?php echo form_error('title'); ?></span>

                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('description') ?></label>
                            <textarea class="form-control" name="task_description" id="task-description"></textarea>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                            <input class="form-control datetime" type="text" autocomplete="off" name="task_date" placeholder="" id="task_date">
                            <input class="form-control" type="hidden" name="eventid" id="taskid">
                        </div>

                        <?php
                        // if ($loginrole != "Super Admin") { 
                        ?>
                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('status'); ?></label>
                            <select id="status" name="status" class="form-control">
                                <!-- <option value=""><?php echo $this->lang->line('select') ?></option> -->
                                <option value="pending"><?php echo $this->lang->line('pending'); ?></option>
                                <option value="completed"><?php echo $this->lang->line('completed'); ?></option>
                                <option value="in_progress"><?php echo $this->lang->line('in_progress'); ?></option>
                                <option value="not_started"><?php echo $this->lang->line('not_started'); ?></option>
                                <option value="cancelled"><?php echo $this->lang->line('cancelled'); ?></option>
                                <option value="hold"><?php echo $this->lang->line('hold'); ?></option>
                            </select>
                            <span class="text-danger"><?php echo form_error('status'); ?></span>
                        </div>
                        <?php
                        // } 
                        ?>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('priority'); ?></label>
                            <select id="priority" name="priority" class="form-control">
                                <option value="high"><?php echo $this->lang->line('high'); ?></option>
                                <option value="medium"><?php echo $this->lang->line('medium'); ?></option>
                                <option value="low"><?php echo $this->lang->line('low'); ?></option>
                                <option value="critical"><?php echo $this->lang->line('critical'); ?></option>
                                <option value="urgent"><?php echo $this->lang->line('urgent'); ?></option>
                            </select>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('reminder'); ?></label><br>
                            <input type="checkbox" name="task_reminder" placeholder="" id="task_reminder" value="1">

                        </div>

                        <div class="form-group col-md-4 showhid">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('interval_in_minutes'); ?></label>
                            <input class="form-control" type="text" name="task_minute" placeholder="" id="task_minute" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                        </div>
                    </div>
                </div>
                <div class="box-footer clear">
                    <div id="permission"><?php if ($this->rbac->hasPrivilege('assign_task', 'can_add')) { ?>

                            <input type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="addtodo_formbtn" class="btn btn-primary submit_addtask pull-right" value="<?php echo $this->lang->line('save'); ?>">
                        <?php } ?>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>backend/js/Chart.bundle.js"></script>
<script src="<?php echo base_url() ?>backend/js/utils.js"></script>

<script type="text/javascript">
    $("#accordion").accordion({
        heightStyle: "content",
        active: true,
        collapsible: true,
        header: ".accordianheader"
    });

    $(document).ready(function() {
        $(".accordianheader").click(function() {

        });

    });
</script>
<script type="text/javascript">
    $(document).ready(function() {

        $(document).on('click', '.close_notice', function() {
            var data = $(this).data();
            $.ajax({
                type: "POST",
                url: base_url + "admin/notification/read",
                data: {
                    'notice': data.noticeid
                },
                dataType: "json",
                success: function(data) {
                    if (data.status == "fail") {

                        errorMsg(data.msg);
                    } else {
                        successMsg(data.msg);
                    }

                }
            });
        });
    });
</script>
<!-- https://bootsnipp.com/snippets/Q6zjv -->
<script>
    function add_task() {
        $("#modal-title").html("<?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('task'); ?>");
        $("#task-title").val('');
        $("#taskid").val('');

        $('#newTask').modal('show');
        $('#task-date').datepicker({
            autoclose: true
        });
        $("#task-date").val('<?php echo date('m/d/Y') ?>');

    }

    function taskedit(eventid) {

        $.ajax({
            url: "<?php echo site_url("admin/calendar/getTaskIdData/") ?>" + eventid,
            type: "POST",
            data: {
                eventid: eventid
            },
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function(res) {

                $("#modal-title").html("<?php echo $this->lang->line('edit') . " " . $this->lang->line('task'); ?>");
                $("#task-title").val(res.task_title);
                $("#task-description").val(res.task_description);
                $("#taskid").val(eventid);
                if (res.task_reminder == 1) {
                    $("#task_reminder").prop("checked", true);
                    $('.showhid').show();
                } else {
                    $('.showhid').hide();
                    $("#task_reminder").prop("checked", false);
                }
                $("#staff_name").val(res.staff_name);
                $('#task_minute').val(res.task_int_min);
                $('#task_date').val(res.start_date);
                // $("#task_date").val(new Date(res.start_date).toString("MM-dd-yyyy hh:mm tt"));
                // $('#task_date').datepicker({
                //     autoclose: true
                // });
                $('#role').val(res.role_id);
                $('#designation').val(res.designation_id);
                $('#department').val(res.department_id);
                $('#staff_id').val(res.staff_id);

                // Check status and set dropdown value
                $('#status').val(res.status); // Set the selected status 
                $('#priority').val(res.priority);
                getDesignation(res.role_id, res.designation_id);
                getStaffName(res.department_id, res.staff_id, res.designation_id);

                // Disable all fields except status if not super admin
                <?php if ($loginrole != 'Super Admin') { ?>
                    $("#task-title").prop("readonly", true);
                    $("#task-description").prop("readonly", true);
                    $("#priority").prop("disabled", true);
                    $("#task_date").prop("disabled", true);
                    // $("#task_reminder").prop("disabled", true);
                    // $("#task_minute").prop("disabled", true);
                    $("#role").prop("disabled", true);
                    $("#designation").prop("disabled", true);
                    $("#department").prop("disabled", true);
                    $("#staff_id").prop("disabled", true);
                <?php } ?>

                $('#newTask').modal('show');

                $('#permission').html('<?php if ($this->rbac->hasPrivilege('assign_task', 'can_edit')) { ?><input type="submit" id="addtodo_formbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>"  class="btn btn-primary submit_addtask pull-right" value="<?php echo $this->lang->line('save'); ?>"><?php } ?>');

            }
        });
    }



    $(document).ready(function(e) {

        $("#addtodo_form").on('submit', (function(e) {
            // $("#addtodo_formbtn").button("loading");
            e.preventDefault();

            // Enable the disabled fields before submitting the form
            $("#priority").prop("disabled", false);
            $("#task_date").prop("disabled", false);
            $("#role").prop("disabled", false);
            $("#designation").prop("disabled", false);
            $("#department").prop("disabled", false);
            $("#staff_id").prop("disabled", false);

            // Show loading state for the submit button
            $("#addtodo_formbtn").button("loading");

            $.ajax({
                url: "<?php echo site_url("admin/calendar/addTask") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(res) {


                    if (res.status == "fail") {

                        var message = "";
                        $.each(res.error, function(index, value) {

                            message += value;
                        });
                        errorMsg(message);

                    } else {

                        successMsg(res.message);

                        window.location.reload(true);
                    }
                    $("#addtodo_formbtn").button("reset");
                }
            });
            // Disable the fields again after form submission
            // $("#task_date").prop("disabled", true);
            // $("#role").prop("disabled", true);
            // $("#designation").prop("disabled", true);
            // $("#department").prop("disabled", true);
            // $("#staff_id").prop("disabled", true);

        }));

    });




    function taskmarkcomplete(id) {

        var checkbox = $('#check' + id);

        if (checkbox.is(':checked')) {
            taskcomplete_event(id, 'yes');

        } else {

            taskcomplete_event(id, 'no');
        }
    }

    function taskcomplete_event(id, status) {
        //  alert("complete_event triggered with status: " + status);  // Alert or log the status

        $.ajax({
            url: "<?php echo site_url('admin/calendar/taskmarkcomplete/') ?>" + id,
            type: "POST",
            data: {
                id: id,
                active: status
            },
            dataType: 'json',
            success: function(res) {

                if (res.status === "fail") {
                    var message = "";
                    $.each(res.error, function(index, value) {
                        message += value;
                    });
                    errorMsg(message);
                } else {
                    successMsg(res.message);
                    window.location.reload(true);
                }
            }
        });
    }


    //////

    $(document).ready(function() {
        var role = $('#role').val();
        var selectedDesignation = '<?php echo set_value('designation'); ?>'; // Fetch the previously selected designation from PHP

        if (role !== '') {
            getDesignation(role, selectedDesignation);
        }
    });

    function getDesignation(roleId, selectedDesignation) {
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

    function getStaffName(staffId, selectedStaffName, degi) {

        var role = $('#role').val();
        var deg = ''; // Declare deg once

        // Check if degi is undefined or empty
        if (typeof degi === "undefined" || degi === '') {
            // If degi is undefined or empty, get the value from the #designation dropdown
            deg = $('#designation').val();
        } else {
            // Otherwise, use the passed-in degi value
            deg = degi;
        }

        var url = '<?php echo base_url(); ?>admin/staff/getStaffname/' + role + '/' + deg;
        $.ajax({
            url: url,
            type: 'POST',
            data: {
                staff: staffId,
                selected_staffname: selectedStaffName
            },
            dataType: 'json',
            success: function(response) {
                $('#staff_id').html(response.options); // Populate the designation dropdown

                // Set the selected value, if provided
                if (response.selected) {
                    $('#staff_id').val(response.selected);
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ', status, error);
            }
        });
    }

    function get_Name(value, name) {
        if (name == 'Select') {
            document.getElementById('staff_name').value = '';
            document.getElementById('erelated_to').value = '';
        } else {
            document.getElementById('staff_name').value = name;
            document.getElementById('erelated_to').value = name;
        }

    }

    $(document).ready(function() {
        $('.showhid').hide();
        $('#task_reminder').change(function() {
            if ($(this).is(':checked')) {
                $('.showhid').show();
            } else {
                $('.showhid').hide();
            }
        });
    });

    function taskdelete(id) {
        if (typeof(id) == 'undefined') {
            return;
        }
        if (confirm("Are you sure to delete this Task !")) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/calendar/delete_task/' + id,
                type: 'POST',
                //data: '',
                dataType: "json",
                success: function(res) {
                    if (res.status == "fail") {

                        errorMsg(res.message);

                    } else {

                        successMsg("Task Record Deleted Successfully");

                        window.location.reload(true);
                    }
                }

            })
        }

    }
</script>
<script>
    // Reload page when modal is closed
    $('#newTask').on('hidden.bs.modal', function() {
        window.location.reload();
    });
</script>
<script type="text/javascript">
    $(document).ready(function(e) {

        showdate('<?php echo $search_type; ?>');
        $('.detail_popover').popover({
            placement: 'right',
            title: '',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
    });

    function showdate(value) {
        if (value == 'period') {
            $('#fromdate').show();
            $('#todate').show();
        } else {
            $('#fromdate').hide();
            $('#todate').hide();
        }
    }
</script>