<?php
session_start();
$valid_username = "Zeika";
$valid_pass = "Sushi";
$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST["username"] != $valid_username) {
        $error = "Nombre de usuario inválido";
        alert($error);
        return;
    } else if ($_POST["pass"] != $valid_pass) {
        $error = "Contraseña inválida";
        alert($error);
        return;
    } else {
        if (isset($_POST['username'])) {
            $_SESSION['name'] = $_POST['username'];
            header("location: http://localhost/a01208937/form.php");
        }
    }
}

// auxiliar functions
function alert($msg) {
    echo "<script type='text/javascript'>alert('$msg');</script>";
}

?>