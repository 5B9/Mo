/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

/**
 *
 * @author Altai
 */
@Entity(name = "pessoa")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Pessoa implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idPessoa;
    @Column(name = "nomecompleto", nullable = false, length = 100)
    protected String nomeCompleto;
    @Column(name = "cpf", nullable = false, length = 14)
    protected String cpf;
    @Column(name = "rg", nullable = false, length = 12)
    protected String rg;
    @Column(name = "sexo", nullable = false, length = 1)
    protected String sexo;
    @Column(name = "enderecoEmail", nullable = false, length = 30)
    protected String enderecoEmail;

    public Pessoa() {
        idPessoa = 0;
        nomeCompleto = "";
        cpf = "";
        rg = "";
        sexo = "";
        enderecoEmail = "";
    }

    public Pessoa(int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        this.idPessoa = idPessoa;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.rg = rg;
        this.sexo = sexo;
        this.enderecoEmail = enderecoEmail;
    }

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEnderecoEmail() {
        return enderecoEmail;
    }

    public void setEnderecoEmail(String enderecoEmail) {
        this.enderecoEmail = enderecoEmail;
    }

    @Override
    public String toString() {
        return this.getNomeCompleto(); //To change body of generated methods, choose Tools | Templates.
    }

}
