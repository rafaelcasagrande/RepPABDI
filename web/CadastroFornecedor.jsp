
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Fornecedor</title>
    </head>
    <body> 
        <div align="center">
            <h1> Cadastrar Fornecedor </h1> 
            <form method="GET" action="ServletListarEndereco" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Nome do Fornecedor" type="text" value="${fornecedor.getFornecedorNome()}" id="txtFornecedorNome" name="txtFornecedorNome">
                <input style="width: 300px;" class="form-control" placeholder="CNPJ" type="text" value="${fornecedor.getFornecedorCnpj()}" id="txtFornecedorCnpj" name="txtFornecedorCnpj"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Telefone" type="text" value="${fornecedor.getContato().getContatoTelefone()}" id="txtFornecedorTelefone" name="txtFornecedorTelefone">
                <input style="width: 300px;" class="form-control" placeholder="Outro Telefone" type="text" value="${fornecedor.getContato().getContatoTelefoneAlternativo()}" id="txtFornecedorTelefoneAlternativo" name="txtFornecedorTelefoneAlternativo"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Celular" type="text" value="${fornecedor.getContato().getContatoCelular()}" id="txtFornecedorCelular" name="txtFornecedorCelular">
                <input style="width: 300px;" class="form-control" placeholder="E-mail" type="text" value="${fornecedor.getContato().getContatoEmail()}" id="txtFornecedorEmail" name="txtFornecedorEmail"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Número" type="text" value="${fornecedor.getFornecedorNumeroLogradouro()}" id="txtFornecedorNumeroLogradouro" name="txtFornecedorNumeroLogradouro">
                <input style="width: 200px;" class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" id="txtFornecedorLogradouroCep" name="txtFornecedorLogradouroCep">
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" id="txtFornecedorLogradouroNome" name="txtFornecedorLogradouroNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" id="txtFornecedorBairroNome" name="txtFornecedorBairroNome"><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" id="txtFornecedorCidadeNome" name="txtFornecedorCidadeNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  id="txtFornecedorEstadoNome" name="txtFornecedorEstadoNome"><br><br>
                <input hidden="true" type="text" value="${logradouro.getLogradouroCodigo()}" id="codigoLogradouro">
                <input hidden="true" type="text" value="CadastroFornecedor.jsp" name="pagina">
                <input hidden="true" type="text" value="0" name="codigoFornecedor">
                <input hidden="true" type="text" value="0" name="codigoContato">
            
            </form>
            <button onclick="cadastrarFornecedor()" class="btn btn-primary" id="btnCadastrar">Cadastrar</button>
            <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
        </div>   
            
            <script>
                function cadastrarFornecedor()
                {
                    var nomeFornecedor = document.getElementById("txtFornecedorNome").value;
                    var cnpjFornecedor = document.getElementById("txtFornecedorCnpj").value;
                    var telefoneFornecedor = document.getElementById("txtFornecedorTelefone").value;
                    var telefoneAltFornecedor = document.getElementById("txtFornecedorTelefoneAlternativo").value;
                    var celularFornecedor = document.getElementById("txtFornecedorCelular").value;
                    var emailFornecedor = document.getElementById("txtFornecedorEmail").value;
                    var numeroFornecedor = document.getElementById("txtFornecedorNumeroLogradouro").value;
                    var codigoLogradouro = document.getElementById("codigoLogradouro").value;
                    
                    $.get('ServletCadastrarFornecedor',{nomeFornecedor:nomeFornecedor, cnpjFornecedor:cnpjFornecedor, telefoneFornecedor:telefoneFornecedor, telefoneAltFornecedor:telefoneAltFornecedor, celularFornecedor:celularFornecedor, emailFornecedor:emailFornecedor, numeroFornecedor:numeroFornecedor, codigoLogradouro:codigoLogradouro}, function(){
                        window.location.reload(true);
                    });
                    
                }
                
                function limparCampos()
                {
                    document.getElementById("txtFornecedorNome").value = "";
                    document.getElementById("txtFornecedorCnpj").value = "";
                    document.getElementById("txtFornecedorTelefone").value = "";
                    document.getElementById("txtFornecedorTelefoneAlternativo").value = "";
                    document.getElementById("txtFornecedorCelular").value = "";
                    document.getElementById("txtFornecedorEmail").value = "";
                    document.getElementById("txtFornecedorNumeroLogradouro").value = "";
                    document.getElementById("txtFornecedorLogradouroNome").value = "";
                    document.getElementById("txtFornecedorBairroNome").value = "";
                    document.getElementById("txtFornecedorCidadeNome").value = "";
                    document.getElementById("txtFornecedorEstadoNome").value = "";
                    document.getElementById("txtFornecedorLogradouroCep").value = "";
                }

            </script>
            
            
    </body>
</html>
