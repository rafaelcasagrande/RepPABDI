/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Acesso;
import POJO.Funcionario;
import UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class LoginDAO {
    
    
    public Funcionario verificarAcesso(Acesso acesso)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Acesso verificaAcesso = new Acesso();
        Funcionario funcionario = new Funcionario();
        
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Acesso Where acessoUsuario = :acesso_usuario and acessoSenha = :acesso_senha");
            query.setParameter("acesso_usuario", acesso.getAcessoUsuario());
            query.setParameter("acesso_senha", acesso.getAcessoSenha());
            verificaAcesso = (Acesso)query.list().get(0);
            
            if(verificaAcesso == null)
            {
                return null;
            }
            else
            {
                Query queryFuncionario = session.createQuery("from Funcionario Where acesso = :acesso_funcionario");
                queryFuncionario.setParameter("acesso_funcionario", verificaAcesso);
                funcionario = (Funcionario) queryFuncionario.list().get(0);
            }
            
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
        
        if(funcionario == null)
            return null;
        return funcionario;
       
    }
    
    public boolean alterarLogin(String loginAtual, String novoLogin)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("update Acesso set acessoUsuario = :acesso_novoLogin where acessoUsuario = :acesso_loginAtual");
            query.setParameter("acesso_novoLogin", novoLogin);
            query.setParameter("acesso_loginAtual", loginAtual);
            result = query.executeUpdate();
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
        
        if(result == 0)
            return false;
        return true;
    }
    
    public boolean alterarSenha(String login, String senhaAtual, String novaSenha)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("update Acesso set acessoSenha = :acesso_novaSenha where acessoUsuario = :acesso_login and acessoSenha = :acesso_senha");
            query.setParameter("acesso_novaSenha", novaSenha);
            query.setParameter("acesso_login", login);
            query.setParameter("acesso_senha", senhaAtual);
            result = query.executeUpdate();
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
        
        if(result == 0)
            return false;
        return true;
    }
    
}
