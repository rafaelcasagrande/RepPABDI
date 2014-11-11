/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CargoDAO;
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
public class ServletCadastrarCargo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BigDecimal salario = null;
        String cargoNome = "";
        boolean resultado = false;
        CargoDAO cargoDao = new CargoDAO();
        Cargo cargo = new Cargo();
        
        salario =  BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtCargoSalario").replace(',', '.')));
        
        cargoNome = request.getParameter("txtCargoNome");

        cargo.setCargoNome(cargoNome);
        
        cargo.setCargoSalario(salario);

        resultado = cargoDao.adicionarCargo(cargo);
        
        RequestDispatcher rd = request.getRequestDispatcher("CadastroCargo.jsp");
        
        rd.forward(request, response);
        
    } 
}
