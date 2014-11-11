/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CargoDAO;
import DAO.MarcaDAO;
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
public class ServletManipularCargo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = "";
        
        acao = request.getParameter("acao");
        
        CargoDAO cargoDao = new CargoDAO();
        
        String codigoCargoS = "";
        
        codigoCargoS = request.getParameter("codigoCargo");

        int codigoCargoI = Integer.parseInt(codigoCargoS);

        if(acao.equals("excluir"))
        {
            boolean resultadoE = false;
            
            resultadoE = cargoDao.exluirCargo(codigoCargoI);

            RequestDispatcher rs = request.getRequestDispatcher("ServletListarCargo");

            rs.forward(request, response);
        }
        
    }
}
