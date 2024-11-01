<div class="content-wrapper">  

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">

                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('approve_leave_request'); ?></h3>
                        <?php
                        if ($this->rbac->hasPrivilege('approve_leave_request', 'can_add')) {
                            ?>
                            <small class="pull-right"><a href="#addleave" onclick="addLeave()" role="button" class="btn btn-primary btn-sm checkbox-toggle pull-right edit_setting"  /> <i class="fa fa-plus"></i> <?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('leave_request'); ?></a></small>
                        <?php } ?>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tab-pane active table-responsive no-padding">
                                    <div class="download_label"><?php echo $this->lang->line('approve_leave_request'); ?></div>
                                    <table class="table table-striped table-bordered table-hover example">
                                        <thead>

                                        <th><?php echo $this->lang->line('staff'); ?></th>
                                        <th><?php echo $this->lang->line('leave_type'); ?></th>
                                        <th><?php echo $this->lang->line('leave'); ?> <?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('days'); ?></th>
                                        <th><?php echo $this->lang->line('apply'); ?> <?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('status'); ?></th>
                                        <th class="text-right no-print"><?php echo $this->lang->line('action'); ?></th>

                                        </thead>
                                        <tbody>
                                            <?php
                                            $i = 0;
                                            foreach ($leave_request as $key => $value) {
                                                ?>
                                                <tr>   

                                                    <td><span data-toggle="popover" class="detail_popover" data-original-title="" title=""><?php echo $value['name'] . " " . $value['surname']; ?></span>
                                                        <div class="fee_detail_popover" style="display: none"><?php echo $this->lang->line('staff_id'); ?>: <?php echo $value['employee_id']; ?></div></td>
                                                    <td><?php echo $value["type"] ?></td>
                                                    <td><?php echo date($this->customlib->getSchoolDateFormat(), strtotime($value["leave_from"])) ?> - <?php echo date($this->customlib->getSchoolDateFormat(), strtotime($value["leave_to"])) ?></td>

                                                    <td><?php echo $value["leave_days"]; ?></td>
                                                    <td><?php echo date($this->customlib->getSchoolDateFormat(), strtotime($value["date"])); ?></td>
                                                    <?php
                                                    if ($value["status"] == "approve") {
                                                        $label = "class='label label-success'";
                                                    } else if ($value["status"] == "pending") {
                                                        $label = "class='label label-warning'";
                                                    } else if ($value["status"] == "disapprove") {
                                                        $label = "class='label label-danger'";
                                                    }
                                                    ?>
                                                    <td><span data-toggle="popover" class="detail_popover" data-original-title="" title=""><small <?php echo $label ?>><?php echo $status[$value["status"]]; ?></small></span>

                                                        <div class="fee_detail_popover" style="display: none"><?php echo $this->lang->line('submitted_by'); ?>: <?php echo $value['applied_by']; ?></div></td>
                                                <!--    <td class="pull-right no-print">
                                                        <a href="#leavedetails" onclick="getRecord('<?php echo $value["id"] ?>')" role="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('view'); ?>" ><i class="fa fa-reorder"></i></a>

                                                        <?php if ($value["applied_by"] == $this->customlib->getAdminSessionUserName()) { ?>
                                                            <?php
                                                            if ($this->rbac->hasPrivilege('approve_leave_request', 'can_edit')) {
                                                                ?> 
                                                                <a href="#addleave" onclick="editRecord('<?php echo $value["id"] ?>')" role="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>" ><i class="fa fa-pencil"></i></a>
                                                            <?php } ?>
                                                            <?php if (!empty($value['document_file'])) { ?>
                                                                <a href="<?php echo base_url(); ?>admin/staff/download/<?php echo $value['staff_id'] . "/" . $value['document_file']; ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('download'); ?>">
                                                                    <i class="fa fa-download"></i>
                                                                </a>  
                                                            <?php } ?>                               
                                                        <?php } ?>
                                                    </td>  -->



<td class="pull-right no-print">
    <a href="#leavedetails" onclick="getRecord('<?php echo $value['id']; ?>')" role="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('view'); ?>">
        <i class="fa fa-reorder"></i>
    </a>

    <?php if ($value['applied_by'] == $this->customlib->getAdminSessionUserName()) { ?>
        <?php if ($this->rbac->hasPrivilege('approve_leave_request', 'can_edit')) { ?> 
            <a href="#addleave" onclick="editRecord('<?php echo $value['id']; ?>')" role="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                <i class="fa fa-pencil"></i>
            </a>
        <?php } ?>
        
        <?php if (!empty($value['document_file'])) { ?>
            <a href="<?php echo base_url(); ?>admin/staff/download/<?php echo $value['staff_id'] . '/' . $value['document_file']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('download'); ?>">
                <i class="fa fa-download"></i>
            </a>  
        <?php } ?>                               
    <?php } ?>
</td>


                                                </tr>
                                                <?php
                                                $i++;
                                            }
                                            ?>                         


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>               
                </div>
            </div> </div>

    </section>
</div>

<div id="leavedetails" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('details'); ?></h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <form role="form" id="leavedetails_form" action="">
                        <div class="col-md-12 table-responsive">  
                            <table class="table mb0 table-striped table-bordered examples">
                                <tr>
                                    <th width="15%"><?php echo $this->lang->line('name'); ?></th>
                                    <td width="35%"><span id='name'></span></td>
                                    <th width="15%"><?php echo $this->lang->line('staff_id'); ?></th>
                                    <td width="35%"><span id="employee_id"></span>
                                        <span class="text-danger"><?php echo form_error('leave_request_id'); ?></span>
                                    </td>

                                </tr>
                                <tr>

                                    <th><?php echo $this->lang->line('submitted_by'); ?></th>
                                    <td><span id="appliedby"></span></td>
                                    <th><?php echo $this->lang->line('leave_type'); ?></th>
                                    <td><span id="leave_type"></span>
                                        <input id="leave_request_id" name="leave_request_id" placeholder="" type="hidden" class="form-control" />
                                        <span class="text-danger"><?php echo form_error('leave_request_id'); ?></span></td>
                                </tr>
                                <tr>
                                    <th><?php echo $this->lang->line('leave'); ?></th>
                                    <td><span id='leave_from'></span> - <label> </label><span id='leave_to'> </span> (<span id='days'></span>)
                                        <span class="text-danger"><?php echo form_error('leave_from'); ?></span></td>
                                    <th><?php echo $this->lang->line('apply'); ?> <?php echo $this->lang->line('date'); ?></th>
                                    <td><span id="applied_date"></span></td>
                                </tr>
                                <tr>

                                    <th><?php echo $this->lang->line('status'); ?></th>
                                    <td>
                                        <label class="radio-inline">
                                            <input type="radio" value="<?php echo "pending"; ?>" name="status" checked ><?php echo $status["pending"]; ?>
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" value="<?php echo "approve"; ?>" name="status"><?php echo $status["approve"]; ?>
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" value="<?php echo "disapprove"; ?>" name="status"><?php echo $status["disapprove"]; ?> 
                                        </label>
                                        <span class="text-danger"><?php echo form_error('status'); ?></span>
                                    </td>
                                    <th><?php echo $this->lang->line('reason'); ?></th>
                                    <td><span id="remark"> </span></td>
                                </tr> 
                                <tr>
                                    <input type="hidden" name="staff_id" id="staff_id">
                                    <input type="hidden" name="leave_type_id" id="leave_type_id">
                                    <input type="hidden" name="days_count" id="days_count">

                                    <input type="hidden" name="leave_fromm" id="leave_fromm">
                                    <input type="hidden" name="leave_too" id="leave_too">

                                    <th><?php echo $this->lang->line('note'); ?></th>
                                </tr>
                                <tr>
                                    <td colspan=" 4">
                                        <div id="reason">
                                            <textarea class="form-control" style="resize: none;" rows="2" id="detailremark" name="detailremark" placeholder=""></textarea>
                                            <span class="text-danger"><?php echo form_error('address'); ?></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <?php
                                    if ($this->rbac->hasPrivilege('approve_leave_request', 'can_edit')) {
                                        ?> 
                                        <td colspan="4">
                                            <button type="button" class="btn btn-primary submit_schsetting pull-right" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $this->lang->line('save'); ?></button>
                                        </td>
                                    <?php } ?>
                                </tr>
                            </table>
                        </div>
                    </form>                  
                </div>
            </div>
        </div>
    </div>
</div>


<div id="addleave" class="modal fade " role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('add'); ?>&nbsp;<?php echo $this->lang->line('details'); ?></h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <form role="form" id="addleave_form" method="post" enctype="multipart/form-data" action="">

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label>
                                <?php echo $this->lang->line('role'); ?></label><small class="req"> *</small>
                            <select name="role" class="form-control" onchange="getEmployeeName(this.value)">
                                <option value="" selected><?php echo $this->lang->line('select') ?></option>
                                <?php foreach ($staffrole as $rolekey => $rolevalue) {
                                    ?>
                                    <option value="<?php echo $rolevalue["type"] ?>"><?php echo $rolevalue["type"] ?></option>
                                <?php } ?>
                            </select>
                            <span class="text-danger"><?php echo form_error('role'); ?></span>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?php echo $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <select name="empname" id="empname" value=""onchange="   getLeaveTypeDDL(this.value)"  class="form-control">
                                <option value="" selected><?php echo $this->lang->line('select') ?></option>
                            </select> 
                            <span class="text-danger"><?php echo form_error('empname'); ?></span>
                        </div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?php echo $this->lang->line('apply'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                            <input type="text" id="applieddate" name="applieddate" value="<?php echo date($this->customlib->getSchoolDateFormat()) ?>" class="form-control"readonly>

                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6 ">
                            <label>
                                <?php echo $this->lang->line('leave_type'); ?></label> <small class="req"> *</small>
                            <div id="leavetypeddl">
                                <select name="leave_type" id="leave_type" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select') ?></option>
                                     <!-- <?php foreach ($leavetype as $leave_key => $leave_value) {
                                        ?>
                                        <option value="<?php echo $leave_value["id"] ?>"><?php echo $leave_value["type"] ?></option>
                                    <?php }
                                    ?> -->
                                </select>
                            </div>
                            <span class="text-danger"><?php echo form_error('leave_type'); ?></span>
                            <input type="hidden" name="leave_balance" id="leave_balance">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label><?php echo $this->lang->line('leave'); ?> <?php echo $this->lang->line('date'); ?></label><span class="req"> *</span>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" readonly name="leavedates" class="form-control pull-right daterangeo" id="reservation">
                            </div>

                            <!-- /.input group -->
                        </div>


                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?php echo $this->lang->line('reason'); ?></label><br/>
                            <textarea name="reason" id="reason" style="resize: none;" rows="4" class="form-control"></textarea>
                            <input type="hidden" name="leaverequestid" id="leaverequestid">
                        </div>

                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6" id="reason">
                            <label><?php echo $this->lang->line('note'); ?></label>

                            <textarea class="form-control" style="resize: none;" rows="4" id="remark" name="remark" placeholder=""></textarea>
                            <span class="text-danger"><?php echo form_error('remark'); ?></span>

                        </div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?php echo $this->lang->line('attach_document'); ?></label>
                            <input type="file" id="file" name="userfile" class="filestyle form-control">
                            <input type="hidden" id="filename" name="filename"> 
                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?php echo $this->lang->line('status'); ?> </label>
                            <br/>
                            <label class="radio-inline">

                                <input type="radio" value="<?php echo "pending" ?>" name="addstatus" checked><?php echo $status["pending"] ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" value="<?php echo "approve" ?>"  name="addstatus" ><?php echo $status["approve"] ?></label>
                            <label class="radio-inline">

                                <input type="radio" value="<?php echo "disapprove" ?>"  name="addstatus"><?php echo $status["disapprove"] ?></label>


                            <span class="text-danger"><?php echo form_error('addstatus'); ?></span>
                        </div>


                        <div class="clearfix"></div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <button type="submit" id="addleave_formbtn" class="btn btn-primary submit_addLeave pull-right" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $this->lang->line('save'); ?></button>
                            <input type="reset"  name="resetbutton" id="resetbutton" style="display:none">
                            <button type="button" style="display: none;" id="clearform" onclick="clearForm(this.form)" class="btn btn-primary submit_addLeave pull-right" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $this->lang->line('clear'); ?></button>

                        </div>




                    </form>                  
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var daterange_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'DD', 'm' => 'MM', 'Y' => 'YYYY']) ?>';

    $("body").delegate(".daterangeo", "focusin", function () {
        // Fetch the applied date value from the input field
        var appliedDate = $('#applieddate').val(); 

        // Parse the applied date using moment
        var minDate = moment(appliedDate, daterange_format);

        // Set the end of the year
        var endOfYear = moment().endOf('year'); // December 31st of the current year

        // Format the end of the year
        var endDateFormatted = endOfYear.format(daterange_format);

        $(this).daterangepicker({
            locale: {
                format: daterange_format,
            },
            minDate: minDate,  // Set the minimum date to the applied date
            maxDate: endDateFormatted, // Set the maximum date to the end of the year
        });
    });
</script>
<script type="text/javascript">
    /*--dropify--*/
    $(document).ready(function () {
        // Basic
        $('.filestyle').dropify();
    });
    /*--end dropify--*/
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.detail_popover').popover({
            placement: 'right',
            title: '',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
    });

    function addLeave() {
        $('input:radio[name=addstatus]').attr('checked', false);
        $('input[type=text]').val('');
        $('textarea[name="reason"]').text('');
        $('textarea[name="remark"]').text('');
        $("#resetbutton").click();
        $("#clearform").click();
        $('input:radio[name=addstatus]')[0].checked = true;
        var leavedate_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'MM', 'Y' => 'yyyy',]) ?>';
        var date = '<?php echo date("Y-m-d") ?>';
        $('input[type=text][name=applieddate]').val(new Date(date).toString(leavedate_format));

        $('#addleave').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    }


    function getRecord(id)
 {
        $('input:radio[name=status]').attr('checked', false);
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/leaverequest/leaveRecord',
            type: 'POST',
            data: {id: id},
            dataType: "json",
            success: function (result) {
                var leavedate_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'MM', 'Y' => 'yyyy',]) ?>';
                $('input[name="leave_request_id"]').val(result.id);
                $('#employee_id').html(result.employee_id);
                $('#name').html(result.name + ' ' + result.surname);
                $('#leave_from').html(new Date(result.leave_from).toString(leavedate_format));
                $('#leave_to').html(new Date(result.leave_to).toString(leavedate_format));
                $('#leave_type').html(result.type);
                $('#days').html(result.leave_days + ' Days');
                $('#remark').html(result.employee_remark);
                $('#applied_date').html(new Date(result.date).toString(leavedate_format));
                $('#appliedby').html(result.applied_by);
                $("#detailremark").text(result.admin_remark);
                
                $("#staff_id").val(result.staff_id);
                $("#leave_type_id").val(result.lid);
                $("#days_count").val(result.leave_days);
                $("#leave_fromm").val(result.leave_from);
                $("#leave_too").val(result.leave_to);
                
                if (result.status == 'approve') {

                    $('input:radio[name=status]')[1].checked = true;

                } else if (result.status == 'pending') {
                    $('input:radio[name=status]')[0].checked = true;

                } else if (result.status == 'disapprove') {
                    $('input:radio[name=status]')[2].checked = true;

                }


            }
        });

        $('#leavedetails').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    }
    ;



    $(document).on('click', '.submit_schsetting', function (e) {
        var $this = $(this);
        $this.button('loading');
        
        var staff_id=$('#staff_id').val();
        var leave_type_id=$('#leave_type_id').val();
        var days_count=$('#days_count').val();
        var frmdt=$('#leave_fromm').val();
        var todt=$('#leave_too').val();
        
        $.ajax({
            //url: '<?php echo site_url("admin/leaverequest/leaveStatus") ?>',
             url: '<?php echo site_url("admin/leaverequest/leaveStatus/") ?>'+staff_id+'/'+leave_type_id+'/'+days_count+'/'+frmdt+'/'+todt,
            type: 'post',
            data: $('#leavedetails_form').serialize(),
            dataType: 'json',
            success: function (data) {

                if (data.status == "fail") {

                    /*var message = "";
                    $.each(data.error, function (index, value) {

                        message += value;
                    });
                    errorMsg(message);*/
                    alert(data.message);
                } else {

                    successMsg(data.message);
                    window.location.reload(true);
                }

                $this.button('reset');
            }
        });
    });

    function checkStatus(status) {


        if (status == 'approve') {

            $("#reason").hide();
        } else if (status == 'pending') {

            $("#reason").hide();
        } else if (status == 'disapprove') {

            $("#reason").show();
        }

    }


    $(document).ready(function (e) {
        $("#addleave_form").on('submit', (function (e) {
            $("#addleave_formbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("admin/leaverequest/addLeave") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data)
                {
                    //alert(data);
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
                    $("#addleave_formbtn").button('reset');
                }
            });
        }));


    });


    function getEmployeeName(role) {
        var ne = "";
        var base_url = '<?php echo base_url() ?>';
        $("#empname").html('<option value=><?php echo $this->lang->line('select') ?></option>');
        var div_data = "";
        $.ajax({
            type: "POST",
            url: base_url + "admin/staff/getEmployeeByRole",
            data: {'role': role},
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, obj)
                {


                    div_data += "<option value='" + obj.id + "' >" + obj.name + " " + obj.surname + " " + "(" + obj.employee_id + ")</option>";
                });

                $('#empname').append(div_data);
            }
        });
    }

    function setEmployeeName(role, id = '') {
        var ne = "";
        var base_url = '<?php echo base_url() ?>';
        $("#empname").html("<option value=><?php echo $this->lang->line('select') ?></option>");
        var div_data = "";
        $.ajax({
            type: "POST",
            url: base_url + "admin/staff/getEmployeeByRole",
            data: {'role': role},
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, obj)
                {
                    if (obj.employee_id == id) {
                        ne = 'selected';
                    } else {
                        ne = "";
                    }

                    div_data += "<option value='" + obj.id + "' " + ne + " >" + obj.name + " " + obj.surname + " " + "(" + obj.employee_id + ")</option>";
                });

                $('#empname').append(div_data);

            }
        });

    }

   function getLeaveTypeDDL(id, lid = '') {
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/leaverequest/countLeavee/' + id,
            type: 'POST',
            data: {lid: lid},
            dataType: "json",
            success: function (result) {
              //  alert(result);
                if(result.pending_leaves > 0 && lid == ''){
                    alert("Staff already has pending leave requests.")
                }else{
                    $("#leavetypeddl").html(result.html);
                }

              


            }

        });
    }
    function editRecord(id) {

        var leave_from = '05/01/2018';
        var leave_to = '05/10/2018';
        $("#resetbutton").click();
        $('textarea[name="reason"]').text('');

        $('textarea[name="remark"]').text('');
        $('input:radio[name=addstatus]').attr('checked', false);

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/leaverequest/leaveRecord',
            type: 'POST',
            data: {id: id},
            dataType: "json",
            success: function (result) {
                leave_from = result.leavefrom;
                leave_to = result.leaveto;
                var daterange_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'DD', 'm' => 'MM', 'Y' => 'YYYY']) ?>';
                var leavedate_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'MM', 'Y' => 'yyyy',]) ?>';

                setEmployeeName(result.user_type, result.employee_id);
                getLeaveTypeDDL(result.staff_id, result.lid);
                $('select[name="role"] option[value="' + result.user_type + '"]').attr("selected", "selected");

                $('input[name="applieddate"]').val(new Date(result.date).toString(leavedate_format));

                $('input[name="leavefrom"]').val(new Date(result.leave_from).toString(leavedate_format));
                $('input[name="filename"]').val(result.document_file);
                $('input[name="leavedates"]').val(new Date(result.leave_from).toString(leavedate_format) + '-' + new Date(result.leave_to).toString(leavedate_format));
                $('#reservation').daterangepicker({
                    startDate: new Date(result.leave_from).toString(leavedate_format),
                    endDate: new Date(result.leave_to).toString(leavedate_format),
                    locale: {
                        format: daterange_format,
                    },
                });

                $('input[name="leaverequestid"]').val(id);
                $('textarea[name="reason"]').text(result.employee_remark);
                $('textarea[name="remark"]').text(result.admin_remark);

                if (result.status == 'approve') {

                    $('input:radio[name=addstatus]')[1].checked = true;

                } else if (result.status == 'pending') {
                    $('input:radio[name=addstatus]')[0].checked = true;

                } else if (result.status == 'disapprove') {
                    $('input:radio[name=addstatus]')[2].checked = true;

                }

            }
        });


        $('#addleave').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    }
    ;

    function clearForm(oForm) {

        var elements = oForm.elements;

        for (i = 0; i < elements.length; i++) {

            field_type = elements[i].type.toLowerCase();

            switch (field_type) {

                case "text":
                case "password":

                case "hidden":

                    elements[i].value = "";
                    break;

                case "select-one":
                case "select-multi":
                    elements[i].selectedIndex = "";
                    break;

                default:
                    break;
            }
        }
    }
    
    function GetLbalance(selectElement) {
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var available = selectedOption.getAttribute('data-available');
        console.log("Available Leave:", available);
        // You can now use the available variable as needed
        document.getElementById('leave_balance').value=available;
    }

    var daterange_format = 'DD-MM-YYYY';
     $("body").delegate(".daterange", "focusin", function () {
                $(this).daterangepicker({
                    locale: {
                        format: daterange_format,
                    },
                minDate: moment().startOf('day') // Disable past dates
                });
                
            }).on('apply.daterangepicker', function(ev, picker) {
            // Get the start and end dates
             var startDate = picker.startDate.format(daterange_format); // Format start date
             var endDate = picker.endDate.format(daterange_format); // Format end date
    
            // Calculate the difference in days
            var daysCount = picker.endDate.diff(picker.startDate, 'days') + 1;
            console.log("Number of days:", daysCount);
            //alert(daysCount);
           var leave_bal=$("#leave_balance").val();
           //alert(leave_bal+daysCount);
           if(daysCount>leave_bal){
              alert('You can not take leave more than your leave balance');
               $('#reservation').val(''); // Assuming the input field has the id 'reservation'
               $('#reservation').focus();
               $("#addleave_formbtn").attr("disabled", true);
           }else{
                $("#addleave_formbtn").removeAttr("disabled");
           }
           
     
    });

</script>