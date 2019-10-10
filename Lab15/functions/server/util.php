<?php

function connectDb() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "dbname";

    $con = mysqli_connect($servername, $username, $password, $dbname);

    // Check connection
    if (!$con) {
        die("Connection failed: " . mysqli_connect_error());
    }

    return $con;
}

// La variable $mysql es una conexión establecida anteriormente
function closeDb($mysql) {
    mysqli_close($mysql);
}

function getSongsByArtist($artist) {
    $conn = connectDb();
    $sql = "SELECT name FROM Songs WHERE artist = " . $artist;
    $result = mysqli_query($conn, $sql);
    closeDb($conn);
    return $result;
}

function insertSong($name, $composer) {
    $conn = conectDB();

    $sql = "INSERT INTO Songs (name, composer) VALUES (\"" . $name . "\",\"" . $composer . "\");";
    
    if (mysqli_query($conn, $sql)) {
        echo "New song added succesfully!";
        closeDb($conn);
        return true;
    } else {
        echo "Error: " . $sql . "<br>" . msqli_error($conn);
        closeDb($conn);
        return false; 
    }

    closeDb($conn);
}

?>