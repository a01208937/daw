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

function getFruits() {
    $conn = connectDb();
    $sql = "SELECT name, units, quantity, price, country FROM Fruit";
    $result = mysqli_query($conn, $sql);
    closeDb($conn);
    return $result;
}

function getExpensiveFruits($expensive_price) {
    $conn = connectDb();
    $sql = "SELECT name FROM Fruit WHERE quantity = " . $expensive_price;
    $result = mysqli_query($conn, $sql);
    closeDb($conn);
    return $result;
}

function getJapaneseFruits() {
    $conn = connectDb();
    $sql = "SELECT name FROM Fruit WHERE country = Japan";
    $result = mysqli_query($conn, $sql);
    closeDb($conn);
    return $result;
}

?>