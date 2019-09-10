<?php
    $input = $_GET['arr'];
    $arr = array_map('intval', explode(',', $input));

    echo "Lista: <br>";
    echo "Números: ";
    for ($i = 0; $i<count($arr); $i++) {
        echo $arr[$i] ." ";
    }
    echo "<br> <ul>";
    // promedio
    $total = 0;
    foreach ($arr as $it) {
        $total += $it;
    }
    $total /= count($arr);
    echo "<li>"."Promedio: ".$total."</li>";
    // mediana
    $index = count($arr)/2;
    if ($index % 2 != 0) {
        $index = floor($index);
    } 
    echo "<li>"."Mediana: ".$arr[$index]."</li>";
    // ordenados <
    sort($arr);
    echo "<li>Ordenados menor-mayor: ";
    foreach ($arr as $it) {
        echo $it." ";
    }
    echo "</li>";
    // ordenados >
    rsort($arr);
    echo "<li>Ordenados mayor-menor: ";
    foreach ($arr as $it) {
        echo $it." ";
    }
    echo "</li>";
    echo "</ul>"
?>