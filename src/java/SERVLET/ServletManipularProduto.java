
package SERVLET;

import DAO.ProdutoDAO;
import POJO.Fornecedor;
import POJO.Marca;
import POJO.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletManipularProduto extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = "";
        
        acao = request.getParameter("acao");
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        
        int codigoProduto = 0;
        codigoProduto = Integer.parseInt(request.getParameter("codigoProduto"));
 
        if (acao.equals("excluir"))
        {
            boolean resultado = false;
            
            resultado = produtoDao.exluirProduto(codigoProduto);
            
            RequestDispatcher rs = request.getRequestDispatcher("ServletListarProduto");
            
            rs.forward(request, response);
        }
        else if(acao.equals("alterar"))
        {
            int resultado = 0;
            int quantidadeProduto = 0;
            String descricaoProduto = "";
            String nomeProduto = "";
            BigDecimal precoProduto = null;
            int codigoMarca = 0;
            int codigoFornecedor = 0;
            
            quantidadeProduto = Integer.parseInt(request.getParameter("quantidadeProduto"));
            descricaoProduto = request.getParameter("descricaoProduto");
            nomeProduto = request.getParameter("nomeProduto");
            precoProduto = BigDecimal.valueOf(Double.parseDouble(request.getParameter("precoProduto").replace(',', '.')));
            codigoMarca = Integer.parseInt(request.getParameter("codigoMarca"));
            codigoFornecedor = Integer.parseInt(request.getParameter("codigoFornecedor"));
            
            Fornecedor fornecedor = new Fornecedor();
            Produto produto = new Produto();
            Marca marca = new Marca();
            
            fornecedor.setFornecedorCodigo(codigoFornecedor);
            marca.setMarcaCodigo(codigoMarca);
            
            produto.setFornecedor(fornecedor);
            produto.setMarca(marca);
            produto.setProdutoCodigo(codigoProduto);
            produto.setProdutoDescricao(descricaoProduto);
            produto.setProdutoNome(nomeProduto);
            produto.setProdutoPreco(precoProduto);
            produto.setProdutoQuantidade(quantidadeProduto);
            
            resultado = produtoDao.alterarProduto(produto);
            
            RequestDispatcher rs = request.getRequestDispatcher("ServletListarProduto");
            rs.forward(request, response);
            
        }
    }
}
