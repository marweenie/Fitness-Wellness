<?php
// Marwa Chbeir & Michael Sepsey

// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
session_start();

// Return JSON response header
header('Content-Type: application/json');

// Initialize response array
$response = [];

if (isset($_SESSION['user_id'])) {
    $userid = $_SESSION['user_id'];
    $query = "SELECT * FROM oneuser WHERE UserID = '$userid'";
    $result = $mysqli->query($query);

    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $response['user'] = $user;
    } else {
        $response['error'] = 'User not found';
    }
} else {
    $response['error'] = 'User not logged in';
}

// Close the database connection
$mysqli->close();

// Output the response and exit
echo json_encode($response);
exit();
?>