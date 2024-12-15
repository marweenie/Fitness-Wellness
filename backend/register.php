<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// database connection
$mysqli = new mysqli("localhost", "root", "", "fitnesswellnessdb");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// for JSON  
header('Content-Type: application/json');

$response = [];

// Handle POST  (aka user registration)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $mysqli->real_escape_string($_POST['username']);
    $age = $mysqli->real_escape_string($_POST['userage']);
    $gender = $mysqli->real_escape_string($_POST['usergender']);
    $height = $mysqli->real_escape_string($_POST['userheight']);
    $weight = $mysqli->real_escape_string($_POST['userweight']);
    $password = $mysqli->real_escape_string($_POST['password']);
    $confirmpassword = $mysqli->real_escape_string($_POST['confirmpassword']);

    // Check if the passwords match (when creating a new one)
    if ($password !== $confirmpassword) {
        $response = ['error' => 'Passwords do not match'];
        echo json_encode($response);
        exit();
    }

    // Hash the password from md5 (encrypt)
    $hashedPassword = md5($password);

    // Insert new user into DB
    $query = "INSERT INTO oneuser (Name, Age, Gender, Height, Weight, UserPW) VALUES ('$name', '$age', '$gender', '$height', '$weight', '$hashedPassword')";

    if ($mysqli->query($query) === TRUE) {
        $userid = $mysqli->insert_id;
        $response = [
            'message' => 'Sign up successful',
            'user' => [
                'UserID' => $userid,
                'Name' => $name,
                'Age' => $age,
                'Gender' => $gender,
                'Height' => $height,
                'Weight' => $weight
            ]
        ];
    } else {
        $response = ['error' => 'Error: ' . $mysqli->error];
    }
} else {
    $response = ['error' => 'Invalid request method'];
}

$mysqli->close();

// Output response & exit
echo json_encode($response);
exit();
?>