<script>
//para não criar muitas variáveis dispersas, é interessante criar um array de variáveis 
var VARS_SESSION = new Array();
//em nosso exemplo vamos preencher a variável de ambiente “caminho_servidor”
// a qual terá seu conteúdo fornecido por um echo PHP
return VARS_SESSION['id_user'] = <?php echo $_SESSION['app_id'] ?>;

</script>