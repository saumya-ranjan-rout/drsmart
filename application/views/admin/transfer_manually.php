<style type="text/css">
    .bank-form-container {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 70px;
        /* border: 1px solid #003366; */
        border-radius: 10px;
        background-color: #f4f6f7;
        width: 80%;
        margin: auto;
    }
    .bank-form-container h3, .bank-form-container h4 {
        color: #003366;
        margin-top: 15px;
        font-weight: bold;
    }
    .bank-form-container fieldset {
        border: 1px solid #003366;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
        background-color: #fff;
    }
    .bank-form-container legend {
        font-size: 1.2em;
        font-weight: bold;
        padding: 0 10px;
        color: #003366;
    }
    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
    }
    .form-row label {
        font-weight: bold;
        color: #003366;
        margin-right: 10px;
        width: 15%;
        text-align: left;
        line-height: 1.5;
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
    font-size: 14px; /* Set font size */
}

.form-row textarea {
    border: none; /* No border */
    border-bottom: 1px dashed #003366; /* Dashed bottom border */
    width: 100%;
    padding: 5px;
    background-color: transparent;
    outline: none;
    margin-right: 20px;
    font-size: 14px; /* Set font size */
}

    .form-row input[type="text"]:focus,
    .form-row input[type="date"]:focus,
    .form-row input[type="email"]:focus,
    .form-row input[type="tel"]:focus {
        border-bottom: 1px solid #003366;
    }
    .form-row textarea {
        height: 50px;
    }
    .bank-form-container button {
        background-color: #003366;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        margin: 20px auto;
        width: 50%;
    }
    .bank-form-container button:hover {
        background-color: #002244;
    }

    /* Media Queries for Responsiveness */

    /* Tablets */
    @media (max-width: 768px) {
        .form-row {
            flex-direction: column;
        }
        .form-row label {
            width: 100%;
            margin-bottom: 5px;
        }
        .form-row input[type="text"],
        .form-row input[type="date"],
        .form-row input[type="email"],
        .form-row input[type="tel"],
        .form-row textarea {
            width: 100%;
            margin-right: 0;
        }
        .bank-form-container {
            width: 90%;
            padding: 40px;
        }
    }

    /* Mobile Phones */
    @media (max-width: 480px) {
        .form-row {
            flex-direction: column;
        }
        .form-row label {
            width: 100%;
            margin-bottom: 5px;
        }
        .form-row input[type="text"],
        .form-row input[type="date"],
        .form-row input[type="email"],
        .form-row input[type="tel"],
        .form-row textarea {
            width: 100%;
            margin-right: 0;
        }
        .bank-form-container {
            width: 100%;
            padding: 20px;
        }
        .bank-form-container button {
            width: 100%;
        }
    }
    .skin-blue .wrapper {
    background-color: #F4F6F7;
}
    
</style>


<div class="bank-form-container">
    <h3>Patient Transfer Form</h3>
    <form id="form"method="post">
        <!-- Patient Information -->
        <fieldset>
            <legend>1. Patient Information</legend>
            <div class="form-row">
                <label for="patientName">Full Name:</label>
                <input type="text" id="patientName" name="patientName" readonly>
                <label for="dob">Date of Birth:</label>
                <input type="text" id="dob" name="dob"  class="date" readonly>
            </div>
            <div class="form-row">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" readonly>
                <label for="bloodGroup">Blood Group:</label>
                <input type="text" id="bloodGroup" name="bloodgroup">
            </div>
            <div class="form-row">
                <label for="contactNumber">Contact Number:</label>
                <input type="tel" id="contactNumber" name="contactNumber" readonly>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" readonly>
            </div>
            <div class="form-row">
                <label for="address">Address:</label>
                <textarea id="address" name="address" readonly></textarea>
            </div>
        </fieldset>

        <!-- Hospital Information -->
        <fieldset>
            <legend>2. Hospital Information</legend>
            <div class="form-row">
                <label for="referringHospital">Internal Hospital:</label>
                <input type="text" id="referringHospital" name="referringHospital" readonly>
                <label for="hospitalCode">Hospital Code:</label>
                <input type="text" id="hospitalCode" name="hospitalCode" readonly>
            </div>
            <div class="form-row">
                <label for="hospitalAddress">Hospital Address:</label>
                <input type="text" id="hospitalAddress" name="hospitalAddress" readonly>
                <label for="hospitalContact">Phone:</label>
                <input type="tel" id="hospitalContact" name="hospitalContact" readonly>
            </div>
            <div class="form-row">
                <label for="hospitalEmail">Email:</label>
                <input type="email" id="hospitalEmail" name="hospitalEmail" readonly>
                <label for="patientid"></label>
                <input type="text" style="border-bottom: none; pointer-events: none;" readonly>
                 <input type="hidden" id="patientid" name="patientid">
            </div>

            <h4>External Hospital Details</h4>
            <div class="form-row">
                <label for="external_hospital">External Hospital:</label>
                <input type="text" id="external_hospital" name="external_hospital" >
                <label for="external_hospital_address">Address:</label>
                <input type="text" id="external_hospital_address" name="external_hospital_address" >
            </div>
            <div class="form-row">
                <label for="external_hospital_phone">Phone:</label>
                <input type="tel" id="external_hospital_phone" name="external_hospital_phone" value="+965" 
                oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                <label for="external_hospital_email">Email:</label>
                <input type="email" id="external_hospital_email" name="external_hospital_email" >
            </div>
        </fieldset>

        <!-- Medical Information -->
        <fieldset>
            <legend>3. Medical Information</legend>
            <div class="form-row">
                <label for="reason_for_transfer">Reason for Transfer:</label>
                <textarea id="reason_for_transfer" name="reason_for_transfer" ></textarea>
            </div>
            <div class="form-row">
                <label for="current_diagnosis">Current Diagnosis:</label>
                <textarea id="current_diagnosis" name="current_diagnosis" ></textarea>
            </div>
            <div class="form-row">
                <label for="required_treatment">Required Treatment:</label>
                <textarea id="required_treatment" name="required_treatment" ></textarea>
            </div>
            <div class="form-row">
                <label for="medical_history">Medical History:</label>
                <textarea id="medical_history" name="medical_history"></textarea>
            </div>
        </fieldset>

        <!-- Equipment/Test Unavailability Details -->
        <fieldset>
            <legend>4. Equipment/Test Unavailability Details</legend>
            <div class="form-row">
                <label for="unavailability">Unavailable Equipment/Test:</label>
                <textarea id="unavailability" name="unavailability" ></textarea>
            </div>
            <div class="form-row">
                <label for="unavailability_reason">Reason:</label>
                <textarea id="unavailability_reason" name="unavailability_reason" ></textarea>
            </div>
        </fieldset>

        <!-- Authorization and Consent -->
        <fieldset>
            <legend>5. Authorization and Consent</legend>
            <div class="form-row">
                <label for="consent_for_data_transfer">Consent for Data Transfer:</label>
                <textarea id="consent_for_data_transfer" name="consent_for_data_transfer" ></textarea>
            </div>
            <div class="form-row">
                <label for="representative_name">Representative’s Name:</label>
                <input type="text" id="representative_name" name="representative_name" >
                <label for="consent_date">Date:</label>
                <input type="text" id="consent_date" class="date" name="consent_date" >
            </div>
        </fieldset>

        <!-- Additional Instructions -->
        <fieldset>
            <legend>6. Additional Instructions</legend>
            <div class="form-row">
                <label for="specific_instructions">Specific Instructions:</label>
                <textarea id="specific_instructions" name="specific_instructions"></textarea>
            </div>
        </fieldset>

       

        <button type="submit" id="formbtn" data-loading-text="<?php echo $this->lang->line('processing') ?>" class="pull-right"><?php echo $this->lang->line('save'); ?></button>
    </form>
</div>



<script type="text/javascript">
   function patient_company_details() {
    //alert("hello"); // For testing
    var id = <?php echo $id; ?>;
    var base_url = "<?php echo base_url(); ?>backend/images/loading.gif";

    $.ajax({
        url: '<?php echo base_url(); ?>admin/admin/patient_company_details',
        type: "POST",
        data: { id: id },
        dataType: 'json',
        success: function(res) {
          // alert(JSON.stringify(res.settinglist)); // For testing
            
            if (res) {
                // If the result has values, populate them
                $("#patientid").val(res.id || ""); // Example: res.patientid
                $("#patientName").val(res.patient_name || "");
                $("#dob").val(res.dob || ""); // Assuming it's already set in the backend
                
                // Populate or reset fields with `html()` and `val()`
                $('#gender').val(res.gender || "");
                $('#bloodGroup').val(res.blood_group || "");
                $('#contactNumber').val(res.mobileno || "");
                $('#email').val(res.email || "");
                $('#address').val(res.address || "");
                
                // Use appropriate values from the response
                $('#referringHospital').val(res.settinglist[0].name || "");
                $('#hospitalCode').val(res.settinglist[0].dise_code || "");
                $('#hospitalAddress').val(res.settinglist[0].address || "");
                $('#hospitalContact').val(res.settinglist[0].phone || "");
                $('#hospitalEmail').val(res.settinglist[0].email || "");
            }
        }
    });
}

$(document).ready(function() {
    patient_company_details();
});

$(document).ready(function() {
        $("#form").on('submit', (function(e) {
            $("#formbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: '<?php echo base_url(); ?>admin/admin/add_manually_transfer',
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
                        window.location.href = '<?php echo base_url(); ?>admin/admin/search';

                    }
                    $("#formbtn").button('reset');
                },
                error: function() {
                    //  alert("Fail")
                }
            });
        }));
    });

    function delete_record(id) {
        //console.log(id);
        //alert("delete")
        if (confirm(<?php echo "'" . $this->lang->line('delete_conform') . "'"; ?>)) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/patient/deletePatient',
                type: "POST",
                data: {
                    delid: id
                },
                dataType: 'json',
                success: function(data) {
                    successMsg(<?php echo "'" . $this->lang->line('delete_message') . "'"; ?>);
                    window.location.reload(true);
                }
            })
        }
    }

   

    

    
</script>
