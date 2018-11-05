/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity (name = "candidato")
@PrimaryKeyJoinColumn(name = "idPessoa")
@Proxy(lazy = false)
public class Candidato extends Usuario implements Serializable {
    
    @Column(name = "escolaridade", nullable = false, length = 50)
    private String escolaridade;
    @Column(name = "cargoDesejado", nullable = false, length = 15) 
    private String cargoDesejado; 
    @OneToOne (fetch = FetchType.LAZY)
    private Curriculo curriculo;

    public Candidato() {
       super();
       escolaridade = "";
       cargoDesejado = "";
       curriculo = new Curriculo();
    }

    public Candidato(String escolaridade, String cargoDesejado, String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(nomeUsuario, senha, tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        curriculo = new Curriculo();
    }

    public Candidato(String escolaridade, String cargoDesejado, Curriculo curriculo, String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(nomeUsuario, senha, tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        this.curriculo = curriculo;
    }

    public String getEscolaridade() {
        return escolaridade;
    }

    public void setEscolaridade(String escolaridade) {
        this.escolaridade = escolaridade;
    }

    public String getCargoDesejado() {
        return cargoDesejado;
    }

    public void setCargoDesejado(String cargoDesejado) {
        this.cargoDesejado = cargoDesejado;
    }

    public Curriculo getCurriculo() {
        return curriculo;
    }

    public void setCurriculo(Curriculo curriculo) {
        this.curriculo = curriculo;
    }
    
}
