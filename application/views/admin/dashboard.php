<?php
$logged_in_User_Role = json_decode($this->customlib->getStaffRole());
?>
<style>
    .bg-purple,
    .callout.callout-success,
    .label-success,
    .modal-success .modal-body {
        background-color: #62419a !important;
    }

    .scrollable-table {
        height: 400px; overflow-y: auto;
    }

    @media (max-width: 768px) {
        .scrollable-table {
            height: 300px;
        }
    }

    @media (min-width: 769px) {
        .scrollable-table {
            height: 400px;
        }
    }

    .popup-box {
        display: none;
        position: fixed;
        z-index: 9999;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 20px;
        border: 2px solid #444;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);

    }


    .popup-overlay {
        display: none;
        position: fixed;
        z-index: 9998;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
    }

    /* .popup-box button {
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    */

    /* Label classes for different statuses */
    .label {
        padding: 3px;
        border-radius: 5px;
        color: white;
    }

    .label-primary {
        background-color: #007bff;
    }

    .label-info {
        background-color: #17a2b8;
    }

    .label-warning {
        background-color: #ffc107;
    }

    .bg-purple {
        background-color: #6f42c1;
    }
</style>
<!-- Popup Overlay -->
<!--<div id="popup-overlay" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1000;"></div>



<div id="popup-box" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background:white; padding:20px; border-radius:5px; box-shadow:0 0 10px rgba(0,0,0,0.5); z-index:1001;">
    <h4 style="text-align: center; font-weight: 700;">Task Overview</h4>
    <div id="popup-message" style="margin-bottom: 20px;"></div>
    
    <div style="display: flex; justify-content: center; gap: 10px;">
      <?php if ($this->rbac->hasPrivilege('assign_task', 'can_view')) { ?>
        <a href="<?php echo base_url(); ?>admin/calendar/task" class="btn btn-sm" style="border: 1px solid blue; color: black; padding: 5px 10px; text-decoration: none; border-radius: 5px;">
            <i class="fa fa-tasks"></i> <?php echo 'Task Details' ?>
        </a>
         <?php } ?>
        <button onclick="closePopup()" style="padding: 5px 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Close
        </button>
    </div>
</div>-->


<div id="popup-overlay" class="popup-overlay"></div>
<div id="popup-box" class="popup-box">
    <h4 style="text-align: center; font-weight: 700;">Task Overview</h4>
    <p id="popup-message"></p>
    <div style="display: flex; justify-content: center; gap: 10px;">
        <?php //if ($this->rbac->hasPrivilege('assign_task', 'can_view')) { 
        ?>
        <a href="<?php echo base_url(); ?>admin/calendar/task" class="btn btn-sm" style="border: 1px solid blue; color: black; padding: 5px 10px; text-decoration: none; border-radius: 5px;">
            <i class="fa fa-tasks"></i> <?php echo 'Task Details' ?>
        </a>
        <?php //} 
        ?>
        <button onclick="closePopup()" style="padding: 5px 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Close
        </button>
    </div>
</div>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">


                <?php
                $bar_chart = true;
                $line_chart = true;
                foreach ($notifications as $notice_key => $notice_value) {
                ?>

                    <div class="dashalert alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="alertclose close close_notice" data-dismiss="alert" aria-label="Close" data-noticeid="<?php echo $notice_value->id; ?>"><span aria-hidden="true">&times;</span></button>

                        <a href="<?php echo site_url('admin/notification') ?>"><?php echo $notice_value->title; ?></a>
                    </div>

                <?php
                }
                ?>

                <!--  <?php
                        if ($systemnotifications) {
                            foreach ($systemnotifications as $key => $systemnotification) {
                        ?>
                                    <div class="dashalert alert alert-success alert-dismissible" role="alert">
                                         <button type="button" class="alertclose close close_notice" data-dismiss="alert" aria-label="Close" data-noticeid="<?php echo $systemnotification['id']; ?>"><span aria-hidden="true">&times;</span></button>
                                         <a href="<?php echo site_url('admin/systemnotification') ?>"><?php echo $systemnotification["notification_title"]; ?></a>
                                     </div>   
                    <?php
                            }
                        }
                    ?> -->

            </div>
            <?php
            $currency_symbol = $this->customlib->getSchoolCurrencyFormat();
            ?>
            <?php
            $div_col = 12;
            $div_rol = 12;

            if ($this->rbac->hasPrivilege('staff_role_count_widget', 'can_view')) {
                $div_col = 9;
                $div_rol = 12;
            }

            $widget_col = array();
            if ($this->rbac->hasPrivilege('Monthly fees_collection_widget', 'can_view')) {
                $widget_col[0] = 1;
                $div_rol = 3;
            }

            if ($this->rbac->hasPrivilege('monthly_expense_widget', 'can_view')) {
                $widget_col[1] = 2;
                $div_rol = 3;
            }

            if ($this->rbac->hasPrivilege('student_count_widget', 'can_view')) {
                $widget_col[2] = 3;
                $div_rol = 3;
            }
            $div = sizeof($widget_col);

            if (!empty($widget_col)) {
                $widget = 12 / $div;
            } else {
                $widget = 12;
            }
            ?>
        </div><!--./row-->

        <div class="row">

            <?php
            if ($this->module_lib->hasActive('OPD')) {
                if ($this->rbac->hasPrivilege('opd_income_widget', 'can_view')) {
            ?>

                    <div class="col-lg-2 col-md-3 col-sm-6 col20
                         ">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/patient/search') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-stethoscope"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('opd') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($opd_income)) {
                                                                        echo $currency_symbol . ' ' . $opd_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php
            if ($this->module_lib->hasActive('IPD')) {
                if ($this->rbac->hasPrivilege('ipd_income_widget', 'can_view')) {
            ?>

                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/patient/ipdsearch') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-procedures"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('ipd') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($ipd_income)) {
                                                                        echo $currency_symbol . ' ' . $ipd_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php
            if ($this->module_lib->hasActive('pharmacy')) {
                if ($this->rbac->hasPrivilege('pharmacy_income_widget', 'can_view')) {
            ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/pharmacy/bill') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-mortar-pestle"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('pharmacy') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($pharmacy_income)) {
                                                                        echo $currency_symbol . ' ' . $pharmacy_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
                <?php
                }
            }
            if ($this->module_lib->hasActive('pathology')) {

                if ($this->rbac->hasPrivilege('pathology_income_widget', 'can_view')) {
                ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/pathology/search') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-flask"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('pathology') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($pathology_income)) {
                                                                        echo $currency_symbol . ' ' . $pathology_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php
            if ($this->module_lib->hasActive('radiology')) {
                if ($this->rbac->hasPrivilege('radiology_income_widget', 'can_view')) {
            ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/radio/search') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-microscope"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($radiology_income)) {
                                                                        echo $currency_symbol . ' ' . $radiology_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>

            <?php
            if ($this->module_lib->hasActive('operation_theatre')) {
                if ($this->rbac->hasPrivilege('ot_income_widget', 'can_view')) {
            ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/operationtheatre/otsearch') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-scissors"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('operation_theatre') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($operation_theatre_income)) {
                                                                        echo $currency_symbol . ' ' . $operation_theatre_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php
            if ($this->module_lib->hasActive('blood_bank')) {
                if ($this->rbac->hasPrivilege('blood_bank_income_widget', 'can_view')) {
            ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/bloodbank/issue') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-tint"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('blood_bank') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($blood_bank_income)) {
                                                                        echo $currency_symbol . ' ' . $blood_bank_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php
            if ($this->module_lib->hasActive('ambulance')) {
                if ($this->rbac->hasPrivilege('ambulance_income_widget', 'can_view')) {
            ?>


                    <div class="col-lg-2 col-md-3 col-sm-6 col20
                         ">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/vehicle/search') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-ambulance"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('ambulance') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($ambulance_income)) {
                                                                        echo $currency_symbol . ' ' . $ambulance_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php
                }
            }
            ?>
            <?php if ($this->module_lib->hasActive('income')) {

                if ($logged_in_User_Role->id == 7 || $logged_in_User_Role->id == 1 || $logged_in_User_Role->id == 2) { ?>
                    <div class="col-lg-2 col-md-3 col-sm-6 col20">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/income') ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-money-bill-wave"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('general') . " " . $this->lang->line('income'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($general_income)) {
                                                                        echo $currency_symbol . ' ' . $general_income;
                                                                    } else {
                                                                        echo "0";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                        <?php //}
                        ?>
                    </div><!--./col-lg-2-->

            <?php }
            } ?>
            <?php if ($this->module_lib->hasActive('expense')) {
                if ($logged_in_User_Role->id == 7 || $logged_in_User_Role->id == 1 || $logged_in_User_Role->id == 2) { ?>
                    <div class="col-lg-2 col-md-3 col-sm-6 col20
                     ">
                        <div class="info-box">
                            <a href="<?php echo site_url('admin/expense') ?>">
                                <span class="info-box-icon bg-purple"><i class="fab fa-creative-commons-nc"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $this->lang->line('expenses'); ?></span>
                                    <span class="info-box-number"><?php
                                                                    if (!empty($expense->amount)) {
                                                                        echo $currency_symbol . number_format($expense->amount, 2);
                                                                    } else {
                                                                        echo $currency_symbol . ' ' . "0.00";
                                                                    }
                                                                    ?></span>
                                </div>
                            </a>
                        </div>
                    </div><!--./col-lg-2-->
            <?php }
            } ?>

            <?php
            if ($logged_in_User_Role->id == 4) { ?>



                <div class="col-lg-2 col-md-3 col-sm-6 col20">
                    <div class="info-box">
                        <a href="<?php echo site_url('admin/pharmacy/expired_medicine') ?>">
                            <span class="info-box-icon bg-purple"><i class="fa fa-solid fa-ban"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Medicine Expired</span>
                                <span class="info-box-number"><?php

                                                                $expirynotifications = $this->notification_model->expiredMedicineNotification();
                                                                if (sizeof($expirynotifications) > 0) {
                                                                    echo sizeof($expirynotifications);
                                                                }
                                                                ?></span>
                            </div>
                        </a>
                    </div>
                </div>



                <div class="col-lg-2 col-md-3 col-sm-6 col20">
                    <div class="info-box">
                        <a href="<?php echo site_url('admin/pharmacy/search') ?>">
                            <span class="info-box-icon bg-purple"><i class="fas fa-capsules"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Medicines</span>
                                <span class="info-box-number"><?php
                                                                echo $medicine;

                                                                ?></span>
                            </div>
                        </a>
                    </div>
                </div>

                <?php
               // echo $low_stock_count;

                ?>

                <div class="col-lg-2 col-md-3 col-sm-6 col20">
                    <div class="info-box">
                        <a href="#">
                          <span class="info-box-icon bg-purple"><i class="fa fa-sort-amount-down"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Low Stock Medicines</span>
                                <span class="info-box-number"><?php
                                                                echo $low_stock_count;

                                                                ?></span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6 col20">
                    <div class="info-box">
                        <a href="#">
                          <span class="info-box-icon bg-purple"><i class="fa fa-sort-amount-down"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Out Of Stock Medicines</span>
                                <span class="info-box-number"><?php
                                                                echo $out_of_stock;

                                                                ?></span>
                            </div>
                        </a>
                    </div>
                </div>

                <!--<div class="col-lg-2 col-md-3 col-sm-6 col20">
                    <div class="info-box">
                        <a href="#">
                          <span class="info-box-icon bg-purple"><i class="fa fa-sort-amount-down"></i></span>
                            <div class="info-box-content">Low Stock
                                <span class="info-box-text">Medicine</span>
                                <span class="info-box-number"><?php
                                                                echo $low_stock_count;

                                                                ?></span>
                            </div>
                        </a>
                    </div>
                </div>-->


            <?php }  ?>













        </div><!--./row-->

        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('yearly_income_expense_chart', 'can_view')) {
            ?>
                <div class="col-lg-6 col-md-6 col-sm-12 col50">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('yearly_income_expense'); ?></h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <canvas id="lineChart" style="height:250px"></canvas>
                            </div>
                        </div>
                    </div>
                </div><!--./col-lg-7-->
            <?php } ?>
            <?php
            if ($this->rbac->hasPrivilege('monthly_income_expense_chart', 'can_view')) {
            ?>

                <div class="col-lg-6 col-md-6 col-sm-12 col50">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('upcoming_doctor_appointment_details'); ?></h3>
                        </div>
                        <div class="box-body">
                            <!-- Scrollable table container -->
                            <div class="table-responsive scrollable-table">

                                <table class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('doctor'); ?></th>
                                            <th><?php echo $this->lang->line('doctor') . " " . $this->lang->line('department'); ?></th>
                                            <th><?php echo $this->lang->line('date'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if (empty($resultlist)) {
                                            // Display custom message when no data is available
                                            echo '<tr>';
                                            echo '<td valign="top" colspan="3" class="dataTables_empty" style="text-align:center;">';
                                            echo 'No data available in table <br> <br>';
                                            echo '<img src="https://smart-hospital.in/shappresource/images/addnewitem.svg" width="150"><br><br>';
                                            echo '<span class="text-success bolds"><i class="fa fa-arrow-left"></i> Add new record or search with different criteria.</span>';
                                            echo '</td>';
                                            echo '</tr>';
                                        } else {
                                            $count = 1;
                                            foreach ($resultlist as $appointment) {
                                                // Filter to show only approved appointments
                                                if ($appointment["appointment_status"] == "approved") {
                                                    $given_datetime = $appointment['date'];
                                                    $given_date = DateTime::createFromFormat('Y-m-d H:i:s', $given_datetime)->format('Y-m-d');
                                                    $current_date = date('Y-m-d');

                                        ?>
                                                    <tr <?php if ($given_date == $current_date) { ?> style="background-color: #E4E4C9;" <?php } ?>>
                                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>>
                                                            <?php
                                                            echo '<span class="highlight-text">' . $appointment['name'] . " " . $appointment['surname'] . '</span>';
                                                            if (!empty($appointment['designation'])) {
                                                                echo "<br><small>" . $appointment['designation'] . "</small>";
                                                            }
                                                            ?>
                                                        </td>

                                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?>>
                                                            <span class="highlight-text"><b>
                                                                    <?php
                                                                    if (!empty($appointment['department_name'])) {
                                                                        echo $appointment['department_name'];
                                                                    }
                                                                    ?>
                                                                </b></span>
                                                        </td>
                                                        <td <?php if ($given_date == $current_date) { ?> style="font-weight: bold;" <?php } ?> class="date-cell">
                                                            <?php
                                                            // Extract time and date from the appointment datetime
                                                            $datetime = new DateTime($appointment['date']);
                                                            $time = $datetime->format('g:i A'); // 3:30 PM
                                                            $date = $datetime->format('jS M, Y'); // 18th Aug, 2024

                                                            // Output the formatted time and date
                                                            echo $time . '<br>' . $date;
                                                            ?>
                                                        </td>
                                                    </tr>
                                        <?php
                                                    $count++;
                                                }
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div>
                </div>

                <style>
                    .highlight-text {
                        color: #62419a;
                        font-weight: 500;
                    }

                    .date-cell {
                        background-color: #fde0ed;
                        border-radius: .313rem;
                        color: #ea4f9b;
                        display: inline-block;
                        font-size: 1rem;
                        font-weight: 400;
                        line-height: 1;
                        padding: .5rem .5rem;
                        text-align: center;
                        vertical-align: baseline;
                        white-space: nowrap;
                        margin-top: 5px;
                        margin-bottom: 5px;

                    }

                    .scrollable-table {
                        max-height: 250px;
                        /* Fixed height */
                        overflow-y: auto;
                        /* Vertical scroll */
                    }
                </style>

            <?php } ?>
        </div><!--./row-->
        <div class="row">
            <?php
            // Check if staff_role_count_widget can be viewed
            $show_staff_count = $this->rbac->hasPrivilege('staff_role_count_widget', 'can_view');
            // Determine column width based on the above condition
            $calendar_col_class = $show_staff_count ? 'col-lg-9 col-md-9 col-sm-12 col80' : 'col-lg-12 col-md-12 col-sm-12';
            ?>

            <div class="<?php echo $calendar_col_class; ?>">
                <?php
                if ($this->rbac->hasPrivilege('calendar_to_do_list', 'can_view')) {
                ?>
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('calendar'); ?></h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div><!--./calendar column-->

            <?php if ($show_staff_count) { ?>
                <div class="col-lg-3 col-md-3 col-sm-12 col20">
                    <?php foreach ($roles as $key => $value) { ?>
                        <div class="info-box">
                            <a href="<?php echo base_url() . "admin/staff" ?>">
                                <span class="info-box-icon bg-purple"><i class="fas fa-user-secret"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text"><?php echo $key; ?></span>
                                    <span class="info-box-number"><?php echo $value; ?></span>
                                </div>
                            </a>
                        </div>
                    <?php } ?>
                </div><!--./staff count column-->
            <?php } ?>
        </div><!--./row-->

    </section>
</div>
<div id="newEventModal" class="modal fade " role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo "Add New Event"; ?></h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <form role="form" id="addevent_form" method="post" enctype="multipart/form-data" action="">
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('title'); ?></label>
                            <input class="form-control" name="title" id="input-field">
                            <span class="text-danger"><?php echo form_error('title'); ?></span>

                        </div>

                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                            <textarea name="description" class="form-control" id="desc-field"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('date'); ?></label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" autocomplete="off" name="event_dates" class="form-control pull-right" id="date-field">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('color'); ?></label>
                            <input type="hidden" name="eventcolor" autocomplete="off" id="eventcolor" class="form-control">
                        </div>
                        <div class="form-group col-md-12">

                            <?php
                            $i = 0;
                            $colors = '';
                            foreach ($event_colors as $color) {
                                $color_selected_class = 'cpicker-small';
                                if ($i == 0) {
                                    $color_selected_class = 'cpicker-big';
                                }
                                $colors .= "<div class='calendar-cpicker cpicker " . $color_selected_class . "' data-color='" . $color . "' style='background:" . $color . ";border:1px solid " . $color . "; border-radius:100px'></div>";

                                $i++;
                            }
                            echo '<div class="cpicker-wrapper">';
                            echo $colors;
                            echo '</div>';
                            ?>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('type'); ?></label>
                            <br />
                            <label class="radio-inline">

                                <input type="radio" name="event_type" value="public" id="public"><?php echo $this->lang->line('public'); ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="event_type" value="private" checked id="private"><?php echo $this->lang->line('private'); ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="event_type" value="sameforall" id="public"><?php echo $this->lang->line('all'); ?> <?php echo $role ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="event_type" value="protected" id="public"><?php echo $this->lang->line('protected'); ?>
                            </label>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn btn-primary submit_addevent pull-right" value="<?php echo $this->lang->line('save'); ?>">
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div id="viewEventModal" class="modal fade " role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo "View Event"; ?></h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <form role="form" method="post" id="updateevent_form" enctype="multipart/form-data" action="">
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event') ?><?php echo $this->lang->line('title') ?></label>
                            <input class="form-control" name="title" placeholder="Event Title" id="event_title">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('description') ?></label>
                            <textarea name="description" class="form-control" placeholder="Event Description" id="event_desc"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event') ?><?php echo $this->lang->line('date') ?></label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" autocomplete="off" name="eventdates" class="form-control pull-right" id="eventdates">
                            </div>
                        </div>
                        <input type="hidden" name="eventid" id="eventid">
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event') ?><?php echo $this->lang->line('color') ?></label>
                            <input type="hidden" name="eventcolor" autocomplete="off" placeholder="Event Color" id="event_color" class="form-control">
                        </div>
                        <div class="form-group col-md-12">

                            <?php
                            $i = 0;
                            $colors = '';
                            foreach ($event_colors as $color) {
                                $colorid = trim($color, "#");
                                $color_selected_class = 'cpicker-small';
                                if ($i == 0) {
                                    $color_selected_class = 'cpicker-big';
                                }
                                $colors .= "<div id=" . $colorid . " class='calendar-cpicker cpicker " . $color_selected_class . "' data-color='" . $color . "' style='background:" . $color . ";border:1px solid " . $color . "; border-radius:100px'></div>";
                                $i++;
                            }
                            echo '<div class="cpicker-wrapper selectevent">';
                            echo $colors;
                            echo '</div>';
                            ?>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('event') ?><?php echo $this->lang->line('type') ?></label>
                            <label class="radio-inline">

                                <input type="radio" name="eventtype" value="public" id="public"><?php echo $this->lang->line('public') ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="eventtype" value="private" id="private"><?php echo $this->lang->line('private') ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="eventtype" value="sameforall" id="public"><?php echo $this->lang->line('all') ?> <?php echo $role ?>
                            </label>
                            <label class="radio-inline">

                                <input type="radio" name="eventtype" value="protected" id="public"><?php echo $this->lang->line('protected') ?>
                            </label>
                        </div>

                        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">

                            <input type="submit" class="btn btn-primary submit_update pull-right" value="<?php echo $this->lang->line('save'); ?>">
                        </div>
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            <?php if ($this->rbac->hasPrivilege('calendar_to_do_list', 'can_delete')) { ?>
                                <input type="button" id="delete_event" class="btn btn-primary submit_delete pull-right" value="<?php echo $this->lang->line('delete'); ?>">
                            <?php } ?>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>backend/js/Chart.bundle.js"></script>
<script src="<?php echo base_url() ?>backend/js/utils.js"></script>
<script type="text/javascript">
    window.onload = function() {
        var dataPointss = [];
        console.log(dataPointss);


        var yearly_collection_array = <?php echo json_encode($yearly_collection) ?>;
        var yearly_expense_array = <?php echo json_encode($yearly_expense) ?>;
        var MONTHS = <?php echo json_encode($total_month) ?>;
        console.log(yearly_collection_array);
        console.log(yearly_expense_array);


        var config = {
            type: 'line',
            data: {
                labels: MONTHS,
                datasets: [

                    {
                        label: '<?php echo $this->lang->line('income') ?>',
                        fill: false,
                        backgroundColor: '#62419a',
                        borderColor: '#62419a',
                        data: yearly_collection_array,
                    },

                    {
                        label: '<?php echo $this->lang->line('expense') ?>',
                        backgroundColor: '#ea4f9b',
                        borderColor: '#ea4f9b',
                        data: yearly_expense_array,
                        fill: false,
                    }
                ]
            },
            options: {
                responsive: true,
                title: {
                    display: false,
                    text: 'Chart Data'
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: false,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: false,
                            labelString: 'Value'
                        },

                    }]
                }
            }
        };

        var ctx = document.getElementById('lineChart').getContext('2d');
        window.myLine = new Chart(ctx, config);

        /* Pie chart */
        var ph = "pharmacy";

        var dataPointss = [];
        var color = ['#f56954', '#00a65a', '#f39c12', '#2f4074', '#00c0ef', '#3c8dbc', '#d2d6de', '#b7b83f'];

        var datas = <?php echo json_encode($jsonarr) ?>;
        //console.log(datas);

        function addData(datap) {
            for (var i = 0; i < datap.value.length; i++) {
                lb = datap.label[i];

                console.log(lb);
                dataPointss.push({
                    label: lb,
                    value: datap.value[i],
                    color: color[i],
                    highlight: color[i]
                });
            }
            //chart.render();
        }
        addData(datas);
        var labe = ['<?php echo $this->lang->line('opd') ?>', '<?php echo $this->lang->line('ipd') ?>', '<?php echo $this->lang->line('pharmacy') ?>', '<?php echo $this->lang->line('pathology') ?>', '<?php echo $this->lang->line('radiology') ?>', '<?php echo $this->lang->line('operation_theatre') ?>', '<?php echo $this->lang->line('blood_bank') ?>', '<?php echo $this->lang->line('ambulance') ?>', '<?php echo $this->lang->line('income') ?>'];

        //donut chart 
        var config2 = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: datas.value,
                    backgroundColor: [
                        '#715d20',
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.purple,
                        window.chartColors.blue,
                        window.chartColors.grey,
                        '#42b782',
                        '#66aa18',
                    ],
                    label: 'Dataset 1'
                }],
                labels: labe,
            },
            options: {
                responsive: true,
                circumference: Math.PI,
                rotation: -Math.PI,
                legend: {
                    position: 'top',
                },
                title: {
                    display: false,
                    text: 'Chart.js Doughnut Chart'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };


        var ctx2 = document.getElementById('pieChart').getContext('2d');

        window.myDoughnut = new Chart(ctx2, config2);


    }

    $(document).ready(function() {

        $(document).on('click', '.close_notice', function() {
            var data = $(this).data();
            $.ajax({
                type: "POST",
                url: base_url + "admin/notification/read",
                data: {
                    'notice': data.noticeid
                },
                dataType: "json",
                success: function(data) {
                    if (data.status == "fail") {

                        errorMsg(data.msg);
                    } else {
                        successMsg(data.msg);
                    }

                }
            });
        });
    });
</script>
<script>
    function showPopup(message) {
        if (message && message !== "No tasks to display.") {
            document.getElementById("popup-message").innerHTML = message; // Set the message content (with HTML)
            document.getElementById("popup-box").style.display = "block"; // Show the popup
            document.getElementById("popup-overlay").style.display = "block"; // Show the overlay
        }
    }

    function closePopup() {
        document.getElementById("popup-box").style.display = "none"; // Hide the popup
        document.getElementById("popup-overlay").style.display = "none"; // Hide the overlay
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Check if the session flag is set to show popup
        if (<?php echo json_encode($show_popup); ?>) {
            var taskDetails = <?php echo json_encode($task_details); ?>;
            showPopup(taskDetails);
        }
    });

    // Handle popup on dashboard link click
    document.querySelectorAll('a[href="<?php echo base_url(); ?>admin/admin/dashboard"]').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default link behavior
            // Show popup
            var taskDetails = <?php echo json_encode($task_details); ?>;
            showPopup(taskDetails);
            // Navigate to the dashboard after showing the popup
            setTimeout(() => {
                window.location.href = this.href;
            }, 50000); // Delay to allow popup to display
        });
    });
</script>
<script>
    /* document.addEventListener('DOMContentLoaded', function() {
        // Add click event listener to the dashboard link
        document.getElementById('dashboard-link').addEventListener('click', function(event) {
            // Prevent default link behavior (navigation)
            event.preventDefault();

            // Get task details from PHP variable
            var taskDetails = <?php echo json_encode($task_details); ?>;
            
            // Show the popup with task details
            showPopup(taskDetails);

            // Optionally, navigate to the dashboard after showing the popup
            setTimeout(function() {
                window.location.href = "<?php echo base_url(); ?>admin/admin/dashboard";
            }, 30000); // Adjust delay if needed
        });
    });

    // Popup display function
    function showPopup(message) {
        if (message && message !== "No tasks to display.") {
            document.getElementById("popup-message").innerHTML = message; // Set the message content (with HTML)
            document.getElementById("popup-box").style.display = "block"; // Show the popup
            document.getElementById("popup-overlay").style.display = "block"; // Show the overlay
        }
    }

    // Function to close the popup
    function closePopup() {
        document.getElementById("popup-box").style.display = "none"; // Hide the popup
        document.getElementById("popup-overlay").style.display = "none"; // Hide the overlay
    }*/
</script>
<script>
    /*function showPopup(message) {
        if (message && message !== "No tasks to display.") {
            document.getElementById("popup-message").innerHTML = message; // Set the message content (with HTML)
            document.getElementById("popup-box").style.display = "block"; // Show the popup
            document.getElementById("popup-overlay").style.display = "block"; // Show the overlay
        }
    }

   
    function closePopup() {
        document.getElementById("popup-box").style.display = "none"; // Hide the popup
        document.getElementById("popup-overlay").style.display = "none"; // Hide the overlay
    }

    window.onload = function() {
       var taskDetails = <?php echo json_encode($task_details); ?>;
       showPopup(taskDetails);
    };*/
</script>