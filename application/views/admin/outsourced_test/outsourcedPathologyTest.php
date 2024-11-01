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

    .showhid {
        display: none;
    }
</style>

<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title titlefix"><?php echo "Outsourced"  . " " . $this->lang->line('test'); ?></h3>
                        <div class="box-tools pull-right">
                        <?php if ($this->rbac->hasPrivilege('pathology test', 'can_add')) { ?>

                            <!--   -->
                                <a onclick="holdModal('myOutsourcedTestModal')" data-toggle="modal" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo$this->lang->line('request') . " " . $this->lang->line('test'); ?></a>
                            <?php } ?>
                            <!-- <?php if ($this->rbac->hasPrivilege('pathology test', 'can_add')) { ?>
                                <a data-toggle="modal" onclick="holdModal('addTestReportModal')" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('pathology') . " " . $this->lang->line('test'); ?></a>
                            <?php } ?>
                            <?php if ($this->rbac->hasPrivilege('pathology test', 'can_view')) { ?>
                                <a href="<?php echo base_url(); ?>admin/pathology/getTestReportBatch" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('test') . " " . $this->lang->line('report'); ?></a>
                            <?php } ?> -->
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="download_label"><?php echo$this->lang->line('test'); ?></div>
                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                <th><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></th>
                                <th><?php echo $this->lang->line('report') . " " . $this->lang->line('date'); ?></th>
                                <th><?php echo $this->lang->line('doctor') . " " . $this->lang->line('name'); ?></th>
                                    <th><?php echo $this->lang->line('test') . " " . $this->lang->line('name'); ?></th>
                                    <th><?php echo $this->lang->line('short') . " " . $this->lang->line('name'); ?></th>
                                    <th><?php echo $this->lang->line('test') . " " . $this->lang->line('type'); ?></th>
                                    <th><?php echo $this->lang->line('category'); ?></th>
                                    <th><?php echo $this->lang->line('sub') . " " . $this->lang->line('category'); ?></th>
                                    <th><?php echo $this->lang->line('method'); ?></th>
                                    <th><?php echo $this->lang->line('unit'); ?></th>
                                   
                                    <th><?php echo $this->lang->line('action'); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (empty($resultlist)) {
                                ?>

                                    <?php
                                } else {
                                    $count = 1;
                                    foreach ($resultlist as $student) {
                                    ?>
                                        <tr class="">
                                        <td><?php echo $student['patient_name']; ?></td>
                                        <td><?php echo $student['report_date']; ?></td>
                                            <td><?php echo $student['doctorname']." ".$student['doctorsurname']; ?></td>                                            
                                            <td><?php echo $student['test_name']; ?></td>
                                            <td><?php echo $student['short_name']; ?></td>
                                            <td><?php echo $student['test_type']; ?></td>
                                            <td><?php echo $student['category_name']; ?></td>
                                            <td><?php echo $student['sub_category']; ?></td>
                                            <td><?php echo $student['method']; ?></td>
                                            <td><?php echo $student['unit']; ?></td>
                                          
                                            <td> <?php if ($this->rbac->hasPrivilege('add_patho_patient_test_report', 'can_add')) { ?>
                                                    <a href="#" onclick="printData('<?php echo $student['id'] ?>')" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('print'); ?>">
                                                        <i class="fa fa-print" aria-hidden="true"></i>
                                                    </a>
                                                    <a onclick="delete_record('<?php echo $student['id'] ?>')"  href='#' class="btn btn-default btn-xs"  data-toggle='tooltip'  data-original-title='<?php echo $this->lang->line('delete'); ?>'><i class='fa fa-trash'></i></a>
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

<div class="modal fade" id="myOutsourcedTestModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document" style="width:1200px;">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close pt4" data-dismiss="modal">&times;</button>
                <div class="row">
                    <div class="col-sm-6 col-xs-8">
                        <div class="form-group15">
                            <div>
                                <select onchange="get_Patient_Details(this.value)" style="width:100%" class="form-control select2" name='patient_id' id="addpatient_id">
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
                            <?php if ($this->rbac->hasPrivilege('pathology test', 'can_add')) { ?>
                                <a data-toggle="modal" id="add" onclick="holdModal('myModalpa')" class="modalbtnpatient"><i class="fa fa-plus"></i> <span><?php echo $this->lang->line('new') . " " . $this->lang->line('patient') ?></span></a>
                            <?php } ?>

                        </div>
                    </div><!--./col-sm-4-->
                </div><!-- ./row -->
            </div>

            <div class="modal-body pt0 pb0">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <form id="formoutsourced" accept-charset="utf-8" enctype="multipart/form-data" method="post" action="">
                            <div class="row row-eq">

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div id="ajax_loadd"></div>
                                    <div class="row ptt10" id="patientDetailss" style="display:none">
                                        <input type="hidden" name="pathology_id" id="patho_idd">
                                        <input type="hidden" name="patient_id" id="patho_patientidd">
                                        <div class="col-md-5 col-sm-5 col-xs-5" id="Myinfo">

<ul class="singlelist">
    <li class="singlelist24bold">
        <span id="patient_namee"></span>
    </li>
    <li>
        <i class="fas fa-user-secret" data-toggle="tooltip" data-placement="top" title="Patient"></i>
        <span id="guardiann"></span>
    </li>
</ul>
<ul class="multilinelist">
    <li>
        <i class="fas fa-venus-mars" data-toggle="tooltip" data-placement="top" title="Gender"></i>
        <span id="genderss"></span>
    </li>
    <li>
        <i class="fas fa-tint" data-toggle="tooltip" data-placement="top" title="Blood Group"></i>
        <span id="blood_groupp"></span>
    </li>
    <li>
        <i class="fas fa-ring" data-toggle="tooltip" data-placement="top" title="Marital Status"></i>
        <span id="marital_statuss"></span>
    </li>
</ul>
<ul class="singlelist">
    <li>
        <i class="fas fa-hourglass-half" data-toggle="tooltip" data-placement="top" title="Age"></i>
        <span id="agee"></span>
    </li>

    <li>
        <i class="fa fa-phone-square" data-toggle="tooltip" data-placement="top" title="Phone"></i>
        <span id="contact"></span>
    </li>
    <li>
        <i class="fa fa-envelope" data-toggle="tooltip" data-placement="top" title="Email"></i>
        <span id="emaill"></span>
    </li>
    <li>
        <i class="fas fa-street-view" data-toggle="tooltip" data-placement="top" title="Address"></i>
        <span id="addresss"></span>
    </li>
    <li>
        <i class="fa fa-barcode" data-toggle="tooltip" data-placement="top" title="Barcode"></i>
        <span id="barcodeee"></span>
    </li>
    <li>
        <i class="fa fa-qrcode" data-toggle="tooltip" data-placement="top" title="Qrcode"></i>
        <span id="qrcodeee"></span>
    </li>
    </ul>
   
</div><!-- ./col-md-9 -->
<div class="col-md-5 col-sm-5 col-xs-5">
<ul class="singlelist">
    <li class="singlelist24bold">
        <span ></span>
    </li>
    <li>
        <span ></span>
    </li>
</ul>
<ul class="singlelist">
<li>
        <b><?php echo $this->lang->line('any_known_allergies') ?> </b>
        <span id="allergiess"></span>
    </li>
    <li>
        <b><?php echo $this->lang->line('remarks') ?> </b>
        <span id="notee"></span>
    </li>
<li>
        <b><?php echo 'TPA' ?></b>
        <span id="tpaa"></span>
    </li>
    <li>
        <b><?php echo 'TPA ID' ?></b>
        <span id="tpa_idd"></span>
    </li>
    <li>
        <b><?php echo 'TPA Validity' ?></b>
        <span id="tpa_validityy"></span>
    </li>

    <li>
        <b><?php echo 'NIN' ?></b>
        <span id="identity_numberr"></span>
    </li>
   
    <li>
        <b><?php echo 'Alternate Number'; ?></b>
        <span id="alt_noo"></span>
    </li>
</ul>
</div>
                                        <div class="col-md-2 col-sm-2 col-xs-2">
                                            <div class="pull-right">
                                                <!--<b><?php echo $this->lang->line('patient') . " " . $this->lang->line('photo') ?> </b>-->
                                                <!--<span id="image"></span>-->
                                                <?php
                                                $file = "uploads/patient_images/no_image.png";
                                                ?>
                                                <img class="modal-profile-user-img img-responsive" src="<?php echo base_url() . $file ?>" id="imagee" alt="User profile picture">
                                            </div>
                                        </div><!-- ./col-md-3 -->
                                    </div>
                                </div><!--./col-md-8-->


                                <div class="col-lg-6 col-md-6 col-sm-6 col-eq ptt10">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label><?php echo $this->lang->line('test') . " " . $this->lang->line('date'); ?></label><small class="req"> *</small>
                                                <input type="text" id="report_datej" name="report_date" class="form-control date">
                                                <span class="text-danger"><?php echo form_error('reporting_date'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="exampleInputFile">
                                                    <?php echo $this->lang->line('refferal') . " " . $this->lang->line('doctor'); ?></label><small class="req"> *</small>
                                                <div>
                                                    <select class="form-control select2" style="width:100%" name='consultant_doctor' id="consultant_doctorj">
                                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                                        <?php foreach ($doctors as $dkey => $dvalue) {
                                                        ?>
                                                            <option value="<?php echo $dvalue["id"]; ?>"><?php echo $dvalue["name"] . " " . $dvalue["surname"] ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                                <span class="text-danger"><?php echo form_error('consultant_doctor'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('test') . " " . $this->lang->line('name'); ?></label>
                                        <small class="req"> *</small>
                                        <input type="text" name="test_name" id="test_namej" class="form-control" value="">
                                        <span class="text-danger"><?php echo form_error('test_name'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('short') . " " . $this->lang->line('name'); ?>
                                        </label>
                                        <small class="req"> *</small>
                                        <input type="text" name="short_name" id="short_namej" class="form-control" value="">
                                        <span class="text-danger"><?php echo form_error('short_name'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('test') . " " . $this->lang->line('type'); ?></label>
                                        <small class="req"> *</small>
                                        <input type="text" name="test_type" id="test_typej" class="form-control" value="">
                                        <span class="text-danger"><?php echo form_error('test_type'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="exampleInputFile">
                                            <?php echo $this->lang->line('category') . " " . $this->lang->line('name'); ?></label>
                                        <small class="req"> *</small>
                                        <div>
                                            <select class="form-control select2" name='pathology_category_id' id="pathology_category_idj" style="width: 100%">
                                                <option value=""><?php echo $this->lang->line('select') ?></option>
                                                <?php foreach ($categoryName as $dkey => $dvalue) {
                                                ?>
                                                    <option value="<?php echo $dvalue["id"]; ?>"><?php echo $dvalue["category_name"] ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('unit'); ?></label>

                                        <input type="text" name="unit" id="unitj" class="form-control" value="">
                                        <span class="text-danger"><?php echo form_error('unit'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('sub') . " " . $this->lang->line('category'); ?></label>
                                        <input type="text" name="sub_category" id="sub_categoryj" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="Method"><?php echo $this->lang->line('method'); ?></label>

                                        <input name="method" type="text" id="methodj" class="form-control" value="" />
                                    </div>
                                </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="description"><?php echo $this->lang->line('description'); ?></label>

                                                <textarea name="description" class="form-control"></textarea>
                                                <span class="text-danger"><?php echo form_error('description'); ?>
                                                </span>
                                            </div>
                                        </div>
                                      
                                    </div><!--./row-->
                                </div><!--./col-md-4-->
                            </div><!--./row-->

                            <div class="row">
                                <div class="box-footer">
                                    <div class="pull-right mrminus8">
                                        <button type="submit" id="formoutsourcedbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                                    </div>
                                    <div class="pull-right" style="margin-right:10px;">
                                        <button type="button" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right outsourcedprintsavebtn"><?php echo $this->lang->line('save') . " & " . $this->lang->line('print'); ?></button>
                                    </div>
                                </div>
                            </div><!--./row-->
                        </form>
                    </div><!--./col-md-12-->
                </div><!--./row-->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">






$(".outsourcedprintsavebtn").on('click', (function(e) {
//alert("hello");
    var form = $(this).parents('form').attr('id');
    var formElement = document.getElementById(form);
    var formData = new FormData();

    // Serialize all non-file inputs
    var str = $("#" + form).serializeArray();
    $.each(str, function(i, val) {
        formData.append(val.name, val.value);
    });

    // Handle file inputs separately
    $("#" + form + " input[type='file']").each(function() {
        var fileInput = $(this)[0];
        if (fileInput.files.length > 0) {
            formData.append(fileInput.name, fileInput.files[0]);
        }
    });

    $(".outsourcedprintsavebtn").button('loading');
    e.preventDefault();
    $.ajax({
        url: '<?php echo base_url(); ?>admin/Outesourced_Test/addoutsourcedPathologyTest',
        type: "POST",
        data: formData,
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
                printData(data.id);

                // window.location.reload(true);
            }
            $(".outsourcedprintsavebtn").button('reset');
        },
        error: function() {
            //  alert("Fail")
        }
    });


}));


    function printData(id) {
        //alert(id);
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/Outesourced_Test/getOutsourcedTestBill/' + id,
            type: 'POST',
            data: {
                id: id,
                print: 'yes'
            },
            success: function(result) {
                $("#testdata").html(result);
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
        // setTimeout(function () {
        //     window.frames["frame1"].focus();
        //     window.frames["frame1"].print();
        //     frame1.remove();
        //     window.location.reload(true);
        // }, 500);

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




        $("#formoutsourced").on('submit', (function(e) {
            e.preventDefault();

           // alert('Are you sure?');
            $("#formoutsourcedbtn").button('loading');
            $.ajax({
                url: '<?php echo base_url(); ?>admin/Outesourced_Test/addoutsourcedPathologyTest',
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
                    $("#formoutsourcedbtn").button('reset');
                },
                error: function() {
                    //  alert("Fail")
                }
            });
        }));
   


    function get_Patient_Details(id) {
//alert(id);
        // $("#patientDetailss").html("<?php echo $this->lang->line('loading') ?>");
        var base_url = "<?php echo base_url(); ?>backend/images/loading.gif";

        $("#ajax_loadd").html("<center><img src='" + base_url + "'/>");
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

                    $("#ajax_loadd").html("");
                    $("#patientDetailss").show();
                    //  $("#patientDetailss").html("<center><img src='"+base_url+"'backend/images/loading.gif/></center>");

                    $('#patient_unique_id').html(res.patient_unique_id);
                    $('#patho_patientidd').val(res.id);
                    $('#listname').html(res.patient_name);
                    $('#guardiann').html(res.guardian_name);
                    $('#listnumber').html(res.mobileno);
                    $('#emaill').html(res.email);

                    if (res.age == "") {
                        $("#agee").html("");
                    } else {
                        if (res.age) {
                            var age = res.age + " " + "Years";
                        } else {
                            var age = '';
                        }
                        if (res.month) {
                            var month = res.month + " " + "Month";
                        } else {
                            var month = '';
                        }
                        if (res.dob) {
                            var dob = "(" + res.dob + ")";
                        } else {
                            var dob = '';
                        }

                        $("#agee").html(age + "," + month + " " + dob);
                        // console.log(data.dob);
                    }

                    $('#doctname').val(res.name + " " + res.surname);
                    //$("#dob").html(res.dob);
                    $("#bp").html(res.bp);
                    //$("#month").html(res.month);
                    $("#symptoms").html(res.symptoms);
                    //$("#known_allergies").html(res.known_allergies);
                    $("#addresss").html(res.address);
                    $("#identity_numberr").html(res.identity_number);
                    $("#tpaa").html(res.organisation_name);
                $("#tpa_idd").html(res.tpa_id);
                $("#tpa_validityy").html(res.tpa_validity);
                $("#barcodeee").html(
    '<img class="" src="<?php echo base_url(); ?>uploads/barcode/' + res.id + '.png" id="" alt="User profile picture" width="66" height="32">'
);
$("#qrcodeee").html(
    '<img class="" src="<?php echo base_url(); ?>uploads/qrcode/' + res.id + '.png" id="" alt="User profile picture"width="60" height="60">'
);


               
                $("#alt_noo").html(res.alternative_no);
                    $("#notee").html(res.note);
                    $("#heightt").html(res.height);
                    $("#weightt").html(res.weight);
                    $("#genderss").html(res.gender);
                    $("#marital_statuss").html(res.marital_status);
                    $("#blood_groupp").html(res.blood_group);
                    $("#allergiess").html(res.known_allergies);
                    //$("#image").attr("src",res.image);
                    $("#imagee").attr("src", '<?php echo base_url() ?>' + res.image);

                } else {
                    $("#ajax_loadd").html("");
                    $("#patientDetailss").hide();
                }
            }
        });
    }
    function holdModal(modalId) {
        $('#' + modalId).modal({
            backdrop: 'static',
            keyboard: false,
            show: true
        });
    }


    function delete_record(id) {
        if (confirm('<?php echo $this->lang->line('delete_conform') ?>')) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/Outesourced_Test/outsourcedpathologydelete/' + id,
                type: "POST",
                data: {
                    opdid: ''
                },
                dataType: 'json',
                success: function(data) {
                    successMsg('<?php echo $this->lang->line('success_message'); ?>');
                    window.location.reload(true);
                }
            })
        }
    }


    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
        var capital_date_format = date_format.toUpperCase();
        $.fn.dataTable.moment(capital_date_format);

        $("body").delegate(".date", "focusin", function () {

            $(this).datepicker({
                todayHighlight: true,
                format: date_format,
                autoclose: true,
                language: '<?php echo $language_name ?>'
            });
        });
    $(function() {
        $('#easySelectable').easySelectable();
        //stopPropagation();
    })
    $(function() {
        //Initialize Select2 Elements
        $('.select2').select2()
    });
</script>



<?php $this->load->view('admin/patient/patientaddmodal') ?>