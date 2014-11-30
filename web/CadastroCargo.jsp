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
        <div align="center">
            <form role="form" action="ServletCadastrarCargo" onsubmit="validarCampos(this); return false;" >
                <h1>Cadastrar Cargo</h1>
                <input style="width: 300px;" type="text" class="form-control" placeholder="Cargo" id="txtCargoNome" name="txtCargoNome"><br>
                <input style="width: 300px;" type="text" class="form-control" placeholder="Salário" id="txtCargoSalario" name="txtCargoSalario"><br>
                <button type="submit" class="btn btn-primary" id="btnCadastrar">Cadastrar</button>
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
            </form>
        </div>
        <script>
            function limparCampos()
            {
                document.getElementById("txtCargoNome").value = "";
                document.getElementById("txtCargoSalario").value = "";
            }
            
            function validarCampos(frm)
            {
                var cargo = document.getElementById("txtCargoNome").value;
                var salario = document.getElementById("txtCargoSalario").value;
                
                if((cargo || salario) === "")
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
