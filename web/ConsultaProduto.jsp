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
        
        <form method="GET" action="ServletListarProduto">
            <button class="btn btn-primary" type="submit" id="btnListarProdutos" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarProduto">
            <input class="form-control" placeholder="Produto" type="text" name="txtProdutoNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarProdutos" value="Buscar">Buscar</button>
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
                <input disabled="true" class="form-control" placeholder="Código" type="text" name="txtProdutoCodigo" id="txtProdutoCodigo"><br>
                <input class="form-control" placeholder="Quantidade" type="text" name="txtProdutoQuantidade" id="txtProdutoQuantidade"><br>
                <input class="form-control" placeholder="Descrição" type="text" name="txtProdutoDescricao" id="txtProdutoDescricao"><br>
                <input class="form-control" placeholder="Nome" type="text" name="txtProdutoNome" id="txtProdutoNome"><br>
                <input class="form-control" placeholder="Preço" type="text" name="txtProdutoPreco" id="txtProdutoPreco"><br>

                <select name="cbxMarcas" id="cbxMarcas" >
                    <c:forEach items="${marcas}" var="marca" varStatus="loop">
                        <option value="${marca.getMarcaCodigo()}"> ${marca.getMarcaNome()} </option>
                    </c:forEach>
                </select>
                
                <select name="cbxFornecedores" id="cbxFornecedores" >
                    <c:forEach items="${fornecedores}" var="fornecedor" varStatus="loop">
                        <option value="${fornecedor.getFornecedorCodigo()}"> ${fornecedor.getFornecedorNome()} </option>
                    </c:forEach>
                </select>
                
                <button type="submit" onclick="alterarProduto()" class="btn btn-primary" id="btnAlterar">Alterar</button> 
            </form>
        
    <script>
        
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
    
    </body>
</html>
