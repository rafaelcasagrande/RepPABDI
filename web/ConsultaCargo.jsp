<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Cargo</title>
    </head>
    <body>
        
        <div align="center" class="container">
        
            <h1>Consultar Cargo</h1>
            
        <form method="GET" action="ServletListarCargo" class="form-inline">
            
            <button class="btn btn-primary" type="submit" id="btnListarCargos" value="Atualizar">Atualizar</button><br><br>
        </form>
        
        <form method="GET" action="ServletConsultarCargo" class="form-inline">
            <input style="width: 300px;" class="form-control" placeholder="Cargo" type="text" name="txtCargoNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarCargos" value="Buscar">Buscar</button><br><br>
        </form>
        

        <table class="table table-striped">
            <th> Código do Cargo </th>
            <th> Nome do Cargo </th>
            <th> Salário do Cargo </th>
            <th> Alterar </th>
            <th> Excluir </th>
            <c:forEach items="${cargos}" var="cargo" varStatus="loop">
                <tr>
                    <td> ${cargo.getCargoCodigo()} </td>
                    <td> ${cargo.getCargoNome()} </td>
                    <td> ${cargo.getCargoSalario()} </td>
                    <td> <button type="submit" class="btn btn-default"  onclick="preencherCamposCargo(${cargo.getCargoCodigo()}, '${cargo.getCargoNome()}', ${cargo.getCargoSalario()})" id="btnAlterarCargo${cargo.getCargoCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default"  onclick="excluirCargo(${cargo.getCargoCodigo()}, '${cargo.getCargoNome()}')" id="btnExcluirCargo${cargo.getCargoCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        <input style="width: 300px;" disabled="true" type="text" class="form-control" placeholder="Código" id="txtCargoCodigoAlterar" name="txtCargoCodigoAlterar"><br>
        <input style="width: 300px;" type="text" class="form-control" placeholder="Salário" id="txtCargoSalarioAlterar" name="txtCargoSalarioAlterar"><br>
        <input style="width: 300px;" type="text" class="form-control" placeholder="Cargo" id="txtCargoNomeAlterar" name="txtCargoNomeAlterar"><br>
        <button type="submit" onclick="alterarCargo()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
                
                
                
        <script>
            
            function alterarCargo()
            {
                var codigoCargo = document.getElementById("txtCargoCodigoAlterar").value;
                var nomeCargo = document.getElementById("txtCargoNomeAlterar").value;
                var salarioCargo = document.getElementById("txtCargoSalarioAlterar").value;
                
                alert(codigoCargo + nomeCargo + salarioCargo + 'alterar');
                
                $.get('ServletManipularCargo',{codigoCargo:codigoCargo, nomeCargo:nomeCargo, salarioCargo:salarioCargo, acao:'alterar'}, function() {
                    window.location.reload(true);
                });  
            }
            
            function preencherCamposCargo(ParametroCodigoCargo, ParametroNomeCargo, ParametroSalarioCargo)
            {
                document.getElementById("txtCargoNomeAlterar").setAttribute("value", ParametroNomeCargo);
                document.getElementById("txtCargoSalarioAlterar").setAttribute("value", ParametroSalarioCargo);
                document.getElementById("txtCargoCodigoAlterar").setAttribute("value", ParametroCodigoCargo);
            }
            
            
            function excluirCargo(ParametroCodigoCargo, ParametroNomeCargo)
            {
                alert(ParametroCodigoCargo + ParametroNomeCargo + 'excluir');

                $.get('ServletManipularCargo',{codigoCargo:ParametroCodigoCargo, acao:'excluir'}, function() {
                    window.location.reload(true);
                });  
            }
            
            function limparCampos()
            {
                document.getElementById("txtCargoCodigoAlterar").value = "";
                document.getElementById("txtCargoNomeAlterar").value = "";
                document.getElementById("txtCargoSalarioAlterar").value = "";
            }
            
        </script>
        
        </div>
        
    </body>
</html>
