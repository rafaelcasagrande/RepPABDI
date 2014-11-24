package POJO;
// Generated 21/11/2014 21:22:07 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Logradouro generated by hbm2java
 */
public class Logradouro  implements java.io.Serializable {


     private Integer logradouroCodigo;
     private Bairro bairro;
     private String logradouroNome;
     private String logradouroTipo;
     private String logradouroCep;
     private Set fornecedors = new HashSet(0);
     private Set unidades = new HashSet(0);
     private Set pessoas = new HashSet(0);

    public Logradouro() {
    }

    public Logradouro(Bairro bairro, String logradouroNome, String logradouroTipo, String logradouroCep, Set fornecedors, Set unidades, Set pessoas) {
       this.bairro = bairro;
       this.logradouroNome = logradouroNome;
       this.logradouroTipo = logradouroTipo;
       this.logradouroCep = logradouroCep;
       this.fornecedors = fornecedors;
       this.unidades = unidades;
       this.pessoas = pessoas;
    }
   
    public Integer getLogradouroCodigo() {
        return this.logradouroCodigo;
    }
    
    public void setLogradouroCodigo(Integer logradouroCodigo) {
        this.logradouroCodigo = logradouroCodigo;
    }
    public Bairro getBairro() {
        return this.bairro;
    }
    
    public void setBairro(Bairro bairro) {
        this.bairro = bairro;
    }
    public String getLogradouroNome() {
        return this.logradouroNome;
    }
    
    public void setLogradouroNome(String logradouroNome) {
        this.logradouroNome = logradouroNome;
    }
    public String getLogradouroTipo() {
        return this.logradouroTipo;
    }
    
    public void setLogradouroTipo(String logradouroTipo) {
        this.logradouroTipo = logradouroTipo;
    }
    public String getLogradouroCep() {
        return this.logradouroCep;
    }
    
    public void setLogradouroCep(String logradouroCep) {
        this.logradouroCep = logradouroCep;
    }
    public Set getFornecedors() {
        return this.fornecedors;
    }
    
    public void setFornecedors(Set fornecedors) {
        this.fornecedors = fornecedors;
    }
    public Set getUnidades() {
        return this.unidades;
    }
    
    public void setUnidades(Set unidades) {
        this.unidades = unidades;
    }
    public Set getPessoas() {
        return this.pessoas;
    }
    
    public void setPessoas(Set pessoas) {
        this.pessoas = pessoas;
    }




}


