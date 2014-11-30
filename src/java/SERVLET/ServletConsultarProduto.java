/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.MarcaDAO;
import DAO.ProdutoDAO;
import POJO.Cliente;
import POJO.Marca;
import POJO.Pessoa;
import POJO.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONObject;
import javax.json.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;


public class ServletConsultarProduto extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Produto> produtos = new LinkedList<Produto>();
        List<Marca> marcas = new LinkedList<Marca>();
        
        
        ProdutoDAO produtoDao = new ProdutoDAO();
        MarcaDAO marcaDao = new MarcaDAO();


        String nomeProduto = request.getParameter("txtProdutoNome");
        String pagina = request.getParameter("txtPagina");
        
        if(pagina.equals("CadastroVenda.jsp"))
        {
            Cliente cliente = new Cliente();
            List<Produto> carrinhoCompra = new LinkedList<Produto>();
            
            String nomeCliente = request.getParameter("txtNomeCliente");
            String sobrenomeCliente = request.getParameter("txtSobrenomeCliente");
            String codigoClienteS = request.getParameter("txtCodigoCliente");
            int codigoCliente = 0;

            if(!codigoClienteS.equals(""))
            {
                codigoCliente = Integer.parseInt(codigoClienteS);
                Pessoa pessoa = new Pessoa();
                
                cliente.setClienteCodigo(codigoCliente);
                pessoa.setPessoaNome(nomeCliente);
                pessoa.setPessoaSobrenome(sobrenomeCliente);
                cliente.setPessoa(pessoa); 
                request.setAttribute("cliente", cliente);
            }

            String codigosProdutos = request.getParameter("txtCodigosProdutos");
            String nomesProdutos = request.getParameter("txtNomesProdutos");
            String precosProdutos = request.getParameter("txtPrecosProdutos");
              
            if(!codigosProdutos.equals(""))
            {
                String[] listaCodigosProdutos = codigosProdutos.split("#");
                String[] listaNomesProdutos = nomesProdutos.split("#");
                String[] listaPrecosProdutos = precosProdutos.split("#");

                for(int i=1; i<listaCodigosProdutos.length;i++)
                {
                    Produto p = new Produto();
                    p.setProdutoCodigo(Integer.parseInt(listaCodigosProdutos[i]));
                    p.setProdutoNome(listaNomesProdutos[i]);
                    p.setProdutoPreco(BigDecimal.valueOf(Double.parseDouble(listaPrecosProdutos[i])));

                    carrinhoCompra.add(p);
                }
                request.setAttribute("carrinhoCompra", carrinhoCompra);
                request.setAttribute("txtCodigosProdutos", codigosProdutos);
                request.setAttribute("txtPrecosProdutos", precosProdutos);
                request.setAttribute("txtNomesProdutos", nomesProdutos);
            }
        }
        
        marcas = marcaDao.listarMarca();
        produtos = produtoDao.consultarProduto(nomeProduto);
        
        RequestDispatcher rs = request.getRequestDispatcher(pagina);
        
        request.setAttribute("produtos", produtos);
        request.setAttribute("marcas", marcas);

        rs.forward(request, response); 
        
    }
}
