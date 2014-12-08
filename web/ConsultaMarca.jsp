
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
        
        <div align="center" class="container">
        
            <h1>Consultar Marcas</h1>
            
        <form method="GET" action="ServletListarMarca">
            <button class="btn btn-primary" type="submit" id="btnListarMarcas" value="Atualizar">Atualizar</button><br><br>
        </form>
        
        <form method="GET" action="ServletConsultarMarca" class="form-inline">
            <input style="width: 300px;" class="form-control" placeholder="Marca" type="text" name="txtMarcaNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarMarcas" value="Buscar">Buscar</button><br><br>
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


            <input style="width: 300px;" disabled="true" class="form-control" placeholder="Codigo" type="text" id="txtCodigoAlterar" name="txtCodigoAlterar"><br>
            <input style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaNomeAlterar" name="txtMarcaNomeAlterar"><br>
        <button type="submit" class="btn btn-primary" onclick="alterarMarca()" id="btnAlterarMarca">Alterar</button> 
        <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
        
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("txtCodigoAlterar").value = "";
                document.getElementById("txtMarcaNomeAlterar").value = "";
            }
            
            function excluirMarca(ParametroCodigoMarca, ParametroNomeMarca)
            {
                $.get('ServletManipularMarca',{codigoMarca:ParametroCodigoMarca, acao:'excluir'}, function() {
                    window.location.reload(true);
                });  
            }
            
            function alterarMarca()
            {
                var codigoMarca = document.getElementById("txtCodigoAlterar").value;
                var nomeMarca = document.getElementById("txtMarcaNomeAlterar").value;
                
                $.get('ServletManipularMarca',{codigoMarca:codigoMarca, nomeMarca:nomeMarca, acao:'alterar'}, function() {
                    window.location.reload(true);
                });  
                
            }
            
            function preencherCamposMarca(ParametroCodigoMarca, ParametroNomeMarca)
            {
                document.getElementById("txtCodigoAlterar").setAttribute("value", ParametroCodigoMarca);
                document.getElementById("txtMarcaNomeAlterar").setAttribute("value", ParametroNomeMarca);
            }
        </script>
        
        </div>
    </body>
</html>
