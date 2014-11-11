
package DAO;

import POJO.Cargo;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class CargoDAO {
    
    public boolean adicionarCargo(Cargo cargo)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            session.save(cargo);
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
    
    public List<Cargo> listarCargo()
    {
        List<Cargo> marcas = new LinkedList<Cargo>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Cargo");
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
    
    public List<Cargo> consultarMarca(String nomeCargo)
    {
        List<Cargo> cargos = new LinkedList<Cargo>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Cargo Where cargoNome like :nome_cargo");
            query.setParameter("nome_cargo", nomeCargo + "%");
            cargos = query.list();
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
        return cargos;
    }
    
    public boolean exluirCargo(int codigoCargo)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Cargo cargo = new Cargo();
        cargo.setCargoCodigo(codigoCargo);
        
        try
        {
            trns = session.beginTransaction();
            session.delete(cargo);
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
