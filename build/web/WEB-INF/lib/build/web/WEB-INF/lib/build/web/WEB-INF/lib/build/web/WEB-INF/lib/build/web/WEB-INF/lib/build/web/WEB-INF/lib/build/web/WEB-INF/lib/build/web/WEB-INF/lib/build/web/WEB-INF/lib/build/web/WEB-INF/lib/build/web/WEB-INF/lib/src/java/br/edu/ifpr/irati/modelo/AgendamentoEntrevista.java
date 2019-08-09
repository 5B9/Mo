/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity (name = "agendamento")
@Proxy(lazy = false)
public class AgendamentoEntrevista implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idSessao;
    @Column(name = "localSessao", nullable = false, length = 30)
    private String localSessao;
    @Temporal(TemporalType.TIME)
    private Date horaInicio;
    @Temporal(TemporalType.DATE)
    private Date dataSessao;
     @Column(name = "cargoSessao", nullable = false, length = 30)
    private String cargoSessao;
    @OneToMany(fetch = FetchType.LAZY) 
    private List<Entrevista> entrevistas;

    public AgendamentoEntrevista() {
        idSessao = 0;
        localSessao = "";
        horaInicio = new Date();
        dataSessao = new Date();
        entrevistas = new ArrayList<>();
        cargoSessao = "";
    }

    public AgendamentoEntrevista(int idSessao, String localSessao, Date horaInicio, Date dataSessao, String cargoSessao) {
        this.idSessao = idSessao;
        this.localSessao = localSessao;
        this.horaInicio = horaInicio;
        this.dataSessao = dataSessao;
        this.cargoSessao = cargoSessao;
        entrevistas = new ArrayList<>();
    }

    public AgendamentoEntrevista(int idSessao, String localSessao, Date horaInicio, Date dataSessao, List<Entrevista> entrevistas, String cargoSessao) {
        this.idSessao = idSessao;
        this.localSessao = localSessao;
        this.horaInicio = horaInicio;
        this.dataSessao = dataSessao;
        this.entrevistas = entrevistas;
        this.cargoSessao = cargoSessao;
    }

    public void adicionarEntrevista(Entrevista entrevista){
        this.entrevistas.add(entrevista);
    }
    
    public void removerEentrevista(Entrevista entrevista){
        this.entrevistas.remove(entrevista);
    }

    
    public Date getHoraInicio() {
        return horaInicio;
    }
    
    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getDataSessao() {
        return dataSessao;
    }

    public void setDataSessao(Date dataSessao) {
        this.dataSessao = dataSessao;
    }

    public int getIdSessao() {
        return idSessao;
    }

    public void setIdSessao(int idSessao) {
        this.idSessao = idSessao;
    }

    public String getLocalSessao() {
        return localSessao;
    }

    public void setLocalSessao(String localSessao) {
        this.localSessao = localSessao;
    }

    public List<Entrevista> getEntrevistas() {
        return entrevistas;
    }

    public void setEntrevistas(List<Entrevista> entrevistas) {
        this.entrevistas = entrevistas;
    }

    public String getCargoSessao() {
        return cargoSessao;
    }

    public void setCargoSessao(String cargoSessao) {
        this.cargoSessao = cargoSessao;
    }
}
