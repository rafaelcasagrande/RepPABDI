
package DAO;

import POJO.Marca;
import POJO.Produto;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProdutoDAO {
    
    public boolean adicionarProduto(Produto produto)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(produto);
            session.getTransaction().commit();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return true;
    }
    
    public List<Produto> listarProduto()
    {
        List<Produto> produtos = new LinkedList<Produto>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Produto");
            produtos = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            //session.flush();
            //session.close();
        }
        return produtos;
    }
    
     public List<Produto> consultarProduto(String nomeProduto)
    {
        List<Produto> produtos = new LinkedList<Produto>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Produto Where produtoNome like :nome_produto");
            query.setParameter("nome_produto", nomeProduto + "%");
            produtos = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            //session.flush();
            //session.close();
        }
        return produtos;
    }
     
     public boolean exluirProduto(int codigoProduto)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Produto produto = new Produto();
        produto.setProdutoCodigo(codigoProduto);
        
        try
        {
            trns = session.beginTransaction();
            session.delete(produto);
            session.getTransaction().commit();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return true;
    }
    
     public int alterarProduto(Produto produto)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("update Produto set produtoPreco = :preco_produto, produtoNome = :nome_produto, produtoDescricao = :descricao_produto, produtoQuantidade = :quantidade_produto, marca = :marca_produto, fornecedor = :fornecedor_produto where produtoCodigo = :codigo_produto");
            query.setParameter("preco_produto", produto.getProdutoPreco());
            query.setParameter("nome_produto", produto.getProdutoNome());
            query.setParameter("descricao_produto", produto.getProdutoDescricao());
            query.setParameter("quantidade_produto", produto.getProdutoQuantidade());
            query.setParameter("nome_produto", produto.getProdutoNome());
            query.setParameter("marca_produto", produto.getMarca());
            query.setParameter("codigo_produto", produto.getProdutoCodigo());
            query.setParameter("fornecedor_produto", produto.getFornecedor());
            result = query.executeUpdate();
            session.getTransaction().commit();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return result;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return result;
    }
     
}
