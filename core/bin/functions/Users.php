<?php

function Users(){
    $db = new Connect();
    $sql = $db->query("SELECT * FROM usuarios");
    
    if($db->rows($sql) > 0){
        while ($d = $db->selectArr($sql)) {
            $users[$d['user_id']] = array(
                
                'id'        => $d['user_id'],
                'user'      => $d['user'],
                'email'     => $d['user_email'],
                'pass'      => $d['user_password'],
                'nome'      => $d['user_name'],
                'permissao' => $d['user_permissao']

            );
            
        }
    }else{
        $users = false;
    }
    $db->reset($sql);
    $db->close();
    
    return $users;
}