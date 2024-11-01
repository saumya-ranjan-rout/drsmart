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
            font-size: 8px;
        }



        .bank-form-container fieldset {
        border: 1px solid #B5B7B7;
        border-radius: 5px;
        padding: 7px;
        margin-bottom: 12px;
        background-color: #fff;
    }
    .bank-form-container legend {
        font-size: 1.0em;
        /* font-weight: bold; */
        padding: 0 5px;
        color: #003366;
    }
    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 5px;
    }
    .form-row label {
        /* font-weight: bold; */
        color: #003366;
        margin-right: 10px;
        width: 15%;
        text-align: left;
        line-height: 1.0em;
    }
    .form-row input[type="text"], 
.form-row input[type="date"], 
.form-row input[type="email"],
.form-row input[type="tel"] {
    border: none; /* No border */
    border-bottom: 1px dashed #003366; /* Dashed bottom border */
    width: 30%;
    padding: 5px;
    background-color: transparent;
    outline: none;
    margin-right: 20px;
    font-size: 12px; /* Set font size */
}

.form-row textarea {
    border: none; /* No border */
    border-bottom: 1px dashed #003366; /* Dashed bottom border */
    width: 100%;
    padding: 5px;
    background-color: transparent;
    outline: none;
    margin-right: 20px;
    font-size: 10px; /* Set font size */
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
                <table width="100%" class="printablea4" >
                    <tr >
                    <div class="bank-form-container">
                    <fieldset>
            <legend>1.Patient Information</legend>
            <div class="form-row">
                <label for="patientName">Full Name:</label>
                <input type="text" id="patientName" name="patientName" readonly value="<?php echo $patientlist["patient_name"]; ?>">
                <label for="dob">Date of Birth:</label>
                <input type="text" id="dob" name="dob"  class="date" readonly value="<?php echo $patientlist["dob"]; ?>">
            </div>
            <div class="form-row">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" readonly value="<?php echo $patientlist["gender"]; ?>">
                <label for="bloodGroup">Blood Group:</label>
                <input type="text" id="bloodGroup" name="bloodgroup" value="<?php echo $patientlist["blood_group"]; ?>">
            </div>
            <div class="form-row">
                <label for="contactNumber">Contact Number:</label>
                <input type="tel" id="contactNumber" name="contactNumber" readonly value="<?php echo $patientlist["mobileno"]; ?>">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" readonly value="<?php echo $patientlist["email"]; ?>">
            </div>
            <div class="form-row">
                <label for="address">Address:</label>
                <textarea id="address" name="address" readonly><?php echo $patientlist["address"]; ?></textarea>
            </div>
        </fieldset>

        <fieldset>
            <legend>2. Hospital Information</legend>
            <div class="form-row">
                <label for="referringHospital">Internal Hospital:</label>
                <input type="text" id="referringHospital" name="referringHospital" readonly value="<?php echo $settinglist[0]["name"]; ?>">
                <label for="hospitalCode">Hospital Code:</label>
                <input type="text" id="hospitalCode" name="hospitalCode" readonly value="<?php echo $settinglist[0]["dise_code"]; ?>">
            </div>
            <div class="form-row">
                <label for="hospitalAddress">Hospital Address:</label>
                <input type="text" id="hospitalAddress" name="hospitalAddress" readonly value="<?php echo $settinglist[0]["address"]; ?>">
                <label for="hospitalContact">Phone:</label>
                <input type="tel" id="hospitalContact" name="hospitalContact" readonly value="<?php echo $settinglist[0]["phone"]; ?>">
            </div>
            <div class="form-row">
                <label for="hospitalEmail">Email:</label>
                <input type="email" id="hospitalEmail" name="hospitalEmail" readonly value="<?php echo $settinglist[0]["email"]; ?>">
                <label for="patientid"></label>
                <input type="text" style="border-bottom: none; pointer-events: none;" readonly >
                 <input type="hidden" id="patientid" name="patientid">
            </div>
            <h4>External Hospital Details</h4>
            <div class="form-row">
                <label for="external_hospital">External Hospital:</label>
                <input type="text" id="external_hospital" name="external_hospital" value="<?php echo $result["external_hospital"]; ?>">
                <label for="external_hospital_address">Address:</label>
                <input type="text" id="external_hospital_address" name="external_hospital_address" value="<?php echo $result["external_hospital_address"]; ?>">
            </div>
            <div class="form-row">
                <label for="external_hospital_phone">Phone:</label>
                <input type="tel" id="external_hospital_phone" name="external_hospital_phone" value="<?php echo $result["external_hospital_phone"]; ?>">
                <label for="external_hospital_email">Email:</label>
                <input type="email" id="external_hospital_email" name="external_hospital_email" value="<?php echo $result["external_hospital_email"]; ?>">
            </div>
        </fieldset>
        <fieldset>
            <legend>3. Medical Information</legend>
            <div class="form-row">
                <label for="reason_for_transfer">Reason for Transfer:</label>
                <textarea id="reason_for_transfer" name="reason_for_transfer" ><?php echo $result["reason_for_transfer"]; ?></textarea>
            </div>
            <div class="form-row">
                <label for="current_diagnosis">Current Diagnosis:</label>
                <textarea id="current_diagnosis" name="current_diagnosis" ><?php echo $result["current_diagnosis"]; ?></textarea>
            </div>
            <div class="form-row">
                <label for="required_treatment">Required Treatment:</label>
                <textarea id="required_treatment" name="required_treatment" ><?php echo $result["required_treatment"]; ?></textarea>
            </div>
            <div class="form-row">
                <label for="medical_history">Medical History:</label>
                <textarea id="medical_history" name="medical_history"><?php echo $result["medical_history"]; ?></textarea>
            </div>
        </fieldset>

        <!-- Equipment/Test Unavailability Details -->
        <fieldset>
            <legend>4. Equipment/Test Unavailability Details</legend>
            <div class="form-row">
                <label for="unavailability">Unavailable Equipment/Test:</label>
                <textarea id="unavailability" name="unavailability" ><?php echo $result["unavailability"]; ?></textarea>
            </div>
            <div class="form-row">
                <label for="unavailability_reason">Reason:</label>
                <textarea id="unavailability_reason" name="unavailability_reason" ><?php echo $result["unavailability_reason"]; ?></textarea>
            </div>
        </fieldset>

        <!-- Authorization and Consent -->
        <fieldset>
            <legend>5. Authorization and Consent</legend>
            <div class="form-row">
                <label for="consent_for_data_transfer">Consent for Data Transfer:</label>
                <textarea id="consent_for_data_transfer" name="consent_for_data_transfer" ><?php echo $result["consent_for_data_transfer"]; ?></textarea>
            </div>
            <div class="form-row">
                <label for="representative_name">Representative’s Name:</label>
                <input type="text" id="representative_name" name="representative_name" value="<?php echo $result["representative_name"]; ?>">
                <label for="consent_date">Date:</label>
                <input type="text" id="consent_date" class="date" name="consent_date" value="<?php echo $result["consent_date"]; ?>">
            </div>
        </fieldset>

        <!-- Additional Instructions -->
        <fieldset>
            <legend>6. Additional Instructions</legend>
            <div class="form-row">
                <label for="specific_instructions">Specific Instructions:</label>
                <textarea id="specific_instructions" name="specific_instructions"><?php echo $result["specific_instructions"]; ?></textarea>
            </div>
        </fieldset>

        </div>
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
<script type="text/javascript">
    function delete_bill(id) {
        if (confirm('<?php echo $this->lang->line('delete_conform') ?>')) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/pathology/deletePharmacyBill/' + id,
                success: function(res) {
                    successMsg('<?php echo $this->lang->line('delete_message'); ?>');
                    window.location.reload(true);
                },
                error: function() {
                    alert("Fail")
                }
            });
        }
    }

    function printData(id) {

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/pathology/getBillDetails/' + id,
            type: 'POST',
            data: {
                id: id,
                print: 'yes'
            },
            success: function(result) {
                // $("#testdata").html(result);
                popup(result);
            }
        });
    }

    function popup(data) {
        var base_url = '<?php echo base_url() ?>';
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({
            "position": "absolute",
            "top": "-1000000px"
        });
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
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);
        return true;
    }
</script>