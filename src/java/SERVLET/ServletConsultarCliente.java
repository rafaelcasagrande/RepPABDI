
package SERVLET;

import DAO.ClienteDAO;
import POJO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletConsultarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Object> clientes = new LinkedList<Object>();
         
        ClienteDAO clienteDao = new ClienteDAO();
       
        String nomeCliente = request.getParameter("txtClienteNome");
        
        clientes = clienteDao.consultarPessoa(nomeCliente);
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaCliente.jsp");
        
        request.setAttribute("clientes", clientes);
        
        rs.forward(request, response);
        
    }
}
