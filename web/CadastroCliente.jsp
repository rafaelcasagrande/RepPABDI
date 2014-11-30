
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
        
        <script>
            
            function limparCampos()
            {
                document.getElementById("txtPessoaNome").value = "";
                document.getElementById("txtPessoaSobrenome").value = "";
                document.getElementById("txtPessoaCpf").value = "";
                document.getElementById("txtPessoaDataNascimento").value = "";
                document.getElementById("txtContatoTelefone").value = "";
                document.getElementById("txtContatoTelefoneAlternativo").value = "";
                document.getElementById("txtContatoCelular").value = "";
                document.getElementById("txtContatoEmail").value = "";
                document.getElementById("txtPessoaNumeroLogradouro").value = "";
                document.getElementById("txtPessoaLogradouroCep").value = "";
                document.getElementById("txtPessoaLogradouroNome").value = "";
                document.getElementById("txtPessoaBairroNome").value = "";
                document.getElementById("txtPessoaCidadeNome").value = "";
                document.getElementById("txtPessoaEstadoNome").value = "";
            }
            
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
        
        
        <div align="center">
            <h1> Cadastrar Cliente </h1>   
            <form role="form" method="GET" action="ServletListarEnderecoCliente" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Nome do Cliente" value="${cliente.getPessoa().getPessoaNome()}" type="text" id="txtPessoaNome" name="txtPessoaNome"> 
                <input style="width: 300px;" class="form-control" placeholder="Sobrenome" value="${cliente.getPessoa().getPessoaSobrenome()}" type="text" id="txtPessoaSobrenome" name="txtPessoaSobrenome"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="CPF" value="${cliente.getPessoa().getPessoaCpf()}" type="text" id="txtPessoaCpf" name="txtPessoaCpf">
                <input style="width: 300px;" class="form-control" placeholder="Data de Nascimento" value="${pessoaDataNascimento}" type="text" id="txtPessoaDataNascimento" name="txtPessoaDataNascimento"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Telefone" type="text" value="${cliente.getPessoa().getContato().getContatoTelefone()}" id="txtContatoTelefone" name="txtContatoTelefone">
                <input style="width: 300px;" class="form-control" placeholder="Outro Telefone" value="${cliente.getPessoa().getContato().getContatoTelefoneAlternativo()}" type="text" id="txtContatoTelefoneAlternativo" name="txtContatoTelefoneAlternativo"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Celular" value="${cliente.getPessoa().getContato().getContatoCelular()}" type="text" id="txtContatoCelular" name="txtContatoCelular">
                <input style="width: 300px;" class="form-control" placeholder="E-mail" value="${cliente.getPessoa().getContato().getContatoEmail()}" type="text" id="txtContatoEmail" name="txtContatoEmail"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Número" value="${cliente.getPessoa().getPessoaNumeroLogradouro()}" type="text" id="txtPessoaNumeroLogradouro" name="txtPessoaNumeroLogradouro">
                <input style="width: 200px;" class="form-control" placeholder="CEP" type="text" value="${cliente.getPessoa().getLogradouro().getLogradouroCep()}" id="txtPessoaLogradouroCep" name="txtPessoaLogradouroCep">
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br><br>
                <input disabled="true" style="width: 300px;" class="form-control" placeholder="Logradouro" value="${cliente.getPessoa().getLogradouro().getLogradouroNome()}" type="text" id="txtPessoaLogradouroNome" name="txtPessoaLogradouroNome">
                <input disabled="true" style="width: 300px;" class="form-control" placeholder="Bairro" value="${cliente.getPessoa().getLogradouro().getBairro().getBairroNome()}" type="text" id="txtPessoaBairroNome" name="txtPessoaBairroNome"><br><br>
                <input disabled="true" style="width: 300px;" class="form-control" placeholder="Cidade" value="${cliente.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()}"type="text" id="txtPessoaCidadeNome" name="txtPessoaCidadeNome">
                <input disabled="true" style="width: 300px;" class="form-control" placeholder="Estado" value="${cliente.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoNome()}" type="text" id="txtPessoaEstadoNome" name="txtPessoaEstadoNome"><br><br>
                <input hidden="true" type="text" value="${cliente.getPessoa().getLogradouro().getLogradouroCodigo()}" name="txtPessoaLogradouro" id="txtPessoaLogradouro">
                <input hidden="true" type="text" value="CadastroCliente.jsp" name="pagina">
             </form>
                
             <button onclick="cadastrarCliente()" class="btn btn-primary" id="btnValidar">Cadastrar</button>
             <input type="button" onclick="limparCampos()" class="btn btn-primary" value="Limpar" id="btnLimpar">
        </div>

        
    </body>
</html>
