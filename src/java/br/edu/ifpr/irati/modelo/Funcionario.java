/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity(name = "funcionario")
@PrimaryKeyJoinColumn(name = "idPessoa")
@Proxy(lazy = false)
public class Funcionario extends Usuario implements Serializable {

    @Column(name = "tipoFuncionario", nullable = false, length = 300)
    private String tipoFuncionario;
    @Temporal(TemporalType.DATE)
    private Date dataAdmissao;
    @Column(name = "matricula", nullable = false, length = 15)
    private int matricula;
    @Column(name = "desabilitar", nullable = false, length = 15)
    private boolean desabilitar;

    public Funcionario() {
        super();
        tipoFuncionario = "";
        dataAdmissao = new Date();
        matricula = 0;
        desabilitar = false;
    }

    public Funcionario(int matricula,String tipoFuncionario, Date dataAdmissao, String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail, boolean desabilitar) {
        super(nomeUsuario, senha, tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.tipoFuncionario = tipoFuncionario;
        this.dataAdmissao = dataAdmissao;
        this.matricula = matricula;
        this.desabilitar = desabilitar;
    }
    
    public Funcionario(int matricula,String tipoFuncionario, Date dataAdmissao, String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(nomeUsuario, senha, tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.tipoFuncionario = tipoFuncionario;
        this.dataAdmissao = dataAdmissao;
        this.matricula = matricula;
        this.desabilitar = desabilitar;
    }
    
    public Funcionario(int matricula,String tipoFuncionario, Date dataAdmissao, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail, boolean desabilitar) {
        super(tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.tipoFuncionario = tipoFuncionario;
        this.dataAdmissao = dataAdmissao;
        this.matricula = matricula;
        this.desabilitar = desabilitar;
    }
    
    public Funcionario(int matricula,String tipoFuncionario, Date dataAdmissao, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.tipoFuncionario = tipoFuncionario;
        this.dataAdmissao = dataAdmissao;
        this.matricula = matricula;
        this.desabilitar = desabilitar;
    }

    public String getTipoFuncionario() {
        return tipoFuncionario;
    }

    public void setTipoFuncionario(String tipoFuncionario) {
        this.tipoFuncionario = tipoFuncionario;
    }

    public Date getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public boolean isDesabilitar() {
        return desabilitar;
    }

    public void setDesabilitar(boolean desabilitar) {
        this.desabilitar = desabilitar;
    }

}
