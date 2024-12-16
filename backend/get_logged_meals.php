<?php
// Marwa Chbeir & Michael Sepsey

// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// start session
session_start();

// set type to JSON
header('Content-Type: application/json');

// Db connect
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

if ($mysqli->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $mysqli->connect_error]));
}

$response = [];

// verify user session
if (isset($_SESSION['user_id'])) {
    $userid = $_SESSION['user_id'];
    $query = "SELECT * FROM meal WHERE UserID = '$userid' ORDER BY Date DESC"; 
    $result = $mysqli->query($query);

    // check query results
    if ($result && $result->num_rows > 0) {
        $meals = $result->fetch_all(MYSQLI_ASSOC);
        $response['meals'] = $meals;
        $result->free();
    } else {
        $response['error'] = 'No meals found';
    }
} else {
    $response['error'] = 'User not logged in';
}

$mysqli->close();
echo json_encode($response);
exit();
?>