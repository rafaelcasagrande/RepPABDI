<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Fornecedor</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Consultar Fornecedores </h1>
        <form method="GET" action="ServletListarFornecedor">
            <button class="btn btn-primary" type="submit" id="btnListarFornecedores" value="Atualizar">Atualizar</button><br><br>
        </form>
        
        <form method="GET" action="ServletConsultarFornecedor" class="form-inline">
            <input style="width: 300px;" class="form-control" placeholder="Fornecedor" type="text" name="txtFornecedorNome">
                   <button class="btn btn-primary" type="submit" id="btnConsultarFornecedores" value="Buscar">Buscar</button><br><br>
        </form>
        

        <table class="table table-striped">
            <th> Código </th>
            <th> Nome </th>
            <th> CNPJ </th>
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
            <c:forEach items="${fornecedores}" var="fornecedor" varStatus="loop">
                <tr>
                    <td> ${fornecedor.getFornecedorCodigo()} </td>
                    <td> ${fornecedor.getFornecedorNome()} </td>
                    <td> ${fornecedor.getFornecedorCnpj()} </td>
                    <td> ${fornecedor.getContato().getContatoTelefone()} </td>
                    <td> ${fornecedor.getContato().getContatoTelefoneAlternativo()} </td>
                    <td> ${fornecedor.getContato().getContatoCelular()} </td>
                    <td> ${fornecedor.getContato().getContatoEmail()} </td>
                    <td> ${fornecedor.getLogradouro().getLogradouroNome()} </td>
                    <td> ${fornecedor.getFornecedorNumeroLogradouro()} </td>
                    <td> ${fornecedor.getLogradouro().getBairro().getBairroNome()} </td>
                    <td> ${fornecedor.getLogradouro().getBairro().getCidade().getCidadeNome()} </td>
                    <td> ${fornecedor.getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()} </td>
                    <td> <button type="submit" class="btn btn-default" onclick="preencherCampos(${fornecedor.getLogradouro().getLogradouroCodigo()}, ${fornecedor.getContato().getContatoCodigo()}, ${fornecedor.getFornecedorCodigo()}, '${fornecedor.getFornecedorNome()}', '${fornecedor.getFornecedorCnpj()}', '${fornecedor.getContato().getContatoTelefone()}', '${fornecedor.getContato().getContatoTelefoneAlternativo()}', '${fornecedor.getContato().getContatoCelular()}', '${fornecedor.getContato().getContatoEmail()}', '${fornecedor.getLogradouro().getLogradouroNome()}', '${fornecedor.getLogradouro().getLogradouroCep()}' , '${fornecedor.getFornecedorNumeroLogradouro()}', '${fornecedor.getLogradouro().getBairro().getBairroNome()}', '${fornecedor.getLogradouro().getBairro().getCidade().getCidadeNome()}', '${fornecedor.getLogradouro().getBairro().getCidade().getEstado().getEstadoSigla()}')" id="btnAlterarFornecedor${fornecedor.getFornecedorCodigo()}"> <span class="glyphicon glyphicon-pencil"> </span> </button> </td>
                    <td> <button type="submit" class="btn btn-default" onclick="excluirFornecedor(${fornecedor.getFornecedorCodigo()}, ${fornecedor.getContato().getContatoCodigo()})" id="btnExcluirFornecedor${fornecedor.getFornecedorCodigo()}"> <span class="glyphicon glyphicon-remove"> </span></button> </td>
                </tr>
            </c:forEach>
        </table>
        
        <div class="container">
            <form method="GET" action="ServletListarEndereco" class="form-inline" onsubmit="validarCampo(this); return false;">
                <input style="width: 300px;" class="form-control" placeholder="Nome do Fornecedor" type="text" value="${fornecedor.getFornecedorNome()}" id="txtFornecedorNome" name="txtFornecedorNome">
                <input style="width: 300px;" class="form-control" placeholder="CNPJ" type="text" value="${fornecedor.getFornecedorCnpj()}" id="txtFornecedorCnpj" name="txtFornecedorCnpj"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Telefone" type="text" value="${fornecedor.getContato().getContatoTelefone()}" id="txtFornecedorTelefone" name="txtFornecedorTelefone">
                <input style="width: 300px;" class="form-control" placeholder="Outro Telefone" type="text" value="${fornecedor.getContato().getContatoTelefoneAlternativo()}" id="txtFornecedorTelefoneAlternativo" name="txtFornecedorTelefoneAlternativo"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Celular" type="text" value="${fornecedor.getContato().getContatoCelular()}" id="txtFornecedorCelular" name="txtFornecedorCelular">
                <input style="width: 300px;" class="form-control" placeholder="E-mail" type="text" value="${fornecedor.getContato().getContatoEmail()}" id="txtFornecedorEmail" name="txtFornecedorEmail"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Número" type="text" value="${fornecedor.getFornecedorNumeroLogradouro()}" id="txtFornecedorNumeroLogradouro" name="txtFornecedorNumeroLogradouro">
                <input style="width: 200px;" class="form-control" placeholder="CEP" type="text" value="${logradouro.getLogradouroCep()}" id="txtFornecedorLogradouroCep" name="txtFornecedorLogradouroCep">
                    <button type="submit" class="btn btn-primary" id="btnValidar">Validar Cep</button><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Logradouro" type="text" value="${logradouro.getLogradouroNome()}" id="txtFornecedorLogradoutoNome" name="txtFornecedorLogradoutoNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Bairro" type="text" value="${logradouro.getBairro().getBairroNome()}" id="txtFornecedorBairroNome" name="txtFornecedorBairroNome"><br><br>
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Cidade" type="text" value="${logradouro.getBairro().getCidade().getCidadeNome()}" id="txtFornecedorCidadeNome" name="txtFornecedorCidadeNome">
                <input style="width: 300px;" class="form-control" disabled="true" placeholder="Estado" type="text" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"  id="txtFornecedorEstadoNome" name="txtFornecedorEstadoNome"><br><br>
                
                <input hidden="true" type="text" value="ServletListarFornecedor" name="pagina">
                <input hidden="true" type="text" value="${fornecedor.getFornecedorCodigo()}" id="codigoFornecedor" name="codigoFornecedor">
                <input hidden="true" type="text" value="${fornecedor.getContato().getContatoCodigo()}" id="codigoContato" name="codigoContato">
                <input hidden="true" type="text" value="${logradouro.getLogradouroCodigo()}" id="codigoLogradouro">
                
            </form>
                <button onclick="alterarFornecedor()" class="btn btn-primary" id="btnAlterar">Alterar</button>
                <input type="button" onclick="limparCampos()" class="btn btn-primary" id="btnLimpar" value="Limpar">
        </div>   
        
        <script>
            
            function validarCampo(frm)
                {
                    var cep = document.getElementById("txtFornecedorLogradouroCep").value;

                    if(cep === "")
                    {
                        alert("Informe o CEP");
                        return false;
                    }
                    else
                        frm.submit();
                }
            
            
            function limparCampos()
            {
                document.getElementById("codigoLogradouro").value = "";
                document.getElementById("codigoContato").value = "";
                document.getElementById("codigoFornecedor").value = "";
                document.getElementById("txtFornecedorNome").value = "";
                document.getElementById("txtFornecedorCnpj").value = "";
                document.getElementById("txtFornecedorTelefone").value = "";
                document.getElementById("txtFornecedorTelefoneAlternativo").value = "";
                document.getElementById("txtFornecedorCelular").value = "";
                document.getElementById("txtFornecedorEmail").value = "";
                document.getElementById("txtFornecedorNumeroLogradouro").value = "";
                document.getElementById("txtFornecedorLogradouroCep").value = "";
                document.getElementById("txtFornecedorLogradoutoNome").value = "";
                document.getElementById("txtFornecedorBairroNome").value = "";
                document.getElementById("txtFornecedorCidadeNome").value = "";
                document.getElementById("txtFornecedorEstadoNome").value = "";
            }
            
            function excluirFornecedor(paramCodigoFornecedor, paramCodigoContato)
            {
                $.get('ServletManipularFornecedor',{codigoFornecedor:paramCodigoFornecedor, codigoContato:paramCodigoContato, acao:'excluir'},function(){
                    window.location.reload(true);
                });
            }
            
            function preencherCampos(logradouroCodigo, contatoCodigo, fornecedorCodigo, fornecedorNome, fornecedorCnpj, contatoTelefone, contatoTelefoneAlternativo, contatoCelular, contatoEmail, logradouroNome, logradouroCep, numeroLogradouro, bairroNome, cidadeNome, estadoSigla)
            {
                document.getElementById("codigoLogradouro").setAttribute("value", logradouroCodigo);
                document.getElementById("codigoContato").setAttribute("value", contatoCodigo);
                document.getElementById("codigoFornecedor").setAttribute("value", fornecedorCodigo);
                document.getElementById("txtFornecedorNome").setAttribute("value", fornecedorNome);
                document.getElementById("txtFornecedorCnpj").setAttribute("value", fornecedorCnpj);
                document.getElementById("txtFornecedorTelefone").setAttribute("value", contatoTelefone);
                document.getElementById("txtFornecedorTelefoneAlternativo").setAttribute("value", contatoTelefoneAlternativo);
                document.getElementById("txtFornecedorCelular").setAttribute("value", contatoCelular);
                document.getElementById("txtFornecedorEmail").setAttribute("value", contatoEmail);
                document.getElementById("txtFornecedorNumeroLogradouro").setAttribute("value", numeroLogradouro);
                document.getElementById("txtFornecedorLogradouroCep").setAttribute("value", logradouroCep);
                document.getElementById("txtFornecedorLogradoutoNome").setAttribute("value", logradouroNome);
                document.getElementById("txtFornecedorBairroNome").setAttribute("value", bairroNome);
                document.getElementById("txtFornecedorCidadeNome").setAttribute("value", cidadeNome);
                document.getElementById("txtFornecedorEstadoNome").setAttribute("value", estadoSigla);
            }
            
            function alterarFornecedor()
            {
                var codigoContato = document.getElementById("codigoContato").value;
                var codigoLogradouro = document.getElementById("codigoLogradouro").value;
                var codigoFornecedor = document.getElementById("codigoFornecedor").value;
                var nomeFornecedor = document.getElementById("txtFornecedorNome").value;
                var cnpjFornecedor = document.getElementById("txtFornecedorCnpj").value;
                var telefoneFornecedor = document.getElementById("txtFornecedorTelefone").value;
                var telefoneAltFornecedor = document.getElementById("txtFornecedorTelefoneAlternativo").value;
                var celularFornecedor = document.getElementById("txtFornecedorCelular").value;
                var emailFornecedor = document.getElementById("txtFornecedorEmail").value;
                var numeroFornecedor = document.getElementById("txtFornecedorNumeroLogradouro").value;

                 $.get('ServletManipularFornecedor',{codigoContato:codigoContato, codigoLogradouro:codigoLogradouro,codigoFornecedor:codigoFornecedor,nomeFornecedor:nomeFornecedor,cnpjFornecedor:cnpjFornecedor,telefoneFornecedor:telefoneFornecedor,telefoneAltFornecedor:telefoneAltFornecedor,celularFornecedor:celularFornecedor,emailFornecedor:emailFornecedor,numeroFornecedor:numeroFornecedor, acao:'alterar'},function(){
                    window.location.reload(true);
                });
            }
            
        </script>
        
        </div>
    </body>
</html>
