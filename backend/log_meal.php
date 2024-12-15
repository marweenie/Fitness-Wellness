<?php
// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check 
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
        $food = $mysqli->real_escape_string($_POST['food']);
        $calories = $mysqli->real_escape_string($_POST['calories']);

        // Insert new meal log into the database
        $query = "INSERT INTO meal (Date, Food, Calories, UserID) VALUES ('$date', '$food', '$calories', '$user_id')";
        if ($mysqli->query($query) === TRUE) {
            $response['message'] = 'Meal logged successfully';
        } else {
            $response['error'] = 'Error: ' . $mysqli->error;
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