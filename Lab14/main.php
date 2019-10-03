<?php

// auxiliar functions
function alert($msg) {
    echo "<script type='text/javascript'>alert('$msg');</script>";
}

if (isset($_POST['preguntas_btn'])) {
    header("location: http://localhost/a01208937/preguntas.php");
}

if (isset($_POST['consultas_btn'])) {
    header("location: http://localhost/a01208937/consultas.php");
}

include("html/main.html");
?>