
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

public class ServletConsultarUnidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Unidade> unidades = new LinkedList<Unidade>();
         
        UnidadeDAO unidadeDao = new UnidadeDAO();
       
        String nomeUnidade = request.getParameter("txtUnidadeNome");
        
        unidades = unidadeDao.consultarUnidade(nomeUnidade);
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaUnidade.jsp");
        
        request.setAttribute("unidades", unidades);
        
        rs.forward(request, response);
        
    }
}
