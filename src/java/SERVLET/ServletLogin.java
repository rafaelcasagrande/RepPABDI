package SERVLET;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.LoginDAO;
import POJO.Acesso;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletLogin extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("txtUsername");
        
        String senha = request.getParameter("txtPassword");
        
        Acesso acesso = new Acesso();
        
        acesso.setAcessoSenha(senha);
        
        acesso.setAcessoUsuario(usuario);
        
        boolean resultado = false;
        
        LoginDAO loginDao = new LoginDAO();
        
        resultado = loginDao.verificarAcesso(acesso);
        
        String mensagem = "";
  
        if(resultado)
            response.sendRedirect("CadastroCargo.jsp");
        else
        {
            mensagem = "Login e/ou Senha inválidos";
            request.setAttribute("mensagem", mensagem);
            RequestDispatcher rs = request.getRequestDispatcher("Login.jsp");
            rs.forward(request, response);
        }
    }
}
