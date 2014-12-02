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
        
        <div align="center">
        
            <h1>Consultar Unidades</h1>
            
        <form method="GET" action="ServletListarUnidade">
            <button class="btn btn-primary" type="submit" id="btnListarFornecedores" value="Atualizar">Atualizar</button><br><br>
        </form>
        
        <form method="GET" action="ServletConsultarUnidade" class="form-inline">
            <input style="width: 300px;" class="form-control" placeholder="Unidade" type="text" name="txtUnidadeNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarUnidades" value="Buscar">Buscar</button><br><br>
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
            <form method="GET" action="ServletListarEnderecoUnidade" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Nome da Unidade" type="text" value="${unidade.getUnidadeNome()}" name="txtUnidadeNome" id="txtUnidadeNome">
                <input style="width: 300px;" class="form-control" placeholder="Telefone" type="text" value="${unidade.getContato().getContatoTelefone()}" name="txtUnidadeContatoTelefone" id="txtUnidadeContatoTelefone"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Outro Telefone" type="text" value="${unidade.getContato().getContatoTelefoneAlternativo()}" name="txtUnidadeContatoTelefoneAlternativo" id="txtUnidadeContatoTelefoneAlternativo">
                <input style="width: 300px;" class="form-control" placeholder="Celular" type="text" value="${unidade.getContato().getContatoCelular()}" name="txtUnidadeContatoCelular" id="txtUnidadeContatoCelular"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="E-mail" type="text" value="${unidade.getContato().getContatoEmail()}" name="txtUnidadeContatoEmail" id="txtUnidadeContatoEmail">
                <input style="width: 300px;" class="form-control" placeholder="Número" type="text" value="${unidade.getUnidadeNumeroLogradouro()}" name="txtUnidadeNumeroLogradouro" id="txtUnidadeNumeroLogradouro"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" name="txtUnidadeLogradouroCep" id="txtUnidadeLogradouroCep">
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" id="txtUnidadeLogradouroNome" name="txtUnidadeLogradouroNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" id="txtUnidadeBairroNome" name="txtUnidadeBairroNome"><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" id="txtUnidadeCidadeNome" name="txtUnidadeCidadeNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  id="txtUnidadeEstadoNome" name="txtUnidadeEstadoNome"><br><br>
                <input hidden="true" type="text" value="ServletListarUnidade" name="pagina">
                <input hidden="true" type="text" value="${unidade.getUnidadeCodigo()}" id="codigoUnidade" name="codigoUnidade">
                <input hidden="true" type="text" value="${unidade.getContato().getContatoCodigo()}" id="codigoContato" name="codigoContato">
                <input hidden="true" type="text" value="${logradouro.getLogradouroCodigo()}" id="codigoLogradouro" name="codigoLogradouro">
                
                
            </form>
                <button onclick="alterarUnidade()" class="btn btn-primary" id="btnAlterar">Alterar</button>
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
        </div>   
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("codigoLogradouro").value = "";
                document.getElementById("codigoContato").value = "";
                document.getElementById("codigoUnidade").value = "";
                document.getElementById("txtUnidadeNome").value = "";
                document.getElementById("txtUnidadeContatoTelefone").value = "";
                document.getElementById("txtUnidadeContatoTelefoneAlternativo").value = "";
                document.getElementById("txtUnidadeContatoCelular").value = "";
                document.getElementById("txtUnidadeContatoEmail").value = "";
                document.getElementById("txtUnidadeNumeroLogradouro").value = "";
                document.getElementById("txtUnidadeLogradouroCep").value = "";
                document.getElementById("txtUnidadeLogradouroNome").value = "";
                document.getElementById("txtUnidadeBairroNome").value = "";
                document.getElementById("txtUnidadeCidadeNome").value = "";
                document.getElementById("txtUnidadeEstadoNome").value = "";
            }
            
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
        
        
        </div>
    </body>
</html>
