<?php

$valid_username = "Zeika";
$valid_pass = "Sushi";
$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST["username"] != $valid_username) {
        $error = "Nombre de usuario inválido";
        alert($error);
        return;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST["pass"] != $valid_pass) {
        $error = "Contraseña inválida";
        alert($error);
        return;
    }
}

// auxiliar functions
function alert($msg) {
    echo "<script type='text/javascript'>alert('$msg');</script>";
}

?>