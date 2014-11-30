<%-- 
    Document   : CadastroMarca
    Created on : 24/08/2014, 17:53:36
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Marca</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Cadastrar Marca </h1> 
            <form method="GET" action="ServletCadastrarMarca">
                <input style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaNome" name="txtMarcaNome"><br>
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
            </form>
        </div>
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("txtMarcaNome").value = "";
            }
            
        </script>
        
    </body>
</html>
