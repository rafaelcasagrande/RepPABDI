<%-- 
    Document   : CadastroMarca
    Created on : 24/08/2014, 17:53:36
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Marca</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Cadastrar Marca </h1> 
            <form method="GET" action="ServletCadastrarMarca" onsubmit="validarCampos(this); return false;">
                <input style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaNome" name="txtMarcaNome"><br>
                
                
                <c:if test="${mensagem != null}">
                    <c:if test="${mensagem == true}">
                        <div style="width: 300px;" class="alert alert-success">Cadastro realizado com sucesso</div>
                    </c:if>
                    <c:if test="${mensagem == false}">
                        <div style="width: 300px;" class="alert alert-danger">Falha ao cadastrar</div>
                    </c:if>
                </c:if>  
                
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
            </form>
        </div>
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("txtMarcaNome").value = "";
            }
            
            function validarCampos(frm)
            {
                var marca = document.getElementById("txtMarcaNome").value;
                
                if(marca === "")
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
