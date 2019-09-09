<?php
    $input = $_GET['arr_prom'];
    $arr = array_map('intval', explode(',', $input));
    $total = 0;
    foreach ($arr as $it) {
        $total += $it;
    }
    $total /= count($arr);
    echo($total);
?>