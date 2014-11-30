/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ClienteDAO;
import POJO.Cliente;
import POJO.Pessoa;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletVendaBuscaCliente extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String codigoClienteS = request.getParameter("txtClienteCodigo");
        
        int codigoCliente = Integer.parseInt(codigoClienteS);
        
        Cliente cliente = new Cliente();
        
        ClienteDAO clienteDao = new ClienteDAO();

        cliente = clienteDao.consultarPessoa(codigoCliente);
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroVenda.jsp");
        
        request.setAttribute("cliente", cliente);
        
        rs.forward(request, response);
        
        
    }
}
