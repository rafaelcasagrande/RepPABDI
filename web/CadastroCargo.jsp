<%-- 
    Document   : CadastroCargo
    Created on : 24/08/2014, 17:52:09
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cargo</title>
    </head>
    <body>
        <div class="container">  
            
            <form role="form" action="ServletCadastrarCargo">
            
                <input type="text" class="form-control" placeholder="Salário" name="txtCargoSalario"><br>
                <input type="text" class="form-control" placeholder="Cargo" name="txtCargoNome"><br>
            
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button>
                
            </form>
            
        </div>
    </body>
</html>
