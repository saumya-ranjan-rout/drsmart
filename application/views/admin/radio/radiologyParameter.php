<div class="content-wrapper" style="min-height: 946px;">  
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!--  <?php //if (($this->rbac->hasPrivilege('department', 'can_add')) || ($this->rbac->hasPrivilege('department', 'can_edit'))) {
?>      -->
            <div class="col-md-2">
                <div class="box border0">
                    <ul class="tablists">
                        <li><a href="<?php echo base_url(); ?>admin/lab/addLab"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('category'); ?></a></li>
                        <li><a href="<?php echo base_url(); ?>admin/lab/unit" ><?php echo $this->lang->line('unit'); ?></a></li>
                        <li><a href="<?php echo base_url(); ?>admin/lab/radioparameter" class="active"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('parameter'); ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-10">              
                <div class="box box-primary" id="tachelist">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('parameter') . " " . $this->lang->line('list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php if ($this->rbac->hasPrivilege('radiology_category', 'can_add')) { ?>
                                <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>  <?php echo $this->lang->line('add') . " " . $this->lang->line('radiology') . " " . $this->lang->line('parameter'); ?></a> 
                            <?php } ?>    
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('radiology') . " " . $this->lang->line('parameter') . " " . $this->lang->line('name'); ?></div>
                            <table class="table table-striped table-bordered table-hover example" >
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('parameter') . " " . $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('reference') . " " . $this->lang->line('range'); ?></th>
                                        <th><?php echo $this->lang->line('unit'); ?></th>
                                        <th><?php echo $this->lang->line('description'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $count = 1;
                                    foreach ($parameterName as $lab) {
                                        ?>
                                        <tr>
                                            <td><?php echo $lab['parameter_name']; ?></td>
                                            <td><?php echo $lab['reference_range']; ?></td>
                                            <td><?php echo $lab['unit']; ?></td>
                                            <td><?php echo $lab['description']; ?></td>
                                            <td class="text-right">
                                                <?php if ($this->rbac->hasPrivilege('radiology_category', 'can_edit')) { ?>
                                                    <a data-target="#editmyModal" onclick="get(<?php echo $lab['id'] ?>)"  class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                    <?php
                                                }
                                                if ($this->rbac->hasPrivilege('radiology_category', 'can_delete')) {
                                                    ?>
                                                    <a class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="delete_recordById('<?php echo base_url(); ?>admin/lab/delete_parameter/<?php echo $lab['id'] ?>', '<?php echo $this->lang->line('delete_message'); ?>')";>
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                        <?php
                                        $count++;
                                    }
                                    ?>
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


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-mid" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"> <?php echo $this->lang->line('add') . " " . $this->lang->line('radiology') . " " . $this->lang->line('parameter'); ?></h4> 
            </div>

            



            <form id="formadd" action="<?php echo site_url('admin/lab/addPathoparameter') ?>"  id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                           
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('parameter') . " " . $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <input autofocus="" name="parameter_name" placeholder="" type="text" class="form-control" autocomplete="off">
                            <span class="text-danger"><?php echo form_error('parameter_name'); ?></span>
                        </div>    
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('reference') . " " . $this->lang->line('range'); ?></label><small class="req"> *</small>
                            <input autofocus="" name="reference_range" placeholder="" type="text" class="form-control" autocomplete="off">
                            <span class="text-danger"><?php echo form_error('reference_range'); ?></span>
                        </div> 
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('unit'); ?></label><small class="req"> *</small>
                            <select name="unit" id="unit" placeholder=""   type="text" class="form-control">
                                    <option value=""   ><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                                    foreach ($units as $key => $unit) {
                                                        ?>
                                                        <option value="<?php echo $unit['unit_name'] ?>"><?php echo $unit["unit_name"] ?></option>
                                                    <?php }
                                                    ?>
                            </select>
                        <span class="text-danger"><?php echo form_error('unit'); ?></span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                            <input autofocus="" name="description" placeholder="" type="text" class="form-control" autocomplete="off">
                            <span class="text-danger"><?php echo form_error('description'); ?></span>
                        </div>
                    </div>
                </div><!--./modal-->     
                <div class="box-footer">
                    <button type="submit" data-loading-text="<?php echo $this->lang->line('processing') ?>" id="formaddbtn" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>
            </form>


        </div><!--./row--> 
    </div>
</div>
<div class="modal fade" id="editmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-mid" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('edit') . " " . $this->lang->line('radiology') . " " . $this->lang->line('parameter'); ?></h4> 
            </div>


            <form id="editformadd" action="<?php echo site_url('admin/lab/addPathoparameter') ?>" name="employeeform" method="post" accept-charset="utf-8"  enctype="multipart/form-data">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                         
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('parameter') . " " . $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <input autofocus=""  id="parameter_name1" name="parameter_name" placeholder="" type="text" class="form-control" value="<?php
                            if (isset($result)) {
                                echo $result["parameter_name"];
                            }
                            ?>" />
                            <span class="text-danger"><?php echo form_error('parameter_name'); ?></span>
                            <input type="hidden" id="id" name="radiology_parameter_id">
                        </div>  
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('reference') . " " . $this->lang->line('range'); ?></label><small class="req"> *</small>
                            <input autofocus="" id="reference_range1" name="reference_range" placeholder="" type="text" class="form-control" value="<?php
                            if (isset($result)) {
                                echo $result["reference_range"];
                            }
                            ?>" />
                            <span class="text-danger"><?php echo form_error('reference_range'); ?></span>
                        </div> 
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('unit'); ?></label><small class="req"> *</small>
                             <select id="unit1" name="unit"  class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                    <?php foreach ($units as $value) { ?>
                                        <option value="<?php echo $value['unit_name']; ?>"><?php echo $value['unit_name']; ?></option>

                                    <?php } ?>
                                </select>

                        <span class="text-danger"><?php echo form_error('unit'); ?></span>
                        </div>  
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                            <input autofocus="" id="description1" name="description" placeholder="" type="text" class="form-control" value="<?php
                            if (isset($result)) {
                                echo $result["reference_range"];
                            }
                            ?>" />
                            <span class="text-danger"><?php echo form_error('description'); ?></span>
                        </div>           
                    </div>
                </div><!--./modal-->        
                <div class="box-footer">
                    <button type="submit" id="editformaddbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                </div>
            </form>


        </div><!--./row--> 
    </div>
</div>
<script>


    $(document).ready(function (e) {
        $('#formadd').on('submit', (function (e) {
            $("#formaddbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {

                    if (data.status == "fail") {

                        var message = "";
                        $.each(data.error, function (index, value) {

                            message += value;
                        });
                        errorMsg(message);
                    } else {

                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#formaddbtn").button('reset');
                },
                error: function () {

                }
            });


        }));

    });


    function get(id) {
        $('#editmyModal').modal('show');
        $.ajax({
            dataType: 'json',
            url: '<?php echo base_url(); ?>admin/lab/get_data_parameter/' + id,
            success: function (result) {
                $('#id').val(result.id);
                $('#parameter_name1').val(result.parameter_name);
                $('#reference_range1').val(result.reference_range);
                $('#unit1').val(result.unit);
                $('#description1').val(result.description);
            }
        });
    }
    $(document).ready(function (e) {
        $('#editformadd').on('submit', (function (e) {
            $("#editformaddbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    if (data.status == "fail") {
                        var message = " ";
                        $.each(data.error, function (index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#editformaddbtn").button('reset');
                },
                error: function () {}
            });
        }));
    });
</script>



