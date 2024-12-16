<?php
// Marwa Chbeir & Michael Sepsey
// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
session_start();
header('Content-Type: application/json');

$response = [];

if (isset($_SESSION['user_id'])) {
    $userid = $_SESSION['user_id'];
    
    // get total calories consumed today
    $today = date('Y-m-d'); //todays date
    $queryConsumed = "SELECT SUM(Calories) AS totalConsumed FROM meal WHERE UserID = '$userid' AND Date = '$today'";
    $resultConsumed = $mysqli->query($queryConsumed);
    
    if ($resultConsumed && $resultConsumed->num_rows > 0) {
        $rowConsumed = $resultConsumed->fetch_assoc();
        $totalConsumed = $rowConsumed['totalConsumed'] ? $rowConsumed['totalConsumed'] : 0;
    } else {
        $totalConsumed = 0;
    }

    // get total calories burned today
    $queryBurned = "
        SELECT SUM((w.MET * 3.5 * w.ExerciseMultiplier * (o.Weight / 200)) * s.Duration) AS totalBurned
        FROM sessions s 
        JOIN workouttype w ON s.TypeID = w.TypeID 
        JOIN oneuser o ON s.UserID = o.UserID
        WHERE s.UserID = '$userid' AND s.Date = '$today'";
    $resultBurned = $mysqli->query($queryBurned);
    
    if ($resultBurned && $resultBurned->num_rows > 0) {
        $rowBurned = $resultBurned->fetch_assoc();
        $totalBurned = $rowBurned['totalBurned'] ? $rowBurned['totalBurned'] : 0;
    } else {
        $totalBurned = 0;
    }

    // Calculate net caloric intake
    $netCalories = $totalConsumed - $totalBurned;

    $response['totalConsumed'] = $totalConsumed;
    $response['totalBurned'] = $totalBurned;
    $response['netCalories'] = $netCalories;
} else {
    $response['error'] = 'User not logged in';
}

$mysqli->close();
echo json_encode($response);
exit();
?>