/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import POJO.Marca;
import DAO.MarcaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletListarMarcas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Marca> marcas = new LinkedList<Marca>();
        
        MarcaDAO marcaDao = new MarcaDAO();
        
        marcas = marcaDao.listarMarca();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaMarca.jsp");
        request.setAttribute("marcas", marcas);
        
        int c = 0;
        String n = "";
        
        for(Marca m : marcas){
            c = m.getMarcaCodigo();
            n = m.getMarcaNome();
        }
        
        rs.forward(request, response); 
    }
}
