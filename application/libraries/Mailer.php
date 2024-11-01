<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Mailer
{

    public $mail_config;
    private $sch_setting;

    public function __construct()
    {
        $this->CI = &get_instance();
        $this->CI->load->model('emailconfig_model');
        $this->CI->mail_config = $this->CI->emailconfig_model->getActiveEmail();
        $this->CI->load->model('setting_model');
        $this->sch_setting = $this->CI->setting_model->get();
    }

    public function send_mail($toemail, $subject, $body)
    {

        $mail          = new PHPMailer();
        $mail->CharSet = 'UTF-8';
        $school_name   = $this->sch_setting[0]['name'];
        if ($this->CI->mail_config->email_type == "smtp") {

            $mail->IsSMTP();
            $mail->SMTPAuth   = true;
            $mail->SMTPSecure = 'tls';
            $mail->Host       = 'smtp.gmail.com';
            $mail->Port       = '587';
            $mail->Username   = 'doctorapp123@gmail.com';
            $mail->Password   = 'doctor@123';
        }
        $mail->SetFrom($this->CI->mail_config->smtp_username, $school_name);
        $mail->AddReplyTo($this->CI->mail_config->smtp_username, $this->CI->mail_config->smtp_username);
        
        $mail->Subject = $subject;
        $mail->Body    = $body;
        $mail->AltBody = $body;
        $mail->AddAddress($toemail);
        if ($mail->Send()) {
            return true;
        } else {
            return false;
        }
    }

}
