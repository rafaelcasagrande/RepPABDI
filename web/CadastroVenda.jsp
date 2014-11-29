
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Venda</title>
    </head>
    <body>
        
        <form method="GET" action="ServletConsultarProduto">
            <input class="form-control" placeholder="Produto" type="text" name="txtProdutoNome">
            <input hidden="true"  type="text" name="txtPagina" value="CadastroVenda.jsp">
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
            <th> Adicionar </th>
            
            <c:forEach items="${produtos}" var="produto" varStatus="loop">
                <tr>
                    <td> ${produto.getProdutoCodigo()} </td>
                    <td> ${produto.getProdutoNome()} </td>
                    <td> ${produto.getProdutoPreco()} </td>
                    <td> ${produto.getProdutoDescricao()} </td>
                    <td> ${produto.getProdutoQuantidade()} </td>
                    <td> ${produto.getMarca().getMarcaNome()} </td>
                    <td> ${produto.getFornecedor().getFornecedorNome()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="adicionar(${produto.getProdutoCodigo()}, '${produto.getProdutoNome()}', ${produto.getProdutoPreco()})" id="btnAlterarProduto${produto.getProdutoCodigo()}"> <span class="glyphicon glyphicon-ok"> </span> </button> </td>
                </tr>
            </c:forEach>
        </table>    
        
        <h1> Carrinho de Compras</h1>
        
        <table class="table table-striped" id="carrinhoCompras">
            <thead>
                <tr>
                    <th> Nome do Produto </th>
                    <th> Preço </th>
                    <th> Quantidade </th>
                    <th> Remover </th> 
                </tr>
            </thead>
            <tbody>
                
                
            </tbody>
        </table>  
        
        <script>
            
            function adicionar(paramCodigoProduto, paramNomeProduto, paramPrecoProduto)
            {
                $('#carrinhoCompras tbody').append(
                "<tr>" +
                    "<td>" + paramNomeProduto + "</td>" +
                    "<td>" + paramPrecoProduto + "</td>" +      
                    "<td> <input class='form-control' placeholder='Qtde.' type='text' name='QtdeProd"+ paramCodigoProduto +"'> </td>" +
                    "<td> <button type='submit' class='btn btn-default'> <span class='glyphicon glyphicon-trash'> </span> </button> </td>" +
                "</tr>");
            }
        </script>
            
        
    </body>
</html>
