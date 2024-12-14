<?php

// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Return JSON  
header('Content-Type: application/json');

$response = [];

// Handle POST request (user login)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userid = $mysqli->real_escape_string($_POST['userid']);
    $password = $mysqli->real_escape_string($_POST['password']);

    // Query to select the user by UserID (PK)
    $query = "SELECT * FROM oneuser WHERE UserID = '$userid'";
    $result = $mysqli->query($query);

    // Check if the user exists in the database
    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (md5($password) === $user['UserPW']) {
            session_start();
            $_SESSION['user_id'] = $user['UserID'];
            $response = [
                'message' => 'Login successful',
                'user' => [
                    'UserID' => $user['UserID'],
                    'Name' => $user['Name'],
                    'Age' => $user['Age'],
                    'Gender' => $user['Gender'],
                    'Height' => $user['Height'],
                    'Weight' => $user['Weight']
                ]
            ];
        } else {
            $response = ['error' => 'Invalid credentials'];
        }
    } else {
        $response = ['error' => 'User not found'];
    }

    // Free result set
    $result->free();
} else {
    $response = ['error' => 'Invalid request method'];
}

// Close database 
$mysqli->close();

echo json_encode($response);
exit();
?>