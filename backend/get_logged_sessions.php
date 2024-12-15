<?php

// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

session_start();

header('Content-Type: application/json');

// DB 
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// check connection
if ($mysqli->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $mysqli->connect_error]));
}

$response = [];

// verify session
if (isset($_SESSION['user_id'])) {
    $userid = $_SESSION['user_id'];
    $query = "SELECT s.SessionID, s.Date, w.ExerciseType, s.Duration, 
    ((w.MET * 3.5 * w.ExerciseMultiplier * (o.Weight / 200)) * s.Duration) AS TotalCaloriesBurned
    FROM sessions s 
    JOIN workouttype w ON s.TypeID = w.TypeID 
    JOIN oneuser o ON s.UserID = o.UserID
    WHERE s.UserID = '$userid'
    ORDER BY s.Date DESC";

    $result = $mysqli->query($query);
    
    if ($result && $result->num_rows > 0) {
        $sessions = [];
        while ($row = $result->fetch_assoc()) {
            // mkaing TotalCaloriesBurned output as a number by casting float
            $row['TotalCaloriesBurned'] = (float)$row['TotalCaloriesBurned'];
            $sessions[] = $row;
        }
        $response['sessions'] = $sessions;
    } else {
        $response['error'] = 'No sessions found';
    }

    if ($result) {
        $result->free();
    }
} else {
    $response['error'] = 'User not logged in';
}

$mysqli->close();
echo json_encode($response);
exit();
?>