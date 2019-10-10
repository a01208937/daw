<?php
session_start();
require_once "functions/server/util.php";


// POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['search'])) {
        search($_POST['artist_txt']);
    }
}

//----------- FUNCTIONS -----------------
function insert_song() {
    $name = $_POST['songName'];
    $composer = $_POST['composer'];

    if (strlen($name) > 0 && strlen($composer) > 0) {
        if (insertSong($name, $composer)) {
            echo "Well done, young anakin";
        }
    }
}

function search($artist) {
    $_SESSION['search_field'] = $artist;
    header("location: http://localhost/a01208937/search.php");
}

include("html/acciones.html");
?>