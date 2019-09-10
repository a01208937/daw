<?php
$intNum = 1;
$input = $_GET["num"];
$num = intval($input);
echo"<table align=center width=80% border=1 cellspacing=0 cellpading=2>";
echo "<tr>";
echo "<th>Numero</th>";
echo "<th>Cuadrado del número</th>";
echo "<th>Cubo del número</th>";
echo "</tr>";
while($intNum<=$input){
    $intNum2 = $intNum*$intNum;
    $intNum3=$intNum2*$intNum;
    echo"<tr>";
    echo "<td>" .$intNum, "</td>";
    echo "<td>" .$intNum2, "</td>";
    echo "<td>" .$intNum3,"</td>";
    echo"<tr>";
    $intNum++;
}echo"</table>";
?>