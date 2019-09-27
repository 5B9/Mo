/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity(name = "entrevista")
@Proxy(lazy = false)
public class Entrevista implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEntrevista;
    @OneToOne(fetch = FetchType.EAGER)
    private Funcionario funcionarioMinistrante;
    @OneToOne(fetch = FetchType.EAGER)
    private Cargo cargo;
    @Column(name = "fasePsicologica", nullable = false, length = 20)
    private String fasePsicologica;
    @Column(name = "faseTecnica", nullable = false, length = 20)
    private boolean faseTecnica;
    @Column(name = "desabilitar", nullable = false, length = 15)
    private boolean desabilitar;
    @OneToOne(fetch = FetchType.EAGER)
    private Candidato candidato;
    @Column(name = "situacaoProcesso", nullable = false, length = 15)
    private boolean situacaoProcesso;
    @Column(name = "tipoEntrevista", nullable = false, length = 30)
    private String tipoEntrevista;

    public Entrevista() {
        idEntrevista = 0;
        funcionarioMinistrante = new Funcionario();
        cargo = new Cargo();
        fasePsicologica = "";
        faseTecnica = false;
        candidato = new Candidato();
        desabilitar = false;
        situacaoProcesso = false;
        tipoEntrevista = "";
    }

    public Entrevista(int idEntrevista,String tipoEntrevista ,Funcionario funcionarioMinistrante, Cargo cargo, String fasePsicologica, boolean faseTecnica, Candidato candidato, boolean desabilitar) {
        this.idEntrevista = idEntrevista;
        this.funcionarioMinistrante = funcionarioMinistrante;
        this.cargo = cargo;
        this.fasePsicologica = fasePsicologica;
        this.faseTecnica = faseTecnica;
        this.candidato = candidato;
        this.desabilitar = desabilitar;
        this.tipoEntrevista = tipoEntrevista;
    }

    public Entrevista(int idEntrevista,String tipoEntrevista, Funcionario funcionarioMinistrante, Cargo cargo, String fasePsicologica, boolean faseTecnica, Candidato candidato, boolean desabilitar, boolean situacaoProcesso) {
        this.idEntrevista = idEntrevista;
        this.funcionarioMinistrante = funcionarioMinistrante;
        this.cargo = cargo;
        this.fasePsicologica = fasePsicologica;
        this.faseTecnica = faseTecnica;
        this.candidato = candidato;
        this.desabilitar = desabilitar;
        this.situacaoProcesso = situacaoProcesso;
        this.tipoEntrevista = tipoEntrevista;
    }

    public int getIdEntrevista() {
        return idEntrevista;
    }

    public void setIdEntrevista(int idEntrevista) {
        this.idEntrevista = idEntrevista;
    }

    public Funcionario getFuncionarioMinistrante() {
        return funcionarioMinistrante;
    }

    public void setFuncionarioMinistrante(Funcionario funcionarioMinistrante) {
        this.funcionarioMinistrante = funcionarioMinistrante;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public String getFasePsicologica() {
        return fasePsicologica;
    }

    public void setFasePsicologica(String fasePsicologica) {
        this.fasePsicologica = fasePsicologica;
    }

    public boolean isFaseTecnica() {
        return faseTecnica;
    }

    public void setFaseTecnica(boolean faseTecnica) {
        this.faseTecnica = faseTecnica;
    }

    public Candidato getCandidato() {
        return candidato;
    }

    public void setCandidato(Candidato candidato) {
        this.candidato = candidato;
    }

    public boolean isDesabilitar() {
        return desabilitar;
    }

    public void setDesabilitar(boolean desabilitar) {
        this.desabilitar = desabilitar;
    }

    public boolean isSituacaoProcesso() {
        return situacaoProcesso;
    }

    public void setSituacaoProcesso(boolean situacaoProcesso) {
        this.situacaoProcesso = situacaoProcesso;
    }

    public String getTipoEntrevista() {
        return tipoEntrevista;
    }

    public void setTipoEntrevista(String tipoEntrevista) {
        this.tipoEntrevista = tipoEntrevista;
    }

  

}
