
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

public class ServletManipularFornecedor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FornecedorDAO fornecedorDao = new FornecedorDAO();
        boolean resultado = false;
        
        int codigoFornecedor = Integer.parseInt(request.getParameter("codigoFornecedor"));
        int codigoContato =  Integer.parseInt(request.getParameter("codigoContato"));      
        
        String acao = request.getParameter("acao");
        
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setFornecedorCodigo(codigoFornecedor);

        Contato contato = new Contato();
        contato.setContatoCodigo(codigoContato);

        if(acao.equals("excluir"))
        {
            fornecedor.setContato(contato);
            
            resultado = fornecedorDao.exluirFornecedor(fornecedor);
        }
        else if(acao.equals("alterar"))
        {
            int codigoLogradouro = Integer.parseInt(request.getParameter("codigoLogradouro"));   
            String nomeFornecedor = request.getParameter("nomeFornecedor");
            String cnpjFornecedor = request.getParameter("cnpjFornecedor");
            String telefoneFornecedor = request.getParameter("telefoneFornecedor");
            String telefoneAltFornecedor = request.getParameter("telefoneAltFornecedor");
            String celularFornecedor = request.getParameter("celularFornecedor");
            String emailFornecedor = request.getParameter("emailFornecedor");
            String numeroFornecedor = request.getParameter("numeroFornecedor");
            
            Logradouro logradouro = new Logradouro();
            logradouro.setLogradouroCodigo(codigoLogradouro);
            
            fornecedor.setFornecedorNome(nomeFornecedor);
            fornecedor.setFornecedorCnpj(cnpjFornecedor);
            fornecedor.setFornecedorNumeroLogradouro(numeroFornecedor);
            
            contato.setContatoTelefone(telefoneFornecedor);
            contato.setContatoTelefoneAlternativo(telefoneAltFornecedor);
            contato.setContatoCelular(celularFornecedor);
            contato.setContatoEmail(emailFornecedor);
            
            fornecedor.setContato(contato);
            fornecedor.setLogradouro(logradouro);
            
            fornecedorDao.alterarFornecedor(fornecedor);
            
        }

        RequestDispatcher rs = request.getRequestDispatcher("ServletListarFornecedor");

        fornecedor = new Fornecedor();
        
        request.setAttribute("fornecedor", fornecedor);
        
        rs.forward(request, response);
    }
}
