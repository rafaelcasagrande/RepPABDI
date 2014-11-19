/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Unidade;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class UnidadeDAO {
    
    public boolean adicionarUnidade(Unidade unidade)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(unidade.getContato());
            session.save(unidade);
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
    
    public List<Unidade> listarUnidade()
    {
        List<Unidade> unidades = new LinkedList<Unidade>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Unidade");
            unidades = query.list();
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
        return unidades;
    }
    
    public List<Unidade> consultarUnidade(String nomeUnidade)
    {
        List<Unidade> unidades = new LinkedList<Unidade>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Unidade Where unidadeNome like :nome_unidade");
            query.setParameter("nome_unidade", nomeUnidade + "%");
            unidades = query.list();
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
        return unidades;
    }
    
    public boolean exluirUnidade(Unidade unidade)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
       
        
        try
        {
            trns = session.beginTransaction();
            session.delete(unidade);
            session.delete(unidade.getContato());
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
    
    public int alterarUnidade(Unidade unidade)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        int result2 = 0;
        try
        {
            trns = session.beginTransaction();

            Query queryUnidade = session.createQuery("update Unidade set unidadeNome = :nome_unidade, unidadeNumeroLogradouro = :numeroLogradouro_unidade, logradouro = :logradouro_unidade where unidadeCodigo = :codigo_unidade");
            queryUnidade.setParameter("nome_unidade", unidade.getUnidadeNome());
            queryUnidade.setParameter("numeroLogradouro_unidade", unidade.getUnidadeNumeroLogradouro());
            queryUnidade.setParameter("codigo_unidade", unidade.getUnidadeCodigo());
            queryUnidade.setParameter("logradouro_unidade", unidade.getLogradouro());
            
            Query queryContato = session.createQuery("update Contato set contatoTelefone = :telefone_contato, contatoTelefoneAlternativo = :telefoneAlt_contato, contatoCelular = :celular_contato, contatoEmail = :email_contato where contatoCodigo = :codigo_contato");
            queryContato.setParameter("telefone_contato", unidade.getContato().getContatoTelefone());
            queryContato.setParameter("telefoneAlt_contato", unidade.getContato().getContatoTelefoneAlternativo());
            queryContato.setParameter("celular_contato", unidade.getContato().getContatoCelular());
            queryContato.setParameter("email_contato", unidade.getContato().getContatoEmail());
            queryContato.setParameter("codigo_contato", unidade.getContato().getContatoCodigo());
            
            result2 = queryContato.executeUpdate();
            result = queryUnidade.executeUpdate();
            
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
