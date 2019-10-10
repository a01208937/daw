<?php
session_start();

require_once "functions/server/util.php";

include("html/search.html");

// load search data
$songList = getSongsByArtist($_SESSION['search_field']);
echo $songList;

?>