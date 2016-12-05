function goReg(){
    var connect, form, response, result, user, pass, sesion;
    user    = pegaid('user_login').value;
    pass    = pegaid('pass_login').value;
    sesion  = pegaid('session_login').checked ? true : false;
    
    form = 'user=' + user + '&pass=' + pass + '&sesion=' + sesion;
        //alert(form);
    //VERIFICA SE O NAVEGADOR É IE
    connect = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
   //elemento que vai acionar toda vez que houver uma alteração no ajax quando houver um envio ou resposta para o servidor
    //cria uma funcao anonima
    connect.onreadystatechange = function(){
        //1=ativo
        //2=quando php enviando os dados
        //3=quando php ja recebeu os dados
        //4=quando php devolde os dados
        //status 200 quando é encontrado
           //propriedade da isntancia que vem de window.XMLHttpRequest
        if (connect.readyState == 4 && connect.status == 200) {
            //logado
          if(connect.responseText == 1){
            result =  '<div class="alert alert-dismissible alert-success">';
            result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
            result += '<h4>Conectado!</h4>';
            result += '<p>Você será redirecionado em instantes!</p>';
            result += '</div>';
            pegaid('_AJAX_LOGIN_').innerHTML = result;
            //recarrega a pagina
            location.reload();
          }else{
            // nao logado
            pegaid('_AJAX_LOGIN_').innerHTML = connect.responseText;
          }
         console.log(connect.responseText)         ;
          //caso haja demora na resposta do servidor
        }else if(connect.readyState !== 4){            
            result =  '<div class="alert alert-dismissible alert-warning">';
            result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
            result += '<h4>Processando...</h4>';
            result += '<p>Estamos verifincado os dados!</p>';
            result += '</div>';
            pegaid('_AJAX_LOGIN_').innerHTML = result;
        }
    }
    //abre uma conexão 3º parametro true para que seja assincrono
    connect.open('POST','ajax.php?mode=login',true);
    
    //recebera os dados criptografados do POST - 
                            //tipo de dado  Url codificada
    connect.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    connect.send(form);
}

    //reconhece tecla enter
function runScriptReg(e){
    if(e.keyCode == 13){
        //alert("oo");
        goReg();
    }
}

