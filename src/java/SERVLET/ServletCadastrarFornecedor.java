
package SERVLET;

import DAO.FornecedorDAO;
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


public class ServletCadastrarFornecedor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado = false;
        
        String nomeFornecedor = request.getParameter("nomeFornecedor");
        String cnpjFornecedor = request.getParameter("cnpjFornecedor");
        String telefoneFornecedor = request.getParameter("telefoneFornecedor");
        String telefoneAltFornecedor = request.getParameter("telefoneAltFornecedor");
        String celularFornecedor = request.getParameter("celularFornecedor");
        String emailFornecedor = request.getParameter("emailFornecedor");
        String numeroFornecedor = request.getParameter("numeroFornecedor");
        int codigoLogradouro = Integer.parseInt(request.getParameter("codigoLogradouro"));
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(codigoLogradouro);
        
        Contato contato = new Contato();
        contato.setContatoCelular(celularFornecedor);
        contato.setContatoEmail(emailFornecedor);
        contato.setContatoTelefone(telefoneFornecedor);
        contato.setContatoTelefoneAlternativo(telefoneAltFornecedor);
        
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setFornecedorCnpj(cnpjFornecedor);
        fornecedor.setFornecedorNome(nomeFornecedor);
        fornecedor.setFornecedorNumeroLogradouro(numeroFornecedor);
       
        fornecedor.setContato(contato);
        fornecedor.setLogradouro(logradouro);
        
        FornecedorDAO fornecedorDao = new FornecedorDAO();
        resultado = fornecedorDao.adicionarFornecedor(fornecedor);
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroFornecedor.jsp");
        
        rs.forward(request, response);
    }
}
