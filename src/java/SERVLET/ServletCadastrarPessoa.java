/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ClienteDAO;
import DAO.FuncionarioDAO;
import DAO.PessoaDAO;
import POJO.Cargo;
import POJO.Cliente;
import POJO.Contato;
import POJO.Funcionario;
import POJO.Logradouro;
import POJO.Pessoa;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletCadastrarPessoa extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
        
        String nomePessoa = request.getParameter("nomePessoa");
        String sobrenomePessoa = request.getParameter("sobrenomePessoa");
        String cpfPessoa = request.getParameter("cpfPessoa");
        String pessoaDataNascimento = request.getParameter("pessoaDataNascimento");
        String telefonePessoa = request.getParameter("telefonePessoa");
        String telefoneAlternativoPessoa = request.getParameter("telefoneAlternativoPessoa");
        String celularPessoa = request.getParameter("celularPessoa");
        String emailPessoa = request.getParameter("emailPessoa");
        String pessoaNumeroLogradouro = request.getParameter("pessoaNumeroLogradouro");
        String funcionarioDataAdmissao = request.getParameter("funcionarioDataAdmissao");
        String pessoaLogradouro = request.getParameter("pessoaLogradouro");
        String funcionarioCargo = request.getParameter("funcionarioCargo");
        String funcionarioUnidade = request.getParameter("funcionarioUnidade");
        String tipoCadastro = request.getParameter("tipoCadastro");
        Date dataNascimento = null;
        Date dataAdmissao = null;
        
        boolean resultado = false;
        
        try
        {
            dataNascimento = formatoData.parse(pessoaDataNascimento);
            if(funcionarioDataAdmissao != null)
                dataAdmissao = formatoData.parse(funcionarioDataAdmissao);
        }
        catch(ParseException e)
        {
            e.printStackTrace();
        }
        
        Pessoa pessoa = new Pessoa();
        pessoa.setPessoaCpf(cpfPessoa);
        pessoa.setPessoaDataNascimento(dataNascimento);
        pessoa.setPessoaNome(nomePessoa);
        pessoa.setPessoaSobrenome(sobrenomePessoa);
        pessoa.setPessoaNumeroLogradouro(pessoaNumeroLogradouro);
        
        Contato contato = new Contato();
        contato.setContatoCelular(celularPessoa);
        contato.setContatoEmail(emailPessoa);
        contato.setContatoTelefoneAlternativo(telefoneAlternativoPessoa);
        contato.setContatoTelefone(telefonePessoa);
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(Integer.parseInt(pessoaLogradouro));

        Date dataCadastro = new Date();
        
        if(tipoCadastro.equals("funcionario"))
        {
            
            
            Cargo cargo = new Cargo();
            cargo.setCargoCodigo(Integer.parseInt(funcionarioCargo));

            Unidade unidade = new Unidade();
            unidade.setUnidadeCodigo(Integer.parseInt(funcionarioUnidade));

            Funcionario funcionario = new Funcionario();
            funcionario.setFuncionarioDataAdmissao(dataAdmissao);
            
            
            funcionario.setFuncionarioDataCadastro(dataCadastro);

            funcionario.setCargo(cargo);
            funcionario.setUnidade(unidade);
            pessoa.setContato(contato);
            pessoa.setLogradouro(logradouro);
            funcionario.setPessoa(pessoa);
            
            FuncionarioDAO funcionarioDao = new FuncionarioDAO();
            resultado = funcionarioDao.adicionarPessoa(funcionario);
        }
        else
        {
            Cliente cliente = new Cliente();
            cliente.setClienteDataCadastro(dataCadastro);
            
            pessoa.setContato(contato);
            pessoa.setLogradouro(logradouro);
            cliente.setPessoa(pessoa);
            
            ClienteDAO clienteDAO = new ClienteDAO();
            resultado = clienteDAO.adicionarPessoa(cliente);
        }
    }
}
