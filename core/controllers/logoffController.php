<?php

if(isset($_SESSION['user_id'])){
    
    session_destroy();

    header ('location: core/controllers/indexController.php');
    
}
