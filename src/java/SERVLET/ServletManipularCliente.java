/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ClienteDAO;
import DAO.FornecedorDAO;
import DAO.FuncionarioDAO;
import POJO.Cargo;
import POJO.Cliente;
import POJO.Contato;
import POJO.Fornecedor;
import POJO.Funcionario;
import POJO.Logradouro;
import POJO.Pessoa;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletManipularCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigoCliente = request.getParameter("codigoCliente");
        String codigoPessoa = request.getParameter("codigoPessoa");
        String codigoContato = request.getParameter("codigoContato");
        String acao = request.getParameter("acao");
        boolean resultado = false;

        Cliente cliente = new Cliente();
        cliente.setClienteCodigo(Integer.parseInt(codigoCliente));

        Pessoa pessoa = new Pessoa();
        pessoa.setPessoaCodigo(Integer.parseInt(codigoPessoa));

        Contato contato = new Contato();
        contato.setContatoCodigo(Integer.parseInt(codigoContato));
        
        ClienteDAO clienteDao = new ClienteDAO();
        
        if(acao.equals("excluir"))
        {
            pessoa.setContato(contato);
            cliente.setPessoa(pessoa);

            resultado = clienteDao.removerPessoa(cliente);
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
            
            String numeroLogradouro = request.getParameter("numeroLogradouro");
            String codigoLogradouro = request.getParameter("codigoLogradouro");
            
            Date dataNacimento = null;

            pessoa.setPessoaNome(nomePessoa);
            pessoa.setPessoaSobrenome(sobrenomePessoa);
            pessoa.setPessoaCpf(cpfPessoa);
            pessoa.setPessoaDataNascimento(null);
            
            try{
                
                dataNacimento = formatoData.parse(dataNascimentoS);
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
            
            pessoa.setPessoaNumeroLogradouro(numeroLogradouro);
            
            Logradouro logradouro = new Logradouro();
            logradouro.setLogradouroCodigo(Integer.parseInt(codigoLogradouro));

            pessoa.setContato(contato);
            pessoa.setLogradouro(logradouro);

            cliente.setPessoa(pessoa);

            clienteDao.alterarPessoa(cliente);
        }
    }
}
