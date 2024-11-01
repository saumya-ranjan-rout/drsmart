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
                            <h5><?php echo $this->lang->line('patient') . " " . $this->lang->line('name') . " : "; ?><?php echo $result["patient_name"] ?>[<?php echo $result["patient_unique_id"] ?>]</h5>
                        </td>
                        <td align="right">
                            <h5><?php echo $this->lang->line('payment') . " " . $this->lang->line('date') . " : "; ?><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date'])) ?></h5>
                        </td>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="text-left">#</td>
                        <td align="text-left">
                            <h5><?php echo $this->lang->line('description'); ?></h5>
                        </td>
                        <td align="right">
                            <h5><?php echo $this->lang->line('amount') . "(". $currency_symbol .")"; ?></h5>
                        </td>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="text-left">1</td>
                        <td align="text-left">
                            <h5><?php echo $this->lang->line('payment') ." ". $this->lang->line('mode') ." : <br>"; ?><?php echo $this->lang->line(strtolower($result["payment_mode"])) ?></h5>
                        </td>
                        <td align="right">
                            <h5><?php echo $result["paid_amount"]; ?></h5>
                        </td>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="right">
                            <h5><?php echo $this->lang->line('total') . " : "; ?></h5>
                        </td>
                        <td align="right">
                            <h5><?php echo $result["paid_amount"]; ?></h5>
                        </td>
                    </tr>
                </table>
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