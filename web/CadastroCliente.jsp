<%-- 
    Document   : CadastroCliente
    Created on : 24/08/2014, 17:52:33
    Author     : rafael
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <div class="container">
             
            <form role="form" method="GET" action="ServletListarEnderecoCliente">
                <input class="form-control" placeholder="Nome do Cliente" value="${cliente.getPessoa().getPessoaNome()}" type="text" id="txtPessoaNome" name="txtPessoaNome"><br>
                <input class="form-control" placeholder="Sobrenome" value="${cliente.getPessoa().getPessoaSobrenome()}" type="text" id="txtPessoaSobrenome" name="txtPessoaSobrenome"><br>
                <input class="form-control" placeholder="CPF" value="${cliente.getPessoa().getPessoaCpf()}" type="text" id="txtPessoaCpf" name="txtPessoaCpf"><br>
                <input class="form-control" placeholder="Data de Nascimento" value="${pessoaDataNascimento}" type="text" id="txtPessoaDataNascimento" name="txtPessoaDataNascimento"><br>
                <input class="form-control" placeholder="Telefone" type="text" value="${cliente.getPessoa().getContato().getContatoTelefone()}" id="txtContatoTelefone" name="txtContatoTelefone"><br>
                <input class="form-control" placeholder="Outro Telefone" value="${cliente.getPessoa().getContato().getContatoTelefoneAlternativo()}" type="text" id="txtContatoTelefoneAlternativo" name="txtContatoTelefoneAlternativo"><br>
                <input class="form-control" placeholder="Celular" value="${cliente.getPessoa().getContato().getContatoCelular()}" type="text" id="txtContatoCelular" name="txtContatoCelular"><br>
                <input class="form-control" placeholder="E-mail" value="${cliente.getPessoa().getContato().getContatoEmail()}" type="text" id="txtContatoEmail" name="txtContatoEmail"><br>
                <input class="form-control" placeholder="Número" value="${cliente.getPessoa().getPessoaNumeroLogradouro()}" type="text" id="txtPessoaNumeroLogradouro" name="txtPessoaNumeroLogradouro"><br>
                <input class="form-control" placeholder="CEP" type="text" value="${cliente.getPessoa().getLogradouro().getLogradouroCep()}" id="txtPessoaLogradouroCep" name="txtPessoaLogradouroCep"><br>
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br>
                <input class="form-control" placeholder="Logradouro" value="${cliente.getPessoa().getLogradouro().getLogradouroNome()}" type="text" id="txtPessoaLogradouroNome" name="txtPessoaLogradouroNome"><br>
                <input class="form-control" placeholder="Bairro" value="${cliente.getPessoa().getLogradouro().getBairro().getBairroNome()}" type="text" id="txtPessoaBairroNome" name="txtPessoaBairroNome"><br>
                <input class="form-control" placeholder="Cidade" value="${cliente.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()}"type="text" id="txtPessoaCidadeNome" name="txtPessoaCidadeNome"><br>
                <input class="form-control" placeholder="Estado" value="${cliente.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoNome()}" type="text" id="txtPessoaEstadoNome" name="txtPessoaEstadoNome"><br>
                <input hidden="true" type="text" value="${cliente.getPessoa().getLogradouro().getLogradouroCodigo()}" name="txtPessoaLogradouro" id="txtPessoaLogradouro">
                <input hidden="true" type="text" value="CadastroCliente.jsp" name="pagina">
             </form>
                
             <button onclick="cadastrarCliente()" class="btn btn-primary" id="btnValidar">Cadastrar</button><br>
        </div>

        <script>
            
            function cadastrarCliente()
            {
                var nomePessoa = document.getElementById("txtPessoaNome").value;
                var sobrenomePessoa = document.getElementById("txtPessoaSobrenome").value;
                var cpfPessoa = document.getElementById("txtPessoaCpf").value;
                var pessoaDataNascimento = document.getElementById("txtPessoaDataNascimento").value;
                var telefonePessoa = document.getElementById("txtContatoTelefone").value;
                var telefoneAlternativoPessoa = document.getElementById("txtContatoTelefoneAlternativo").value;
                var celularPessoa = document.getElementById("txtContatoCelular").value;
                var emailPessoa = document.getElementById("txtContatoEmail").value;
                var pessoaNumeroLogradouro = document.getElementById("txtPessoaNumeroLogradouro").value;
                var pessoaLogradouro = document.getElementById("txtPessoaLogradouro").value;
                
                $.get('ServletCadastrarPessoa',{nomePessoa:nomePessoa, sobrenomePessoa:sobrenomePessoa, cpfPessoa:cpfPessoa, pessoaDataNascimento:pessoaDataNascimento, 
                    telefonePessoa:telefonePessoa, telefoneAlternativoPessoa:telefoneAlternativoPessoa, celularPessoa:celularPessoa, emailPessoa:emailPessoa,
                    pessoaNumeroLogradouro:pessoaNumeroLogradouro, pessoaLogradouro:pessoaLogradouro,
                    tipoCadastro:'cliente'},function(){
                    window.location.reload(true);
                });
            }
        </script>
    </body>
</html>
