<?php
require_once "functions/server/util.php";

if (isset($_POST['logIn'])) {
    $username_field = $_POST['uname'];
    $pass_field = $_POST['pass'];
    if ($pass_field == getUserPassWord($username_field)) {
        session_start();
        $_SESSION['uid'] = $username_field;
        echo $_SESSION['uid'];
    } else {
        echo 'Wrong username or password';
    }
}
?>