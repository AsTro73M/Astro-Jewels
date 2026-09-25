<?php
include("connection.php"); // Include database connection file

if (isset($_POST['inputFirstName']) && isset($_POST['correo']) && isset($_POST['inputPassword'])) {

  $nombre = $_POST['inputFirstName'];
  $correo = $_POST['correo'];
  $contrasena = $_POST['inputPassword'];


  // Check if the email already exists in the database
  $sql_check = "SELECT COUNT(*) as count FROM Usuarios WHERE email_usua = '$correo'";
  $result_check = $conn->query($sql_check);
  $row_check = $result_check->fetch_assoc();
  $correo_existente = $row_check['count'];

  if ($correo_existente > 0) {
    // The email already exists, display an error message or redirect to an error page
    echo "<h1>Correo Existente</h1>";
  } else {
    // The email doesn't exist, insert the data into the database
    //$sql_insert = "INSERT INTO Usuarios VALUES ((select max(id_us) + 1 from TUsuarios as tu), 'Cliente', '$nombre', '$correo', 1, '$contrasena')"
    $sql_insert = "INSERT INTO Usuarios (email_usua, tipo_usua, pass_usua) VALUES ('$correo', 2, '$contrasena')";
    
    if ($conn->query($sql_insert) === TRUE) {
      echo "Registro Exitoso, Bienvenido";
    } else {
      echo "Registro No Exitoso";
    }
  }

  $conn->close();
}
?>