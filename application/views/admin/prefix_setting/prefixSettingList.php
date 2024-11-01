<link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <section class="content">
        <div class="row">
            <?php $this->load->view('setting/sidebar'); ?>
            <div class="col-md-10">
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('prefix_setting'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="">
                        <form class="form-horizontal" id="form_prefix" method="POST" action="<?php echo base_url() ?>admin/prefix">
                            <div class="box-body">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <div class="form-group">
                                    <label for="ipd_no" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('ipd_no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="ipd_no" name="ipd_no" value="<?php echo set_value('ipd_no', $prefixlist->ipd_no); ?>"
                                            autocomplete="off" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="opd_no" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('opd_no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="opd_no" name="opd_no" value="<?php echo set_value('opd_no', $prefixlist->opd_no); ?>"
                                            autocomplete="off" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ipd_prescription" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('ipd') . " " . $this->lang->line('prescription'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="ipd_prescription" name="ipd_prescription" value="<?php echo set_value('ipd_prescription', $prefixlist->ipd_prescription); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="opd_prescription" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('opd') . " " . $this->lang->line('prescription'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="opd_prescription" name="opd_prescription" value="<?php echo set_value('opd_prescription', $prefixlist->opd_prescription); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="appointment" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('appointment'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="appointment" name="appointment" value="<?php echo set_value('appointment', $prefixlist->appointment); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pharmacy_billing" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('pharmacy') . " " . $this->lang->line('bill'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="pharmacy_bill" name="pharmacy_bill" value="<?php echo set_value('pharmacy_bill', $prefixlist->pharmacy_bill); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="operation_theater_reference_no"
                                        class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('operation') . " " . $this->lang->line('reference_no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="operation_reference_no" name="operation_reference_no" value="<?php echo set_value('operation_reference_no', $prefixlist->operation_reference_no); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="blood_bank_billing" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('blood_bank') . " " . $this->lang->line('bill'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="blood_bank_bill" name="blood_bank_bill" value="<?php echo set_value('blood_bank_bill', $prefixlist->blood_bank_bill); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ambulance_call_billing" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('ambulance_call') . " " . $this->lang->line('bill'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="ambulance_call_bill" name="ambulance_call_bill" value="<?php echo set_value('ambulance_call_bill', $prefixlist->ambulance_call_bill); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="radiology_billing" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('bill'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="radiology_bill" name="radiology_bill" value="<?php echo set_value('radiology_bill', $prefixlist->radiology_bill); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pathology_billing" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('pathology') . " " . $this->lang->line('bill'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="pathology_bill" name="pathology_bill" value="<?php echo set_value('pathology_bill', $prefixlist->pathology_bill); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="checkup_id" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('opd') . " " . $this->lang->line('checkup') . " " . $this->lang->line('id'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="opd_checkup_id" name="opd_checkup_id" value="<?php echo set_value('opd_checkup_id', $prefixlist->opd_checkup_id); ?>" autocomplete="off" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchase_no" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('pharmacy') . " " . $this->lang->line('purchase') . " " . $this->lang->line('no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="pharmacy_purchase_no" name="pharmacy_purchase_no" value="<?php echo set_value('pharmacy_purchase_no', $prefixlist->pharmacy_purchase_no); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="transaction_id" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('transaction') . " " . $this->lang->line('id'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="transaction_id" name="transaction_id" value="<?php echo set_value('transaction_id', $prefixlist->transaction_id); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="birth_record_reference_no" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('birth_record') . " " . $this->lang->line('reference_no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="birth_record_reference_no" name="birth_record_reference_no" value="<?php echo set_value('birth_record_reference_no', $prefixlist->birth_record_reference_no); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="death_record_reference_no" class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('death_record') . " " . $this->lang->line('reference_no'); ?><small class="req"> *</small></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" id="death_record_reference_no" name="death_record_reference_no" value="<?php echo set_value('death_record_reference_no', $prefixlist->death_record_reference_no); ?>" oninput="allowOnlyUppercase(this)" required>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-info pull-left " id="load1"
                                        data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Please wait">Save</button>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>
    </section>
</div>


<script type="text/javascript">
    // uppercase character validation
    function allowOnlyUppercase(input) {
        input.value = input.value.toUpperCase().replace(/[^A-Z]/g, '');
    }
</script>