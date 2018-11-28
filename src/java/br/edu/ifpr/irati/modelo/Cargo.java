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
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity(name = "cargo")
@Proxy(lazy = false)
public class Cargo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCargo;
    @Column(name = "qtdVagas", nullable = false, length = 11)
    private int qtdVagas;
    @Column(name = "descricao", nullable = false, length = 200)
    private String descricao;
    @Column(name = "nomeCargo", nullable = false, length = 30)
    private String nomeCargo;
    @Column(name = "salario", nullable = false, length = 11)
    private String salario;
    @Column(name = "modalidade", nullable = false, length = 20)
    private String modalidade;

    public Cargo() {
        idCargo = 0;
        qtdVagas = 0;
        descricao = "";
        nomeCargo = "";
        salario = "";
        modalidade = "";
    }

    public Cargo(int idCargo, int qtdVagas, String descricao, String nomeCargo, String salario, String modalidade) {
        this.idCargo = idCargo;
        this.qtdVagas = qtdVagas;
        this.descricao = descricao;
        this.nomeCargo = nomeCargo;
        this.salario = salario;
        this.modalidade = modalidade;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public int getQtdVagas() {
        return qtdVagas;
    }

    public void setQtdVagas(int qtdVagas) {
        this.qtdVagas = qtdVagas;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNomeCargo() {
        return nomeCargo;
    }

    public void setNomeCargo(String nomeCargo) {
        this.nomeCargo = nomeCargo;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public String getModalidade() {
        return modalidade;
    }

    public void setModalidade(String modalidade) {
        this.modalidade = modalidade;
    }

}
