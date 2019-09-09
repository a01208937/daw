<?php
    $input = $_GET['arr'];
    $arr = array_map('intval', explode(',', $input));
    $index = count($arr)/2;
    if ($index % 2 != 0) {
        $index = floor($index);
    } 
    echo($arr[$index]);
?>