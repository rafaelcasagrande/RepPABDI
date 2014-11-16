/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Fornecedor;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class FornecedorDAO {
    
     public boolean adicionarFornecedor(Fornecedor fornecedor)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(fornecedor.getContato());
            session.save(fornecedor);
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
     
     public List<Fornecedor> listarFornecedor()
    {
        List<Fornecedor> fornecedores = new LinkedList<Fornecedor>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Fornecedor");
            fornecedores = query.list();
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
        return fornecedores;
    }
     
     public List<Fornecedor> consultarFornecedor(String nomeFornecedor)
    {
        List<Fornecedor> fornecedores = new LinkedList<Fornecedor>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Fornecedor Where fornecedorNome like :nome_fornecedor");
            query.setParameter("nome_fornecedor", nomeFornecedor + "%");
            fornecedores = query.list();
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
        return fornecedores;
    }
     
     public boolean exluirFornecedor(Fornecedor fornecedor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
       
        
        try
        {
            trns = session.beginTransaction();
            session.delete(fornecedor);
            session.delete(fornecedor.getContato());
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
     
     
     public int alterarFornecedor(Fornecedor fornecedor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        int result2 = 0;
        try
        {
            trns = session.beginTransaction();

            Query queryFornecedor = session.createQuery("update Fornecedor set fornecedorNome = :nome_fornecedor, fornecedorCnpj = :cnpj_fornecedor, fornecedorNumeroLogradouro = :numeroLogradouro_fornecedor, logradouro = :logradouro_fornecedor where fornecedorCodigo = :codigo_fornecedor");
            queryFornecedor.setParameter("nome_fornecedor", fornecedor.getFornecedorNome());
            queryFornecedor.setParameter("cnpj_fornecedor", fornecedor.getFornecedorCnpj());
            queryFornecedor.setParameter("numeroLogradouro_fornecedor", fornecedor.getFornecedorNumeroLogradouro());
            queryFornecedor.setParameter("codigo_fornecedor", fornecedor.getFornecedorCodigo());
            queryFornecedor.setParameter("logradouro_fornecedor", fornecedor.getLogradouro());
            
            Query queryContato = session.createQuery("update Contato set contatoTelefone = :telefone_contato, contatoTelefoneAlternativo = :telefoneAlt_contato, contatoCelular = :celular_contato, contatoEmail = :email_contato where contatoCodigo = :codigo_contato");
            queryContato.setParameter("telefone_contato", fornecedor.getContato().getContatoTelefone());
            queryContato.setParameter("telefoneAlt_contato", fornecedor.getContato().getContatoTelefoneAlternativo());
            queryContato.setParameter("celular_contato", fornecedor.getContato().getContatoCelular());
            queryContato.setParameter("email_contato", fornecedor.getContato().getContatoEmail());
            queryContato.setParameter("codigo_contato", fornecedor.getContato().getContatoCodigo());
            
            result2 = queryContato.executeUpdate();
            result = queryFornecedor.executeUpdate();
            
            session.getTransaction().commit();

        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return result + result2;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return result + result2;
    }
     
}
