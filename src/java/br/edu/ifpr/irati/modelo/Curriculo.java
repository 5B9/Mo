/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity(name = "curriculo")
@Proxy(lazy = false)
public class Curriculo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCurriculo;
    @Temporal(TemporalType.DATE)
    private Date dataAnexacao;
    @Column(name = "curriculo", nullable = false, length = 300)
    private File curriculo;

    public Curriculo() {
        idCurriculo = 0;
        dataAnexacao = new Date();
        curriculo = new File("");
    }

    public Curriculo(int idCurriculo, Date dataAnexacao, File curriculo) {
        this.idCurriculo = idCurriculo;
        this.dataAnexacao = dataAnexacao;
        this.curriculo = curriculo;
    }

    public Date getDataAnexacao() {
        return dataAnexacao;
    }

    public void setDataAnexacao(Date dataAnexacao) {
        this.dataAnexacao = dataAnexacao;
    }

    public File getCurriculo() {
        return curriculo;
    }

    public void setCurriculo(File curriculo) {
        this.curriculo = curriculo;
    }

    public int getIdCurriculo() {
        return idCurriculo;
    }

    public void setIdCurriculo(int idCurriculo) {
        this.idCurriculo = idCurriculo;
    }

}
