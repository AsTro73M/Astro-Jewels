<?php
// Habilita los errores en pantalla
ini_set('display_errors','on');
//Todos los errores
error_reporting(E_ALL);

$servername = "localhost";
$username = "root";
$password = "123456";
$dbname = "AJ";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
