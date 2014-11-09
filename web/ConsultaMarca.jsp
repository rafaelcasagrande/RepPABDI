
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
        
        <form method="GET" action="ServletListarMarcas">
            <button class="btn btn-primary" type="submit" id="btnListarMarcas" value="Listar Marcas">Listar Marcas</button>
        </form>
 
        <table class="table table-bordered">
            <th>
                <td> Código da Marca </td>
                <td> Nome da Marca </td>
            </th>
 
        <c:forEach items="${marcas}" var="marca" varStatus="loop">
            
            <tr>
                <td> ${marca.getMarcaCodigo()} </td>
                <td> ${marca.getMarcaNome()} </td>
            </tr>
            
        </c:forEach>

        </table>
 
    </body>
</html>
