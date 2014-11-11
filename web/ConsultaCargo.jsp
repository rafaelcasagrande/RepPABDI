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
        <form method="GET" action="ServletListarCargo">
            <button class="btn btn-primary" type="submit" id="btnListarCargos" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarCargo">
            <input class="form-control" placeholder="Cargo" type="text" name="txtCargoNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarCargos" value="Buscar">Buscar</button>
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
                    <td> <button type="submit" class="btn btn-default"  id="btnAlterarCargo${cargo.getCargoCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default"  onclick="excluirCargo(${cargo.getCargoCodigo()}, '${cargo.getCargoNome()}')" id="btnExcluirCargo${cargo.getCargoCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        
        <script>
            function excluirCargo(ParametroCodigoCargo, ParametroNomeCargo)
            {
                alert(ParametroCodigoCargo + ParametroNomeCargo + 'excluir');

                $.get('ServletManipularCargo',{codigoCargo:ParametroCodigoCargo, acao:'excluir'}, function() {
                    window.location.reload(true);
                });  
            }
        </script>
    </body>
</html>
