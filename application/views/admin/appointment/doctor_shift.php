<div class="content-wrapper" style="min-height: 946px;">  

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-2">
                <div class="box border0">
                    <ul class="tablists">
                        <?php //if ($this->rbac->hasPrivilege('hospital_charges', 'can_view')) { ?> <li>
                                <a href="<?php echo base_url(); ?>admin/appointment/onlineappointment/" ><?php echo 'Slots' ?></a></li>
                        <?php //} ?>
                        <?php //if ($this->rbac->hasPrivilege('charge_category', 'can_view')) { ?>
                            <li><a href="<?php echo base_url(); ?>admin/appointment/doctor_shift/" class="active" ><?php echo 'Doctor Shift'; ?></a></li>
                        <?php //} ?> 
                        <?php //if ($this->rbac->hasPrivilege('doctor_opd_charges', 'can_view')) { ?> 
                            <li><a href="<?php echo base_url(); ?>admin/appointment/shift/" ><?php echo 'Shift' ?></a></li>
                        <?php //} ?> 
                                                                                 
                    </ul>
                </div>
            </div>
            <div class="col-md-10"> 
                <div class="box box-primary" id="tachelist">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo 'Doctor Shift' ?></h3>
                       
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php //echo Shift . " " . $this->lang->line('details'); ?></div>
                           <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th>Doctor Name</th>
                                                                                    <?php foreach ($shifts as $key => $shift) { ?>
                                                                                          <th><?php echo $shift['name']; ?></th>
                                                                                     <?php } ?>
                                                                            </tr>
                                </thead>
                                <tbody>
                              <tr>
                                  
                                   <?php foreach ($doctors as $key => $staff) {
                                                    ?>
                                                    
                                                <td><?php echo $staff["name"] . " " . $staff["surname"] ?><small style="color:green">[<?php echo $staff["employee_id"] ?>]</small></td>
                                                   
                                                     <?php foreach ($shifts as $shiftKey => $shift) {
                  
                    $shift_name = $shift['name'];
                    $checked = $staff[$shift_name] == 1 ? 'checked' : '';
                     $value = $staff[$shift_name];
                    $text = $value == 1 ? 'Yes' : 'No';
                    
                    // Using a combination of staff ID and shift key for data-id
                    $data_id = $staff["id"] . '' . ($shiftKey + 1);
                  $checkbox_id = 'global_shift_' . $shiftKey + 1;
            $span_id = 'checkbox_print_' . $data_id;
                ?>
                   <td>
                       
                          <input type="checkbox" onclick="changeShift(<?php echo $staff['id']; ?>,<?php echo $shiftKey + 1; ?>,this)" id="<?php echo $checkbox_id; ?>" name="global_shift[]" value="<?php echo $value; ?>" data-id="<?php echo $data_id; ?>" <?php echo $checked; ?> />
                <span class="hidden" id="<?php echo $span_id; ?>"><?php echo $text; ?></span>
        
            
                    </td>
                    
                                                   <?php } ?>
                            
                                                                            </tr>
                                                                             <?php } ?>
                                                                  
                                                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="">
                        <div class="mailbox-controls">
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </section>
</div>


<script>
function changeShift(doctor_id, shift_id, checkbox) {
    console.log("checkbox_print_" + checkbox.dataset.id);
    let status = checkbox.checked ? 1 : 0;
    document.querySelector("#checkbox_print_" + checkbox.dataset.id).innerHTML = status ? "Yes" : "No";

    $.ajax({
        url: "<?php echo base_url('admin/appointment/editDoctorGlobalShift'); ?>",
        type: "POST",
        data: {doctor_id: doctor_id, shift_id: shift_id, status: status},
        dataType: 'json',
        success: function(data) {
            if (data.status == "success") {
                successMsg(data.message);
            } else {
                alert("Fail: " + data.message);
            }
        },
        error: function() {
            alert("Fail");
        }
    });
}
 
    

</script>