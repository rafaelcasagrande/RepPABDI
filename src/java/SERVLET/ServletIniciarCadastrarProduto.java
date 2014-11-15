
package SERVLET;

import DAO.MarcaDAO;
import POJO.Marca;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletIniciarCadastrarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MarcaDAO marcaDao = new MarcaDAO();
        List<Marca> marcas = new LinkedList<Marca>();
        
        marcas = marcaDao.listarMarca();
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroProduto.jsp");
        
        request.setAttribute("marcas", marcas);
        
        rs.forward(request, response);
    }
}
