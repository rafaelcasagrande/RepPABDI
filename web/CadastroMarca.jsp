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
        
        <form method="GET" action="ServletCadastrarMarca">
            <input class="form-control" placeholder="Marca" type="text" name="txtMarcaNome"><br>
            <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
        </form>
       
    </body>
</html>
