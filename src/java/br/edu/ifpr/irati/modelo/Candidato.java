/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Altai
 */
@Entity(name = "candidato")
@PrimaryKeyJoinColumn(name = "idPessoa")
@Proxy(lazy = false)
public class Candidato extends Usuario implements Serializable {

    @Column(name = "escolaridade", nullable = false, length = 50)
    private String escolaridade;
    @Column(name = "cargoDesejado", nullable = false, length = 15)
    private String cargoDesejado;
    @Column(name = "idade", nullable = false, length = 2)
    private String idade;
    @Column(name = "formacoes", nullable = true, length = 200)
    private String formacoesProfissionais;
    @Column(name = "perfilPreenchido", nullable = false, length = 15)
    private boolean perfilPreenchido;
     @Column(name = "desabilitar", nullable = false, length = 15)
    private boolean desabilitar;
    

    public Candidato() {
        super();
        escolaridade = "";
        cargoDesejado = "";
        idade = "";
        perfilPreenchido = false;
        desabilitar = false;
    }

    public Candidato(String escolaridade, String cargoDesejado, String idade, String formacoesProfissionais, boolean perfilPreenchido,boolean desabilitar, String nomeUsuario, String senha, String tipoUsuario) {
        super(nomeUsuario, senha, tipoUsuario);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        this.idade = idade;
        this.formacoesProfissionais = formacoesProfissionais;
        this.perfilPreenchido = perfilPreenchido;
        this.desabilitar = desabilitar;
    }
    
    public Candidato(String escolaridade, String cargoDesejado, String idade, String formacoesProfissionais, String nomeUsuario, String senha, String tipoUsuario) {
        super(nomeUsuario, senha, tipoUsuario);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        this.idade = idade;
        this.formacoesProfissionais = formacoesProfissionais;
        this.perfilPreenchido = perfilPreenchido;
        this.desabilitar = desabilitar;
    }

    public Candidato(String escolaridade, String cargoDesejado, String idade, String formacoesProfissionais, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        this.idade = idade;
        this.formacoesProfissionais = formacoesProfissionais;
        this.perfilPreenchido = perfilPreenchido;
        this.desabilitar = desabilitar;
    }

    public Candidato(String escolaridade, String cargoDesejado, String idade, String formacoesProfissionais, boolean perfilPreenchido, boolean desabilitar, String nomeUsuario, String senha, String tipoUsuario, int idPessoa, String nomeCompleto, String cpf, String rg, String sexo, String enderecoEmail) {
        super(nomeUsuario, senha, tipoUsuario, idPessoa, nomeCompleto, cpf, rg, sexo, enderecoEmail);
        this.escolaridade = escolaridade;
        this.cargoDesejado = cargoDesejado;
        this.idade = idade;
        this.formacoesProfissionais = formacoesProfissionais;
        this.perfilPreenchido = perfilPreenchido;
        this.desabilitar = desabilitar;
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

    public boolean isPerfilPreenchido() {
        return perfilPreenchido;
    }

    public void setPerfilPreenchido(boolean perfilPreenchido) {
        this.perfilPreenchido = perfilPreenchido;
    }

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }

    public String getFormacoesProfissionais() {
        return formacoesProfissionais;
    }

    public void setFormacoesProfissionais(String formacoesProfissionais) {
        this.formacoesProfissionais = formacoesProfissionais;
    }

    public boolean isDesabilitar() {
        return desabilitar;
    }

    public void setDesabilitar(boolean desabilitar) {
        this.desabilitar = desabilitar;
    }

}
