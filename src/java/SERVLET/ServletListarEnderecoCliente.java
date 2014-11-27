/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CargoDAO;
import DAO.ClienteDAO;
import DAO.EnderecoDao;
import DAO.FuncionarioDAO;
import DAO.UnidadeDAO;
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
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletListarEnderecoCliente extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
        
        String pessoaNome = request.getParameter("txtPessoaNome");
        String pessoaSobrenome = request.getParameter("txtPessoaSobrenome");
        String pessoaCpf = request.getParameter("txtPessoaCpf");
        String pessoaDataNascimento = request.getParameter("txtPessoaDataNascimento");
        String contatoTelefone = request.getParameter("txtContatoTelefone");
        String contatoTelefoneAlt = request.getParameter("txtContatoTelefoneAlternativo");
        String contatoCelular = request.getParameter("txtContatoCelular");
        String contatoEmail = request.getParameter("txtContatoEmail");
        String pessoaNumeroLogradouro = request.getParameter("txtPessoaNumeroLogradouro");
        String pessoaCep = request.getParameter("txtPessoaLogradouroCep");
        String pagina = request.getParameter("pagina");
        
        String codigoPessoa = request.getParameter("txtPessoaCodigo");
        String codigoCliente = request.getParameter("txtClienteCodigo");
        String codigoContato = request.getParameter("txtContatoCodigo");
        if(codigoPessoa == null)
        {
            codigoPessoa = "0";
            codigoCliente = "0";
            codigoContato = "0";
        }
        
        Date dataNascimento = null;
        Date dataAdmissao = null;
        try
        {
            dataNascimento = formatoData.parse(pessoaDataNascimento);
        }
        catch(ParseException e)
        {
            e.printStackTrace();
        }
        
        Pessoa pessoa = new Pessoa();
        pessoa.setPessoaCpf(pessoaCpf);
        
        
        if(!pessoaDataNascimento.equals(""))
            pessoa.setPessoaDataNascimento(dataNascimento);
        
        pessoa.setPessoaCodigo(Integer.parseInt(codigoPessoa));
        pessoa.setPessoaNome(pessoaNome);
        pessoa.setPessoaNumeroLogradouro(pessoaNumeroLogradouro);
        pessoa.setPessoaSobrenome(pessoaSobrenome);
        
        Cliente cliente = new Cliente();
        cliente.setClienteCodigo(Integer.parseInt(codigoCliente));
      
        Contato contato = new Contato();
        contato.setContatoCelular(contatoCelular);
        contato.setContatoEmail(contatoEmail);
        contato.setContatoTelefone(contatoTelefone);
        contato.setContatoTelefoneAlternativo(contatoTelefoneAlt);
        contato.setContatoCodigo(Integer.parseInt(codigoContato));
        
        EnderecoDao enderecoDao = new EnderecoDao();
        Logradouro logradouro = new Logradouro();
        
        logradouro = enderecoDao.consultarEndereco(pessoaCep);

        pessoa.setContato(contato);
        cliente.setPessoa(pessoa);
        pessoa.setLogradouro(logradouro);

        RequestDispatcher rd = request.getRequestDispatcher(pagina);

        ClienteDAO clienteDao = new ClienteDAO();
        
        List<Object> clientes = new LinkedList<Object>();
        
        clientes = clienteDao.listarPessoa();
        
        request.setAttribute("clientes", clientes);
        request.setAttribute("cliente", cliente);
        request.setAttribute("pessoaDataNascimento", pessoaDataNascimento);
        
        rd.forward(request, response);   
        
        
    }
}
