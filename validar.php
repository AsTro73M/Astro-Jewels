<?php
if (isset($_POST['correo']) && isset($_POST['inputPassword'])) {
    include("connection.php");
    $usuario = $_POST['correo'];
    $password = $_POST['inputPassword'];
    
    // Consulta para verificar el usuario en la base de datos
    $sql = "SELECT * FROM Usuarios WHERE email_usua = '$usuario' AND pass_usua = '$password'";

    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {

        $row = $result->fetch_assoc();
        $tipo_us = $row['tipo_usua'];
        $idusa = $row['email_usua'];
        // Mandar a la página correspondiente según el tipo de usuario
        if ($tipo_us == 2) {
            // Página del cliente

            $pagina = "index.html?usuario="  . urlencode($idusa);
            header("Location: " . $pagina);
            exit();
        } elseif ($tipo_us == 1) {
            // Página de empleados/administradores
            header("Location:Back/Otros/index.php");
            exit();
        }
    } else {
        // Usuario no encontrado
        echo"Usuario No Encontrado";
        exit();
    }
}

$conn->close();
?>
