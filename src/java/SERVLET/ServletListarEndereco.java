/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.EnderecoDao;
import POJO.Contato;
import POJO.Fornecedor;
import POJO.Logradouro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletListarEndereco extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        EnderecoDao enderecoDao = new EnderecoDao();

        String nomeFornecedor = request.getParameter("txtFornecedorNome");
        String cnpjFornecedor = request.getParameter("txtFornecedorCnpj");
        String telefoneFornecedor = request.getParameter("txtFornecedorTelefone");
        String telefoneAltFornecedor = request.getParameter("txtFornecedorTelefoneAlternativo");
        String celularFornecedor = request.getParameter("txtFornecedorCelular");
        String emailFornecedor = request.getParameter("txtFornecedorEmail");
        String numeroFornecedor = request.getParameter("txtFornecedorNumeroLogradouro");
        String codigoFornecedor = request.getParameter("codigoFornecedor");
        String codigoContato = request.getParameter("codigoContato");

        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setFornecedorCnpj(cnpjFornecedor);
        fornecedor.setFornecedorNome(nomeFornecedor);
        fornecedor.setFornecedorNumeroLogradouro(numeroFornecedor);
        fornecedor.setFornecedorCodigo(Integer.parseInt(codigoFornecedor));
        
       
        Contato contato = new Contato();
        contato.setContatoCelular(celularFornecedor);
        contato.setContatoEmail(emailFornecedor);
        contato.setContatoTelefone(telefoneFornecedor);
        contato.setContatoTelefoneAlternativo(telefoneAltFornecedor);
        contato.setContatoCodigo(Integer.parseInt(codigoContato));
        
        fornecedor.setContato(contato);
        
        String cep = "";
        
        String pagina = "";
        
        pagina = request.getParameter("pagina");
        cep = request.getParameter("txtFornecedorLogradouroCep");
        
        Logradouro logradouro = new Logradouro();
        
        logradouro = enderecoDao.consultarEndereco(cep);
        
        
        
        RequestDispatcher rd = request.getRequestDispatcher(pagina);

        request.setAttribute("fornecedor", fornecedor);
        request.setAttribute("logradouro", logradouro);
        
        rd.forward(request, response);

    }
}
