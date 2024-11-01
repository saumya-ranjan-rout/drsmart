<div class="content-wrapper" style="min-height: 946px;">  

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-2">
                <div class="box border0">
                    <ul class="tablists">
                        <?php //if ($this->rbac->hasPrivilege('hospital_charges', 'can_view')) { ?> <li>
                                <a href="<?php echo base_url(); ?>admin/appointment/onlineappointment/" ><?php echo 'Slots' ?></a></li>
                        <?php //} ?>
                        <?php //if ($this->rbac->hasPrivilege('charge_category', 'can_view')) { ?>
                            <li><a href="<?php echo base_url(); ?>admin/appointment/doctor_shift/" ><?php echo 'Doctor Shift'; ?></a></li>
                        <?php //} ?> 
                        <?php //if ($this->rbac->hasPrivilege('doctor_opd_charges', 'can_view')) { ?> 
                            <li><a href="<?php echo base_url(); ?>admin/appointment/shift/" class="active"><?php echo 'Shift' ?></a></li>
                        <?php //} ?> 
                                                                                 
                    </ul>
                </div>
            </div>
            <div class="col-md-10"> 
                <div class="box box-primary" id="tachelist">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo 'Shift' ?></h3>
                        <div class="box-tools pull-right">
                            <?php //if ($this->rbac->hasPrivilege('charge_category', 'can_add')) { ?> 
                                <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . Shift; ?></a>  
                            <?php //} ?>   
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php //echo Shift . " " . $this->lang->line('details'); ?></div>
                            <table class="table table-striped table-bordered table-hover example" >
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo 'Time From' ?></th>
                                        <th><?php echo 'Time To' ?></th>
                                         <th>Is Active</th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $count = 1;
                                    foreach ($shifts as $shift) {
                                        ?>
                                        <tr>
                                            <td><?php echo $shift['name']; ?></td>
                                            <td><?php echo $shift['time_from']; ?></td>
                                            <td><?php echo $shift['time_to']; ?></td>
                                             <?php 
                                              if ($shift["is_active"] == "1") {
                                            $label = "class='label label-success'";
                                            $value='Yes';
                                        } else if ($shift["is_active"] == "0") {
                                            $label = "class='label label-warning'";
                                             $value='No';
                                        } ?>
                                              
                                             
                                              
                                                <td><small <?php echo $label ?> ><?php echo $value; ?></small></td>



                                            <td class="text-right">
                                                <?php //if ($this->rbac->hasPrivilege('charge_category', 'can_edit')) { ?> 
                                                    <a onclick="get(<?php echo $shift['id']; ?>)" data-target="#editmyModal"  class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                <?php //} if ($this->rbac->hasPrivilege('charge_category', 'can_delete')) { ?> 
                                                   <!-- <a  class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="delete_recordById('<?php echo base_url(); ?>admin/appointment/delete_shift/<?php echo $shift['id'] ?>', '<?php echo $this->lang->line('delete_message'); ?>')";>
                                                        <i class="fa fa-trash"></i>
                                                    </a> -->
                                                <?php //} ?>
                                            </td>
                                        </tr>
                                        <?php
                                        $count++;
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="">
                        <div class="mailbox-controls">
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </section>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog modal-sm400" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"> <?php echo $this->lang->line('add') . " " . Shift ?></h4> 
            </div>

           

                <form id="addshift" action="<?php echo site_url('admin/appointment/add_shift') ?>"  id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                     <div class="modal-body pt0 pb0">
                    <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <span class="req"> *</span>
                                    <input  name="name" placeholder="" type="text" class="form-control"  value="" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="time_from">Time From</label>
                                <span class="req"> *</span>
                                <div class="form-group input-group">
                                    <input type="text" name="time_from" class="form-control time_from time" id="time_from" value="">
                                    <div class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="time_to">Time To</label>
                                <span class="req"> *</span>
                                <div class="form-group input-group">
                                    <input type="text" name="time_to" class="form-control time_to time" id="time_to" value="">
                                    <div class="input-group-addon">
                                        <span class="fa fa-clock-o"></span>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>   
                <div class="modal-footer clear">
                    <div class="pull-right">
                        <button type="submit" id="addshiftbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                    </div>
                </div>     
                
               
                </form>

               
        </div><!--./row--> 
    </div>
</div>


<div class="modal fade" id="editmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-sm400" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('edit') . " " . Shift; ?></h4> 
            </div>

            <div class="modal-body pt0 pb0">

                <form id="editshift" action="<?php echo site_url('admin/appointment/add_shift') ?>" name="employeeform" method="post" accept-charset="utf-8"  enctype="multipart/form-data">
                 <div class="modal-body pt0 pb0">
                    <div class="ptt10 row" id="">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <span class="req"> *</span>
                                <input id="edit_name" name="name" placeholder="" type="text" readonly class="form-control"  value="<?php
                            if (isset($result)) {
                                echo $result["name"];
                            }
                            ?>" />
                            <span class="text-danger"><?php echo form_error('name'); ?></span> 
                                <input id="shiftid" name="id" placeholder="" type="hidden" class="form-control"  />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="time_from">Time From</label>
                            <span class="req"> *</span>
                            <div class="form-group input-group">
                                <input type="text" name="time_from" class="form-control time_from time" id="edit_time_from" value="">
                                <div class="input-group-addon">
                                    <span class="fa fa-clock-o"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="time_to">Time To</label>
                            <span class="req"> *</span>
                            <div class="form-group input-group">
                                <input type="text" name="time_to" class="form-control time_to time" id="edit_time_to" value="">
                                <div class="input-group-addon">
                                    <span class="fa fa-clock-o"></span>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-sm-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Is Active</label>
                                <span class="req"> *</span>
                               <select class="form-control" id="is_active" name="is_active">
                                   <option value="1">Yes</option>
                                       <option value="0">No</option>
                                   </select>
                           
                            </div>
                        </div>
                        
                        
                       
                        
                    </div>
                </div>
                
              
                    <div class="row">
                        <div class="box-footer">
                            <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="editshiftbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </div>    
                </form>

            </div><!--./col-md-12-->       
        </div><!--./row--> 
    </div>
</div>

<script>

 $(document).on('focus', '.time', function () {
        var $this = $(this);
        $this.datetimepicker({
            format: 'LT'
        });
    });
    
    
    $(document).ready(function (e) {
        $('#addshift').on('submit', (function (e) {
            $("#addshiftbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
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
                    $("#addshiftbtn").button('reset');
                },
                error: function () {

                }
            });


        }));

    });


    function get(id) {
        $('#editmyModal').modal('show');

        $.ajax({

            dataType: 'json',

            url: '<?php echo base_url(); ?>admin/appointment/get_data_shift/' + id,

            success: function (data) {
                 $("#edit_name").val(data.name);
                $("#shiftid").val(id);
                $("#edit_time_from").val(data.time_from);
                $("#edit_time_to").val(data.time_to);
                 $("#is_active").val(data.is_active);

            }

        });

    }
 

    $(document).ready(function (e) {

        $('#editshift').on('submit', (function (e) {
            e.preventDefault();
            $("#editshiftbtn").button('loading');
            $.ajax({
                url: $(this).attr('action'),
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
                    $("#editshiftbtn").button('reset');
                },
                error: function () {

                }
            });


        }));

    });
</script>