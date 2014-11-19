/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.UnidadeDAO;
import POJO.Unidade;
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
public class ServletListarUnidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UnidadeDAO unidadeDao = new UnidadeDAO();

        List<Unidade> unidades = new LinkedList<Unidade>();
        
        unidades = unidadeDao.listarUnidade();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaUnidade.jsp");
        
        request.setAttribute("unidades", unidades);
        
        rs.forward(request, response);
        
    }
}
