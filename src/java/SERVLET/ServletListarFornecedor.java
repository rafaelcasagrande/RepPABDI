
package SERVLET;

import DAO.FornecedorDAO;
import POJO.Fornecedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletListarFornecedor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FornecedorDAO fornecedorDao = new FornecedorDAO();
        
        List<Fornecedor> fornecedores = new LinkedList<Fornecedor>();
        
        fornecedores = fornecedorDao.listarFornecedor();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaFornecedor.jsp");
        
        request.setAttribute("fornecedores", fornecedores);
        
        rs.forward(request, response);
        
    }
}
