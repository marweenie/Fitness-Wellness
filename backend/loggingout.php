<?php
// Marwa Chbeir & Michael Sepsey

session_start();
session_unset();
session_destroy();

// Redirect to the login page
header('Location: ../frontend/login.html'); 
exit();
?>
