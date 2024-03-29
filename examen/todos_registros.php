<?php
$servername = "mysql1008.mochahost.com";
$username = "dawbdorg_1208937";
$password = "1208937";
$db = "dawbdorg_A01208937";

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

// obtener estados
$sql = "call obtenerEstados();";
$statesCount = 0;
$conn = new mysqli($servername, $username, $password, $db);
if ($result = mysqli_query($conn, $sql)) {
    while ($row = mysqli_fetch_assoc($result)) {
        $arrEstados[$statesCount][0] = $row['Id'];
        $arrEstados[$statesCount][1] = $row['Nombre'];
        $statesCount++;
    }
} else {
    echo "error obteniendo estados";
}

// obtener registros
$sql = "call obtenerRegistros();";
$regCount = 0;
$conn = new mysqli($servername, $username, $password, $db);
if ($result = mysqli_query($conn, $sql)) {
    while ($row = mysqli_fetch_assoc($result)) {
        $arrReg[$regCount][0] = $row['Id'];
        $arrReg[$regCount][1] = $row['FechaHora'];
        $arrReg[$regCount][2] = $row['Id_Usuario'];
        $arrReg[$regCount][3] = $row['Id_Estado'];
        echo getUsername($arrReg[$regCount][2], $usersCount, $arrUsuarios);
        echo " ";
        echo getEstado($arrReg[$regCount][3], $statesCount, $arrEstados);
        echo " ";
        echo $arrReg[$regCount][1];
        echo '<br>';
        $regCount++;
    }
} else {
    echo "error obteniendo registros";
}

//funciones auxiliares
function getUsername($uid, $count, $arrUs) {
    for ($i=0; $i<$count; $i++) {
        if ($arrUs[$i][0] == $uid) {
            return $arrUs[$i][1];
        }
    }
}

function getEstado($eId, $count, $arrEs) {
    for ($i=0; $i<$count; $i++) {
        if ($arrEs[$i][0] == $eId) {
            return $arrEs[$i][1];
        }
    }
}

?>

<!DOCTYPE html>
<html>
<html lang="es">

<head>
    <!--Import materialize.css-->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <meta content="text/html; charset=UTF-8" http-equiv="content-type">
    <title>Examen de segundo parcial</title>

    <script type="text/javascript" src='funciones.js'> </script>
</head>

<body>
    <div class="container">
        <br>
        <?php
        // presentar todos los registros
        ?>
    </div>
</body>

</html>