<div class="content-wrapper" style="min-height: 946px;">  

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-2">
                <div class="box border0">
                    <ul class="tablists">
                        <?php //if ($this->rbac->hasPrivilege('hospital_charges', 'can_view')) { ?> <li>
                                <a href="<?php echo base_url(); ?>admin/appointment/onlineappointment/" class="active"><?php echo 'Slots' ?></a></li>
                        <?php //} ?>
                        <?php //if ($this->rbac->hasPrivilege('charge_category', 'can_view')) { ?>
                            <li><a href="<?php echo base_url(); ?>admin/appointment/doctor_shift/" ><?php echo 'Doctor Shift'; ?></a></li>
                        <?php //} ?> 
                        <?php //if ($this->rbac->hasPrivilege('doctor_opd_charges', 'can_view')) { ?> 
                            <li><a href="<?php echo base_url(); ?>admin/appointment/shift/"><?php echo 'Shift' ?></a></li>
                        <?php //} ?> 
                                                                                 
                    </ul>
                </div>
            </div>
            <div class="col-md-10"> 
                <div class="box box-primary" id="tachelist">
                    <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Slots</h3>
                        <div class="box-tools pull-right">
                        </div>
                    </div>
                    <form action="#" id="doctor_form" method="post" accept-charset="utf-8">
                        <div class="box-body">
                            <input type="hidden" name="ci_csrf_token" value="">                            <div class="row">
                                <div class="col-lg-3 col-md-3">
                                    <div class="form-group">
                                        <label>Doctor<small class="req"> *</small></label>
                                        <select autofocus=""  class="form-control select2"style="width: 100%" onchange="getDoctorShift()" id="doctor" name="doctor" >
                                          
                                                                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                        <?php foreach ($doctors as $dkey) {
                                            ?>
                                            <option value="<?php echo $dkey["id"] ?>"> <?php echo $dkey["name"] . " " . $dkey["surname"] ?></option> 
                                            <?php }?>
                                                                                    </select>
                                                                                    
                                                                                 
                                        <span class="text-danger"></span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <div class="form-group">
                                        <label>Shift<small class="req"> *</small></label>
                                        <select autofocus="" id="shift" name="shift" class="form-control">
                                            <option value="">Select</option> 
                                            <option value="1" >Morning</option>
                                            <option value="3">Evening</option></select>
                                        <span class="text-danger"></span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 mt-5">
                                    <label></label>
                                    <div class="form-group">
                                        <button type="button" onclick="search()" class="btn btn-primary btn-sm">Search</button>
                                    </div>
                                </div>
                            </div>
                    
                    <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group"> 
                                        <label>Consultation Duration<small class="req"> *</small></label>
                                        <input type="number" name="consult_time" form="form_Monday" value="15" placeholder="" class="form-control" id="consult_time">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Charge Category</label>
                                        <select name="charge_category" style="width: 100%" form="form_Monday" class="form-control ">
                                           
                                                                                            <option selected="" value="31">
                                                Appointment Charges                                                 </option>
                                                                                            
                                                                                    </select>
                                    </div>
                                </div> 
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Charge</label><small class="req"> *</small>
                                            <select name="charge_id" style="width: 100%" form="form_Monday" class="form-control">
                                               
                                                                                                <option selected="" value="9">
                                                Appointment  Fees</option>
                                                                                            </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Amount</label>
                                        <input type="text" class="form-control standard_charge" value="500.00" >
                                    </div>
                                </div>
                            </div>
                        </div></form>                    
                                        <div class="box-header ptbnull"></div>
                    <div class="nav-tabs-custom border0">
                        <ul class="nav nav-tabs" id="myTabs">
                                                            <li class="active"><a href="#tab_1" data-s="1" data-d="11" data-day="Monday" data-toggle="tab" aria-expanded="true">Monday</a></li>
                                                                            <li><a href="#tab_2" data-s="1" data-d="11" data-day="Tuesday" data-toggle="tab" aria-expanded="true">Tuesday</a></li>
                                                                <li><a href="#tab_3" data-s="1" data-d="11" data-day="Wednesday" data-toggle="tab" aria-expanded="true">Wednesday</a></li>
                                                                <li><a href="#tab_4" data-s="1" data-d="11" data-day="Thursday" data-toggle="tab" aria-expanded="true">Thursday</a></li>
                                                                <li><a href="#tab_5" data-s="1" data-d="11" data-day="Friday" data-toggle="tab" aria-expanded="true">Friday</a></li>
                                                                <li><a href="#tab_6" data-s="1" data-d="11" data-day="Saturday" data-toggle="tab" aria-expanded="true">Saturday</a></li>
                                                                <li><a href="#tab_7" data-s="1" data-d="11" data-day="Sunday" data-toggle="tab" aria-expanded="true">Sunday</a></li>
                                                        </ul>
                        <div class="tab-content">
                                                        <div class="tab-pane active" id="tab_1"><style type="text/css">
    .relative label.text-danger{position: absolute; left:5px; bottom:0;}
</style>
<div class="row clearfix">
    <div class="col-md-12 column">    
        <form method="POST" id="form_Monday" class="commentForm autoscroll" novalidate="novalidate">
            <input type="hidden" name="day" value="Monday">
            <input type="hidden" name="doctor" value="11">
            <input type="hidden" name="shift" value="1">
            <div class="">   
                <table class="table table-bordered table-hover order-list tablewidthRS" id="tab_logic">
                    <thead>
                        <tr>
                            <th>
                                Time From                            </th>
                            <th>
                                Time To                            </th>
                            <th class="text-right">
                                Action                            </th>
                        </tr>
                    </thead>
                    <tbody>
                                                    <input type="hidden" name="prev_array[]" value="5">
                            <tr id="addr0">
                                <td>
                                    <input type="hidden" name="total_row[]" value="1">
                                    <input type="hidden" name="prev_id_1" value="5">
                                    <div class="input-group">
                                        <input type="text" name="time_from_1" class="form-control time_from time" id="time_from_1" value="06:00 AM">
                                        <div class="input-group-addon">
                                            <span class="fa fa-clock-o"></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group">
                                        <input type="text" name="time_to_1" class="form-control time_to time" id="time_to_1" value="09:00 AM">
                                        <div class="input-group-addon">
                                            <span class="fa fa-clock-o"></span>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right" width="30">
                                                                    <button class="ibtnDel btn btn-danger btn-sm btn-danger"> <i class="fa fa-trash"></i></button>
                                                                </td>
                            </tr>
                                                <tr><td><input type="hidden" name="total_row[]" value="2"><input type="hidden" name="prev_id_2" value="0"><div class="input-group"><input type="text" name="time_from_2" class="form-control time_from time valid" id="time_from_2" aria-invalid="false" autocomplete="off"><div class="input-group-addon"><i class="fa fa-clock-o"></i></div></div></td><td><div class="input-group"><input type="text" name="time_to_2" class="form-control time_to time" id="time_to_2" aria-invalid="false"><div class="input-group-addon"><i class="fa fa-clock-o"></i></div></div></td><td width="30" class="text-right"><button type="button" class="ibtnDel btn btn-danger btn-sm btn-danger"><i class="fa fa-trash"></i></button></td></tr></tbody>
                </table>
                        <a id="add_row" class="addrow addbtnright btn btn-primary btn-sm pull-left"><i class="fa fa-plus"></i> Add New</a>
                </div>
                            <button class="btn btn-primary btn-sm pull-right" data-loading-text="Processing..." type="submit"><i class="fa fa-check-circle"></i> Save</button>
                      </form>
    </div>
</div>


</div>
                                                    <div class="tab-pane" id="tab_2">
                            </div>
                                                    <div class="tab-pane" id="tab_3">
                            </div>
                                                    <div class="tab-pane" id="tab_4">
                            </div>
                                                    <div class="tab-pane" id="tab_5">
                            </div>
                                                    <div class="tab-pane" id="tab_6">
                            </div>
                                                    <div class="tab-pane" id="tab_7">
                            </div>
                                                </div>
                    </div>
                </div>
                </div>
            </div> 
        </div>
    </section>
</div>
<script type="text/javascript">

  $(function () {
$('.select2').select2()
 });
                                                            
                                                            
                                                            
 $(document).on('focus', '.time', function () {
        var $this = $(this);
        $this.datetimepicker({
            format: 'LT'
        });
    });
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    var form_id = "Monday";
    $(function () {
        $('form#form_' + form_id).on('submit', function (event) {
        $('form#form_' + form_id).button('loading');

            $('input[id^="time_from_"]').each(function () {
                $(this).rules('add', {
                    required: true,
                    messages: {
                        required: "Required"
                    }
                });
            });

            $('input[id^="time_to_"]').each(function () {
                $(this).rules('add', {
                    required: true,
                    messages: {
                        required: "Required"
                    }
                });
            });

            // prevent default submit action         
            event.preventDefault();

            // test if form is valid 
            if ($('form#form_' + form_id).validate().form()) {
                var target = $('.nav-tabs .active a').attr("href");
                var target_id = $('.nav-tabs .active a').attr("id");
                var ajax_data = $('.nav-tabs .active a').data();

                $.ajax({
                    type: 'POST',
                    url: base_url + "admin/onlineappointment/saveDoctorShift",
                    data: $('#form_' + form_id).serialize(),
                    dataType: 'json',
                    beforeSend: function () {

                    },
                    success: function (data) {
                        $(target).html(data.html);
                        if (data.status == 1) {
                            successMsg(data.message);
                            $(target).html("");
                            getShiftdata(target, target_id, ajax_data);
                        } else if(data.status == 3) {
                             var message = 'Shift Start Time Should Be Greater Than End Time.';
                            alert(message);
                        } else if(data.status == 4){
                            var message = 'Shift Timing Overlapping.';
                            alert(message);
                        } else if(data.status == 5){
                            var message = 'Time Should Be Under Global Shift';
                            alert(message);
                        } else {
                            var list = $('<ul></ul>');
                            $.each(data.error, function (key, value) {
                                if (value != "") {
                                    list.append(value);
                                }
                            });
                            errorMsg(list);
                        }
                        $('form#form_' + form_id).button('reset');
                    },
                    error: function (xhr) { // if error occured

                    },
                    complete: function () {

                    }
                });
            } else {
                var message = 'Does Not Validate';
                errorMsg('Invalid Input')
                console.log(message);
                $('form#form_' + form_id).button('reset');
            }
        });

        // initialize the validator
        $('form#form_' + form_id).validate({
            errorClass: 'text-danger'
        });
    });








var tot_count = 0;
    var doctor = '11';

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href"); // activated tab
        var target_id = $(e.target).attr("id"); // activated tab
        var ajax_data = $(e.target).data(); // activated tab
        $(target).html("");
        getShiftdata(target, target_id, ajax_data);
    })

    function getShiftdata(target, target_id, ajax_data) {
        $("#consult_time").attr("form","form_"+ajax_data.day);
        $("#consult_fee").attr("form","form_"+ajax_data.day);
        $(".charge_category").attr("form","form_"+ajax_data.day);
        $(".charge").attr("form","form_"+ajax_data.day);
        $.ajax({
            type: 'POST',
            url: base_url + "admin/onlineappointment/getShiftdata",
            data: {'day': ajax_data.day, 'doctor': ajax_data.d, 'shift' : ajax_data.s},
            dataType: 'json',
            beforeSend: function () {
                $(target).addClass('show');
            },
            success: function (data) {
                $(target).html(data.html);
                tot_count = data.total_count + 1;
            },
            error: function (xhr) { // if error occured

            },
            complete: function () {
                $(target).removeClass('show');
            }
        });
    }

    $(document).ready(function () {
        $(".select2").select2();
        $('#myTabs a:first').tab('show');
        var counter = 0;

        $(document).on("click", ".addrow", function () {
            var newRow = $("<tr>");
            var cols = "";
            cols += '<td><input type="hidden" name="total_row[]" value="' + tot_count + '"><input type="hidden" name="prev_id_' + tot_count + '" value="0"><div class="input-group"><input type="text" name="time_from_' + tot_count + '" class="form-control time_from time" id="time_from_' + tot_count + '"  aria-invalid="false"><div class="input-group-addon"><i class="fa fa-clock-o"></i></div></div></td>';

            cols += '<td><div class="input-group"><input type="text" name="time_to_' + tot_count + '" class="form-control time_to time" id="time_to_' + tot_count + '"  aria-invalid="false"><div class="input-group-addon"><i class="fa fa-clock-o"></i></div></div></td>';

            cols += '<td width="30" class="text-right"><button type="button" class="ibtnDel btn btn-danger btn-sm btn-danger"><i class="fa fa-trash"></i></button></td>';
            newRow.append(cols);

            $("table.order-list").append(newRow);

            tot_count++;
        });

        $(document).on("click", ".ibtnDel", function (event) {
              if($(this).closest('tr').prev('input').val()){
                var msg = 'Are you Sure You Want To Delete?';
              if (confirm(msg)) {
              $(this).closest("tr").remove();
                counter -= 1
                 }
        return false;

    }else{
          $(this).closest("tr").remove();
                counter -= 1
    }
        });

        if($("#doctor").val() != ''){
            prev_val = 1;
            getDoctorShift(prev_val);
        }
    });


    function getDoctorShift(prev_val = 0){
        var doctor_id = $("#doctor").val();
        var select_box = "<option value=''>Select</option> ";
        $.ajax({
            type: 'POST',
            url: base_url + "admin/onlineappointment/doctorshiftbyid",
            data: {doctor_id:doctor_id},
            dataType: 'json',
            success: function(res){
                $.each(res, function(i, list){
                    selected = list.id == prev_val ? "selected" : "";
                    select_box += "<option value='"+ list.id +"' "+selected+">"+ list.name +"</option>";
                });
                $("#shift").html(select_box);
           }
        });
    }
    
    function search(){
        $( "#doctor_form" ).submit();
    }   


     $(document).on('select2:select','.charge_category',function(){
            var charge_category=$(this).val();          
            $('.charge').html("<option value=''>Loading...</option>");
            getchargecode(charge_category,"");
     });

    function getchargecode(charge_category,charge_id) {
      var div_data = "<option value=''>Select</option>";
      if(charge_category != ""){
          $.ajax({
            url: base_url+'admin/charges/getchargeDetails',
            type: "POST",
            data: {charge_category: charge_category},
            dataType: 'json',
            success: function (res) {              
                $.each(res, function (i, obj)
                {
                    var sel = "";
                    div_data += "<option value='" + obj.id + "'>" + obj.name + "</option>";
                });
                $('.charge').html(div_data);
                $(".charge").select2("val", charge_id);             
            }
        });
      }
    }

    $(document).on('select2:select','.charge',function(){
        var charge=$(this).val();
        var orgid = $("#organisation").val();
        var apply_amount=0;

        $.ajax({
                url: 'https://demo.smart-hospital.in/admin/patient/getChargeById',
                type: "POST",
                data: {charge_id: charge, organisation_id: 0},
                dataType: 'json',
                success: function (res) {
                    let standard_charge = parseFloat(res.standard_charge)+parseFloat(res.standard_charge*res.percentage/100)
                    $('.standard_charge').val(standard_charge.toFixed(2));
                }
        });
    });
</script>