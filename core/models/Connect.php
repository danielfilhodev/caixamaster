<?php

class Connect extends mysqli{
    
    public function __construct(){
        parent::__construct(DB_HOST,DB_USER,DB_PASS,DB_NAME);
        $this->connect_errno ? die('Erro na conexão com o Banco de Dados!') : NULL;
        $this->set_charset("utf8");
    }
    
    public function rows($query){
        return mysqli_num_rows($query);
    }
    
    public function reset($query){
        return mysqli_free_result($query);
    }

    public function selectArr($query){
        return mysqli_fetch_array($query);
    }    
            
    public function selectAss($query){
        return mysqli_fetch_assoc($query);
    }    
}
