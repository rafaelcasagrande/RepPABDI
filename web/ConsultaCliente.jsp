<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Cliente</title>
    </head>
    <body>
        
        <form method="GET" action="ServletListarCliente">
            <button class="btn btn-primary" type="submit" id="btnListarClientes" value="Atualizar">Atualizar</button>
        </form>
        
        <form method="GET" action="ServletConsultarCliente">
            <input class="form-control" placeholder="Cliente" type="text" name="txtClienteNome">
            <button class="btn btn-primary" type="submit" id="btnConsultarCliente" value="Buscar">Buscar</button>
        </form>
        

        <table class="table table-striped">
            <th> Código </th>
            <th> Nome </th>
            <th> Sobrenome </th>
            <th> CPF </th>
            <th> Data Nascimento </th>
            <th> Telefone </th>
            <th> Telefone Alt. </th>
            <th> Celular </th>
            <th> E-mail </th>
            <th> Endereco </th>
            <th> Numero </th>
            <th> Bairro </th>
            <th> Cidade </th>
            <th> Estado </th>
            <th> Alterar </th>
            <th> Excluir </th>
            <c:forEach items="${clientes}" var="cliente" varStatus="loop">
                <tr>
                    <td> ${cliente.getClienteCodigo()} </td>
                    <td> ${cliente.getPessoa().getPessoaNome()} </td>
                    <td> ${cliente.getPessoa().getPessoaSobrenome()} </td>
                    <td> ${cliente.getPessoa().getPessoaCpf()} </td>
                    <td> ${cliente.getPessoa().getPessoaDataNascimento()} </td>
                    <td> ${cliente.getPessoa().getContato().getContatoTelefone()} </td>
                    <td> ${cliente.getPessoa().getContato().getContatoTelefoneAlternativo()} </td>
                    <td> ${cliente.getPessoa().getContato().getContatoCelular()} </td>
                    <td> ${cliente.getPessoa().getContato().getContatoEmail()} </td>
                    <td> ${cliente.getPessoa().getLogradouro().getLogradouroNome()} </td>
                    <td> ${cliente.getPessoa().getPessoaNumeroLogradouro()} </td>
                    <td> ${cliente.getPessoa().getLogradouro().getBairro().getBairroNome()} </td>
                    <td> ${cliente.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()} </td>
                    <td> ${cliente.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCampos(${cliente.getPessoa().getLogradouro().getLogradouroCodigo()} , ${cliente.getPessoa().getContato().getContatoCodigo()}, ${cliente.getClienteCodigo()}, ${cliente.getPessoa().getPessoaCodigo()} ,'${cliente.getPessoa().getPessoaNome()}', '${cliente.getPessoa().getPessoaSobrenome()}', 
 '${cliente.getPessoa().getPessoaCpf()}',
 '${cliente.getPessoa().getPessoaDataNascimento()}', '${cliente.getPessoa().getContato().getContatoTelefone()}', '${cliente.getPessoa().getContato().getContatoTelefoneAlternativo()}', 
 '${cliente.getPessoa().getContato().getContatoCelular()}', '${cliente.getPessoa().getContato().getContatoEmail()}', 
 '${cliente.getPessoa().getLogradouro().getLogradouroNome()}', '${cliente.getPessoa().getPessoaNumeroLogradouro()}', '${cliente.getPessoa().getLogradouro().getBairro().getBairroNome()}',
 '${cliente.getPessoa().getLogradouro().getBairro().getCidade().getCidadeNome()}', '${cliente.getPessoa().getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()}', '${cliente.getPessoa().getLogradouro().getLogradouroCep()}')" id="btnAlterarCliente${cliente.getClienteCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirCliente(${cliente.getClienteCodigo()}, ${cliente.getPessoa().getPessoaCodigo()}, ${cliente.getPessoa().getContato().getContatoCodigo()})" id="btnExcluirCliente${cliente.getClienteCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        
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
                <input hidden="true" type="text" value="ConsultaCliente.jsp" name="pagina">
                <input hidden="true" type="text" value="${cliente.getPessoa().getPessoaCodigo()}" name="txtPessoaCodigo" id="txtPessoaCodigo">
                <input hidden="true" type="text" value="${cliente.getClienteCodigo()}" name="txtClienteCodigo" id="txtClienteCodigo">
                <input hidden="true" type="text" value="${cliente.getPessoa().getContato().getContatoCodigo()}" name="txtContatoCodigo" id="txtContatoCodigo">
 
             </form>
        
        
        <div class="container">            
            <button onclick="alterarCliente()" class="btn btn-primary" id="btnAlterar">Alterar</button>
        </div>   
        
        <script>
            
            function excluirCliente(paramClienteCodigo, paramPessoaCodigo, paramContatoCodigo)
            {
                $.get('ServletManipularCliente',{codigoCliente:paramClienteCodigo, codigoPessoa:paramPessoaCodigo, codigoContato:paramContatoCodigo, acao:'excluir'}, function(){
                        window.location.reload(true);
                });
            }
            
            function preencherCampos(codigoLogradouro, codigoContato, codigoCliente, codigoPessoa, nomePessoa, sobrenomePessoa, cpfPessoa, dataNascimentoPessoa, telefonePessoa, telefoneAlternativoPessoa,
            celularPessoa, emailPessoa, nomeLogradouro, numeroLogradouro, nomeBairro, nomeCidade, nomeEstado, logradouroCep)
            {
                document.getElementById("txtPessoaLogradouro").value = codigoLogradouro;
                document.getElementById("txtContatoCodigo").value = codigoContato;
                document.getElementById("txtClienteCodigo").value = codigoCliente;
                document.getElementById("txtPessoaCodigo").value = codigoPessoa;
                
                document.getElementById("txtPessoaNome").value = nomePessoa;
                document.getElementById("txtPessoaSobrenome").value = sobrenomePessoa;
                document.getElementById("txtPessoaCpf").value = cpfPessoa;
                document.getElementById("txtPessoaDataNascimento").value = dataNascimentoPessoa;
                document.getElementById("txtContatoTelefone").value = telefonePessoa;
                document.getElementById("txtContatoTelefoneAlternativo").value = telefoneAlternativoPessoa;
                document.getElementById("txtContatoCelular").value = celularPessoa;
                document.getElementById("txtContatoEmail").value = emailPessoa;
                document.getElementById("txtPessoaNumeroLogradouro").value = numeroLogradouro;
                document.getElementById("txtPessoaLogradouroCep").value = logradouroCep;
                document.getElementById("txtPessoaLogradouroNome").value = nomeLogradouro;
                document.getElementById("txtPessoaBairroNome").value = nomeBairro;
                document.getElementById("txtPessoaCidadeNome").value = nomeCidade;
                document.getElementById("txtPessoaEstadoNome").value = nomeEstado;
 
            }
            
            function alterarCliente()
            {
                var codigoPessoa = document.getElementById("txtPessoaCodigo").value;
                var codigoContato = document.getElementById("txtContatoCodigo").value;
                var codigoCliente = document.getElementById("txtClienteCodigo").value;
                var nomePessoa = document.getElementById("txtPessoaNome").value;
                var sobrenomePessoa = document.getElementById("txtPessoaSobrenome").value;
                var cpfPessoa = document.getElementById("txtPessoaCpf").value;
                var dataNascimentoPessoa = document.getElementById("txtPessoaDataNascimento").value;
                var telefonePessoa = document.getElementById("txtContatoTelefone").value;
                var telefoneAltPessoa = document.getElementById("txtContatoTelefoneAlternativo").value;
                var celularPessoa = document.getElementById("txtContatoCelular").value;
                var emailPessoa = document.getElementById("txtContatoEmail").value;
                var numeroLogradouro = document.getElementById("txtPessoaNumeroLogradouro").value;
                var codigoLogradouro = document.getElementById("txtPessoaLogradouro").value;
                
                $.get('ServletManipularCliente',{codigoPessoa:codigoPessoa, codigoContato:codigoContato, codigoCliente:codigoCliente, nomePessoa:nomePessoa, sobrenomePessoa:sobrenomePessoa, cpfPessoa:cpfPessoa, dataNascimentoPessoa:dataNascimentoPessoa, telefonePessoa:telefonePessoa, telefoneAltPessoa:telefoneAltPessoa, celularPessoa:celularPessoa, emailPessoa:emailPessoa, numeroLogradouro:numeroLogradouro, codigoLogradouro:codigoLogradouro, acao:'alterar'}, function(){
                        window.location.reload(true);
                });
                
            }
            
        </script>
        
    </body>
</html>
