package POJO;
// Generated 21/11/2014 21:22:07 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Fornecedor generated by hbm2java
 */
public class Fornecedor  implements java.io.Serializable {


     private Integer fornecedorCodigo;
     private Contato contato;
     private Logradouro logradouro;
     private String fornecedorNome;
     private String fornecedorCnpj;
     private String fornecedorNumeroLogradouro;
     private Set produtos = new HashSet(0);

    public Fornecedor() {
    }

    public Fornecedor(Contato contato, Logradouro logradouro, String fornecedorNome, String fornecedorCnpj, String fornecedorNumeroLogradouro, Set produtos) {
       this.contato = contato;
       this.logradouro = logradouro;
       this.fornecedorNome = fornecedorNome;
       this.fornecedorCnpj = fornecedorCnpj;
       this.fornecedorNumeroLogradouro = fornecedorNumeroLogradouro;
       this.produtos = produtos;
    }
   
    public Integer getFornecedorCodigo() {
        return this.fornecedorCodigo;
    }
    
    public void setFornecedorCodigo(Integer fornecedorCodigo) {
        this.fornecedorCodigo = fornecedorCodigo;
    }
    public Contato getContato() {
        return this.contato;
    }
    
    public void setContato(Contato contato) {
        this.contato = contato;
    }
    public Logradouro getLogradouro() {
        return this.logradouro;
    }
    
    public void setLogradouro(Logradouro logradouro) {
        this.logradouro = logradouro;
    }
    public String getFornecedorNome() {
        return this.fornecedorNome;
    }
    
    public void setFornecedorNome(String fornecedorNome) {
        this.fornecedorNome = fornecedorNome;
    }
    public String getFornecedorCnpj() {
        return this.fornecedorCnpj;
    }
    
    public void setFornecedorCnpj(String fornecedorCnpj) {
        this.fornecedorCnpj = fornecedorCnpj;
    }
    public String getFornecedorNumeroLogradouro() {
        return this.fornecedorNumeroLogradouro;
    }
    
    public void setFornecedorNumeroLogradouro(String fornecedorNumeroLogradouro) {
        this.fornecedorNumeroLogradouro = fornecedorNumeroLogradouro;
    }
    public Set getProdutos() {
        return this.produtos;
    }
    
    public void setProdutos(Set produtos) {
        this.produtos = produtos;
    }




}


