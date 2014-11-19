
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Unidade</title>
    </head>
    <body>
        <div class="container">
        
            <form role="form" method="GET" action="ServletListarEnderecoUnidade">
             
                <input class="form-control" placeholder="Nome da Unidade" type="text" value="${unidade.getUnidadeNome()}" name="txtUnidadeNome" id="txtUnidadeNome"><br>
                <input class="form-control" placeholder="Telefone" type="text" value="${unidade.getContato().getContatoTelefone()}" name="txtUnidadeContatoTelefone" id="txtUnidadeContatoTelefone"><br>
                <input class="form-control" placeholder="Outro Telefone" type="text" value="${unidade.getContato().getContatoTelefoneAlternativo()}" name="txtUnidadeContatoTelefoneAlternativo" id="txtUnidadeContatoTelefoneAlternativo"><br>
                <input class="form-control" placeholder="Celular" type="text" value="${unidade.getContato().getContatoCelular()}" name="txtUnidadeContatoCelular" id="txtUnidadeContatoCelular"><br>
                <input class="form-control" placeholder="E-mail" type="text" value="${unidade.getContato().getContatoEmail()}" name="txtUnidadeContatoEmail" id="txtUnidadeContatoEmail"><br>
                <input class="form-control" placeholder="Número" type="text" value="${unidade.getUnidadeNumeroLogradouro()}" name="txtUnidadeNumeroLogradouro" id="txtUnidadeNumeroLogradouro"><br>
                <input class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" name="txtUnidadeLogradouroCep" id="txtUnidadeLogradouroCep"><br>
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br>
                <input class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" name="txtUnidadeLogradoutoNome"><br>
                <input class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" name="txtUnidadeBairroNome"><br>
                <input class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" name="txtUnidadeCidadeNome"><br>
                <input class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  name="txtUnidadeEstadoNome"><br>
                <input class="form-control" placeholder="Gerente" type="text" name="txtUnidadeGerenteLocal"><br>
                <input hidden="true" type="text" value="${logradouro.getLogradouroCodigo()}" id="codigoLogradouro">
             </form>
            <button onclick="cadastrarUnidade()" class="btn btn-primary" id="btnCadastrar">Cadastrar</button>
         </div>
        
        <script>

        function cadastrarUnidade()
        {
            
            var nomeUnidade = document.getElementById("txtUnidadeNome").value;
            var telefoneUnidade = document.getElementById("txtUnidadeContatoTelefone").value;
            var telefoneAltUnidade = document.getElementById("txtUnidadeContatoTelefoneAlternativo").value;
            var celularUnidade = document.getElementById("txtUnidadeContatoCelular").value;
            var emailUnidade = document.getElementById("txtUnidadeContatoEmail").value;
            var numeroUnidade = document.getElementById("txtUnidadeNumeroLogradouro").value;
            var codigoLogradouro = document.getElementById("codigoLogradouro").value;

            $.get('ServletCadastrarUnidade',{nomeUnidade:nomeUnidade, telefoneUnidade:telefoneUnidade, telefoneAltUnidade:telefoneAltUnidade, celularUnidade:celularUnidade, emailUnidade:emailUnidade, numeroUnidade:numeroUnidade, codigoLogradouro:codigoLogradouro}, function(){
                window.location.reload(true);
            });

        }
        
        </script>
                
    </body>
</html>
