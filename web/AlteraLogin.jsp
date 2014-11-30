<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Login</title>
    </head>
    <body>
        <form>
            <input class="form-control" placeholder="Login atual" value="" type="text" id="txtLoginAtual" name="txtLoginAtual"><br>
            <input class="form-control" placeholder="Novo login" value="" type="text" id="txtNovoLogin" name="txtNovoLogin"><br>
            <input class="form-control" placeholder="Confirma novo login" value="" type="text" id="txtConfirmaNovoLogin" name="txtConfirmaNovoLogin"><br>
            <button onclick="validarCampos()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        </form>
        
        
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
            
        </script>
    </body>
</html>
