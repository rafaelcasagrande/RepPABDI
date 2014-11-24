<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Funcionario</title>
    </head>
    <body>
        
        <form method="GET" action="ServletListarFuncionario">
            <button class="btn btn-primary" type="submit" id="btnListarFuncionarios" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarFuncionario">
            <input class="form-control" placeholder="Fornecedor" type="text" name="txtFuncionarioNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarFuncionarios" value="Buscar">Buscar</button>
        </form>
        

        <table class="table table-striped">
            <th> Código </th>
            <th> Nome </th>
            <th> Sobrenome </th>
            <th> Cargo </th>
            <th> Unidade </th>
            <th> CPF </th>
            <th> Data Nascimento </th>
            <th> Telefone </th>
            <th> Telefone Alt. </th>
            <th> Celular </th>
            <th> E-mail </th>
            <th> Data Admissão </th>
            <th> Endereco </th>
            <th> Numero </th>
            <th> Bairro </th>
            <th> Cidade </th>
            <th> Estado </th>
            <th> Alterar </th>
            <th> Excluir </th>
            <c:forEach items="${funcionarios}" var="funcionario" varStatus="loop">
                <tr>
                    <td> ${funcionario.getFuncionarioCodigo()} </td>
                    <td> ${funcionario.getPessoa().getPessoaNome()} </td>
                    <td> ${funcionario.getPessoa().getPessoaSobrenome()} </td>
                    <td> ${funcionario.getCargo().getCargoNome()} </td>
                    <td> ${funcionario.getUnidade().getUnidadeNome()} </td>
                    <td> ${funcionario.getPessoa().getPessoaCpf()} </td>
                    <td> ${funcionario.getPessoa().getPessoaDataNascimento()} </td>
                    <td> ${funcionario.getPessoa().getContato().getContatoTelefone()} </td>
                    <td> ${funcionario.getPessoa().getContato().getContatoTelefoneAlternativo()} </td>
                    <td> ${funcionario.getPessoa().getContato().getContatoCelular()} </td>
                    <td> ${funcionario.getPessoa().getContato().getContatoEmail()} </td>
                    <td> ${funcionario.getFuncionarioDataAdmissao()} </td>
                    <td> ${funcionario.getPessoa().getLogradouro().getLogradouroNome()} </td>
                    <td> ${funcionario.getPessoa().getPessoaNumeroLogradouro()} </td>
                    <td> ${funcionario.getPessoa().getLogradouro().getBairro().getBairroNome()} </td>
                    <td> ${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()} </td>
                    <td> ${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCampos(${funcionario.getPessoa().getLogradouro().getLogradouroCodigo()} , ${funcionario.getPessoa().getContato().getContatoCodigo()}, ${funcionario.getFuncionarioCodigo()}, ${funcionario.getPessoa().getPessoaCodigo()} ,'${funcionario.getPessoa().getPessoaNome()}', '${funcionario.getPessoa().getPessoaSobrenome()}', 
 '${funcionario.getCargo().getCargoCodigo()}', '${funcionario.getUnidade().getUnidadeCodigo()}', '${funcionario.getPessoa().getPessoaCpf()}',
 '${funcionario.getPessoa().getPessoaDataNascimento()}', '${funcionario.getPessoa().getContato().getContatoTelefone()}', '${funcionario.getPessoa().getContato().getContatoTelefoneAlternativo()}', 
 '${funcionario.getPessoa().getContato().getContatoCelular()}', '${funcionario.getPessoa().getContato().getContatoEmail()}', '${funcionario.getFuncionarioDataAdmissao()}', 
 '${funcionario.getPessoa().getLogradouro().getLogradouroNome()}', '${funcionario.getPessoa().getPessoaNumeroLogradouro()}', '${funcionario.getPessoa().getLogradouro().getBairro().getBairroNome()}',
 '${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()}', '${funcionario.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()}', '${funcionario.getPessoa().getLogradouro().getLogradouroCep()}')" id="btnAlterarFuncionario${funcionario.getFuncionarioCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirFuncionario(${funcionario.getFuncionarioCodigo()}, ${funcionario.getPessoa().getPessoaCodigo()}, ${funcionario.getPessoa().getContato().getContatoCodigo()})" id="btnExcluirFuncionario${funcionario.getFuncionarioCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        
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
                <input hidden="true" type="text" value="ConsultaFuncionario.jsp" name="pagina">
                <input hidden="true" type="text" value="${funcionario.getPessoa().getPessoaCodigo()}" name="txtPessoaCodigo" id="txtPessoaCodigo">
                <input hidden="true" type="text" value="${funcionario.getFuncionarioCodigo()}" name="txtFuncionarioCodigo" id="txtFuncionarioCodigo">
                <input hidden="true" type="text" value="${funcionario.getPessoa().getContato().getContatoCodigo()}" name="txtContatoCodigo" id="txtContatoCodigo">
                
                
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
        
        
        <div class="container">            
            <button onclick="alterarFuncionario()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        </div>   
        
        <script>
            
            function excluirFuncionario(paramFuncionarioCodigo, paramPessoaCodigo, paramContatoCodigo)
            {
                $.get('ServletManipularFuncionario',{codigoFuncionario:paramFuncionarioCodigo, codigoPessoa:paramPessoaCodigo, codigoContato:paramContatoCodigo, acao:'excluir'}, function(){
                        window.location.reload(true);
                });
            }
            
            function preencherCampos(codigoLogradouro, codigoContato, codigoFuncionario, codigoPessoa, nomePessoa, sobrenomePessoa, codigoCargo, codigoUnidade, cpfPessoa, dataNascimentoPessoa, telefonePessoa, telefoneAlternativoPessoa,
            celularPessoa, emailPessoa, dataAdmissaoPessoa, nomeLogradouro, numeroLogradouro, nomeBairro, nomeCidade, nomeEstado, logradouroCep)
            {
                document.getElementById("txtPessoaLogradouro").value = codigoLogradouro;
                document.getElementById("txtContatoCodigo").value = codigoContato;
                document.getElementById("txtFuncionarioCodigo").value = codigoFuncionario;
                document.getElementById("txtPessoaCodigo").value = codigoPessoa;
                
                document.getElementById("txtPessoaNome").value = nomePessoa;
                document.getElementById("txtPessoaSobrenome").value = sobrenomePessoa;
                document.getElementById("txtPessoaCpf").value = cpfPessoa;
                document.getElementById("txtPessoaDataNascimento").value = dataNascimentoPessoa;
                document.getElementById("txtContatoTelefone").value = telefonePessoa;
                document.getElementById("txtContatoTelefoneAlternativo").value = telefoneAlternativoPessoa;
                document.getElementById("txtContatoCelular").value = celularPessoa;
                document.getElementById("txtContatoEmail").value = emailPessoa;
                document.getElementById("txtFuncionarioDataAdmissao").value = dataAdmissaoPessoa;
                document.getElementById("txtPessoaNumeroLogradouro").value = numeroLogradouro;
                document.getElementById("txtPessoaLogradouroCep").value = logradouroCep;
                document.getElementById("txtPessoaLogradouroNome").value = nomeLogradouro;
                document.getElementById("txtPessoaBairroNome").value = nomeBairro;
                document.getElementById("txtPessoaCidadeNome").value = nomeCidade;
                document.getElementById("txtPessoaEstadoNome").value = nomeEstado;
                
                $("#cbxFuncionarioCargo").val(codigoCargo);
                $("#cbxFuncionarioUnidade").val(codigoUnidade);
            }
            
            function alterarFuncionario()
            {
                var codigoPessoa = document.getElementById("txtPessoaCodigo").value;
                var codigoContato = document.getElementById("txtContatoCodigo").value;
                var codigoFuncionario = document.getElementById("txtFuncionarioCodigo").value;
                var nomePessoa = document.getElementById("txtPessoaNome").value;
                var sobrenomePessoa = document.getElementById("txtPessoaSobrenome").value;
                var cpfPessoa = document.getElementById("txtPessoaCpf").value;
                var dataNascimentoPessoa = document.getElementById("txtPessoaDataNascimento").value;
                var telefonePessoa = document.getElementById("txtContatoTelefone").value;
                var telefoneAltPessoa = document.getElementById("txtContatoTelefoneAlternativo").value;
                var celularPessoa = document.getElementById("txtContatoCelular").value;
                var emailPessoa = document.getElementById("txtContatoEmail").value;
                var dataAdmissaoPessoa = document.getElementById("txtFuncionarioDataAdmissao").value;
                var numeroLogradouro = document.getElementById("txtPessoaNumeroLogradouro").value;
                var codigoLogradouro = document.getElementById("txtPessoaLogradouro").value;
                var codigoCargo = document.getElementById("cbxFuncionarioCargo").value;
                var codigoUnidade = document.getElementById("cbxFuncionarioUnidade").value;
                
                $.get('ServletManipularFuncionario',{codigoPessoa:codigoPessoa, codigoContato:codigoContato, codigoFuncionario:codigoFuncionario, nomePessoa:nomePessoa, sobrenomePessoa:sobrenomePessoa, cpfPessoa:cpfPessoa, dataNascimentoPessoa:dataNascimentoPessoa, telefonePessoa:telefonePessoa, telefoneAltPessoa:telefoneAltPessoa, celularPessoa:celularPessoa, emailPessoa:emailPessoa, dataAdmissaoPessoa:dataAdmissaoPessoa, numeroLogradouro:numeroLogradouro, codigoLogradouro:codigoLogradouro, codigoCargo:codigoCargo, codigoUnidade:codigoUnidade, acao:'alterar'}, function(){
                        window.location.reload(true);
                });
                
            }
            
        </script>
    </body>
</html>
