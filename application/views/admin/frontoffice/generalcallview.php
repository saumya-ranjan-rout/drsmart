
<div class="content-wrapper" style="min-height: 348px;">  

    <?php $call_type = $this->customlib->getCalltype(); ?>
    <section class="content">
        <div class="row">

            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('phone_call_log'); ?> <?php echo $this->lang->line('list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php if ($this->rbac->hasPrivilege('phone_call_log', 'can_add')) { ?>
                                <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('call_log'); ?> </a> 
                            <?php } ?>


                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('phone_call_log'); ?></div>
                        <div class="table-responsive mailbox-messages">
                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('phone'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('date'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('next_follow_up_date'); ?></th>
                                        <th><?php echo $this->lang->line('call_type'); ?>
                                        </th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (empty($CallList)) {
                                        ?>

                                        <?php
                                    } else {
                                        foreach ($CallList as $key => $value) {
                                            // print_r($value);
                                            ?>
                                            <tr>
                                                <td class="mailbox-name"><?php echo $value['name']; ?></td>
                                                <td class="mailbox-name"><?php echo $value['contact']; ?></td>
                                                <td class="mailbox-name"><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($value['date'])); ?> </td>
                                                <td class="mailbox-name"> <?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($value['follow_up_date'])); ?></td>
                                                <td class="mailbox-name"> <?php echo $value['call_type']; ?></td>
                                                <td class="mailbox-date pull-right" "="">
                                                    <a  onclick="getRecord(<?php echo $value['id']; ?>)" class="btn btn-default btn-xs" data-target="#calldetails" data-toggle="tooltip"  data-original-title="<?php echo $this->lang->line('view'); ?>"><i class="fa fa-reorder"></i></a>   <?php if ($this->rbac->hasPrivilege('phone_call_log', 'can_edit')) { ?>
                                                        <a class="btn btn-default btn-xs" data-toggle="tooltip" onclick="get(<?php echo $value['id']; ?>);" data-target="#editmyModal" title="" data-original-title="<?php echo $this->lang->line('edit'); ?>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
                                                    <?php } ?>
                                                    <?php if ($this->rbac->hasPrivilege('phone_call_log', 'can_delete')) { ?>
                                                        <a  class="btn btn-default btn-xs" data-toggle="tooltip" title="" onclick="delete_recordById('<?php echo base_url('admin/generalcall/delete/' . $value['id']) ?>', '<?php echo $this->lang->line('delete_message') ?>')" data-original-title="<?php echo $this->lang->line('delete'); ?>">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    <?php } ?>
                                                </td>


                                            </tr>
                                            <?php
                                        }
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div><!--/.col (left) -->

            <!-- right column -->

        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- new END -->
<div id="calldetails" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('call') . " " . $this->lang->line('details') ?></h4>
            </div>
            <div class="modal-body" id="getdetails">


            </div>
        </div>
    </div>
</div>
</div><!-- /.content-wrapper -->
<div id="editmyModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="box-title"> <?php echo $this->lang->line('edit') . " " . $this->lang->line('call_log'); ?> </h4> 
            </div>

            <form id="editformadd" method="post" accept-charset="utf-8" enctype="multipart/form-data" >
                <div class="modal-body pt0 pb0">  
                    <div class="ptt10">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('name'); ?></label>  <small class="req"> *</small>
                                    <input type="text" id="ename" class="form-control"  name="name">
                                    <!-- value="<?php echo set_value('name'); ?>" -->
                                    <span class="text-danger"><?php echo form_error('name'); ?></span>
                                </div>
                            </div>
                            <!--<div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('phone'); ?></label>
                                    <input type="text" class="form-control" id="econtact" value="<?php echo set_value('contact'); ?>" name="contact">
                                </div>
                            </div>-->
                             <div class="col-sm-6">
                                <div class="form-group">
                                         <label for="pwd"><?php echo $this->lang->line('phone'); ?></label><small class="req"> *</small>
                                        <div class="input-group" style="display:flex;">
                                            <div class="input-group-prepend">
                                                <select id="countryCode" name="countryCode" class="form-control" style="padding: 0px;width: 58px;">
                                                    <option value="+965">+965</option>
                                                    <option value="+962">+962</option>
                                                </select>
                                            </div>
                                            <input id="number" autocomplete="off" name="number"  type="text" placeholder="" class="form-control"    oninput="this.value = this.value.replace(/[^0-9]/g, '');"/>
                                            <!-- value="<?php echo set_value('contact'); ?>" -->
                                        </div>
                                </div>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input id="edate" name="date" type="text" class="form-control" readonly="" />
                                    <span class="text-danger"><?php echo form_error('date'); ?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email"><?php echo $this->lang->line('description'); ?></label> 
                                    <textarea class="form-control" id="edescription" name="description"  rows="3"></textarea>
                                    <!-- <?php echo set_value('description'); ?> -->

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('next_follow_up_date'); ?></label>     <input id="efollow_up_date" name="follow_up_date" placeholder="" type="text" class="form-control"  readonly="readonly" />
                                        <!--  value="<?php echo set_value('follow_up_date'); ?>" -->
                                        <span class="text-danger"><?php echo form_error('follow_up_date'); ?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('call_duration'); ?></label>
                                    <input id="ecall_dureation" type="text" class="form-control"  name="call_dureation">
                                    <!-- value="<?php echo set_value('call_dureation'); ?>" -->
                                    <span class="text-danger"><?php echo form_error('call_dureation'); ?></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('note'); ?></label>
                                    <textarea class="form-control" id="enote" name="note" rows="3"></textarea>
                                    <!-- <?php echo set_value('note'); ?> -->
                                    <input type="hidden" name="id" id="generalcall_id" >
                                    <span class="text-danger"><?php echo form_error('note'); ?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('call_type'); ?></label>

                                    <small class="req"> *</small>  

                                    <?php
                                    $n = 1;
                                    foreach ($call_type as $key => $value) {
                                        ?>
                                        <label class="radio-inline"><input type="radio" id="<?php echo $n++; ?>" name="call_type" value="<?php echo $key; ?>" <?php if (set_value('call_type') == $key) { ?> checked=""<?php } ?>> <?php echo $value; ?></label>
<!--  -->
                                    <?php } ?>

                                    <span class="text-danger"><?php echo form_error('call_type'); ?></span>
                                </div>
                            </div>
                        </div>




                    </div><!-- /.box-body -->
                </div>

                <div class="box-footer">
                    <button type="submit" id="editformaddbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>
            </form>



        </div>

    </div>
</div>

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="box-title"> <?php echo $this->lang->line('add') . " " . $this->lang->line('call_log'); ?></h4> 
            </div>
            <form id="formadd" method="post" accept-charset="utf-8" enctype="multipart/form-data" >
                <div class="modal-body pt0 pb0">

                    <div class="ptt10">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('name'); ?></label>  <small class="req"> *</small>
                                    <input type="text" class="form-control"  name="name">
                                    <!-- value="<?php echo set_value('name'); ?>" -->
                                    <span class="text-danger"><?php echo form_error('name'); ?></span>
                                </div>
                            </div>
                           <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('phone'); ?></label>
                                    <input type="text" class="form-control" value="<?php echo set_value('contact'); ?>" name="contact">
                                </div>
                            </div>-->
                             <div class="col-sm-6">
                                <div class="form-group">
                                         <label for="pwd"><?php echo $this->lang->line('phone'); ?></label><small class="req"> *</small>
                                        <div class="input-group" style="display:flex;">
                                            <div class="input-group-prepend">
                                                <select id="countryCode" name="countryCode" class="form-control" style="padding: 0px;width: 58px;">
                                                    <option value="+965">+965</option>
                                                    <option value="+962">+962</option>
                                                </select>
                                            </div>
                                            <input id="number" autocomplete="off" name="number"  type="text" placeholder="" class="form-control"   oninput="this.value = this.value.replace(/[^0-9]/g, '');" />

                                            <!-- value="<?php echo set_value('contact'); ?>" -->
                                        </div>
                                </div>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input id="date" name="date" placeholder="" type="text" class="form-control"   readonly="readonly" />
                                    <!-- value="<?php echo set_value('date', date($this->customlib->getSchoolDateFormat())); ?>" -->
                                    <span class="text-danger"><?php echo form_error('date'); ?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email"><?php echo $this->lang->line('description'); ?></label> 
                                    <textarea class="form-control" id="description" name="description"  rows="3"><?php echo set_value('description'); ?></textarea>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('next_follow_up_date'); ?></label>     <input id="follow_up_date" name="follow_up_date" placeholder="" type="text" class="form-control"  readonly="readonly" />
                                        <!--  value="<?php echo set_value('follow_up_date'); ?>" -->
                                        <span class="text-danger"><?php echo form_error('follow_up_date'); ?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('call_duration'); ?></label>
                                    <input type="text" class="form-control"  name="call_dureation">
                                    <!-- value="<?php echo set_value('call_dureation'); ?>" -->
                                    <span class="text-danger"><?php echo form_error('call_dureation'); ?></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('note'); ?></label>
                                    <textarea class="form-control" id="description" name="note" name="note" rows="3"></textarea>
                                    <!-- <?php //echo set_value('note'); ?> -->
                                    <span class="text-danger"><?php echo form_error('note'); ?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('call_type'); ?></label>

                                    <small class="req"> *</small>  

                                    <?php foreach ($call_type as $key => $value) { ?>
                                        <label class="radio-inline"><input type="radio" name="call_type" value="<?php echo $key; ?>" <?php if (set_value('call_type') == $key) { ?> checked=""<?php } ?>> <?php echo $value; ?></label>

                                         <!--  -->

                                    <?php } ?>

                                    <span class="text-danger"><?php echo form_error('call_type'); ?></span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- /.box-body --> 

                <div class="box-footer">
                    <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="formaddbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>

            </form>


        </div>

    </div>
</div>
<script>
 $(document).ready(function () {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

        // Initialize date field (only future dates can be selected)
        $('#date').datepicker({
            format: date_format,
            startDate: '+0d', // Disable past dates
            autoclose: true,
            todayHighlight: true
        }).on('changeDate', function (selected) {
            var selectedDate = new Date(selected.date.valueOf());
         //   $('#follow_up_date').datepicker('setStartDate', selectedDate); // Set follow-up date start after selected date
            $('#follow_up_date').datepicker('setStartDate', selectedDate).prop('disabled', false); // Enable and set follow-up date start after selected date

// Clear the instruction date whenever applied date is changed
$('#follow_up_date').val(''); 
        });

        // Initialize follow-up date field
        $('#follow_up_date').datepicker({
            format: date_format,
            autoclose: true,
            todayHighlight: true,
            startDate: '+0d', // Disable past dates
        });

        // Alert if follow-up date is selected without main date
        $('#follow_up_date').focus(function () {
            if ($('#date').val() === '') {
                alert("Please select the date first.");
                $(this).blur();
            }
        });

        // Ensure follow-up date is greater than the selected date
        $('#follow_up_date').datepicker().on('changeDate', function (e) {
            var dateVal = $('#date').datepicker('getDate');
            var followUpDateVal = $('#follow_up_date').datepicker('getDate');

            if (followUpDateVal <= dateVal) {
                alert("The follow-up date must be greater than the selected date.");
                $('#follow_up_date').val(''); // Clear invalid follow-up date
            }
        });
    });


    // Function to initialize datepickers on the edit page

</script>
<script type="text/javascript">

    
    // $(document).ready(function () {
    //     var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

    //     $('#date').datepicker({

    //         format: date_format,
    //         endDate: '+0d',
    //         autoclose: true
    //     });



    // });

    $(document).ready(function () {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

        // $('#follow_up_date').datepicker({

        //     format: date_format,
        //     autoclose: true
        // });

        // $('#efollow_up_date').datepicker({

        //     format: date_format,
        //     autoclose: true
        // });


    });

    function getRecord(id) {

        $('#calldetails').modal('show');
        $.ajax({
            url: '<?php echo base_url(); ?>admin/generalcall/details/' + id,
            success: function (result) {

                $('#getdetails').html(result);
            }


        });
    }

    function get(id) {
    $('#editmyModal').modal('show');
    clearModalFields();
    $.ajax({
        dataType: 'json',
        url: '<?php echo base_url(); ?>admin/generalcall/get_calls/' + id,
        success: function (result) {
            var mobileno = result.contact;
            var modifiedMobileno = mobileno.substring(4);
            var countryCode = mobileno.substring(0, 4);

            if (result.call_type == "Incoming") {
                $('#1').prop("checked", true);
            } else {
                $('#2').prop("checked", true);
            }

            // Set values in modal fields
            $('#efollow_up_date').val(result.efollow_up_date);
            $('#epurpose').val(result.purpose);
            $('#ename').val(result.name);
            $('#number').val(modifiedMobileno);
            $('#countryCode').val(countryCode);
            $('#edate').val(result.datedd);
            $('#edescription').val(result.description);
            $('#enote').val(result.note);
            $('#generalcall_id').val(result.id);
            $('#ecall_dureation').val(result.call_dureation);

            // Initialize datepicker with fetched date

           // alert("1:" + result.datedd);
            initializeDatePickers(result.datedd, result.efollow_up_date);
        }
    });
}
// Clear modal fields before opening a new one
function clearModalFields() {
    $('#edate').val(''); // Clear date field
    $('#efollow_up_date').val(''); // Clear follow-up date field
    $('#epurpose').val(''); // Clear other modal fields as needed
    $('#ename').val('');
    $('#number').val('');
    $('#countryCode').val('');
    $('#edescription').val('');
    $('#enote').val('');
    $('#ecall_dureation').val('');
}
// Function to initialize datepickers on the edit page
// function initializeDatePickers(fetchedDate, fetchedFollowUpDate) {

//     var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
    
//     // Convert the fetched date string (dd-mm-yyyy) into a Date object
//     var dateParts = fetchedDate.split("-");
//     var fetchedDateObj = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]); // yyyy, mm, dd

//     alert("2:" + fetchedDateObj);

//     // Initialize 'date' field with fetched date as startDate
//     $('#edate').datepicker('destroy').datepicker({
//         format: date_format, // Set date format to dd-mm-yyyy
//         autoclose: true,
//         startDate: fetchedDateObj, // Set the fetched date as the minimum selectable date
//         todayHighlight: true // Optionally highlight today
//     }).datepicker('setDate', fetchedDateObj) // Set fetched date in datepicker
//     .on('changeDate', function (selected) {
//         var selectedDate = new Date(selected.date.valueOf());
//         $('#efollow_up_date').datepicker('setStartDate', selectedDate); // Ensure follow-up date is after selected date
//     });
//     alert("3:" + fetchedDateObj);
//     // Convert fetched follow-up date to Date object if provided
//     if (fetchedFollowUpDate) {
//         var followUpDateParts = fetchedFollowUpDate.split("-");
//         var fetchedFollowUpDateObj = new Date(followUpDateParts[2], followUpDateParts[1] - 1, followUpDateParts[0]);
//     }
//     alert("4:" + fetchedDateObj);
//     // Initialize follow-up date field, starting after the selected date or fetched date
//     $('#efollow_up_date').datepicker('destroy').datepicker({
//         format: date_format, // Set date format to dd-mm-yyyy
//         autoclose: true,
//         startDate: fetchedDateObj // Start follow-up date after the fetched 'date'
//     }).datepicker('setDate', fetchedFollowUpDateObj ? fetchedFollowUpDateObj : fetchedDateObj);

//     alert("5:" + fetchedDateObj);
//     // Alert if follow-up date is selected without selecting the main date
//     $('#efollow_up_date').focus(function () {
//         if ($('#edate').val() === '') {
//             alert("Please select the date first.");
//             $(this).blur();
//         }
//     });
//     alert("6:" + fetchedDateObj);

//     // Ensure follow-up date is greater than or equal to the selected date
//     $('#efollow_up_date').datepicker().on('changeDate', function (e) {
//         var dateVal = $('#edate').datepicker('getDate');
//         var followUpDateVal = $('#efollow_up_date').datepicker('getDate');

//         if (followUpDateVal <= dateVal) {
//             alert("The follow-up date must be greater than the selected date.");
//             $('#efollow_up_date').val(''); // Clear invalid follow-up date
//         }
//     });
//     alert("7:" + fetchedDateObj); 
// }


function initializeDatePickers(fetchedDate, fetchedFollowUpDate) {
    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
    
    // Convert the fetched date string (dd-mm-yyyy) into a Date object
    var dateParts = fetchedDate.split("-");
    var fetchedDateObj = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]); // yyyy, mm, dd

   // alert("2:" + fetchedDateObj);

    // Initialize 'date' field with fetched date as startDate
    $('#edate').datepicker({
        format: date_format,  // Set date format to dd-mm-yyyy
        autoclose: true,
        todayHighlight: true  // Optionally highlight today's date
    }).datepicker('setStartDate', fetchedDateObj)  // Update start date
      .datepicker('setDate', fetchedDateObj);  // Set the fetched date in the datepicker
    
   // alert("3:" + fetchedDateObj);
    
    // Convert fetched follow-up date to Date object if provided
    var fetchedFollowUpDateObj;
    if (fetchedFollowUpDate) {
        var followUpDateParts = fetchedFollowUpDate.split("-");
        fetchedFollowUpDateObj = new Date(followUpDateParts[2], followUpDateParts[1] - 1, followUpDateParts[0]);
    }
    
  //  alert("4:" + fetchedDateObj);

    // Initialize 'follow-up date' field, starting after the selected date or fetched date
    $('#efollow_up_date').datepicker({
        format: date_format,  // Set date format to dd-mm-yyyy
        autoclose: true,
        todayHighlight: true
    }).datepicker('setStartDate', fetchedDateObj)  // Update start date
      .datepicker('setDate', fetchedFollowUpDateObj ? fetchedFollowUpDateObj : fetchedDateObj);  // Set fetched follow-up date or fallback to fetched date

      $('#edate').datepicker().on('changeDate', function () {
        // Clear follow-up date when main date is changed
        $('#efollow_up_date').val('');

        // Update the follow-up date's start date after the new selected date
        var newSelectedDate = $(this).datepicker('getDate');
        $('#efollow_up_date').datepicker('setStartDate', newSelectedDate);
    });

   // alert("5:" + fetchedDateObj);

    // Ensure the follow-up date is selected after the main date
    $('#efollow_up_date').focus(function () {
        if ($('#edate').val() === '') {
            alert("Please select the main date first.");
            $(this).blur();
        }
    });

    // Ensure follow-up date is greater than or equal to the selected main date
    $('#efollow_up_date').datepicker().on('changeDate', function (e) {
        var dateVal = $('#edate').datepicker('getDate');
        var followUpDateVal = $('#efollow_up_date').datepicker('getDate');

        if (followUpDateVal <= dateVal) {
            alert("The follow-up date must be greater than the selected date.");
            $('#efollow_up_date').val(''); // Clear invalid follow-up date
        }
    });

  //  alert("6:" + fetchedDateObj); 
}

$(document).ready(function () {
    // This ensures datepickers work both for add and edit pages
    initializeDatePickers(); // Call with default empty arguments for add page
});


  //  $(document).ready(function (e) {
        $("#formadd").on('submit', (function (e) {

          //  alert("Form submitted");
            $("#formaddbtn").button('loading');
            e.preventDefault();

            var formData = new FormData(this);
        
        // Prepare a message string to alert
        var message = "Form Data:\n";
        for (var pair of formData.entries()) {
            message += pair[0] + ': ' + pair[1] + '\n';
        }

        // Alert the form data
       // alert(message);
            $.ajax({
                url: '<?php echo base_url(); ?>admin/generalcall/add',
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

                }
            });

        }));
   // });

   // $(document).ready(function (e) {
        $("#editformadd").on('submit', (function (e) {
          //  initializeDatePickers();
            $("#editformaddbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: '<?php echo base_url(); ?>admin/generalcall/edit',
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
                    $("#editformaddbtn").button('reset');

                },
                error: function () {

                }
            });

        }));
   // });
</script>
