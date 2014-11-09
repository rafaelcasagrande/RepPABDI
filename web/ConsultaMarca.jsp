
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
        
        <form action="ServletListarMarcas" method="GET">
            <button class="btn btn-primary" type="submit" id="btnListarMarcas" value="Listar Marcas"></button>
        </form>
 
        <table>
            <th>
                <tr> Código da Marca </tr>
                <tr> Nome da Marca </tr>
            </th>
 
        <c:forEach items="${marcas}" var="marca" varStatus="loop">
            
            <td>
                <tr> ${marca.getMarcaCodigo()} </tr>
                <tr> ${marca.getMarcaNome()} </tr>
            </td>
            
        </c:forEach>

        </table>
 
    </body>
</html>
