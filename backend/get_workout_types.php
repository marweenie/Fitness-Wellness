<?php
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Return JSON 
header('Content-Type: application/json');

$response = [];

// Fetch workout types
$query = "SELECT TypeID, ExerciseType FROM workouttype";
$result = $mysqli->query($query);

if ($result && $result->num_rows > 0) {
    $workouts = [];
    while ($row = $result->fetch_assoc()) {
        $workouts[] = $row;
    }
    $response['workouts'] = $workouts;
} else {
    $response['error'] = 'No workout types found';
}

// Close the DB connection
$mysqli->close();

// Output the response and exit
echo json_encode($response);
exit();
?>