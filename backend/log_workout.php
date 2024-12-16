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
        $user_id = $_SESSION['user_id'];
        $date = $mysqli->real_escape_string($_POST['date']);
        $type_id = $mysqli->real_escape_string($_POST['type_id']);
        $duration = $mysqli->real_escape_string($_POST['duration']);

        // Insert new workout log to db
        $query = "INSERT INTO sessions (Date, UserID, TypeID, Duration) VALUES ('$date', '$user_id', '$type_id', '$duration')";
        if ($mysqli->query($query) === TRUE) {
            $response['message'] = 'Workout logged successfully';
        } else {
            $response['error'] = 'Error: ' . $mysqli->error;
        }
    } else {
        $response['error'] = 'User not logged in';
    }
} else {
    $response['error'] = 'Invalid request method';
}

// Close
$mysqli->close();

echo json_encode($response);
exit();
?>