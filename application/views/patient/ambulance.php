<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
$genderList = $this->customlib->getGender();
?>


<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title titlefix"> <?php echo $this->lang->line('ambulance') . " " . $this->lang->line('bill'); ?></h3>
                        <!--<div class="box-tools pull-right">
                                        
                                <a data-toggle="modal" onclick="holdModal('myModal')" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('generate') . " " . $this->lang->line('bill'); ?></a>
                          
                          
                                <a href="<?php echo base_url(); ?>admin/pharmacy/search" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('medicines'); ?></a>
                           
                        </div> -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('pharmacy') . " " . $this->lang->line('bill'); ?></div>
                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo $this->lang->line('bill') . " " . $this->lang->line('no'); ?></th>
                                    <th><?php echo $this->lang->line('vehicle_model'); ?></th>
                                    <th><?php echo $this->lang->line('driver_name'); ?></th>
                                    <th><?php echo $this->lang->line('driver_contact'); ?></th>
                                    <th class="text-right"><?php echo $this->lang->line('amount'); ?></th>
                                    <th class="text-right"><?php echo $this->lang->line('action'); ?></th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (empty($resultlist)) {
                                ?>
                                    <!-- <tr>
                                                <td colspan="12" class="text-danger text-center"><?php //echo $this->lang->line('no_record_found');     
                                                                                                    ?></td>
                                              </tr> -->
                                    <?php
                                } else {
                                    $count = 1;
                                    foreach ($resultlist as $bill) {
                                    ?>
                                        <tr class="">
                                            <td><?php echo $bill['bill_no']; ?></td>
                                            <td><?php echo $bill['vehicle_model']; ?></td>
                                            <td><?php echo $bill['driver']; ?></td>
                                            <td><?php echo $bill['driver_contact']; ?></td>
                                            <td class="text-right"><?php echo $bill['amount']; ?></td>
                                            <td class="text-right">
                                                <a href="#"
                                                    onclick="viewDetail('<?php echo $bill['id'] ?>')"
                                                    class="btn btn-default btn-xs" data-toggle="tooltip"
                                                    title="<?php echo $this->lang->line('show'); ?>">
                                                    <i class="fa fa-reorder"></i>
                                                </a>
                                                <a href="#"
                                                    onclick="printData('<?php echo $bill['id'] ?>')"
                                                    class="btn btn-default btn-xs" data-toggle="tooltip"
                                                    title="<?php echo $this->lang->line('print'); ?>">
                                                    <i class="fa fa-print"></i>
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

<div class="modal fade" id="viewModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-toggle="tooltip" title="<?php echo $this->lang->line('clase'); ?>" data-dismiss="modal">&times;</button>
                <div class="modalicon">
                    <div id='edit_deletebill'>
                        <a href="#" data-target="#edit_prescription" data-toggle="modal" title="" data-original-title="<?php echo $this->lang->line('edit'); ?>"><i class="fa fa-pencil"></i></a>

                        <a href="#" data-toggle="tooltip" title="" data-original-title="<?php echo $this->lang->line('delete'); ?>"><i class="fa fa-trash"></i></a>
                    </div>
                </div>
                <h4 class="box-title"><?php echo $this->lang->line('bill') . " " . $this->lang->line('details'); ?></h4>
            </div>
            <div class="modal-body pt0 pb0">
                <div id="reportdata"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function viewDetail(id) {
        $.ajax({
            url: '<?php echo base_url() ?>patient/dashboard/getBillDetailsAmbulance/' + id,
            type: "GET",
            data: {
                id: id
            },
            success: function(data) {
                $('#reportdata').html(data);
                $('#edit_deletebill').html("<a href='#' data-toggle='tooltip' onclick='printData(" + id + ")'   data-original-title='<?php echo $this->lang->line('print'); ?>'><i class='fa fa-print'></i></a> ");
                holdModal('viewModal');
            },
        });
    }


    function holdModal(modalId) {
        $('#' + modalId).modal({
            backdrop: 'static',
            keyboard: false,
            show: true
        });
    }

    // print
    function printData(id) {

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'patient/dashboard/getBillDetailsAmbulance/' + id,
            type: 'POST',
            data: {
                id: id,
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
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);
        return true;
    }
</script>