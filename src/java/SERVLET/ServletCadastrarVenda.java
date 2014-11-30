
package SERVLET;

import DAO.VendaDAO;
import POJO.Acesso;
import POJO.Cliente;
import POJO.Funcionario;
import POJO.Produto;
import POJO.ProdutoVenda;
import POJO.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ServletCadastrarVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               
        List<Produto> produtos = new LinkedList<Produto>();
                       
        String codigosProdutos = request.getParameter("codigosProdutos");
        String quantidadeProdutos = request.getParameter("quantidadeProdutos");
        String formaPagamento = request.getParameter("formaPagamento");
        String valorTotal = request.getParameter("valorTotal");
        String codigoClienteS = request.getParameter("codigoCliente");
        int codigoCliente = Integer.parseInt(codigoClienteS);
        
        boolean resultado = false;
        
        if(!codigosProdutos.equals(""))
        {
            String[] listaCodigosProdutos = codigosProdutos.split("#");
            String[] listaQuantidadeProdutos = quantidadeProdutos.split("#");

            for(int i=1; i<listaCodigosProdutos.length;i++)
            {
                Produto produto = new Produto();
                produto.setProdutoCodigo(Integer.parseInt(listaCodigosProdutos[i]));
                produto.setProdutoQuantidade(Integer.parseInt(listaQuantidadeProdutos[i]));
                
                produtos.add(produto);
            } 
        }
        Cliente cliente = new Cliente();
        cliente.setClienteCodigo(codigoCliente);
        
        
        Venda venda = new Venda();
        venda.setVendaValorTotal(BigDecimal.valueOf(Double.parseDouble(valorTotal)));
        venda.setVendaData(new Date());
        venda.setVendaFormaPagamento(formaPagamento);
        venda.setCliente(cliente);
        
        List<ProdutoVenda> produtosVendas = new LinkedList<ProdutoVenda>();
        
        for(Produto produto:produtos)
        {
            ProdutoVenda produtoVenda = new ProdutoVenda();
            produtoVenda.setProduto(produto);
            produtoVenda.setProdutovendaQuantidade(produto.getProdutoQuantidade());
            produtoVenda.setVenda(venda);
            produtosVendas.add(produtoVenda);
        }
        
        HttpSession session = request.getSession();
        Funcionario funcionario = new Funcionario();
        funcionario.setFuncionarioCodigo(Integer.parseInt(session.getAttribute("codigoFuncionario").toString()));
        
        venda.setFuncionario(funcionario);
        
        VendaDAO vendaDao = new VendaDAO();
        resultado = vendaDao.adicionarVenda(venda, produtosVendas);
    }
}
