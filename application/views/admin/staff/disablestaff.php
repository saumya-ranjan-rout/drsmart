<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<style type="text/css">


.staffinfo-box {
    width: 100%; 
    height: 220px; 
    overflow: hidden; 
    display: flex;
    flex-direction: column; 
    text-align: center;
    background: #f8f8f8;
    border: 1px solid #ddd; 
    box-sizing: border-box; 
}

.staffleft-box {
    width: 100%;  
    height: 115px;
    overflow: hidden; 
    display: flex;
    justify-content: center;
    align-items: center;
    background: #eaeaea;
    
}

.staffleft-box img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover; 
}

.staffleft-content {
    flex-grow: 1;
    overflow: hidden; 
    text-align: center;
    font-size: 10px; 
    padding: 2px; 
}


.staffleft-content h5,
.staffleft-content p {
    margin: 2px 0; 
    white-space: nowrap; 
    overflow: hidden;
    text-overflow: ellipsis;
}
.staffleft-box img {
    width: 100px;
    height: 100px;
    position: relative;
    z-index: 0;
    background: #fff;
}
.stafficons a {
    display: inline-block;
    text-align: center;
    color: #fff;
    font-size: 24px;
    padding-right: 110px;
    padding-left: 0px;
    line-height: 100px;
}


/* .fixed-width {
            display: inline-block; 
           width: 70px;
            white-space: nowrap; 
            overflow: hidden; 
            vertical-align: top; 
            transition: font-size 0.3s ease;
        } */
</style>

<div class="content-wrapper" style="min-height: 946px;">  

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"> <?php echo $this->lang->line('disabled_staff'); ?></h3>
                    </div>
                    <div class="box-body">
                        <?php if ($this->session->flashdata('msg')) { ?>  <?php echo $this->session->flashdata('msg');
$this->session->unset_userdata('msg'); ?> <?php } ?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <form role="form" action="<?php echo site_url('admin/staff/disablestafflist') ?>" method="post" class="">
                                        <?php echo $this->customlib->getCSRF(); ?>
                                        <div class="col-sm-12">
                                            <div class="form-group"> 
                                                <label><?php echo $this->lang->line("role") ?></label><small class="req"> *</small>
                                                <select name="role" class="form-control">
                                                    <option value=""><?php $this->lang->line('select') ?></option>
                                                    <?php foreach ($role as $key => $role_value) {
                                                        ?>
                                                        <option value="<?php echo $role_value['type'] ?>"><?php echo $role_value['type'] ?></option>
                                                    <?php }
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('role'); ?></span>
                                            </div>  
                                        </div>


                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm pull-right checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                            </div>
                                        </div>
                                    </form>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <form role="form" action="<?php echo site_url('admin/staff/disablestafflist') ?>" method="post" class="">
                                        <?php echo $this->customlib->getCSRF(); ?>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label><?php echo $this->lang->line('search_by_keyword'); ?></label>
                                                <input type="text" name="search_text" class="form-control"   placeholder="<?php echo $this->lang->line('search_by_staff'); ?>">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <button type="submit" name="search" value="search_full" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                    if (isset($resultlist)) {
                        ?>
                        <div class="box border0 clear">   
                            <div style="background: #dadada; height: 1px; width: 100%; clear: both; margin-top:5px;"></div> 
                            <div class="nav-tabs-custom border0">
                                <ul class="nav nav-tabs">

                                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false"><i class="fa fa-newspaper-o"></i> <?php echo $this->lang->line('card'); ?> <?php echo $this->lang->line('view'); ?></a></li>
                                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true"><i class="fa fa-list"></i> <?php echo $this->lang->line('list'); ?>  <?php echo $this->lang->line('view'); ?></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="download_label"><?php echo "Disable Staff List"; ?></div>
                                    <div class="tab-pane  table-responsive no-padding" id="tab_2">
                                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th><?php echo $this->lang->line('staff_id'); ?></th>
                                                    <th><?php echo $this->lang->line('name'); ?></th>
                                                    <th><?php echo $this->lang->line('role'); ?></th>
                                                    <th><?php echo $this->lang->line('department'); ?></th>
                                                    <th><?php echo $this->lang->line('designation'); ?></th>
                                                    <th><?php echo $this->lang->line('mobile_no'); ?></th>

                                                    <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                if (empty($resultlist)) {
                                                    ?>

                                                    <?php
                                                } else {
                                                    $count = 1;
                                                    foreach ($resultlist as $staff) {
                                                        ?>
                                                        <tr>
                                                            <td><?php echo $staff['employee_id']; ?></td>
                                                            <td>
                                                                <a href="<?php echo base_url(); ?>admin/staff/profile/<?php echo $staff['id']; ?>"><?php echo $staff['name'] . " " . $staff['surname']; ?>
                                                                </a>
                                                            </td>

                                                            <td><?php echo $staff['user_type']; ?></td>
                                                            <td><?php echo $staff['department']; ?></td>
                                                            <td><?php echo $staff['designation']; ?></td>
                                                            <td><?php echo $staff['contact_no']; ?></td>

                                                            <td class="pull-right">
                                                                <a href="<?php echo base_url(); ?>admin/staff/profile/<?php echo $staff['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('show'); ?>" >
                                                                    <i class="fa fa-reorder"></i>
                                                                </a>
                                                                <!-- <a href="<?php echo base_url(); ?>admin/staff/edit/<?php echo $staff['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a> -->
                                                            </td>
                                                        </tr>
                                                        <?php
                                                        $count++;
                                                    }
                                                }
                                                ?>
                                            </tbody>
                                        </table>
                                    </div>                           
                                    <div class="tab-pane active" id="tab_1">
                                         <div class="mediarow">   
                                            <div class="row">  
                                                <?php if (empty($resultlist)) {
                                                    ?>
                                                    <div class="alert alert-info"><?php echo $this->lang->line('no_record_found'); ?></div>
                                                    <?php
                                                } else {
                                                    $count = 1;
                                                    foreach ($resultlist as $staff) {
                                                        ?>
                                                        <div class="col-lg-3 col-md-6 col-sm-6 img_div_modal">
                                                            <div class="staffinfo-box">
                                                                <div class="staffleft-box">
                                                                    <?php
                                                                    if (!empty($staff["image"])) {
                                                                        $image = $staff["image"];
                                                                    } else {
                                                                        $image = "no_image.png";
                                                                    }
                                                                    ?>
                                                                    <img src="<?php echo base_url() . "uploads/staff_images/" . $image ?>" />
                                                                </div>
                                                                <div class="staffleft-content">
                                                                    <h5><span   data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["name"] . " " . $staff["surname"]; ?></span></h5>

                                                                    <p><font   data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["employee_id"] ?></font></p>

                                                                    <p><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["contact_no"] ?></font></p>

                                                                    <p><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php
                                                                        if (!empty($staff["location"])) {
                                                                            echo $staff["location"] . ",";
                                                                        }
                                                                        ?></font><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $staff["department"]; ?></font></p>

                                                                    <p class="staffsub" ><span  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["user_type"] ?></span> 

                                                                        <span  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["designation"] ?></span></p>
                                                                </div>
                                                                <div class="overlay3">
                                                                    <div class="stafficons">

                                                                        <a title="<?php echo $this->lang->line('show') ?>" href="<?php echo base_url() . "admin/staff/profile/" . $staff["id"] ?>"><i class="fa fa-navicon"></i></a>
                                                                            <?php if ($this->rbac->hasPrivilege('staff', 'can_edit')) { ?>
                                                                                                <!-- <a title="Edit" href="<?php echo base_url() . "admin/staff/edit/" . $staff["id"] ?>"><i class=" fa fa-pencil"></i></a> -->
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><!--./col-md-3-->
                                                        <?php
                                                    }
                                                }
                                                ?>


                                            </div><!--./col-md-3-->
                                        </div><!--./row-->  
                                    </div><!--./mediarow-->  


                                </div>                                                          
                            </div>
                        </div>  
                    </div>                                                            
                </div>
                <?php
            }
            ?>
        </div>  
</div> 
</section>
</div>
