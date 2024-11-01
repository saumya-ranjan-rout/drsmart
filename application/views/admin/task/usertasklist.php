<style>

    .ui-accordion{border: 1px solid #f4f4f4;}    
    .panel-heading {
        padding: 0;
        border: 0;
    }
    .panel-title > a,
    .panel-title > a:active {
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


    .notigybg{background: #fafafa; padding: 10px; overflow: hidden;font-weight: bold;}
    .notifyleft{width: 5%; float: left;}
    .notifymiddle{width: 13%; float: left;}
    .notifyright{width: 13%; float: left;}
    .noteangle{position: absolute; right:20px; font-size: 18px; top:20px;}
    .note-content{padding:10px 0px 15px 5.5%}

    .noteDM10{padding-top: 10px;}
    .unreadbg{background:#e1eeff;}
    .readbg{background:#fff;}
    .accordianheader{-webkit-transition: all 0.5s ease 0s;
                     -moz-transition: all 0.5s ease 0s;
                     -ms-transition: all 0.5s ease 0s;
                     -o-transition: all 0.5s ease 0s;
                     transition: all 0.5s ease 0s;}
    .accordianheader:focus,
    .accordianheader:visited,
    .accordianheader:hover{background:#f5f5f5;}
    @media(max-width:767px){
        .notifyleft{width: 60px;}
        .notifymiddle{width: 40%;}
        .notifyright{width: 20%;}
        .noteDM10{padding-top: 0px;}
        .note-content{padding-left: 70px;}
    }
</style>

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
                        <h3 class="box-title titlefix"><i class="fa fa-reorder"></i> <?php echo "Task List"; ?></h3>
                    </div>
                    <div class="box-body">



                        <div id="accordion" class="accordionclick">
                            <div class="notigybg">   
                                <div class="notifyleft" style=""><?php echo "Slno";?></div>                           
                                <div class="notifymiddle" style=""><?php echo "Staff Name"; ?></div>
                                <div class="notifymiddle" style=""><?php echo "Role"; ?></div>
                                <div class="notifymiddle" style=""><?php echo "Designation"; ?></div>
                                <div class="notifymiddle" style=""><?php echo "Department"; ?></div>
                                <div class="notifymiddle" style=""><?php echo "Status"; ?></div>
                                <div class="notifyright" style=""><?php echo $this->lang->line('date'); ?></div>
                            </div>   
                            <!-- yeah, yeah, I spelled Accordion wrong,  do something about it.  - G  -->
                            <?php if (empty($notifications)) { ?>
                                <?php
                            } else {
                                $count = 1;
                                $color = "";
                                foreach ($notifications as $result) {
                                   
                                    ?>
                                    <div class="accordianheader  <?php echo $class ?>" data-noticeid="<?php echo $result['id'] ?>">
                               
                                        <div class="notifyleft noteDM10"><?php echo  $count; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['name']." ".$result['surname']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['role_name']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['designation']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['department_name']; ?></div>
                                        <div class="notifymiddle noteDM10"><?php echo $result['status']; ?></div>
                                        <div class="notifyright noteDM10"><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['start_date'])); ?></div>
                                        <div class="noteangle" style=""><i class="fa fa-angle-down" ></i>
                                        </div>
                                    </div>
                                    <div class="accordianbody" style="position: relative;">
                                        <div class="note-content"> 
                                        <h4>Task Title</h4>
                                        <p> <?php echo $result['task_title']; ?></p>   
                                            <div>                                         
                                            <a onclick="taskedit('<?php echo $result['id']; ?>')" class="btn btn-default btn-xs" data-toggle="tooltip" title="" data-original-title="Edit">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </a>
                                         
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
                <h4 class="box-title" id="modal-title" ></h4>
            </div>
            <form role="form" id="addtodo_form" method="post" enctype="multipart/form-data" action="">  
                <div class="modal-body pt0 pb0">

                    <div class="row ptt10">
                   
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('role'); ?></label>
                        <input type="text" name="role" id="role" class="form-control" readonly>
                    </div>
                
                
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('designation'); ?></label>
                        <input type="text" name="designation" id="designation" class="form-control" readonly>
                    </div>
                
                
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('department'); ?></label>
                        <input type="text" name="department" id="department" class="form-control" readonly>
                    </div>
                   
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo "Staff Name"; ?></label>
                        <input type="text" name="staff_name" id="staff_name" class="form-control" readonly>
                    </div>
                 
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo "Status"; ?><small class="req"> *</small></label>
                        <select id="status" name="status"  class="form-control">
                            <option value=""><?php echo $this->lang->line('select') ?></option>
                            <option value="completed">Completed</option>
                            <option value="in-progress">In Progress</option>
                            <option value="not-started">Not Started</option>
                            <option value="cancelled">Cancelled</option>
                            <option value="hold">Hold</option>
                        </select>
                        <span class="text-danger"><?php echo form_error('status'); ?></span>
                    </div>
               
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?></label>
                        <input class="form-control" name="task_title"  id="task-title"> 
                    </div>


                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('date'); ?></label>
                        <input class="form-control datetime" type="text" autocomplete="off"  name="task_date" placeholder="" id="task_date">
                        <input class="form-control" type="hidden" name="eventid" id="taskid">
                    </div>
                    
                    <div class="form-group col-md-4">
                        <label for="exampleInputEmail1"><?php echo "Reminder"; ?></label><br>
                        <input type="checkbox"  name="task_reminder" placeholder="" id="task_reminder" value="1" disabled>
                       
                    </div>

                    <div class="form-group col-md-4 showhid">
                        <label for="exampleInputEmail1"><?php echo "Interval In Minutes"; ?></label>
                        <input class="form-control" type="number"  name="task_minute" placeholder="" id="task_minute" readonly>
                    </div>


                    </div>
                </div>
                <div class="box-footer clear"> 
                    <div id="permission"><?php if ($this->rbac->hasPrivilege('assign_task', 'can_add')) { ?>

                            <input type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>"  id="addtodo_formbtn" class="btn btn-primary submit_addtask pull-right" value="<?php echo $this->lang->line('save'); ?>">
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

    $(document).ready(function () {
        $(".accordianheader").click(function () {
           
        });

    });

</script>

<!-- https://bootsnipp.com/snippets/Q6zjv -->
 <script>
    



            function taskedit(eventid) {
     

                $.ajax({
                    url: "<?php echo site_url("admin/calendar/getUserTaskIdData/") ?>" + eventid,
                    type: "POST",
                    data: {eventid: eventid},
                    dataType: 'json',
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (res)
                    {
                        alert(res.role_name);
                        $("#modal-title").html("<?php echo $this->lang->line('edit') . " " . $this->lang->line('task'); ?>");
                        $("#task-title").val(res.task_title);
                        $("#taskid").val(eventid);
                        if(res.task_reminder==1){
                         $("#task_reminder").prop("checked", true);
                         $('.showhid').show();
                        }else{
                         $('.showhid').hide();
                         $("#task_reminder").prop("checked", false);
                        }
                        $("#staff_name").val(res.staff_name);
                        $('#task_minute').val(res.task_int_min);
                        $("#task_date").val(new Date(res.start_date).toString("MM-dd-yyyy hh:mm tt"));
                        $('#role').val(res.role_name);
                        $('#designation').val(res.designation);
                        $('#department').val(res.department_name);
                       
                        $('#newTask').modal('show');
                       
                        $('#permission').html('<?php if ($this->rbac->hasPrivilege('assign_task', 'can_edit')) { ?><input type="submit" id="addtodo_formbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>"  class="btn btn-primary submit_addtask pull-right" value="<?php echo $this->lang->line('save'); ?>"><?php } ?>');
                        
                                    }
                                });
                            }



                            $(document).ready(function (e) {

                                $("#addtodo_form").on('submit', (function (e) {
                                    $("#addtodo_formbtn").button("loading");
                                    e.preventDefault();
                                    $.ajax({
                                        url: "<?php echo site_url("admin/calendar/updateusertask") ?>",
                                        type: "POST",
                                        data: new FormData(this),
                                        dataType: 'json',
                                        contentType: false,
                                        cache: false,
                                        processData: false,
                                        success: function (res)
                                        {
                                          

                                            if (res.status == "fail") {

                                                var message = "";
                                                $.each(res.error, function (index, value) {

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
                                alert("complete_event triggered with status: " + status);  // Alert or log the status

                                $.ajax({
                                    url: "<?php echo site_url('admin/calendar/taskmarkcomplete/') ?>" + id,
                                    type: "POST",
                                    data: {id: id, active: status},
                                    dataType: 'json',
                                    success: function (res) {
                                       
                                        if (res.status === "fail") {
                                            var message = "";
                                            $.each(res.error, function (index, value) {
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

$(document).ready(function () {
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
        data: { role: roleId, selected_designation: selectedDesignation },
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

function getStaffName(staffId, selectedStaffName) {
 
        var role=$('#role').val();
        var deg=$('#designation').val();
     
   //alert(role+deg);
    var url = '<?php echo base_url(); ?>admin/staff/getStaffname/'+role+'/'+deg;
    $.ajax({
        url: url,
        type: 'POST',
        data: { staff: staffId, selected_staffname: selectedStaffName },
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
        if (typeof (id) == 'undefined') {
            return;
        }
        if (confirm("Are you sure to delete this Task !")) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/calendar/delete_task/' + id,
                type: 'POST',
                //data: '',
                dataType: "json",
                success: function (res) {
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