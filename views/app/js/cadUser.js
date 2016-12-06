function goCadUser(){
    var connect, form, response, result, txt, msg_cad, name_user, user, email, pass, tp_user, status, msg_ok;
    name_user   = pegaid('name_user_reg').value;
    user        = pegaid('user_reg').value;
    email       = pegaid('email_reg').value;
    pass        = pegaid('pass_reg').value;
    tp_user     = pegaid('tipo_user_reg').value;
    status      = pegaid('status').value;
    //var minhaVar = request.getSession().getAttribute('app_id');
    /*
     * PASSOS
     * VERIFICAR SE OS CAMPOS ESTÃO PRENCHIDOS: OK
     * VERIFICAR SE O NOVO USER É ADMIN:OK
     * CASO SIM -> MOSTRA ALERT E SOLICITA SENHA VALIDA DE UM ADMINISTRADOR:
     * CASO NÃO -> CADASTRA O USUARIO NO DB
     */
    
    if (name_user !='' && user !='' && email !='' && pass !='') {           
         if (tp_user != 1) {
         //Para cadastro de usuario comum ou supervisor

            form = 'user=' + user + '&name_user=' + name_user + '&email=' + email + '&pass=' + pass + '&tp_user=' + tp_user + '&status=' + status;
            connect = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            connect.onreadystatechange = function () {
                if (connect.readyState == 4 && connect.status == 200) {
                    //logado
                    if (connect.responseText == 1) {
                        result = '<div class="alert alert-dismissible alert-success">';
                        result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                        result += '<h4>Registro OK!</h4>';
                        result += '<p>Você será redirecionado em instantes!</p>';
                        result += '</div>';
                        pegaid('_AJAX_REG_').innerHTML = result;
                        //recarrega a pagina
                        location.reload();
                        msg_ok = '<div class="alert alert-dismissible alert-success">';
                        msg_ok += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                        msg_ok += '<h4>Registro OK!</h4>';
                        msg_ok += '<p>:)</p>';
                        msg_ok += '</div>';                        
                        pegaid('_AJAX_REG_').innerHTML = msg_ok;
                    } 
                    else {
                        // nao logado
                        pegaid('_AJAX_REG_').innerHTML = connect.responseText;
                    }
                    //caso haja demora na resposta do servidor
                } 
                else if (connect.readyState !== 4) {
                    result = '<div class="alert alert-dismissible alert-warning">';
                    result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                    result += '<h4>Processando...</h4>';
                    result += '<p>Estamos verifincado os dados!</p>';
                    result += '</div>';
                    pegaid('_AJAX_REG_').innerHTML = result;
                }
            }
            //abre uma conexão 3º parametro true para que seja assincrono
            connect.open('POST', 'ajax.php?mode=cad_user', true);
            connect.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            connect.send(form);
        } 
        else { 
        //Para cadastro de usuario com direitos administrativos    
            msg_cad = confirm("Atenção: Você vai cadastar um usuário com direitos Administrativos!");
            if (msg_cad == true) {    

                form = 'user=' + user + '&name_user=' + name_user + '&email=' + email + '&pass=' + pass + '&tp_user=' + tp_user + '&status=' + status;
                //alert(form);
                //VERIFICA SE O NAVEGADOR É IE
                connect = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                //elemento que vai acionar toda vez que houver uma alteração no ajax quando houver um envio ou resposta para o servidor
                //cria uma funcao anonima
                connect.onreadystatechange = function () {
                    //1=ativo
                    //2=quando php enviando os dados
                    //3=quando php ja recebeu os dados
                    //4=quando php devolde os dados
                    //status 200 quando é encontrado
                    //propriedade da isntancia que vem de window.XMLHttpRequest
                    if (connect.readyState == 4 && connect.status == 200) {
                        //logado
                        if (connect.responseText == 1) {
                            result = '<div class="alert alert-dismissible alert-success">';
                            result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                            result += '<h4>Registro OK!</h4>';
                            result += '<p>Você será redirecionado em instantes!</p>';
                            result += '</div>';
                            pegaid('_AJAX_REG_').innerHTML = result;
                            //recarrega a pagina
                            location.reload();
                        } 
                        else {
                            // nao logado
                            pegaid('_AJAX_REG_').innerHTML = connect.responseText;
                        }
                        //console.log(connect.responseText);
                        //caso haja demora na resposta do servidor
                    } 
                    else if (connect.readyState !== 4) {
                        result = '<div class="alert alert-dismissible alert-warning">';
                        result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                        result += '<h4>Processando...</h4>';
                        result += '<p>Estamos verifincado os dados!</p>';
                        result += '</div>';
                        pegaid('_AJAX_REG_').innerHTML = result;
                    }
                }
                //abre uma conexão 3º parametro true para que seja assincrono
                connect.open('POST', 'ajax.php?mode=cad_user', true);

                //recebera os dados criptografados do POST - 
                //tipo de dado  Url codificada
                connect.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                connect.send(form);
                
            //caso o usuario que estiver sendo cadastrado for uma admi o sistema solicitara a senha novamente!
            /*  do {
                  var pass1 = prompt ("Informe a Senha de Administrador!");
                } while (pass1 == null || pass1 == "");
            */

            } 
            else {
                //alert("ebaa saiu!!!");   
            }

        }
        
    }
    else {
        result =  '<div class="alert alert-dismissible alert-danger">';
        result += '<button type="button" class="close" data-dismiss="alert">&times;</button>';
        result += '<h4>ERROR</h4>';
        result += '<p>Preencha todos os campos</p>';
        result += '</div>';
        pegaid('_AJAX_REG_').innerHTML = result;     
        //exit();
    }


}//funcão

    //reconhece tecla enter
function runScriptCadUser(e){
    if(e.keyCode == 13){
        //alert("oo");
        goCadUser();
    }
}

