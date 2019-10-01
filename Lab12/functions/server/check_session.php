<?php
//------------- funciones -------------------
function logout() {
    session_unset();
    session_destroy();
    header("http://localhost/a01208937/main.php");
}

// auxiliar functions
function alert($msg) {
    echo "<script type='text/javascript'>alert('$msg');</script>";
}
//------------- funciones -------------------

session_start();
if (!$_SESSION['name']) logout();
else {
    //echo("sesión válida"); // si no está comentada esta linea, aparece un texto que indica si la sesión es válida :)
}

if (isset($_POST['logout'])) logout();

?>