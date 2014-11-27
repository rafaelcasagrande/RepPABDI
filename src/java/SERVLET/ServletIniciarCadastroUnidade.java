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


public class ServletIniciarCadastroUnidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FuncionarioDAO funcinarioDao = new FuncionarioDAO();
        
        List<Object> funcionarios = new LinkedList<Object>();
        
        funcionarios = funcinarioDao.listarPessoa();
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroUnidade.jsp");
        
        request.setAttribute("funcionarios", funcionarios);
        
        rs.forward(request, response);
    }
}
