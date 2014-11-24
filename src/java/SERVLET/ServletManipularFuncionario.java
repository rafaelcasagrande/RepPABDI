/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.FuncionarioDAO;
import POJO.Cargo;
import POJO.Contato;
import POJO.Funcionario;
import POJO.Logradouro;
import POJO.Pessoa;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletManipularFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String codigoFuncionario = request.getParameter("codigoFuncionario");
        String codigoPessoa = request.getParameter("codigoPessoa");
        String codigoContato = request.getParameter("codigoContato");
        String acao = request.getParameter("acao");
        boolean resultado = false;

        Funcionario funcionario = new Funcionario();
        funcionario.setFuncionarioCodigo(Integer.parseInt(codigoFuncionario));

        Pessoa pessoa = new Pessoa();
        pessoa.setPessoaCodigo(Integer.parseInt(codigoPessoa));

        Contato contato = new Contato();
        contato.setContatoCodigo(Integer.parseInt(codigoContato));
        
        FuncionarioDAO funcionarioDao = new FuncionarioDAO();
        
        if(acao.equals("excluir"))
        {
            pessoa.setContato(contato);
            funcionario.setPessoa(pessoa);

            resultado = funcionarioDao.removerPessoa(funcionario);
        }
        else
        {
            SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");
            
            String nomePessoa = request.getParameter("nomePessoa");
            String sobrenomePessoa = request.getParameter("sobrenomePessoa");
            String cpfPessoa = request.getParameter("cpfPessoa");
            String dataNascimentoS = request.getParameter("dataNascimentoPessoa");
            String telefonePessoa = request.getParameter("telefonePessoa");
            String telefoneAltPessoa = request.getParameter("telefoneAltPessoa");
            String celularPessoa = request.getParameter("celularPessoa");
            String emailPessoa = request.getParameter("emailPessoa");
            String dataAdmissaoS = request.getParameter("dataAdmissaoPessoa");
            String numeroLogradouro = request.getParameter("numeroLogradouro");
            String codigoLogradouro = request.getParameter("codigoLogradouro");
            String codigoCargo = request.getParameter("codigoCargo");
            String codigoUnidade = request.getParameter("codigoUnidade");
            Date dataNacimento = null;
            Date dataAdmissao = null;
            
            
            pessoa.setPessoaNome(nomePessoa);
            pessoa.setPessoaSobrenome(sobrenomePessoa);
            pessoa.setPessoaCpf(cpfPessoa);
            pessoa.setPessoaDataNascimento(null);
            
            try{
                
                dataNacimento = formatoData.parse(dataNascimentoS);
                dataAdmissao = formatoData.parse(dataAdmissaoS);
            }
            catch(ParseException e)
            {
                e.printStackTrace();
            }
            
            pessoa.setPessoaDataNascimento(dataNacimento);
            
            contato.setContatoTelefone(telefonePessoa);
            contato.setContatoEmail(emailPessoa);
            contato.setContatoTelefoneAlternativo(telefoneAltPessoa);
            contato.setContatoCelular(celularPessoa);
            
            funcionario.setFuncionarioDataAdmissao(dataAdmissao);
            
            pessoa.setPessoaNumeroLogradouro(numeroLogradouro);
            
            Logradouro logradouro = new Logradouro();
            logradouro.setLogradouroCodigo(Integer.parseInt(codigoLogradouro));
            
            Cargo cargo = new Cargo();
            cargo.setCargoCodigo(Integer.parseInt(codigoCargo));
            
            Unidade unidade = new Unidade();
            unidade.setUnidadeCodigo(Integer.parseInt(codigoUnidade));
            
            pessoa.setContato(contato);
            pessoa.setLogradouro(logradouro);
            funcionario.setCargo(cargo);
            funcionario.setPessoa(pessoa);
            funcionario.setUnidade(unidade);
        
            funcionarioDao.alterarPessoa(funcionario);
            
        }
    }
}
