
package SERVLET;

import DAO.ProdutoDAO;
import POJO.Marca;
import POJO.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletCadastrarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String quantidadeProdutosS = "";
        String descricao = "";
        String nome = "";
        String precoS = "";
        String marcaS = "";

        Marca marca = new Marca();
        
        quantidadeProdutosS = request.getParameter("txtProdutoQuantidade");
        descricao = request.getParameter("txtProdutoDescricao");
        nome = request.getParameter("txtProdutoNome");
        precoS = request.getParameter("txtProdutoPreco");
        marcaS = request.getParameter("cbxMarcas");
        
        int produtoQuantidadeI = Integer.parseInt(quantidadeProdutosS);
        BigDecimal precoB = BigDecimal.valueOf(Double.parseDouble(precoS.replace(',', '.')));
        int marcaI = Integer.parseInt(marcaS);
        
        marca.setMarcaCodigo(marcaI);
        
        //marca = (Marca)request.getAttribute("minhaMarca");
        
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        Produto produto = new Produto();
        produto.setProdutoDescricao(descricao);
        produto.setProdutoNome(nome);
        produto.setProdutoPreco(precoB);
        produto.setProdutoQuantidade(produtoQuantidadeI);
        produto.setMarca(marca);
        
        
        boolean resultado = false;
        
        resultado = produtoDao.adicionarProduto(produto);
        
        
        
    }
}
