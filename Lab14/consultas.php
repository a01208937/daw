<?php
//include("util.php");
require_once "util.php";

// auxiliar functions
function alert($msg) {
    echo "<script type='text/javascript'>alert('$msg');</script>";
}

if (isset($_POST['todas'])) {
    $fruits = getFruits();
    if (mysqli_num_rows($fruits) > 0) {
        while ($row = mysqli_fetch_assoc($fruits)) {
            echo "<tr>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td>" . $row["units"] . "</td>";
            echo "<td>" . $row["quantity"] . "</td>";
            echo "<td>" . $row["price"] . "</td>";
            echo "<td>" . $row["country"] . "</td>";
            echo "</tr>";
        }
    }
}

if (isset($_POST['caras'])) {
    $fruits = getExpensiveFruits(75);
    if (mysqli_num_rows($fruits) > 0) {
        while ($row = mysqli_fetch_assoc($fruits)) {
            echo "<tr>";
            echo "<td>" . $row["name"] . "</td>";
            echo "</tr>";
        }
    }
}

if (isset($_POST['japonesas'])) {
    $fruits = getJapaneseFruits();
    if (mysqli_num_rows($fruits) > 0) {
        while ($row = mysqli_fetch_assoc($fruits)) {
            echo "<tr>";
            echo "<td>" . $row["name"] . "</td>";
            echo "</tr>";
        }
    }
}

include("html/consultas.html");
?>