<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        
        <script src="jquery/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        
       
 
        <div class="container">
        
            <nav class="navbar navbar-default" role="navigation">

                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu-principal">
                        <span class="sr-only">Toggle navigation</span>
                      </button>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-menu-principal">
                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cargo <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroCargo.jsp">Cadastrar</a></li>
                              <li><a href="ServletListarCargo">Consultar</a></li>
                              <li><a href="ServletListarCargo">Alterar</a></li>
                              <li><a href="ServletListarCargo">Excluir</a></li>
                            </ul>
                          </li>
                       </ul> 

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cliente <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroCliente.jsp">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                        </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Configurações <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Alterar Username</a></li>
                              <li><a href="#">Alterar Senha</a></li>
                            </ul>
                          </li>
                       </ul> 

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fornecedor <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroFornecedor.jsp">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Funcionário <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroFuncionario.jsp">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul> 

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Marca <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroMarca.jsp">Cadastrar</a></li>
                                <li><a href="ServletListarMarca" >Consultar</a></li>
                                <li><a href="ServletListarMarca">Alterar</a></li>
                                <li><a href="ServletListarMarca">Excluir</a></li>
                            </ul>
                          </li>
                       </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Produto <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroProduto.jsp">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Relatório <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Relatório Local</a></li>
                              <li><a href="#">Relatório Geral</a></li>
                            </ul>
                          </li>
                       </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Unidade <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="CadastroUnidade.jsp">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul>  


                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Venda <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                        </ul>  

                        <ul class="nav navbar-nav navbar-right">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Sair</a></li>
                            </ul>
                          </li>
                       </ul>

                    </div>
                </div> 
            </nav>
            
        </div>
        
        
    </head>
    <body>
    </body>
</html>
