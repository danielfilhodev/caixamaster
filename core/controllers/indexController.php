<?php
    
if(isset($_SESSION['app_id'])){

    include HTML_DIR . 'index/index.php';

} else {
    
    include 'core/controllers/loginController.php';
    
}
    
