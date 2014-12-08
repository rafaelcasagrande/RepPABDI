
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
        <div align="center">
            <h1> Cadastrar Produto </h1> 
            <form role="form" action="ServletCadastrarProduto" onsubmit="validarCampos(this); return false;">
             
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" name="txtProdutoNome" id="txtProdutoNome"><br>
                <input style="width: 300px;" class="form-control" placeholder="Descrição" type="text" name="txtProdutoDescricao" id="txtProdutoDescricao"><br>
                <input style="width: 300px;" class="form-control" placeholder="Quantidade" type="text" name="txtProdutoQuantidade" id="txtProdutoQuantidade"><br>
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
                
                 <c:if test="${mensagem != null}">
                    <c:if test="${mensagem == true}">
                        <div style="width: 300px;" class="alert alert-success">Cadastro realizado com sucesso</div>
                    </c:if>
                    <c:if test="${mensagem == false}">
                        <div style="width: 300px;" class="alert alert-danger">Falha ao cadastrar</div>
                    </c:if>
                </c:if>  
                
                
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
                <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
            </form>
         </div>
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("txtProdutoNome").value = "";
                document.getElementById("txtProdutoDescricao").value = "";
                document.getElementById("txtProdutoQuantidade").value = "";
                document.getElementById("txtProdutoPreco").value = "";
            }
            
            function validarCampos(frm)
            {
                var produto = document.getElementById("txtProdutoNome").value;
                var descricao = document.getElementById("txtProdutoDescricao").value;
                var quantidade = document.getElementById("txtProdutoQuantidade").value;
                var preco = document.getElementById("txtProdutoPreco").value;
                
                if((produto || descricao || quantidade || preco) === "")
                {
                    alert("Preenchimento obrigatório");
                    return false;
                }
                else
                    frm.submit();
            }
            
        </script>
        
    </body>
</html>
