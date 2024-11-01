<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title><?php echo $this->lang->line('bill'); ?></title>
        <style type="text/css">
            .printablea4{width: 100%;}
            /*.printablea4 p{margin-bottom: 0;}*/
            .printablea4>tbody>tr>th,
            .printablea4>tbody>tr>td{padding:2px 0; line-height: 1.42857143;vertical-align: top; font-size: 12px;}
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
                        <td align="text-left"><h5><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['patient_name'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('appointment') . " " . $this->lang->line('no'); ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['appointment_no']; ?></h5>
                        </td>
                       
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('age'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['age'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('appointment') . " S." . $this->lang->line('no'); ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['id']; ?></h5>
                        </td>
                       
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('email'); ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['email'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('appointment') . " " . $this->lang->line('date'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['date']; ?></h5>
                        </td>
                       
                        </tr>

                        <tr>
                       
                        <td align="text-left"><h5><?php echo $this->lang->line('phone'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['mobileno'] ?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('appointment'). " Priority"; ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['appointment_priority'];?></h5>
                        </td>
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('gender'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['gender'] ?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('source'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['source'] ?></h5>
                        </td>
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('doctor'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['name']." ".$result['surname'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('status'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['appointment_status'] ?></h5>
                        </td>
                        
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('department'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['department_name'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('amount'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['doctor_fee'] ?></h5>
                        </td>
                        
                        </tr>
                        <tr>
                        <td align="text-left"><h5><?php echo $this->lang->line('collected_by'); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['collector_name']." ".$result['collector_surname'];?></h5>
                        </td>
                        <td align="text-left"><h5><?php echo $this->lang->line('message'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['message'] ?></h5>
                        </td>
                        
                        </tr>
                        <tr>
                  
                        <td align="text-left"><h5><?php echo $this->lang->line('address'); ?></th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<?php echo $result['patient_address'] ?></h5>
                        </td>
                        
                        </tr>
                 
                     
                    </table>
                    
<!--                     
                    <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                    <table class="printablea4" id="testreport" width="100%">
                        <tr>
                            <th><?php echo $this->lang->line('expire') . " " . $this->lang->line('date'); ?></th>
                            <th><?php echo $this->lang->line('quantity'); ?></th>
                            <th style="text-align: right;"><?php echo $this->lang->line('sale') . " " . $this->lang->line('price') . ' (' . $currency_symbol . ')'; ?></th>
                        </tr>
                        <?php
                        $j = 0;
                        foreach ($detail as $bill) {
                            ?>
                            <tr>
                
                                <td><?php echo $bill['expire_date']; ?></td>
                                <td><?php echo $bill["quantity"]; ?></td>
                                <td align="right"><?php echo $bill["sale_price"]; ?></td>
                            </tr>
                            <?php
                            $j++;
                        }
                        ?>
                         <tr>
            <td></td><td></td><td></td>
            <th><?php echo $this->lang->line('total'); ?></th>

            <td><?php echo $currency_symbol . "" . $result["total"]; ?></td>
        </tr>
                    </table>  -->
                    <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">

                    <table align="" class="printablea4" style="width: 30%; float: right;">
                        <?php if (!empty($result["total"])) { ?>
                            <tr>

                                <th><?php echo $this->lang->line('total') . " (" . $currency_symbol . ")"; ?></th>

                                <td align="right"><?php echo $result["total"]; ?></td>
                            </tr>
                        <?php } ?>
                        <?php if (!empty($result["discount"])) { ?>
                            <tr>
                                <th><?php
                                    echo $this->lang->line('discount') . " (" . $currency_symbol . ")";
                                    ;
                                    ?></th>

                                <td align="right"><?php echo $result["discount"]; ?></td>

                            </tr>
                        <?php } ?>
                        <?php if (!empty($result["tax"])) { ?>
                            <tr>
                                <th><?php
                                    echo $this->lang->line('tax') . " (" . $currency_symbol . ")";
                                    ;
                                    ?></th>

                                <td align="right"><?php echo $result["tax"]; ?></td>

                            </tr>
                        <?php } ?>
                        <?php
                        if ((!empty($result["discount"])) && (!empty($result["tax"]))) {
                            if (!empty($result["net_amount"])) {
                                ?>
                                <tr>
                                    <th><?php
                                        echo $this->lang->line('net_amount') . " (" . $currency_symbol . ")";
                                        ;
                                        ?></th>

                                    <td align="right"><?php echo $result["net_amount"]; ?></td>

                                </tr>
                                <?php
                            }
                        }
                        ?>
                        <?php if (!empty($result["note"])) { ?>
                            <tr>

                                <th><?php echo $this->lang->line('note'); ?></th>

                                <td align="right"><?php echo $result["note"]; ?></td>
                            </tr>
                        <?php } ?>
                        <?php if (($print) != 'yes') { ?>
                            <tr id="generated_by">

                                <th><?php echo $this->lang->line('collected_by'); ?></th>

                                <td align="right"><?php echo $result["name"] . " " . $result["surname"]; ?></td>
                            </tr>
                        <?php } ?>
                    </table>

                    <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">    
                    <p><?php
                        if (!empty($print_details[0]['print_footer'])) {
                           // echo $print_details[0]['print_footer'];
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
                url: '<?php echo base_url(); ?>admin/pharmacy/deletePharmacyBill/' + id,
                success: function (res) {
                    successMsg('<?php echo $this->lang->line('delete_message'); ?>');
                    window.location.reload(true);
                },
                error: function () {
                    alert("Fail")
                }
            });
        }
    }
    function printData(id) {

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/pharmacy/getBillDetails/' + id,
            type: 'POST',
            data: {id: id, print: 'yes'},
            success: function (result) {
                // $("#testdata").html(result);
                popup(result);
            }
        });
    }

    function popup(data)
    {
        var base_url = '<?php echo base_url() ?>';
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({"position": "absolute", "top": "-1000000px"});
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
        setTimeout(function () {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);
        return true;
    }
</script>