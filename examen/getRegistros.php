<?php
$servername = "mysql1008.mochahost.com";
$username = "dawbdorg_1208937";
$password = "1208937";
$db = "dawbdorg_A01208937";

$uid = $_POST['uid'];

function getRegistros($conn, $idUsuario)
{
    //obtener usuarios
    $res = "";
    $sqlUsers = "call obtenerRegistrosPorUsuario(" . $idUsuario . ");";
    if ($uResult = mysqli_query($conn, $sqlUsers)) {
        while ($row = mysqli_fetch_assoc($uResult)) {
            $res .= $row['Estado'] . " " . $row['FechaHora'] . "<br>";
        }
    } else {
        $res = "error obteniendo registro";
    }
    return $res;
}

$conn = new mysqli($servername, $username, $password, $db);
echo getRegistros($conn, $uid);

?>