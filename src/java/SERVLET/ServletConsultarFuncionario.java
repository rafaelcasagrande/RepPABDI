/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.FuncionarioDAO;
import POJO.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletConsultarFuncionario extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Object> funcionarios = new LinkedList<Object>();
         
        FuncionarioDAO funcionarioDao = new FuncionarioDAO();
       
        String nomeFuncionario = request.getParameter("txtFuncionarioNome");
        
        funcionarios = funcionarioDao.consultarPessoa(nomeFuncionario);
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaFuncionario.jsp");
        
        request.setAttribute("funcionarios", funcionarios);
        
        rs.forward(request, response);
        
    }
}
