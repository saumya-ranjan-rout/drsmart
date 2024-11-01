<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><?php echo $this->lang->line('bill'); ?></title>
    <style type="text/css">
        .printablea4 {
            width: 100%;
        }

        /*.printablea4 p{margin-bottom: 0;}*/
        .printablea4>tbody>tr>th,
        .printablea4>tbody>tr>td {
            padding: 2px 0;
            line-height: 1.42857143;
            vertical-align: top;
            font-size: 12px;
        }
    </style>
</head>
<div id="html-2-pdfwrapper">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <div class="">
                <?php if (!empty($print_details[0]['print_header'])) { ?>
                    <div class="pprinta4">
                        <img src="<?php
                                    if (!empty($print_details[0]['print_header'])) {
                                        echo base_url() . $print_details[0]['print_header'];
                                    }
                                    ?>" class="img-responsive" style="height:100px; width: 100%;">
                    </div>
                <?php } ?>
                <table width="100%" class="printablea4">
                    <tr>
                        <td align="text-left">
                            <!-- <h5><?php echo $this->lang->line('bill') . " #"; ?><?php echo $result["ref_no"] ?></h5> -->
                        </td>
                        <td align="right">
                            <h5><?php echo $this->lang->line('report') . "  " . $this->lang->line('date') . " : "; ?><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['report_date'])) ?></h5>
                        </td>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <th width="20%"><?php echo $this->lang->line('name'); ?></th>
                        <td width="25%"><?php echo $result["patient_name"]; ?></td>
                        <th width="25%"><?php echo $this->lang->line('doctor'); ?></th>
                        <td width="30%" align="left"><?php echo $result["doctorname"] . " " . $result["doctorsurname"]; ?></td>
                    </tr>
                    <tr>
                        <th width="20%"><?php echo $this->lang->line('test') . " " . $this->lang->line('name'); ?></th>
                        <td width="25%"><?php echo $result["test_name"]; ?></td>
                        <th width="25%"><?php echo $this->lang->line('short') . " " . $this->lang->line('name'); ?></th>
                        <td width="30%" align="left"><?php echo $result["short_name"]; ?></td>
                    </tr>
                    <tr>
                        <th width="20%"><?php echo $this->lang->line('test') . " " . $this->lang->line('type'); ?></th>
                        <td width="25%"><?php echo $result["test_type"]; ?></td>
                        <th width="25%"><?php echo $this->lang->line('category') . " " . $this->lang->line('name'); ?></th>
                        <td width="30%" align="left"><?php echo $result["category_name"]; ?></td>
                    </tr>
                    <tr>
                        <th width="20%"><?php echo $this->lang->line('sub') . " " . $this->lang->line('category'); ?></th>
                        <td width="25%"><?php echo $result["sub_category"]; ?></td>
                        <th width="25%"><?php echo $this->lang->line('unit'); ?></th>
                        <td width="30%" align="left"><?php echo $result["unit"]; ?></td>
                    </tr>
                    <tr>
                        <th width="20%"><?php echo $this->lang->line('method'); ?></th>
                        <td width="25%"><?php echo $result["method"]; ?></td>
                        <th width="25%"><?php echo $this->lang->line('description'); ?></th>
                        <td width="30%" align="left"><?php echo $result["description"]; ?></td>
                    </tr>
                   
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
               
          

             
                <p><?php
                    if (!empty($print_details[0]['print_footer'])) {
                        echo $print_details[0]['print_footer'];
                    }
                    ?></p>
            </div>
        </div>
        <!--/.col (left) -->
    </div>
</div>

</html>
<script type="text/javascript">
    function delete_bill(id) {
        if (confirm('<?php echo $this->lang->line('delete_conform') ?>')) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/pathology/deletePharmacyBill/' + id,
                success: function(res) {
                    successMsg('<?php echo $this->lang->line('delete_message'); ?>');
                    window.location.reload(true);
                },
                error: function() {
                    alert("Fail")
                }
            });
        }
    }

    function printData(id) {

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/pathology/getBillDetails/' + id,
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