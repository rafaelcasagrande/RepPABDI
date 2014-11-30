<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Senha</title>
    </head>
    <body>
        
        <form>
            <input class="form-control" placeholder="Login" value="" type="text" id="txtLogin" name="txtLogin"><br>
            <input class="form-control" type="password" placeholder="Senha atual" value="" type="text" id="txtSenhaAtual" name="txtSenhaAtual"><br>
            <input class="form-control" type="password" placeholder="Nova senha" value="" type="text" id="txtNovaSenha" name="txtNovaSenha"><br>
            <input class="form-control" type="password" placeholder="Confirma nova senha" value="" type="text" id="txtConfirmaNovaSenha" name="txtConfirmaNovaSenha"><br>
            <button onclick="validarCampos()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        </form>
        
        
        <script>
            
            function validarCampos()
            {
                var login = document.getElementById("txtLogin").value;
                var senhaAtual = document.getElementById("txtSenhaAtual").value;
                var novaSenha = document.getElementById("txtNovaSenha").value;
                var confirmaNovaSenha = document.getElementById("txtConfirmaNovaSenha").value;
               
                if(novaSenha === confirmaNovaSenha)
                {
                    $.post('ServletAlterarCredenciais',{login:login, senhaAtual:senhaAtual, novaSenha:novaSenha, confirmaNovoLogin:confirmaNovaSenha, pagina:'AlteraSenha.jsp'});
                }
                else
                {
                    alert("Senha não confere");
                }
            }
            
        </script>
        
    </body>
</html>
