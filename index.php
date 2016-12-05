<?php
require 'core/core.php';

if (isset($_GET['view'])) {
    //Verifica se existe o arquivo 
    //concatena o valor passado em $_GET
    //http://localhost/projeto/index.php?view=produtoController.php
    if (file_exists('core/controllers/'. strtolower($_GET['view']).'Controller.php')) {
        include('core/controllers/'. strtolower($_GET['view']).'Controller.php');
    }else{
        include('core/controllers/errorController.php');
    }

} else {
    include('core/controllers/indexController.php');
}