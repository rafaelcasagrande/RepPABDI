/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CargoDAO;
import DAO.MarcaDAO;
import POJO.Cargo;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
        }
        else if(acao.equals("alterar"))
        {
            int resultado = 0;
            
            String nomeCargo = "";
            
            BigDecimal salarioCargo = null;
            
            Cargo cargo = new Cargo();
            
            nomeCargo = request.getParameter("nomeCargo");
            
            salarioCargo = BigDecimal.valueOf(Double.parseDouble(request.getParameter("salarioCargo").replace(',', '.')));
            
            cargo.setCargoCodigo(codigoCargoI);
            cargo.setCargoNome(nomeCargo);
            cargo.setCargoSalario(salarioCargo);
            
            resultado = cargoDao.alterarCargo(cargo);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("ServletListarCargo");
            
        rd.forward(request, response);
    }
}
