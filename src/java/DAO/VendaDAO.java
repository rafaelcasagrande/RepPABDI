/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Produto;
import POJO.ProdutoVenda;
import POJO.Venda;
import UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author rafael
 */
public class VendaDAO {
    
    public boolean adicionarVenda(Venda venda, List<ProdutoVenda> produtoVendas)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(venda);
            
           for(ProdutoVenda produtoVenda:produtoVendas)
           {
               session.save(produtoVenda);
           }
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
    
}
