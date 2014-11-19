<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Unidade</title>
    </head>
    <body>
        
        <form method="GET" action="ServletListarUnidade">
            <button class="btn btn-primary" type="submit" id="btnListarFornecedores" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarUnidade">
            <input class="form-control" placeholder="Unidade" type="text" name="txtUnidadeNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarUnidades" value="Buscar">Buscar</button>
        </form>
        

        <table class="table table-striped">
            <th> Código </th>
            <th> Nome </th>
            <th> Telefone </th>
            <th> Telefone Alt. </th>
            <th> Celular </th>
            <th> E-mail </th>
            <th> Logradouro </th>
            <th> Número </th>
            <th> Bairro </th>
            <th> Cidade </th>
            <th> Estado </th>
            <th> Alterar </th>
            <th> Excluir </th>
            <c:forEach items="${unidades}" var="unidade" varStatus="loop">
                <tr>
                    <td> ${unidade.getUnidadeCodigo()} </td>
                    <td> ${unidade.getUnidadeNome()} </td>
                    <td> ${unidade.getContato().getContatoTelefone()} </td>
                    <td> ${unidade.getContato().getContatoTelefoneAlternativo()} </td>
                    <td> ${unidade.getContato().getContatoCelular()} </td>
                    <td> ${unidade.getContato().getContatoEmail()} </td>
                    <td> ${unidade.getLogradouro().getLogradouroNome()} </td>
                    <td> ${unidade.getUnidadeNumeroLogradouro()} </td>
                    <td> ${unidade.getLogradouro().getBairro().getBairroNome()} </td>
                    <td> ${unidade.getLogradouro().getBairro().getCidade().getCidadeNome()} </td>
                    <td> ${unidade.getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCampos(${unidade.getLogradouro().getLogradouroCodigo()}, ${unidade.getContato().getContatoCodigo()}, ${unidade.getUnidadeCodigo()}, '${unidade.getUnidadeNome()}', '${unidade.getContato().getContatoTelefone()}', '${unidade.getContato().getContatoTelefoneAlternativo()}', '${unidade.getContato().getContatoCelular()}', '${unidade.getContato().getContatoEmail()}', '${unidade.getLogradouro().getLogradouroNome()}', '${unidade.getLogradouro().getLogradouroCep()}' , '${unidade.getUnidadeNumeroLogradouro()}', '${unidade.getLogradouro().getBairro().getBairroNome()}', '${unidade.getLogradouro().getBairro().getCidade().getCidadeNome()}', '${unidade.getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()}')" id="btnAlterarUnidade${unidade.getUnidadeCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirUnidade(${unidade.getUnidadeCodigo()}, ${unidade.getContato().getContatoCodigo()})" id="btnExcluirUnidade${unidade.getUnidadeCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        <div class="container">
            <form method="GET" action="ServletListarUnidade">
                <input class="form-control" placeholder="Nome da Unidade" type="text" value="${unidade.getUnidadeNome()}" name="txtUnidadeNome" id="txtUnidadeNome"><br>
                <input class="form-control" placeholder="Telefone" type="text" value="${unidade.getContato().getContatoTelefone()}" name="txtUnidadeContatoTelefone" id="txtUnidadeContatoTelefone"><br>
                <input class="form-control" placeholder="Outro Telefone" type="text" value="${unidade.getContato().getContatoTelefoneAlternativo()}" name="txtUnidadeContatoTelefoneAlternativo" id="txtUnidadeContatoTelefoneAlternativo"><br>
                <input class="form-control" placeholder="Celular" type="text" value="${unidade.getContato().getContatoCelular()}" name="txtUnidadeContatoCelular" id="txtUnidadeContatoCelular"><br>
                <input class="form-control" placeholder="E-mail" type="text" value="${unidade.getContato().getContatoEmail()}" name="txtUnidadeContatoEmail" id="txtUnidadeContatoEmail"><br>
                <input class="form-control" placeholder="Número" type="text" value="${unidade.getUnidadeNumeroLogradouro()}" name="txtUnidadeNumeroLogradouro" id="txtUnidadeNumeroLogradouro"><br>
                <input class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" name="txtUnidadeLogradouroCep" id="txtUnidadeLogradouroCep"><br>
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br>
                <input class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" id="txtUnidadeLogradouroNome" name="txtUnidadeLogradouroNome"><br>
                <input class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" id="txtUnidadeBairroNome" name="txtUnidadeBairroNome"><br>
                <input class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" id="txtUnidadeCidadeNome" name="txtUnidadeCidadeNome"><br>
                <input class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  id="txtUnidadeEstadoNome" name="txtUnidadeEstadoNome"><br>
                <input class="form-control" placeholder="Gerente" type="text" name="txtUnidadeGerenteLocal"><br>
                
                <input hidden="true" type="text" value="ServletListarUnidade" name="pagina">
                <input hidden="true" type="text" value="${unidade.getUnidadeCodigo()}" id="codigoUnidade" name="codigoUnidade">
                <input hidden="true" type="text" value="${unidade.getContato().getContatoCodigo()}" id="codigoContato" name="codigoContato">
                <input hidden="true" type="text" value="${unidade.getLogradouro().getLogradouroCodigo()}" id="codigoLogradouro">
                
            </form>
                <button onclick="alterarUnidade()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        </div>   
        
        <script>
            
            function excluirUnidade(paramCodigoUnidade, paramCodigoContato)
            {
                $.get('ServletManipularUnidade',{codigoUnidade:paramCodigoUnidade, codigoContato:paramCodigoContato, acao:'excluir'},function(){
                    window.location.reload(true);
                });
            }
            
            function preencherCampos(logradouroCodigo, contatoCodigo, unidadeCodigo, unidadeNome, contatoTelefone, contatoTelefoneAlternativo, contatoCelular, contatoEmail, logradouroNome, logradouroCep, numeroLogradouro, bairroNome, cidadeNome, estadoSigla)
            {
                document.getElementById("codigoLogradouro").setAttribute("value", logradouroCodigo);
                document.getElementById("codigoContato").setAttribute("value", contatoCodigo);
                document.getElementById("codigoUnidade").setAttribute("value", unidadeCodigo);
                document.getElementById("txtUnidadeNome").setAttribute("value", unidadeNome);
                document.getElementById("txtUnidadeContatoTelefone").setAttribute("value", contatoTelefone);
                document.getElementById("txtUnidadeContatoTelefoneAlternativo").setAttribute("value", contatoTelefoneAlternativo);
                document.getElementById("txtUnidadeContatoCelular").setAttribute("value", contatoCelular);
                document.getElementById("txtUnidadeContatoEmail").setAttribute("value", contatoEmail);
                document.getElementById("txtUnidadeNumeroLogradouro").setAttribute("value", numeroLogradouro);
                document.getElementById("txtUnidadeLogradouroCep").setAttribute("value", logradouroCep);
                document.getElementById("txtUnidadeLogradouroNome").setAttribute("value", logradouroNome);
                document.getElementById("txtUnidadeBairroNome").setAttribute("value", bairroNome);
                document.getElementById("txtUnidadeCidadeNome").setAttribute("value", cidadeNome);
                document.getElementById("txtUnidadeEstadoNome").setAttribute("value", estadoSigla);
            }
            
            function alterarUnidade()
            {
                var codigoLogradouro = document.getElementById("codigoLogradouro").value;
                var codigoContato = document.getElementById("codigoContato").value;
                var codigoUnidade = document.getElementById("codigoUnidade").value;
                var nomeUnidade = document.getElementById("txtUnidadeNome").value;
                var telefoneUnidade = document.getElementById("txtUnidadeContatoTelefone").value;
                var telefoneAltUnidade = document.getElementById("txtUnidadeContatoTelefoneAlternativo").value;
                var celularUnidade = document.getElementById("txtUnidadeContatoCelular").value;
                var emailUnidade = document.getElementById("txtUnidadeContatoEmail").value;
                var numeroUnidade = document.getElementById("txtUnidadeNumeroLogradouro").value;

                 $.get('ServletManipularUnidade',{codigoContato:codigoContato, codigoLogradouro:codigoLogradouro,codigoUnidade:codigoUnidade, nomeUnidade:nomeUnidade,telefoneUnidade:telefoneUnidade,telefoneAltUnidade:telefoneAltUnidade,celularUnidade:celularUnidade,emailUnidade:emailUnidade,numeroUnidade:numeroUnidade, acao:'alterar'},function(){
                    window.location.reload(true);
                });
            }
            
        </script>
        
        
        
    </body>
</html>