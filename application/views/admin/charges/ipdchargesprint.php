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

        @media print {
            h4 {
                width: 100%;
                background-color: black;
                color: #fff;
                text-align: center;
                padding: 5px;
            }
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
                            <h5><?php echo $this->lang->line('date') . " : "; ?><?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date'])) ?></h5>
                        </td>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <th width="5%"> # &nbsp;</th>
                        <th width="15%"><?php echo $this->lang->line('charge') . " " . $this->lang->line('type'); ?></th>
                        <th width="15%"><?php echo $this->lang->line('charge') . " " . $this->lang->line('name'); ?></th>
                        <th width="15%"><?php echo $this->lang->line('standard') . " " . $this->lang->line('charges'); ?></th>
                        <th width="15%"><?php echo $this->lang->line('organisation') . " " . $this->lang->line('charges'); ?></th>
                        <th width="15%"><?php echo $this->lang->line('applied') . " " . $this->lang->line('charges'); ?></th>
                    </tr>
                </table>
                <hr style="height: 1px; clear: both;margin-bottom: 10px; margin-top: 10px">
                <table class="printablea4" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="5%"> 1 </td>
                        <td width="15%"><?php echo $result['charge_type']; ?></td>
                        <td width="15%"><?php echo $result['charge_category']; ?></td>
                        <td width="15%"><?php echo $result['standard_charge']; ?></td>
                        <td width="15%"><?php echo $result['org_charge']; ?></td>
                        <td width="15%"><?php echo $result['apply_charge']; ?></td>
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