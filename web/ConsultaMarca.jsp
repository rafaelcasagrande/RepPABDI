
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Marca</title>
    </head>
    <body>
        
        <form method="GET" action="ServletListarMarca">
            <button class="btn btn-primary" type="submit" id="btnListarMarcas" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarMarca">
            <input class="form-control" placeholder="Marca" type="text" name="txtMarcaNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarMarcas" value="Buscar">Buscar</button>
        </form>
        

        <table class="table table-striped">
            <th> Código da Marca </th>
            <th> Nome da Marca </th>
            <th> Alterar </th>
            <th> Excluir </th>
            <c:forEach items="${marcas}" var="marca" varStatus="loop">
                <tr>
                    <td> ${marca.getMarcaCodigo()} </td>
                    <td> ${marca.getMarcaNome()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCamposMarca(${marca.getMarcaCodigo()}, '${marca.getMarcaNome()}')" id="btnAlterarMarca${marca.getMarcaCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirMarca(${marca.getMarcaCodigo()}, '${marca.getMarcaNome()}')" id="btnExcluirMarca${marca.getMarcaCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>


        <input disabled="true" class="form-control" placeholder="Codigo" type="text" id="txtCodigoAlterar" name="txtCodigoAlterar">
        <input class="form-control" placeholder="Marca" type="text" id="txtMarcaNomeAlterar" name="txtMarcaNomeAlterar"><br>
        <button type="submit" class="btn btn-primary" onclick="alterarMarca()" id="btnAlterarMarca">Alterar</button> 
            
        <script>
            function excluirMarca(ParametroCodigoMarca, ParametroNomeMarca)
            {
                alert(ParametroCodigoMarca + ParametroNomeMarca + 'excluir');

                $.get('ServletManipularMarca',{codigoMarca:ParametroCodigoMarca, acao:'excluir'}, function() {
                    window.location.reload(true);
                });  
            }
            
            function alterarMarca()
            {
                var codigoMarca = document.getElementById("txtCodigoAlterar").value;
                var nomeMarca = document.getElementById("txtMarcaNomeAlterar").value;
                
                alert(codigoMarca + nomeMarca + 'alterar');
                
                $.get('ServletListarMarca',{codigoMarca:codigoMarca, nomeMarca:nomeMarca, acao:'alterar'}, function() {
                    window.location.reload(true);
                });  
                
            }
            
            function preencherCamposMarca(ParametroCodigoMarca, ParametroNomeMarca)
            {
                document.getElementById("txtCodigoAlterar").setAttribute("value", ParametroCodigoMarca);
                document.getElementById("txtMarcaNomeAlterar").setAttribute("value", ParametroNomeMarca);
            }
        </script>
        
    </body>
</html>
