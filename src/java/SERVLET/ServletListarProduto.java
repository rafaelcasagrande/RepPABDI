/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.FornecedorDAO;
import DAO.MarcaDAO;
import DAO.ProdutoDAO;
import POJO.Fornecedor;
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

public class ServletListarProduto extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Produto> produtos = new LinkedList<Produto>();
        List<Marca> marcas = new LinkedList<Marca>();
        List<Fornecedor> fornecedores = new LinkedList<Fornecedor>();
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        MarcaDAO marcaDao = new MarcaDAO();
        FornecedorDAO fornecedorDao = new FornecedorDAO();
        
        fornecedores = fornecedorDao.listarFornecedor();
        marcas = marcaDao.listarMarca();
        produtos = produtoDao.listarProduto();

        RequestDispatcher rs = request.getRequestDispatcher("ConsultaProduto.jsp");
        request.setAttribute("produtos", produtos);
        request.setAttribute("marcas", marcas);
        request.setAttribute("fornecedores", fornecedores);
        
        rs.forward(request, response); 
    }
}
