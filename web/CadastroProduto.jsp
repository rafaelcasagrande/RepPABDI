
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produto</title>
    </head>
    <body>
        <div class="container">
        
            <form role="form" action="ServletCadastrarProduto" >
             
                <input class="form-control" placeholder="Quantidade" type="text" name="txtProdutoQuantidade" id="txtProdutoQuantidade"><br>
                <input class="form-control" placeholder="Descrição" type="text" name="txtProdutoDescricao" id="txtProdutoDescricao"><br>
                <input class="form-control" placeholder="Nome" type="text" name="txtProdutoNome" id="txtProdutoNome"><br>
                <input class="form-control" placeholder="Preço" type="text" name="txtProdutoPreco" id="txtProdutoPreco"><br>

                <select name="cbxMarcas" id="cbxMarcas" >
                    <option selected disabled> Marca </option>
                    <c:forEach items="${marcas}" var="marca" varStatus="loop">
                        <option value="${marca.getMarcaCodigo()}"> ${marca.getMarcaNome()} </option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
            </form>
         </div>
    </body>
    
    
    
    
</html>
