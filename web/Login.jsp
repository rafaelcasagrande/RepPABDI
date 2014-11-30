<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        
       
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="jquery/jquery-1.11.1.min.js"></script>
       

    </head>
    <body>
        <div align="center">
            <form class="form-signin" role="form" method="POST" action="ServletLogin" >
                <h2 class="form-sigin-heading">Dados para Login</h2>
                <input style="width: 300px;" type="text" class="form-control" placeholder="Username" required autofocus name="txtUsername"><br>
                <input style="width: 300px;" type="password" class="form-control" placeholder="Password" required name="txtPassword"><br>
                <c:if test="${mensagem != null}">
                    <div style="width: 300px;" class="alert alert-danger">${mensagem}</div>
                </c:if>

                <button style="width: 300px;" class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
            </form>
        </div>
    </body>
</html>
