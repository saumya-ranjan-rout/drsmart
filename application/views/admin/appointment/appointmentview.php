<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>

<div class="content-wrapper" style="min-height: 946px;">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Doctor Wise Appointment</h3>
                    </div>

                    <form role="form" action="<?php echo base_url('admin/appointment/doctorwise'); ?>" method="POST">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>

                            <div class="row">
                                <div class="col-sm-6 col-md-5">
                                    <div class="form-group">
                                        <label>Doctor<small class="req"> *</small></label>
                                        <select autofocus class="form-control select2" style="width: 100%" onchange="getDoctorShift()" id="doctor" name="doctor">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                            <?php foreach ($doctors as $dkey) { ?>
                                                <option value="<?php echo $dkey["id"]; ?>" <?php echo (set_value('doctor') == $dkey["id"]) ? 'selected' : ''; ?>>
                                                    <?php echo $dkey["name"] . " " . $dkey["surname"]; ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('doctor'); ?></span>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-5">
                                    <div class="form-group">
                                        <label for="date">Date</label>
                                        <div class="input-group">
                                            <input type="text" name="date" class="form-control date" value="<?php echo set_value('date'); ?>" />
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary pull-right">
                                        <i class="fa fa-search"></i> Search
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="box-body" id="list">
                        <div class="download_label"><?php echo $this->lang->line('appointed_patient_list'); ?></div>
                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo $this->lang->line('patient') . " " . $this->lang->line('name'); ?></th>
                                    <th><?php echo $this->lang->line('appointment') . " " . $this->lang->line('no'); ?></th>
                                    <th><?php echo $this->lang->line('date'); ?></th>
                                    <th><?php echo $this->lang->line('phone'); ?></th>
                                    <th><?php echo $this->lang->line('gender'); ?></th>
                                    <th><?php echo $this->lang->line('doctor'); ?></th>
                                    <th><?php echo $this->lang->line('source'); ?></th>
                                    <th><?php echo $this->lang->line('status'); ?></th>
                                    <!-- <th class="text-right"><?php echo $this->lang->line('action'); ?></th> -->
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (!empty($resultlist)) {
                                    foreach ($resultlist as $appointment) {
                                        $label = '';
                                        if ($appointment["appointment_status"] == "approved") {
                                            $label = "class='label label-success'";
                                        } elseif ($appointment["appointment_status"] == "pending") {
                                            $label = "class='label label-warning'";
                                        } elseif ($appointment["appointment_status"] == "cancel") {
                                            $label = "class='label label-danger'";
                                        }

                                        $given_datetime = $appointment['date'];
                                        $given_date = DateTime::createFromFormat('Y-m-d H:i:s', $given_datetime)->format('Y-m-d');
                                        $current_date = date('Y-m-d');
                                        $highlight = $given_date == $current_date ? "style='background-color: #E4E4C9; font-weight: bold;'" : "";
                                ?>
                                        <tr <?php echo $highlight; ?>>
                                            <td <?php echo $highlight; ?>>
                                                <a href="#" onclick="viewDetail('<?php echo $appointment['id'] ?>')" data-target="#viewModal">
                                                    <?php echo $appointment['patient_name']; ?>
                                                </a>
                                            </td>
                                            <td <?php echo $highlight; ?>>
                                                <?php
                                                if ($appointment['appointment_status'] == 'approved') {
                                                    echo $appointment['appointment_no'];
                                                } else {
                                                    echo $this->lang->line($appointment['appointment_status']);
                                                }
                                                ?>
                                            </td>
                                            <td <?php echo $highlight; ?>>
                                                <?php echo date($this->customlib->getSchoolDateFormat(true, true), strtotime($appointment['date'])); ?>
                                            </td>
                                            <td <?php echo $highlight; ?>><?php echo $appointment['mobileno']; ?></td>
                                            <td <?php echo $highlight; ?>><?php echo $appointment['gender']; ?></td>
                                            <td <?php echo $highlight; ?>><?php echo $appointment['name'] . " " . $appointment['surname']; ?></td>
                                            <td <?php echo $highlight; ?>><?php echo $appointment['source']; ?></td>
                                            <td><small <?php echo $label; ?>><?php echo $this->lang->line($appointment['appointment_status']); ?></small></td>
                                            <!-- <td class="text-right">
                                                <?php if ($appointment['appointment_status'] == 'pending') { ?>
                                                    <a href="<?php echo base_url(); ?>admin/appointment/status/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('approve') . " " . $this->lang->line('appointment'); ?>" onclick="return confirm('<?php echo $this->lang->line('approve') . " " . $this->lang->line('appointment'); ?>');">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                    </a>
                                                <?php } ?>

                                                <?php if ($appointment['appointment_status'] == 'approved' && $appointment['is_opd'] != 'yes') { ?>
                                                    <a href="<?php echo base_url(); ?>admin/appointment/moveopd/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('opd'); ?>" onclick="return confirm('<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('opd'); ?>');">
                                                        <i class="fas fa-share-square" aria-hidden="true"></i>
                                                    </a>
                                                <?php } ?>

                                                <?php if ($appointment['appointment_status'] == 'approved' && $appointment['is_ipd'] != 'yes') { ?>
                                                    <a href="<?php echo base_url(); ?>admin/appointment/moveipd/<?php echo $appointment['id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('ipd'); ?>" onclick="return confirm('<?php echo $this->lang->line('move') . " " . $this->lang->line('to') . " " . $this->lang->line('patient') . " " . $this->lang->line('in') . " " . $this->lang->line('ipd'); ?>');">
                                                        <i class="fas fa-share-square" aria-hidden="true"></i>
                                                    </a>
                                                <?php } ?>
                                                <a href="#" onclick="viewDetail('<?php echo $appointment['id'] ?>')" class="btn btn-default btn-xs" data-toggle="tooltip" data-target="#viewModal" title="<?php echo $this->lang->line('show'); ?>">
                                                    <i class="fa fa-reorder"></i>
                                                </a>
                                            </td> -->
                                        </tr>
                                <?php
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
