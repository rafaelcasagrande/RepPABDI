package POJO;
// Generated 21/11/2014 21:22:07 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Unidade generated by hbm2java
 */
public class Unidade  implements java.io.Serializable {


     private Integer unidadeCodigo;
     private Contato contato;
     private Logradouro logradouro;
     private String unidadeNome;
     private String unidadeNumeroLogradouro;
     private Set funcionarios = new HashSet(0);
     private Set vendas = new HashSet(0);

    public Unidade() {
    }

    public Unidade(Contato contato, Logradouro logradouro, String unidadeNome, String unidadeNumeroLogradouro, Set funcionarios, Set vendas) {
       this.contato = contato;
       this.logradouro = logradouro;
       this.unidadeNome = unidadeNome;
       this.unidadeNumeroLogradouro = unidadeNumeroLogradouro;
       this.funcionarios = funcionarios;
       this.vendas = vendas;
    }
   
    public Integer getUnidadeCodigo() {
        return this.unidadeCodigo;
    }
    
    public void setUnidadeCodigo(Integer unidadeCodigo) {
        this.unidadeCodigo = unidadeCodigo;
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
    public String getUnidadeNome() {
        return this.unidadeNome;
    }
    
    public void setUnidadeNome(String unidadeNome) {
        this.unidadeNome = unidadeNome;
    }
    public String getUnidadeNumeroLogradouro() {
        return this.unidadeNumeroLogradouro;
    }
    
    public void setUnidadeNumeroLogradouro(String unidadeNumeroLogradouro) {
        this.unidadeNumeroLogradouro = unidadeNumeroLogradouro;
    }
    public Set getFuncionarios() {
        return this.funcionarios;
    }
    
    public void setFuncionarios(Set funcionarios) {
        this.funcionarios = funcionarios;
    }
    public Set getVendas() {
        return this.vendas;
    }
    
    public void setVendas(Set vendas) {
        this.vendas = vendas;
    }




}


