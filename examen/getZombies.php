<?php 
$servername = "mysql1008.mochahost.com";
$username = "dawbdorg_1208937";
$password = "1208937";
$db = "dawbdorg_A01208937";


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

//obtener usuarios
$sqlUsers = "call obtenerUsuarios();";
$usersCount = 0;
$conn = new mysqli($servername, $username, $password, $db);
if ($uResult = mysqli_query($conn, $sqlUsers)) {
    while ($row = mysqli_fetch_assoc($uResult)) {
        $arrUsuarios[$usersCount][0] = $row['Id'];
        $arrUsuarios[$usersCount][1] = $row['Nombre'];
        $usersCount++;
    }
} else {
    echo "error obteniendo usuarios";
}

for ($i = 0; $i < $usersCount; $i++) {
    $conn = new mysqli($servername, $username, $password, $db);
    echo "<tr>
            <td>" . $arrUsuarios[$i][1] . "</td>
            <td><div id='reg".$i."'></div>" . getRegistros($conn, $i + 1) . 
            '<a class="waves-effect waves-light btn btn modal-trigger" href="#modal1">
                <i class="material-icons left">
                    add
                </i>Registrar estado</a>
            </td>';
}
                    
?>