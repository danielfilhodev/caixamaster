<?php

if (!empty($_POST['user']) and ! empty($_POST['pass'])) {

    $db   = new Connect();
    $data = $db->real_escape_string($_POST['user']);
    $pass = $_POST['pass'];
    $sql  = $db->query("SELECT user_id, user_password FROM usuarios WHERE (user = '$data' OR user_email = '$data') LIMIT 1");

    //verifca se encontro o usuario
    if ($db->rows($sql) > 0) {
        while ($dado = $db->selectArr($sql)) {
            $hash = $dado['user_password'];
            
            //compara a senha do post com a senha do DB
            //Bcrypt::check($pass, $hash);
            if (Bcrypt::check($pass, $hash)) {

                if ($_POST['sesion']) { ini_set('session.cookie_lifetime', time(1)); }

                $_SESSION['app_id'] = $dado['user_id'];
                echo 1;
                //exit("bem vindo");
            }else{
                echo '<div class="alert alert-dismissible alert-danger">
                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                      <strong>ERROR:</strong> Os dados informados estão incorretos!
                      </div>';
            }
        }
        
    } else {
        echo '<div class="alert alert-dismissible alert-danger">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              <strong>ERROR:</strong> Os dados informados estão incorretos!
              </div>';
    }
    $db->reset($sql);
    $db->close();
} else {
    echo '<div class="alert alert-dismissible alert-danger">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>ERROR:</strong> Todo os dados devem estar preenchidos!
          </div>';
}



/*  
    //echo '<pre>';
    //var_dump($sql);

    
    
   /* 
$hash = '$2a$08$MTgxNjQxOTEzMTUwMzY2OOc15r9yENLiaQqel/8A82XLdj.OwIHQm'; // Valor retirado do banco

Bcrypt::check($_GET['pass'], $hash)
        
    $pass = FUNCAO($_GET['pass']);
    

    $db->close();
    */