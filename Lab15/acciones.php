<?php
require_once "functions/server/util.php";

function insert_song() {
    $name = $_POST['songName'];
    $composer = $_POST['composer'];

    if (strlen($name) > 0 && strlen($composer) > 0) {
        if (insertSong($name, $composer)) {
            echo "Well done, young anakin";
        }
    }
}

include("html/acciones.html");
?>