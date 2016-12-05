<?php
//NUCLEO DA APLICAÇÃO
//
//INICIA A SESSION
session_start();

#CONSTANTES DE CONEXÃO
define('DB_HOST', 'localhost');
define('DB_USER', 'suporte');
define('DB_PASS', '9731');
define('DB_NAME', 'caixa_master');

#CONSTANTES DA APP
define('HTML_DIR','html/');
define('APP_TITLE','Caixa Master');
define('APP_URL','http://localhost/caixamaster/');

#ESTRUTURA
require 'vendor/autoload.php';
require 'core/models/Connect.php';
require 'core/bin/functions/Encrypt.php';
require 'core/bin/functions/Users.php';

#ATRIBUIÇÃO DE VARIAVEL PRA FUNÇÃO PARA ULIZAÇÃO GLOBAL
$users = Users();


