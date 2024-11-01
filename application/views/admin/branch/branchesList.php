<div class="content-wrapper" style="min-height: 946px;">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!--  <?php //if (($this->rbac->hasPrivilege('department', 'can_add')) || ($this->rbac->hasPrivilege('department', 'can_edit'))) {
                    ?>      -->
            <div class="col-md-2">
                <div class="box border0">
                    <ul class="tablists">
                        <li><a href="<?php echo base_url(); ?>admin/branch/index" class="active"><?php echo $this->lang->line('branch'); ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-10">
                <div class="box box-primary" id="tachelist">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('branches') . " " . $this->lang->line('list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php if ($this->rbac->hasPrivilege('branch', 'can_add')) { ?>
                                <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('branch'); ?></a>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('branches') . " " . $this->lang->line('list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('branch') . " " . $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('other') . " " . $this->lang->line('details'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $count = 1;
                                    foreach ($branchName as $branch) {
                                    ?>
                                        <tr>
                                            <td><?php echo $branch['branch_name']; ?></td>
                                            <td><?php echo $branch['other_details']; ?></td>
                                            <td class="text-right">
                                                <!-- <?php if ($this->rbac->hasPrivilege('branch', 'can_edit')) { ?> -->
                                                <a data-target="#editmyModal" onclick="get(<?php echo $branch['id'] ?>)" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <?php
                                                            // }
                                                            // if ($this->rbac->hasPrivilege('branch', 'can_delete')) {
                                                ?>
                                                <a class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="delete_recordById('<?php echo base_url(); ?>admin/branch/delete/<?php echo $branch['id'] ?>', '<?php echo $this->lang->line('delete_message'); ?>')" ;>
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                                <!-- <?php } ?> -->
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

<!-- branch Add Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-mid" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"> <?php echo $this->lang->line('add') . " " . $this->lang->line('branch'); ?></h4>
            </div>

            <form id="formadd" action="<?php echo site_url('admin/branch/add') ?>" id="branchform" name="branchform" method="post" accept-charset="utf-8">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('branch') . " " . $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <input autofocus="" name="branch_name" placeholder="" type="text" class="form-control" />
                            <span class="text-danger"><?php echo form_error('branch_name'); ?></span>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('other') . " " . $this->lang->line('details'); ?></label>
                            <textarea name="other_details" class="form-control"></textarea>
                            <span class="text-danger"><?php echo form_error('other_details'); ?></span>
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

<!-- branch Edit Modal -->
<div class="modal fade" id="editmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-mid" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('edit') . " " . $this->lang->line('branch'); ?></h4>
            </div>

            <form id="editformadd" action="<?php echo site_url('admin/branch/add') ?>" name="branchform" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                <div class="modal-body pt0 pb0">
                    <div class="ptt10">
                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('branch') . " " . $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <input autofocus="" id="branch_name" name="branch_name" placeholder="" type="text" class="form-control"
                                value="<?php
                                        if (isset($result)) {
                                            echo $result["medicine_category"];
                                        }
                                        ?>" />
                            <span class="text-danger"><?php echo form_error('branch_name'); ?></span>
                            <input type="hidden" id="id" name="branch_id">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('other') . " " . $this->lang->line('details'); ?></label>
                            <textarea name="other_details" id="other_details" class="form-control"><?php
                                if (isset($result)) {
                                    echo $result["description"];
                                }
                                ?></textarea>
                            <span class="text-danger"><?php echo form_error('other_details'); ?></span>
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
    $(document).ready(function(e) {
        $('#formadd').on('submit', (function(e) {
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
                success: function(data) {

                    if (data.status == "fail") {

                        var message = "";
                        $.each(data.error, function(index, value) {

                            message += value;
                        });
                        errorMsg(message);
                    } else {

                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#formaddbtn").button('reset');
                },
                error: function() {

                }
            });


        }));

    });


    function get(id) {
        $('#editmyModal').modal('show');
        $.ajax({
            dataType: 'json',
            url: '<?php echo base_url(); ?>admin/branch/get_data/' + id,
            success: function(result) {
                $('#id').val(result.id);
                $('#branch_name').val(result.branch_name);
                $('#other_details').val(result.other_details);
            }
        });
    }


    $(document).ready(function(e) {
        $('#editformadd').on('submit', (function(e) {
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
                success: function(data) {
                    if (data.status == "fail") {
                        var message = " ";
                        $.each(data.error, function(index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#editformaddbtn").button('reset');
                },
                error: function() {}
            });
        }));
    });
</script>