<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Password</title>
    </head>
    <body>
        <div align="center">
            <h1> Alterar Password </h1> 
        <form>
            <input style="width: 300px;" class="form-control" placeholder="Login" value="" type="text" id="txtLogin" name="txtLogin"><br>
            <input style="width: 300px;" class="form-control" type="password" placeholder="Senha atual" value="" type="text" id="txtSenhaAtual" name="txtSenhaAtual"><br>
            <input style="width: 300px;" class="form-control" type="password" placeholder="Nova senha" value="" type="text" id="txtNovaSenha" name="txtNovaSenha"><br>
            <input style="width: 300px;" class="form-control" type="password" placeholder="Confirma nova senha" value="" type="text" id="txtConfirmaNovaSenha" name="txtConfirmaNovaSenha"><br>
            <button onclick="validarCampos()" class="btn btn-primary" id="btnAlterar">Alterar</button>
            <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
        </form>
        </div>
        
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
            
            function limparCampos()
            {
                document.getElementById("txtLogin").value = "";
                document.getElementById("txtSenhaAtual").value = "";
                document.getElementById("txtNovaSenha").value = "";
                document.getElementById("txtConfirmaNovaSenha").value = "";
            }
            
        </script>
        
    </body>
</html>
