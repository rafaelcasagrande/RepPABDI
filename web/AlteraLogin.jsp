<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Username</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Alterar Username </h1> 
            <form>
                <input style="width: 300px;" class="form-control" placeholder="Login atual" value="" type="text" id="txtLoginAtual" name="txtLoginAtual"><br>
                <input style="width: 300px;" class="form-control" placeholder="Novo login" value="" type="text" id="txtNovoLogin" name="txtNovoLogin"><br>
                <input style="width: 300px;" class="form-control" placeholder="Confirma novo login" value="" type="text" id="txtConfirmaNovoLogin" name="txtConfirmaNovoLogin"><br>
                <button onclick="validarCampos()" class="btn btn-primary" id="btnAlterar">Alterar</button>
                <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
            </form>
        </div>
        
        <script>
            
            function validarCampos()
            {
                var loginAtual = document.getElementById("txtLoginAtual").value;
                var novoLogin = document.getElementById("txtNovoLogin").value;
                var confirmaNovoLogin = document.getElementById("txtConfirmaNovoLogin").value;
               
                if(novoLogin === confirmaNovoLogin)
                {
                    $.post('ServletAlterarCredenciais',{loginAtual:loginAtual, novoLogin:novoLogin, confirmaNovoLogin:confirmaNovoLogin, pagina:'AlteraLogin.jsp'});
                }
                else
                {
                    alert("Login não confere");
                }
            }
            
            
            function limparCampos()
            {
                document.getElementById("txtLoginAtual").value = "";
                document.getElementById("txtNovoLogin").value = "";
                document.getElementById("txtConfirmaNovoLogin").value = "";
            }
            
        </script>
    </body>
</html>
