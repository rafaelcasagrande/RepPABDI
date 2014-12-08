
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
        <div align="center">
            <h1> Cadastrar Unidade </h1> 
            <form role="form" method="GET" action="ServletListarEnderecoUnidade" class="form-inline" onsubmit="validarCampo(this); return false;">
             
                <input style="width: 300px;" class="form-control" placeholder="Nome da Unidade" type="text" value="${unidade.getUnidadeNome()}" name="txtUnidadeNome" id="txtUnidadeNome">
                <input style="width: 300px;" class="form-control" placeholder="Telefone" type="text" value="${unidade.getContato().getContatoTelefone()}" name="txtUnidadeContatoTelefone" id="txtUnidadeContatoTelefone"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Outro Telefone" type="text" value="${unidade.getContato().getContatoTelefoneAlternativo()}" name="txtUnidadeContatoTelefoneAlternativo" id="txtUnidadeContatoTelefoneAlternativo">
                <input style="width: 300px;" class="form-control" placeholder="Celular" type="text" value="${unidade.getContato().getContatoCelular()}" name="txtUnidadeContatoCelular" id="txtUnidadeContatoCelular"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="E-mail" type="text" value="${unidade.getContato().getContatoEmail()}" name="txtUnidadeContatoEmail" id="txtUnidadeContatoEmail">
                <input style="width: 300px;" class="form-control" placeholder="Número" type="text" value="${unidade.getUnidadeNumeroLogradouro()}" name="txtUnidadeNumeroLogradouro" id="txtUnidadeNumeroLogradouro"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" name="txtUnidadeLogradouroCep" id="txtUnidadeLogradouroCep">
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" name="txtUnidadeLogradoutoNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" name="txtUnidadeBairroNome"><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" name="txtUnidadeCidadeNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  name="txtUnidadeEstadoNome"><br><br>
                
                <input hidden="true" type="text" value="${logradouro.getLogradouroCodigo()}" id="codigoLogradouro">
                <input hidden="true" type="text" value="CadastroUnidade.jsp" id="pagina" name="pagina">
             </form>
            
            <button onclick="cadastrarUnidade()" class="btn btn-primary" id="btnCadastrar">Cadastrar</button>
            <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
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

            if((nomeUnidade || telefoneUnidade || telefoneAltUnidade || celularUnidade || emailUnidade || numeroUnidade) === "")
            {
                alert("Preenchimento obrigatório");
            }
            else
            {
                $.get('ServletCadastrarUnidade',{nomeUnidade:nomeUnidade, telefoneUnidade:telefoneUnidade, telefoneAltUnidade:telefoneAltUnidade, celularUnidade:celularUnidade, emailUnidade:emailUnidade, numeroUnidade:numeroUnidade, codigoLogradouro:codigoLogradouro}, function(){
                    alert("Cadastro Realizado com Sucesso.");
                });
            }

        }
        
        
        function limparCampos()
        {
            document.getElementById("txtUnidadeNome").value = "";
            document.getElementById("txtUnidadeContatoTelefone").value = "";
            document.getElementById("txtUnidadeContatoTelefoneAlternativo").value = "";
            document.getElementById("txtUnidadeContatoCelular").value = "";
            document.getElementById("txtUnidadeContatoEmail").value = "";
            document.getElementById("txtUnidadeNumeroLogradouro").value = "";
            document.getElementById("txtUnidadeLogradouroCep").value = "";
        }
        
        function validarCampo(frm)
        {
            var cep = document.getElementById("txtUnidadeLogradouroCep").value;

            if(cep === "")
            {
                alert("Informe o CEP");
                return false;
            }
            else
                frm.submit();
        }
        
        </script>
                
    </body>
</html>
