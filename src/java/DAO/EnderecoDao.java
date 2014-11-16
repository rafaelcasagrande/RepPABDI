/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Logradouro;
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
public class EnderecoDao {
    
    public Logradouro consultarEndereco(String cep)
    {
        Logradouro logradouro = new Logradouro();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Logradouro Where logradouroCep = :numero_cep");
            query.setParameter("numero_cep", cep);
            logradouro = (Logradouro)query.list().get(0);
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
        return logradouro;
    }
    
}
