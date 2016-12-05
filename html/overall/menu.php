<nav class="navbar navbar-inverse" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bar1">
      <span class="sr-only">Navegação</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.php"><?php APP_TITLE; ?></a>
  </div>
  <div class="collapse navbar-collapse" id="bar1">
    <ul class="nav navbar-nav ">
      <?php
        if ( $_SESSION['app_id'] == true ) {
        //Mostra no menu a opção de USUARIOS 
      ?>
        <li><a href="?view=cadastro_usuario">Cadastro Usuário</a></li>
      <?php }//fecha if ?>
        <li><a href="?view=cad_pedido">Novo Pedido</a></li>
        <?php
          //if ( $_SESSION['logado'] === true and $_SESSION['usuario'] === 'admin'){
          //Mostra no menu a opção Pesquisar?>            

        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Relatórios <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="?view=pesquisa_pedido">Pedidos</a></li>
              <!--<li><a href="pesquisa.php">Por Pedido</a></li>-->
            </ul>
        </li>
        <?php //}//fecha if ?>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a>Nome: <?php echo strtoupper($users[$_SESSION['app_id']]['nome']);  ?></a></li>
        <li><a>|</a></li>
        <li><a>Email: <?php echo strtolower($users[$_SESSION['app_id']]['email']);  ?></a></li>
        <li><a>|</a></li>
        <li><a href="?view=logoff">Sair@</a></li>
    </ul>        
  </div><!-- /.navbar-collapse -->
</nav>
