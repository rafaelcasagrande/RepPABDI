/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.LoginDAO;
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
public class ServletAlterarCredenciais extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pagina = request.getParameter("pagina");
        
        boolean resultado = false;
        
        if(pagina.equals("AlteraLogin.jsp"))
        {
            String loginAtual = request.getParameter("loginAtual");
            String novoLogin = request.getParameter("novoLogin");

            LoginDAO loginDao = new LoginDAO();
            resultado = loginDao.alterarLogin(loginAtual, novoLogin); 
            
            request.setAttribute("mensagem", resultado);
            
            RequestDispatcher rs = request.getRequestDispatcher("AlteraLogin.jsp");
            
            rs.forward(request, response);
            
            
        }
        else
        {
            String login = request.getParameter("login");
            String senhaAtual = request.getParameter("senhaAtual");
            String novaSenha = request.getParameter("novaSenha");

            LoginDAO loginDao = new LoginDAO();
            resultado = loginDao.alterarSenha(login, senhaAtual, novaSenha); 
            
            request.setAttribute("mensagem", resultado);
            
            RequestDispatcher rs = request.getRequestDispatcher("AlteraSenha.jsp");
            
            rs.forward(request, response);
            
        }
        
    }
}
