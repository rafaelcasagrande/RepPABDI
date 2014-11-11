/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.MarcaDAO;
import POJO.Marca;
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
public class ServletManipularMarca extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = "";
        
        acao = request.getParameter("acao");
        
        MarcaDAO marcaDao = new MarcaDAO();
        
        String codigoMarcaS = "";
        
        codigoMarcaS = request.getParameter("codigoMarca");

        int codigoMarcaI = Integer.parseInt(codigoMarcaS);

        if(acao.equals("excluir"))
        {
            boolean resultadoE = false;
            
            resultadoE = marcaDao.exluirMarca(codigoMarcaI);

            RequestDispatcher rs = request.getRequestDispatcher("ServletListarMarca");

            rs.forward(request, response);
        }
        else if(acao.equals("alterar"))
        {
            int resultadoA = 0;
            
            Marca marca = new Marca();
            
            marca.setMarcaCodigo(codigoMarcaI);
            
            String nomeMarca = request.getParameter("nomeMarca");
            
            marca.setMarcaNome(nomeMarca);
   
            resultadoA = marcaDao.alterarMarca(marca);
            
            RequestDispatcher rs = request.getRequestDispatcher("ServletListarMarca");

            rs.forward(request, response);
        }      
    }
}
