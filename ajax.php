<?php

if ($_POST) {

    require 'core/core.php';
    
    switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
        case 'login':
            require 'core/bin/ajax/goLogin.php';
        break;
    
        case 'cad_user':
            require 'core/bin/ajax/goCadUser.php';
        break;
    
        case 'reg':
            require 'core/bin/ajax/consult.php';
        break;    
    
        default:
            header('location: index.php');
        break;
    }
}else{
    header('location: index.php');
}
