/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ServletListarCliente extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ClienteDAO clienteDao = new ClienteDAO();
        
        List<Object> clientes = new LinkedList<Object>();
        
        clientes = clienteDao.listarPessoa();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaCliente.jsp");
 
        request.setAttribute("clientes", clientes);
        
        rs.forward(request, response);
        
    }
}
