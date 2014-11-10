/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import POJO.Marca;
import UTIL.HibernateUtil;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class MarcaDAO {

    public boolean adicionarMarca(Marca marca)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(marca);
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
    
    public List<Marca> listarMarca()
    {
        List<Marca> marcas = new LinkedList<Marca>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Marca");
            marcas = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return marcas;
    }
    
    public int alterarMarca(Marca marca)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("update Marca set marcaNome = :nome_marca where marcaCodigo = :codigo_marca");
            query.setParameter("codigo_marca", marca.getMarcaCodigo());
            query.setParameter("nome_marca", marca.getMarcaNome());
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
    
    
    public boolean exluirMarca(int codigoMarca)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Marca marca = new Marca();
        marca.setMarcaCodigo(codigoMarca);
        
        try
        {
            trns = session.beginTransaction();
            session.delete(marca);
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
    
    public List<Marca> consultarMarca(String nomeMarca)
    {
        List<Marca> marcas = new LinkedList<Marca>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Marca Where marcaNome like :nome_marca");
            query.setParameter("nome_marca", nomeMarca + "%");
            marcas = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return marcas;
    }
    
}
