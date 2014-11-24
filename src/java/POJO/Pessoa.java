package POJO;
// Generated 21/11/2014 21:22:07 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Pessoa generated by hbm2java
 */
public class Pessoa  implements java.io.Serializable {


     private Integer pessoaCodigo;
     private Contato contato;
     private Logradouro logradouro;
     private String pessoaCpf;
     private String pessoaSobrenome;
     private Date pessoaDataNascimento;
     private String pessoaNumeroLogradouro;
     private String pessoaNome;
     private Set clientes = new HashSet(0);
     private Set funcionarios = new HashSet(0);

    public Pessoa() {
    }

    public Pessoa(Contato contato, Logradouro logradouro, String pessoaCpf, String pessoaSobrenome, Date pessoaDataNascimento, String pessoaNumeroLogradouro, String pessoaNome, Set clientes, Set funcionarios) {
       this.contato = contato;
       this.logradouro = logradouro;
       this.pessoaCpf = pessoaCpf;
       this.pessoaSobrenome = pessoaSobrenome;
       this.pessoaDataNascimento = pessoaDataNascimento;
       this.pessoaNumeroLogradouro = pessoaNumeroLogradouro;
       this.pessoaNome = pessoaNome;
       this.clientes = clientes;
       this.funcionarios = funcionarios;
    }
   
    public Integer getPessoaCodigo() {
        return this.pessoaCodigo;
    }
    
    public void setPessoaCodigo(Integer pessoaCodigo) {
        this.pessoaCodigo = pessoaCodigo;
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
    public String getPessoaCpf() {
        return this.pessoaCpf;
    }
    
    public void setPessoaCpf(String pessoaCpf) {
        this.pessoaCpf = pessoaCpf;
    }
    public String getPessoaSobrenome() {
        return this.pessoaSobrenome;
    }
    
    public void setPessoaSobrenome(String pessoaSobrenome) {
        this.pessoaSobrenome = pessoaSobrenome;
    }
    public Date getPessoaDataNascimento() {
        return this.pessoaDataNascimento;
    }
    
    public void setPessoaDataNascimento(Date pessoaDataNascimento) {
        this.pessoaDataNascimento = pessoaDataNascimento;
    }
    public String getPessoaNumeroLogradouro() {
        return this.pessoaNumeroLogradouro;
    }
    
    public void setPessoaNumeroLogradouro(String pessoaNumeroLogradouro) {
        this.pessoaNumeroLogradouro = pessoaNumeroLogradouro;
    }
    public String getPessoaNome() {
        return this.pessoaNome;
    }
    
    public void setPessoaNome(String pessoaNome) {
        this.pessoaNome = pessoaNome;
    }
    public Set getClientes() {
        return this.clientes;
    }
    
    public void setClientes(Set clientes) {
        this.clientes = clientes;
    }
    public Set getFuncionarios() {
        return this.funcionarios;
    }
    
    public void setFuncionarios(Set funcionarios) {
        this.funcionarios = funcionarios;
    }




}


