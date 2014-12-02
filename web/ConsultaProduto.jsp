<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Produto</title>
    </head>
    <body>
        
        <div align="center" class="container">
        
            <h1>Consultar Produtos</h1>
            
        <form method="GET" action="ServletListarProduto">
            <button class="btn btn-primary" type="submit" id="btnListarProdutos" value="Atualizar">Atualizar</button><br><br>
        </form>
        
        <form method="GET" action="ServletConsultarProduto" class="form-inline">
            <input style="width: 300px;" class="form-control" placeholder="Produto" type="text" name="txtProdutoNome">
            <input hidden="true"  type="text" name="txtPagina" value="ConsultaProduto.jsp">
            <button class="btn btn-primary" type="submit" id="btnConsultarProdutos" value="Buscar">Buscar</button><br><br>
        </form>
 
        <table class="table table-striped">
            <th> Código do Produto </th>
            <th> Nome do Produto </th>
            <th> Preço </th>
            <th> Descrição </th>
            <th> Quantidade </th>
            <th> Marca </th>
            <th> Fornecedor </th>
            <th> Alterar </th>
            <th> Excluir </th>
            
            <c:forEach items="${produtos}" var="produto" varStatus="loop">
                <tr>
                    <td> ${produto.getProdutoCodigo()} </td>
                    <td> ${produto.getProdutoNome()} </td>
                    <td> ${produto.getProdutoPreco()} </td>
                    <td> ${produto.getProdutoDescricao()} </td>
                    <td> ${produto.getProdutoQuantidade()} </td>
                    <td> ${produto.getMarca().getMarcaNome()} </td>
                    <td> ${produto.getFornecedor().getFornecedorNome()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCampos(${produto.getProdutoCodigo()}, '${produto.getProdutoNome()}', ${produto.getProdutoPreco()}, '${produto.getProdutoDescricao()}', ${produto.getProdutoQuantidade()}, '${produto.getMarca().getMarcaCodigo()}', '${produto.getFornecedor().getFornecedorCodigo()}' )" id="btnAlterarProduto${produto.getProdutoCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirProduto(${produto.getProdutoCodigo()}, '${produto.getProdutoNome()}')" id="btnExcluirProduto${produto.getProdutoCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>    
        
        <form role="form">
                <input style="width: 300px;" disabled="true" class="form-control" placeholder="Código" type="text" name="txtProdutoCodigo" id="txtProdutoCodigo"><br>
                <input style="width: 300px;" class="form-control" placeholder="Quantidade" type="text" name="txtProdutoQuantidade" id="txtProdutoQuantidade"><br>
                <input style="width: 300px;" class="form-control" placeholder="Descrição" type="text" name="txtProdutoDescricao" id="txtProdutoDescricao"><br>
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" name="txtProdutoNome" id="txtProdutoNome"><br>
                <input style="width: 300px;" class="form-control" placeholder="Preço" type="text" name="txtProdutoPreco" id="txtProdutoPreco"><br>

                <select name="cbxMarcas" id="cbxMarcas" >
                    <option selected disabled> Marca </option>
                    <c:forEach items="${marcas}" var="marca" varStatus="loop">
                        <option value="${marca.getMarcaCodigo()}"> ${marca.getMarcaNome()} </option>
                    </c:forEach>
                </select>
                
                <select name="cbxFornecedores" id="cbxFornecedores" >
                    <option selected disabled> Fornecedor </option>
                    <c:forEach items="${fornecedores}" var="fornecedor" varStatus="loop">
                        <option value="${fornecedor.getFornecedorCodigo()}"> ${fornecedor.getFornecedorNome()} </option>
                    </c:forEach>
                </select>
                
                <br><br>
                
                <button type="submit" onclick="alterarProduto()" class="btn btn-primary" id="btnAlterar">Alterar</button> 
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
            </form>
        
    <script>
        
        function limparCampos()
        {
            document.getElementById("txtProdutoCodigo").value = "";
            document.getElementById("txtProdutoQuantidade").value = "";
            document.getElementById("txtProdutoDescricao").value = "";
            document.getElementById("txtProdutoNome").value = "";
            document.getElementById("txtProdutoPreco").value = "";
        }
        
        function alterarProduto()
        {
            var produtoCodigo = document.getElementById("txtProdutoCodigo").value;
            var produtoQuantidade = document.getElementById("txtProdutoQuantidade").value;
            var produtoDescricao = document.getElementById("txtProdutoDescricao").value;
            var produtoNome = document.getElementById("txtProdutoNome").value;
            var produtoPreco = document.getElementById("txtProdutoPreco").value;
            var marcaCodigo = document.getElementById("cbxMarcas").value;
            var fornecedorCodigo = document.getElementById("cbxFornecedores").value;
            
            $.get('ServletManipularProduto', {codigoProduto:produtoCodigo, quantidadeProduto:produtoQuantidade, descricaoProduto:produtoDescricao, nomeProduto:produtoNome, precoProduto:produtoPreco, codigoMarca:marcaCodigo, codigoFornecedor:fornecedorCodigo, acao:'alterar'}, function() {
                    window.location.reload(true);
                }); 
        }
        
        function excluirProduto(paramProdutoCodigo, paramProdutoNome)
        {
            alert("Excluir Produto " + paramProdutoCodigo + paramProdutoNome);
            $.get('ServletManipularProduto', {codigoProduto:paramProdutoCodigo, acao:'excluir'}, function(){
                window.location.reload(true);    
            }); 
        }
        
        function preencherCampos(paramProdutoCodigo, paramProdutoNome, paramProdutoPreco, paramProdutoDescricao, paramProdutoQuantidade, paramMarcaCodigo, paramFornecedorCodigo)
        {
            document.getElementById("txtProdutoCodigo").value = paramProdutoCodigo;
            document.getElementById("txtProdutoQuantidade").value = paramProdutoQuantidade;
            document.getElementById("txtProdutoDescricao").value = paramProdutoDescricao;
            document.getElementById("txtProdutoNome").value = paramProdutoNome;
            document.getElementById("txtProdutoPreco").value = paramProdutoPreco;
            $("#cbxMarcas").val(paramMarcaCodigo);
            $("#cbxFornecedores").val(paramFornecedorCodigo);
        }
        
        
    </script>
    
        </div>
    
    </body>
</html>
