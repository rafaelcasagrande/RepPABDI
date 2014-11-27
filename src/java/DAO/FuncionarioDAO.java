
package DAO;


import POJO.Cliente;
import POJO.Funcionario;
import POJO.Pessoa;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class FuncionarioDAO implements PessoaDAO{

    
    public int alterarPessoa(Object objeto) {
        
        
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        int result = 0;
        int result2 = 0;
        int result3 = 0;
        
        Funcionario funcionario = (Funcionario)objeto;
        
        try
        {
            trns = session.beginTransaction();
            
            Query queryFuncionario = session.createQuery("update Funcionario set funcionarioDataAdmissao = :dataAdmissao_funcionario, cargo = :cargo_funcionario, unidade = :unidade_funcionario where funcionarioCodigo = :codigo_funcionario");
            queryFuncionario.setParameter("dataAdmissao_funcionario", funcionario.getFuncionarioDataAdmissao());
            queryFuncionario.setParameter("cargo_funcionario", funcionario.getCargo());
            queryFuncionario.setParameter("unidade_funcionario", funcionario.getUnidade());
            queryFuncionario.setParameter("codigo_funcionario", funcionario.getFuncionarioCodigo());

            Query queryContato = session.createQuery("update Contato set contatoTelefone = :telefone_contato, contatoTelefoneAlternativo = :telefoneAlternativo_contato, contatoCelular = :celular_contato, contatoEmail = :email_contato where contatoCodigo = :codigo_contato");
            queryContato.setParameter("telefone_contato", funcionario.getPessoa().getContato().getContatoTelefone());
            queryContato.setParameter("telefoneAlternativo_contato", funcionario.getPessoa().getContato().getContatoTelefoneAlternativo());
            queryContato.setParameter("celular_contato", funcionario.getPessoa().getContato().getContatoCelular());
            queryContato.setParameter("email_contato", funcionario.getPessoa().getContato().getContatoEmail());
            queryContato.setParameter("codigo_contato", funcionario.getPessoa().getContato().getContatoCodigo());
            
            Query queryPessoa = session.createQuery("update Pessoa set pessoaCpf = :cpf_pessoa, pessoaNome = :nome_pessoa, pessoaSobrenome = :sobrenome_pessoa, pessoaDataNascimento = :dataNascimento_pessoa, pessoaNumeroLogradouro = :numeroLogradouro_pessoa, logradouro = :logradouro_pessoa where pessoaCodigo = :codigo_pessoa");
            queryPessoa.setParameter("cpf_pessoa", funcionario.getPessoa().getPessoaCpf());
            queryPessoa.setParameter("nome_pessoa", funcionario.getPessoa().getPessoaNome());
            queryPessoa.setParameter("sobrenome_pessoa", funcionario.getPessoa().getPessoaSobrenome());
            queryPessoa.setParameter("dataNascimento_pessoa", funcionario.getPessoa().getPessoaDataNascimento());
            queryPessoa.setParameter("numeroLogradouro_pessoa", funcionario.getPessoa().getPessoaNumeroLogradouro());
            queryPessoa.setParameter("logradouro_pessoa", funcionario.getPessoa().getLogradouro());
            queryPessoa.setParameter("codigo_pessoa", funcionario.getPessoa().getPessoaCodigo());
       
                    
            result = queryFuncionario.executeUpdate();
            result2 = queryContato.executeUpdate();
            result3 = queryPessoa.executeUpdate();
            
            session.getTransaction().commit();

        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return result + result2 + result3;
        }
        finally
        {
            session.flush();
            session.close();
        }
        return result + result2 + result3;
    }

    
    public List<Object> consultarPessoa(String nome) {
        
        List<Pessoa> pessoas = new LinkedList<Pessoa>();
        List<Object> funcionarios = new LinkedList<Object>();
        
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
                Query queryFuncionario = session.createQuery("from Funcionario Where pessoa = :objeto_pessoa");
                queryFuncionario.setParameter("objeto_pessoa", pessoa);
                if(queryFuncionario.list().size() != 0)
                    funcionarios.add(queryFuncionario.list().get(0));
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        return funcionarios;
    }

    public List<Object> listarPessoa() {
        
        List<Object> pessoas = new LinkedList<Object>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Funcionario");
            pessoas = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
       
        return pessoas;
    }

    /*
    public List<Funcionario> listarGerente() {
        
        List<Funcionario> pessoas = new LinkedList<Funcionario>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Funcionario func inner join func.cargo car where car.cargoNome = 'CEO'");
            pessoas = query.list();
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        
        for (Funcionario pessoa : pessoas) {
            pessoa.getPessoa().getPessoaNome();
        }
        
        return pessoas;
    }
    */
    public boolean removerPessoa(Object objeto) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Funcionario funcionario = (Funcionario)objeto;
        
        try
        {
            trns = session.beginTransaction();
            session.delete(funcionario);  
            session.delete(funcionario.getPessoa());
            session.delete(funcionario.getPessoa().getContato());
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
    
    
    public boolean adicionarPessoa(Object tipoPessoa)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            Funcionario funcionario = (Funcionario)tipoPessoa;
            session.beginTransaction();
            session.save(funcionario.getPessoa().getContato());
            session.save(funcionario.getPessoa());
            session.save(funcionario);
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
