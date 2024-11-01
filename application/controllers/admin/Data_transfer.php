<?php
require_once '/var/www/html/drsmart/vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;

class Data_transfer extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Data_model'); // Load your model
    }

    // Producer to send data to RabbitMQ
    public function sendData() {
        echo "sendData() called.<br>";

        $patientid = $this->input->post('patientid');
        $hospital_name = $this->input->post('hospital_name');

        // Fetch data from the first database
        echo "Fetching data from the first database for patient ID: $patientid<br>";
        $data = $this->Data_model->getDataFromFirstDatabase($patientid);

        if (empty($data)) {
            echo "Error: No data found for the patient ID.<br>";
            return;
        }

        // Convert data to JSON to send via RabbitMQ
        $jsonData = json_encode($data);
       echo "Data fetched: " . print_r($data, true) . "<br>";

        // Connect to RabbitMQ
        echo "Connecting to RabbitMQ...<br>";
        $connection = new AMQPStreamConnection('40.172.41.136', 5672, 'admin', 'newpassword');
        $channel = $connection->channel();

        // Declare the queue
        echo "Declaring RabbitMQ queue 'data_queue'...<br>";
        $channel->queue_declare('data_queue', false, false, false, false);

        // Create a message to send
        echo "Publishing message to RabbitMQ queue...<br>";
        $msg = new AMQPMessage($jsonData);
        $channel->basic_publish($msg, '', 'data_queue');

        // Close the connection
        echo "Closing RabbitMQ connection...<br>";
        $channel->close();
        $connection->close();

        // Trigger the consumer immediately to process the message
        echo "Calling runConsumer() to process message in RabbitMQ.<br>";
        $this->runConsumer($hospital_name);
    }

   
    

    public function runConsumer($hospital_name) {
        echo "runConsumer() called for hospital: $hospital_name<br>";
    
        // Reconnect to RabbitMQ as the consumer
        echo "Connecting to RabbitMQ as consumer...<br>";
        try {
            $connection = new AMQPStreamConnection('40.172.41.136', 5672, 'admin', 'newpassword');
            $channel = $connection->channel();
        } catch (Exception $e) {
            echo "Error: Could not connect to RabbitMQ - " . $e->getMessage() . "<br>";
            return;
        }
    
        // Declare the queue (same queue used by producer)
        echo "Declaring queue 'data_queue'...<br>";
        try {
            $channel->queue_declare('data_queue', false, false, false, false);
        } catch (Exception $e) {
            echo "Error: Could not declare queue - " . $e->getMessage() . "<br>";
            return;
        }
    
        // Load CodeIgniter instance and connect to the second database
        $CI =& get_instance();
    
        // Attempt to load the second database
        echo "Connecting to second database for $hospital_name...<br>";
        try {
            $db2 = $CI->load->database($hospital_name, TRUE);
        } catch (Exception $e) {
            echo "Error: Could not connect to the second database - " . $e->getMessage() . "<br>";
            return;
        }
    
        if (!$db2) {
            echo "Error: Could not connect to the second database!<br>";
            return;
        }
    
        // Fetch message directly from the queue (no callback)
        echo "Fetching messages from 'data_queue'...<br>";
        while (true) {
            try {
                // Fetch message from queue
                $msg = $channel->basic_get('data_queue');
                if (!$msg) {
                    echo "No messages in the queue.<br>";
                    break; // Exit loop if no messages
                }
    
              //  echo "Message received from queue.<br>";
    
                // Decode the JSON data
                $data = json_decode($msg->body, true);
    
                if ($data === null) {
                    echo "Error: Could not decode the JSON data!<br>";
                    continue; // Move to the next message
                }
    
                echo "Decoded data: " . print_r($data, true) . "<br>";
    
                // Check if essential fields are present in the data
                if (!isset($data['id']) || !isset($data['patient_name'])) {
                    echo "Error: Missing required fields in the data.<br>";
                    continue;
                }
                unset($data['id']);

                // Attempt to insert data into the second database
                if ($db2->insert('patients', $data)) {
                    echo "Data inserted into the second database!<br>";
    
                    // Acknowledge the message after successful processing
                    $channel->basic_ack($msg->delivery_info['delivery_tag']);
                } else {
                    // Log the database error
                    $error = $db2->error();
                    echo "Error: Could not insert data into the second database - " . $error['message'] . "<br>";
                }
            } catch (Exception $e) {
                echo "Error while fetching message: " . $e->getMessage() . "<br>";
                break;
            }
        }
    
        // Close the RabbitMQ connection
        echo "Closing RabbitMQ consumer connection.<br>";
        try {
            $channel->close();
            $connection->close();
        } catch (Exception $e) {
            echo "Error: Could not close RabbitMQ connection - " . $e->getMessage() . "<br>";
        }


        redirect('admin/admin/search');
    }
    
}


