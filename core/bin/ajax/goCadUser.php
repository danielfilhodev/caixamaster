<?php
$db = new Connect();
$user = filter_var($_POST['user'], FILTER_SANITIZE_STRING);
$email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
$name_user = $db->real_escape_string($_POST['name_user']);                
$pass = $db->real_escape_string( $_POST['pass']);
//cryptografa a senha
$hash = Bcrypt::hash($pass);
$tp_user = $db->real_escape_string( $_POST['tp_user']);
$status = $db->real_escape_string( $_POST['status']);

   $sql = $db->query("SELECT user, user_email FROM usuarios WHERE (user = '$user' OR user_email = '$email') LIMIT 1");
   if ($db->rows($sql) < 1) {
        //$dados = $db->selectArr($sql)[0];
        $log = "Responsável pelo cadastro<br> Nome: ". $users[$_SESSION['app_id']]['nome']. "<br> Usuário: ". $users[$_SESSION['app_id']]['user'] . "<br> Email: ". $users[$_SESSION['app_id']]['email'] . "<br> Data: ". date('d/m/Y - H:i:s') . "<br> IP :". $_SERVER['REMOTE_ADDR'];
        $dtCad = date('Y-m-d');    
        $sql = $db->query("INSERT INTO usuarios (user, user_email, user_name, user_password, user_permissao, user_dt_cad, status, log) VALUE ('$user','$email','$name_user','$hash','$tp_user','$dtCad','$log', '$status')");
        $html = 1;
        //$db->reset($sql);
    } else {   
        $html = '<div class="alert alert-dismissible alert-danger">
             <button type="button" class="close" data-dismiss="alert">&times;</button>
             <h4>ERROR</h4>
             <p>Usuário ja Existe!</p>
             </div>';           
     }  
//$db->reset($sql);
$db->close();
echo $html;