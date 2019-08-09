/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity (name = "usuario")
@PrimaryKeyJoinColumn(name = "idPessoa")
@Proxy(lazy = false)
public class Usuario extends Pessoa implements Serializable {
    
    @Column(name = "nomeUsuario", nullable = false, length = 30)
    protected String nomeUsuario;
    @Column(name = "senha", nullable = false, length = 300)
    protected String senha;
    @Column(name = "tipoUsuario", nullable = false, length = 15)
    protected String tipoUsuario;

    public Usuario() {
        super();
        nomeUsuario = "";
        senha = "";
        tipoUsuario = "";
    }

    public Usuario(String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.nomeUsuario = nomeUsuario;
        this.senha = senha;
        this.tipoUsuario = tipoUsuario;
    }
    
     public Usuario( String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        nomeUsuario = "";
        senha = "";
        this.tipoUsuario = tipoUsuario;
    }

    public Usuario(String nomeUsuario, String senha, String tipoUsuario) {
        this.nomeUsuario = nomeUsuario;
        this.senha = senha;
        this.tipoUsuario = tipoUsuario;
    }
    
    

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    
}
