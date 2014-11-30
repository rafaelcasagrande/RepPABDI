<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Venda</title>
    </head>
    <body>

        
        <form method="GET" action="ServletVendaBuscaCliente">
            <input class="form-control" placeholder="Código do Cliente" type="text" name="txtClienteCodigo" id="txtClienteCodigo">
            <label> ${cliente.getPessoa().getPessoaNome()} ${cliente.getPessoa().getPessoaSobrenome()} </label>
            <button class="btn btn-primary" type="submit" id="btnConsultarCliente" value="Buscar">Buscar</button>
        </form>
        
        <form method="GET" action="ServletConsultarProduto">
            <input class="form-control" placeholder="Produto" type="text" name="txtProdutoNome" id="txtProdutoNome">
            <input hidden="true"  type="text" name="txtPagina" value="CadastroVenda.jsp">
            <input hidden="true"  type="text" name="txtCodigosProdutos" id="txtCodigosProdutos" value="${txtCodigosProdutos}">
            <input hidden="true"  type="text" name="txtPrecosProdutos" id="txtPrecosProdutos" value="${txtPrecosProdutos}">
            <input hidden="true"  type="text" name="txtNomesProdutos" id="txtNomesProdutos" value="${txtNomesProdutos}">
            <input hidden="true"  type="text" name="txtQtdeProdutos" id="txtQtdeProdutos">
            <input hidden="true"  type="text" name="txtNomeCliente" id="txtNomeCliente" value="${cliente.getPessoa().getPessoaNome()}">
            <input hidden="true"  type="text" name="txtSobrenomeCliente" id="txtSobrenomeCliente" value="${cliente.getPessoa().getPessoaSobrenome()}">
            <input hidden="true"  type="text" name="txtCodigoCliente" id="txtCodigoCliente" value="${cliente.getClienteCodigo()}">
            <button class="btn btn-primary" type="submit" id="btnConsultarProdutos" value="Buscar">Buscar</button>
        </form>

        <table class="table table-striped">
            
            <thead>
                <tr>
                    <th> Código do Produto </th>
                    <th> Nome do Produto </th>
                    <th> Preço </th>
                    <th> Descrição </th>
                    <th> Quantidade </th>
                    <th> Marca </th>
                    <th> Fornecedor </th>
                    <th> Adicionar </th>
                </tr>
            </thead>
            
            <tbody>
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
            </tbody>
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
                <c:forEach items="${carrinhoCompra}" var="produtoCarrinho" varStatus="loop">
                <tr> 
                    <td> ${produtoCarrinho.getProdutoNome()} </td>
                    <td> ${produtoCarrinho.getProdutoPreco()} </td> +      
                    <td> <input class='form-control' placeholder='Qtde.' type='text' onblur="calcularTotal(${produtoCarrinho.getProdutoPreco()}, ${produtoCarrinho.getProdutoCodigo()})" id='txtQtde${produtoCarrinho.getProdutoCodigo()}'> </td>" +
                    <td> <button type='submit' class='btn btn-default'> <span class='glyphicon glyphicon-trash'> </span> </button> </td>" +
                </tr>
                </c:forEach>
            </tbody>
        </table>  
        
        
        <label> Valor Total: </label> <input type="text" id="txtValorTotal" value="">
        
        <button class="btn btn-primary" type="submit" onclick="vender()" id="btnVender" value="Vender">Vender</button>

        <form>
            <input type="radio" id="cartaocredito" name="pgto" value="cartao credito" checked> Cartão de Crédito
            <br>
            <input type="radio" id="cartaodebito" name="pgto" value="cartao debito"> Cartão de Débito
            <br>
            <input type="radio" id="dinheiro" name="pgto" value="dinheiro"> Dinheiro
        </form>
        
        
        <script>
            
            
            function vender()
            {
                var formaPagamento = "";
                
                if(document.getElementById("cartaocredito").checked)
                {
                    formaPagamento = document.getElementById("cartaocredito").value;
                }
                if(document.getElementById("cartaodebito").checked)
                {
                    formaPagamento = document.getElementById("cartaodebito").value;
                }
                if(document.getElementById("dinheiro").checked)
                {
                    formaPagamento = document.getElementById("dinheiro").value;
                }
                
                var codigosProdutos = document.getElementById("txtCodigosProdutos").value;
                var quantidadeProdutos = document.getElementById("txtQtdeProdutos").value;
                var valorTotal = document.getElementById("txtValorTotal").value;
                var codigoCliente = document.getElementById("txtCodigoCliente").value;
                
                $.get('ServletCadastrarVenda',{codigoCliente:codigoCliente, codigosProdutos:codigosProdutos, quantidadeProdutos:quantidadeProdutos, formaPagamento:formaPagamento, valorTotal:valorTotal}, function() {
                    window.location.reload(true);
                }); 
    
    }
            
            function adicionar(paramCodigoProduto, paramNomeProduto, paramPrecoProduto)
            {

                var codigosProdutos = document.getElementById("txtCodigosProdutos").value;
                var nomeProdutos = document.getElementById("txtNomesProdutos").value;
                var precosProdutos = document.getElementById("txtPrecosProdutos").value;

                codigosProdutos += '#' + paramCodigoProduto;
                nomeProdutos += '#' + paramNomeProduto;
                precosProdutos += '#' + paramPrecoProduto;
                
                document.getElementById("txtCodigosProdutos").value = codigosProdutos;
                document.getElementById("txtNomesProdutos").value= nomeProdutos;
                document.getElementById("txtPrecosProdutos").value = precosProdutos;


                
                $('#carrinhoCompras tbody').append(
                "<tr>" +
                    "<td>" + paramNomeProduto + "</td>" +
                    "<td>" + paramPrecoProduto + "</td>" +      
                    "<td> <input class='form-control' placeholder='Qtde.' type='text' onblur='calcularTotal("+ paramPrecoProduto + ", " + paramCodigoProduto +")' id='txtQtde"+ paramCodigoProduto +"'> </td>" +
                    "<td> <button type='submit' class='btn btn-default'> <span class='glyphicon glyphicon-trash'> </span> </button> </td>" +
                "</tr>");
            }

            function calcularTotal(paramValor, idTxtQuantidade)
            {
               
                
                var quantidadeUnitatia = 'txtQtde'+idTxtQuantidade;
                var quantidade = document.getElementById(quantidadeUnitatia).value;
                var valorSubtotal = quantidade * paramValor;  
                var valorAtual = document.getElementById("txtValorTotal").value;
                var valorTotal = "";
                if(valorAtual === "")
                {
                    valorTotal = valorSubtotal;
                }
                else
                {
                    valorAtual = parseInt(valorAtual);
                    valorTotal = valorSubtotal + valorAtual;
                }

                document.getElementById("txtValorTotal").value = valorTotal;

                var quantidadeProdutos = document.getElementById("txtQtdeProdutos").value;
                quantidadeProdutos = quantidadeProdutos + "#" + quantidade;
                document.getElementById("txtQtdeProdutos").value = quantidadeProdutos;
            }

        </script>
            
        
    </body>
</html>
