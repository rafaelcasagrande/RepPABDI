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
        try
        {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(marca);
        session.getTransaction().commit();
        session.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
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
}
