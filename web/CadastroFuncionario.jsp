
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Funcionário</title>
    </head>
    <body>
        <div class="container">
             
            <form role="form" method="GET" action="ServletListarEnderecoPessoa">
                <input class="form-control" placeholder="Nome do Funcionário" value="${funcionario.getPessoa().getPessoaNome()}" type="text" id="txtPessoaNome" name="txtPessoaNome"><br>
                <input class="form-control" placeholder="Sobrenome" value="${funcionario.getPessoa().getPessoaSobrenome()}" type="text" id="txtPessoaSobrenome" name="txtPessoaSobrenome"><br>
                <input class="form-control" placeholder="CPF" value="${funcionario.getPessoa().getPessoaCpf()}" type="text" id="txtPessoaCpf" name="txtPessoaCpf"><br>
                <input class="form-control" placeholder="Data de Nascimento" value="${pessoaDataNascimento}" type="text" id="txtPessoaDataNascimento" name="txtPessoaDataNascimento"><br>
                <input class="form-control" placeholder="Telefone" type="text" value="${funcionario.getPessoa().getContato().getContatoTelefone()}" id="txtContatoTelefone" name="txtContatoTelefone"><br>
                <input class="form-control" placeholder="Outro Telefone" value="${funcionario.getPessoa().getContato().getContatoTelefoneAlternativo()}" type="text" id="txtContatoTelefoneAlternativo" name="txtContatoTelefoneAlternativo"><br>
                <input class="form-control" placeholder="Celular" value="${funcionario.getPessoa().getContato().getContatoCelular()}" type="text" id="txtContatoCelular" name="txtContatoCelular"><br>
                <input class="form-control" placeholder="E-mail" value="${funcionario.getPessoa().getContato().getContatoEmail()}" type="text" id="txtContatoEmail" name="txtContatoEmail"><br>
                <input class="form-control" placeholder="Data de admissão" value="${funcionarioDataAdmissao}" type="text" id="txtFuncionarioDataAdmissao" name="txtFuncionarioDataAdmissao"><br>
                <input class="form-control" placeholder="Número" value="${funcionario.getPessoa().getPessoaNumeroLogradouro()}" type="text" id="txtPessoaNumeroLogradouro" name="txtPessoaNumeroLogradouro"><br>
                <input class="form-control" placeholder="CEP" type="text" value="${funcionario.getPessoa().getLogradouro().getLogradouroCep()}" id="txtPessoaLogradouroCep" name="txtPessoaLogradouroCep"><br>
                <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br>
                <input class="form-control" placeholder="Logradouro" value="${funcionario.getPessoa().getLogradouro().getLogradouroNome()}" type="text" id="txtPessoaLogradouroNome" name="txtPessoaLogradouroNome"><br>
                <input class="form-control" placeholder="Bairro" value="${funcionario.getPessoa().getLogradouro().getBairro().getBairroNome()}" type="text" id="txtPessoaBairroNome" name="txtPessoaBairroNome"><br>
                <input class="form-control" placeholder="Cidade" value="${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()}"type="text" id="txtPessoaCidadeNome" name="txtPessoaCidadeNome"><br>
                <input class="form-control" placeholder="Estado" value="${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoNome()}" type="text" id="txtPessoaEstadoNome" name="txtPessoaEstadoNome"><br>
                <input hidden="true" type="text" value="${funcionario.getPessoa().getLogradouro().getLogradouroCodigo()}" name="txtPessoaLogradouro" id="txtPessoaLogradouro">
                <input hidden="true" type="text" value="CadastroFuncionario.jsp" name="pagina">
                
                <select name="cbxFuncionarioCargo" id="cbxFuncionarioCargo">
                    <option selected disabled> Cargos </option>
                    <c:forEach items="${cargos}" var="cargo" varStatus="loop">
                        <option value="${cargo.getCargoCodigo()}"> ${cargo.getCargoNome()} </option>
                    </c:forEach>
                </select>
                    
                <select name="cbxFuncionarioUnidade" id="cbxFuncionarioUnidade">
                    <option selected disabled> Unidades </option>
                    <c:forEach items="${unidades}" var="unidade" varStatus="loop">
                        <option value="${unidade.getUnidadeCodigo()}"> ${unidade.getUnidadeNome()} </option>
                    </c:forEach>
                </select>
                
             </form>
                
             <button onclick="cadastrarFuncionario()" class="btn btn-primary" id="btnValidar">Cadastrar</button><br>
        </div>

        <script>
            
            function cadastrarFuncionario()
            {
                var nomePessoa = document.getElementById("txtPessoaNome").value;
                var sobrenomePessoa = document.getElementById("txtPessoaSobrenome").value;
                var cpfPessoa = document.getElementById("txtPessoaCpf").value;
                var pessoaDataNascimento = document.getElementById("txtPessoaDataNascimento").value;
                var telefonePessoa = document.getElementById("txtContatoTelefone").value;
                var telefoneAlternativoPessoa = document.getElementById("txtContatoTelefoneAlternativo").value;
                var celularPessoa = document.getElementById("txtContatoCelular").value;
                var emailPessoa = document.getElementById("txtContatoEmail").value;
                var funcionarioDataAdmissao = document.getElementById("txtFuncionarioDataAdmissao").value;
                var pessoaNumeroLogradouro = document.getElementById("txtPessoaNumeroLogradouro").value;
                var pessoaLogradouro = document.getElementById("txtPessoaLogradouro").value;
                var funcionarioCargo = document.getElementById("cbxFuncionarioCargo").value;
                var funcionarioUnidade = document.getElementById("cbxFuncionarioUnidade").value;
                
                $.get('ServletCadastrarPessoa',{nomePessoa:nomePessoa, sobrenomePessoa:sobrenomePessoa, cpfPessoa:cpfPessoa, pessoaDataNascimento:pessoaDataNascimento, 
                    telefonePessoa:telefonePessoa, telefoneAlternativoPessoa:telefoneAlternativoPessoa, celularPessoa:celularPessoa, emailPessoa:emailPessoa,
                    funcionarioDataAdmissao:funcionarioDataAdmissao, pessoaNumeroLogradouro:pessoaNumeroLogradouro, pessoaLogradouro:pessoaLogradouro, funcionarioCargo:funcionarioCargo,
                    funcionarioUnidade:funcionarioUnidade, tipoCadastro:'funcionario'},function(){
                    window.location.reload(true);
                });
            }
        </script>
    </body>
</html>
