
package SERVLET;

import DAO.FornecedorDAO;
import DAO.MarcaDAO;
import POJO.Fornecedor;
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
        FornecedorDAO fornecedorDao = new FornecedorDAO();
        List<Marca> marcas = new LinkedList<Marca>();
        List<Fornecedor> fornecedores = new LinkedList<Fornecedor>();
        
        marcas = marcaDao.listarMarca();
        fornecedores = fornecedorDao.listarFornecedor();
        
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroProduto.jsp");
        
        request.setAttribute("fornecedores", fornecedores);
        request.setAttribute("marcas", marcas);
        
        rs.forward(request, response);
    }
}
