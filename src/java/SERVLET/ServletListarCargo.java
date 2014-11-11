
package SERVLET;

import DAO.CargoDAO;
import POJO.Cargo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletListarCargo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         List<Cargo> cargos = new LinkedList<Cargo>();
        
        CargoDAO cargoDao = new CargoDAO();
        
        cargos = cargoDao.listarCargo();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaCargo.jsp");
        request.setAttribute("cargos", cargos);

        rs.forward(request, response); 

    }
}
