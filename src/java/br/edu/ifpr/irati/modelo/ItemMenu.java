/*
 * Copyright (C) 2018 Valter Estevam
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
 * @author Valter Estevam
 */
@Entity(name = "itemmenu")
@Proxy(lazy = false)
public class ItemMenu implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "valor", nullable = false, length = 30)
    private String valor;
    @Column(name = "url", nullable = false, length = 50)
    private String url;
    @Column(name = "icone", nullable = false, length = 30)
    private String icone;
    @Column(name = "visivel", nullable = false, length = 3)
    private boolean visivel;
    @Column(name = "aberta", nullable = false, length = 3)
    private boolean aberta;

    /**
     * Construtor padrão
     */
    public ItemMenu() {
        id = 0;
        valor = "";
        url = "";
        icone = "";
        visivel = true;
        aberta = true;
    }

    /**
     * Construtor sem icone.
     *
     * @param id
     * @param valor
     * @param url
     * @param visivel
     * @param aberta
     */
    public ItemMenu(int id, String valor, String url, boolean visivel, boolean aberta) {
        this.id = id;
        this.valor = valor;
        this.url = url;
        this.icone = "";
        this.visivel = visivel;
        this.aberta = aberta;
    }

    /**
     * Construtor completo
     *
     * @param id
     * @param valor
     * @param url
     * @param icone
     */
    public ItemMenu(int id, String valor, String url, String icone, boolean visivel, boolean aberta) {
        this.id = id;
        this.valor = valor;
        this.url = url;
        this.icone = icone;
        this.visivel = visivel;
        this.aberta = aberta;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the valor
     */
    public String getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(String valor) {
        this.valor = valor;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the icone
     */
    public String getIcone() {
        return icone;
    }

    /**
     * @param icone the icone to set
     */
    public void setIcone(String icone) {
        this.icone = icone;
    }

    /**
     * @return the visivel
     */
    public boolean isVisivel() {
        return visivel;
    }

    /**
     * @param visivel the visivel to set
     */
    public void setVisivel(boolean visivel) {
        this.visivel = visivel;
    }

    /**
     * @return the aberta
     */
    public boolean isAberta() {
        return aberta;
    }

    /**
     * @param aberta the aberta to set
     */
    public void setAberta(boolean aberta) {
        this.aberta = aberta;
    }

}
