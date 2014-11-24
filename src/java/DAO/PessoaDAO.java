
package DAO;

import POJO.Pessoa;
import java.util.List;


public interface PessoaDAO {
    
    public List<Object> consultarPessoa(String nome);
    
    public boolean adicionarPessoa(Object pessoa);
    
    public boolean removerPessoa(Object pessoa);
    
    public int alterarPessoa(Object pessoa);
    
    public List<Object> listarPessoa();

}
