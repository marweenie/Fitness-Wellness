<?php
// Marwa Chbeir & Michael Sepsey
// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

session_start();

// Return JSON 
header('Content-Type: application/json');

$response = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_SESSION['user_id'])) {
        $userid = $_SESSION['user_id'];

        //  the base query
        $fields = [];
        if (!empty($_POST['age'])) {
            $age = $mysqli->real_escape_string($_POST['age']);
            $fields[] = "Age = '$age'";
        }
        if (!empty($_POST['weight'])) {
            $weight = $mysqli->real_escape_string($_POST['weight']);
            $fields[] = "Weight = '$weight'";
        }
        if (!empty($_POST['height'])) {
            $height = $mysqli->real_escape_string($_POST['height']);
            $fields[] = "Height = '$height'";
        }

        // Check if there arre fields to update
        if (!empty($fields)) {
            $update_query = "UPDATE oneuser SET " . implode(', ', $fields) . " WHERE UserID = '$userid'";
            if ($mysqli->query($update_query) === TRUE) {
                $response['message'] = 'User info updated successfully';
            } else {
                $response['error'] = 'Error: ' . $mysqli->error;
            }
        } else {
            $response['error'] = 'No valid fields to update';
        }
    } else {
        $response['error'] = 'User not logged in';
    }
} else {
    $response['error'] = 'Invalid request method';
}

$mysqli->close();

echo json_encode($response);
exit();
?>