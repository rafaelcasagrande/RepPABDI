/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.MarcaDAO;
import DAO.ProdutoDAO;
import POJO.Marca;
import POJO.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletConsultarProduto extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Produto> produtos = new LinkedList<Produto>();
        List<Marca> marcas = new LinkedList<Marca>();
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        MarcaDAO marcaDao = new MarcaDAO();
        
        String nomeProduto = "txtProdutoNome";
        
        nomeProduto = request.getParameter(nomeProduto);
        
        marcas = marcaDao.listarMarca();
        produtos = produtoDao.consultarProduto(nomeProduto);
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaProduto.jsp");
        request.setAttribute("produtos", produtos);
        request.setAttribute("marcas", marcas);

        rs.forward(request, response); 
        
    }
}
