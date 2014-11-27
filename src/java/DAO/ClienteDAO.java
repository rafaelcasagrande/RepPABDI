/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Cliente;
import POJO.Funcionario;
import POJO.Pessoa;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class ClienteDAO implements PessoaDAO{

    @Override
    public boolean adicionarPessoa(Object tipoCliente) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            Cliente cliente = (Cliente)tipoCliente;
            session.beginTransaction();
            session.save(cliente.getPessoa().getContato());
            session.save(cliente.getPessoa());
            session.save(cliente);
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

    @Override
    public int alterarPessoa(Object objeto) {
        

        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result2 = 0;
        int result3 = 0;
        
        Cliente cliente = (Cliente)objeto;
        
        try
        {
            trns = session.beginTransaction();

            Query queryContato = session.createQuery("update Contato set contatoTelefone = :telefone_contato, contatoTelefoneAlternativo = :telefoneAlternativo_contato, contatoCelular = :celular_contato, contatoEmail = :email_contato where contatoCodigo = :codigo_contato");
            queryContato.setParameter("telefone_contato", cliente.getPessoa().getContato().getContatoTelefone());
            queryContato.setParameter("telefoneAlternativo_contato", cliente.getPessoa().getContato().getContatoTelefoneAlternativo());
            queryContato.setParameter("celular_contato", cliente.getPessoa().getContato().getContatoCelular());
            queryContato.setParameter("email_contato", cliente.getPessoa().getContato().getContatoEmail());
            queryContato.setParameter("codigo_contato", cliente.getPessoa().getContato().getContatoCodigo());
            
            Query queryPessoa = session.createQuery("update Pessoa set pessoaCpf = :cpf_pessoa, pessoaNome = :nome_pessoa, pessoaSobrenome = :sobrenome_pessoa, pessoaDataNascimento = :dataNascimento_pessoa, pessoaNumeroLogradouro = :numeroLogradouro_pessoa, logradouro = :logradouro_pessoa where pessoaCodigo = :codigo_pessoa");
            queryPessoa.setParameter("cpf_pessoa", cliente.getPessoa().getPessoaCpf());
            queryPessoa.setParameter("nome_pessoa", cliente.getPessoa().getPessoaNome());
            queryPessoa.setParameter("sobrenome_pessoa", cliente.getPessoa().getPessoaSobrenome());
            queryPessoa.setParameter("dataNascimento_pessoa", cliente.getPessoa().getPessoaDataNascimento());
            queryPessoa.setParameter("numeroLogradouro_pessoa", cliente.getPessoa().getPessoaNumeroLogradouro());
            queryPessoa.setParameter("logradouro_pessoa", cliente.getPessoa().getLogradouro());
            queryPessoa.setParameter("codigo_pessoa", cliente.getPessoa().getPessoaCodigo());
       
            result2 = queryContato.executeUpdate();
            result3 = queryPessoa.executeUpdate();
            
            session.getTransaction().commit();

        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return result2 + result3;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return result2 + result3;

    }

    @Override
    public List<Object> consultarPessoa(String nome) {

        List<Pessoa> pessoas = new LinkedList<Pessoa>();
        List<Object> clientes = new LinkedList<Object>();
        
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Pessoa Where pessoaNome like :nome_pessoa");
            query.setParameter("nome_pessoa", nome + "%");
            pessoas = query.list();
            
            for(Pessoa pessoa:pessoas)
            {
                Query queryCliente = session.createQuery("from Cliente Where pessoa = :objeto_pessoa");
                queryCliente.setParameter("objeto_pessoa", pessoa);
                if(queryCliente.list().size() != 0)
                    clientes.add(queryCliente.list().get(0));
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        return clientes;
        
        
        
        
        
        
        
       /* 
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Object> clientes = new LinkedList<Object>();

        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Cliente cli inner join cli.pessoa pes where pes.pessoaNome like :nome_pessoa");
            query.setParameter("nome_pessoa", nome + "%");
            clientes = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        
        return clientes;
               */
    }

    @Override
    public List<Object> listarPessoa() {
    
        List<Object> pessoas = new LinkedList<Object>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Cliente");
            pessoas = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
       
        return pessoas;
        
    }

    @Override
    public boolean removerPessoa(Object objeto) {
        
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Cliente cliente = (Cliente)objeto;
        
        try
        {
            trns = session.beginTransaction();
            session.delete(cliente);  
            session.delete(cliente.getPessoa());
            session.delete(cliente.getPessoa().getContato());
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
