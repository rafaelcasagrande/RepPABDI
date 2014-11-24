
package SERVLET;

import DAO.CargoDAO;
import DAO.UnidadeDAO;
import POJO.Cargo;
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

public class ServletIniciarCadastroFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Cargo> cargos = new LinkedList<Cargo>();
        List<Unidade> unidades = new LinkedList<Unidade>();
        
        CargoDAO cargoDao = new CargoDAO();
        UnidadeDAO unidadeDao = new UnidadeDAO();
        
        cargos = cargoDao.listarCargo();
        unidades = unidadeDao.listarUnidade();
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroFuncionario.jsp");
        request.setAttribute("cargos", cargos);
        request.setAttribute("unidades", unidades);
        
        rs.forward(request, response); 
          
    }
}
