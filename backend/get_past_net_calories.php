<?php
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
    
    // Get past net caloric data
    $query = "
        SELECT s.Date, 
               (SELECT SUM(Calories) FROM meal WHERE UserID = '$userid' AND Date = s.Date) AS totalConsumed,
               SUM((w.MET * 3.5 * w.ExerciseMultiplier * (o.Weight / 200)) * s.Duration) AS totalBurned
        FROM sessions s 
        JOIN workouttype w ON s.TypeID = w.TypeID 
        JOIN oneuser o ON s.UserID = o.UserID
        WHERE s.UserID = '$userid'
        GROUP BY s.Date
        ORDER BY s.Date DESC
    ";

    error_log("Executing query: " . $query);

    if ($result = $mysqli->query($query)) {
        $netCalories = [];
        while ($row = $result->fetch_assoc()) {
            $totalConsumed = $row['totalConsumed'] ? (float)$row['totalConsumed'] : 0; // Explicitly cast to float
            $totalBurned = $row['totalBurned'] ? (float)$row['totalBurned'] : 0; // Explicitly cast to float

            error_log("Date: " . $row['Date'] . " - Consumed: " . $totalConsumed . " - Burned: " . $totalBurned);

            $netCalories[] = [
                'Date' => $row['Date'],
                'TotalConsumed' => $totalConsumed,
                'TotalBurned' => $totalBurned,
                'NetCalories' => $totalConsumed - $totalBurned
            ];
        }
        $response['netCalories'] = $netCalories;
    } else {
        $response['error'] = 'Query failed: ' . $mysqli->error;
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