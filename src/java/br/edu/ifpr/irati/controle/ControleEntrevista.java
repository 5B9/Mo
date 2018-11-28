/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.EntrevistaDAO;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Entrevista;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleEntrevista {

    public void inserirEntrevista(Entrevista entrevista) throws PersistenciaException {
        Dao<Entrevista> entrevistaDAO = new GenericDAO<>(Entrevista.class);
        entrevistaDAO.salvar(entrevista);
    }

    public void alterarEntrevista(Entrevista entrevista) throws PersistenciaException {
        Dao<Entrevista> entrevistaDAO = new GenericDAO<>(Entrevista.class);
        entrevistaDAO.alterar(entrevista);
    }

    public Entrevista consultarEntrevistaPorId(int id) throws PersistenciaException {
        Dao<Entrevista> entrevistaDAO = new GenericDAO<>(Entrevista.class);
        return entrevistaDAO.buscarPorId(id);
    }

    public List<Entrevista> consultarTodasEntrevistas(Entrevista entrevista) throws PersistenciaException {
        Dao<Entrevista> entrevistaDAO = new GenericDAO<>(Entrevista.class);
        return entrevistaDAO.buscarTodos(Entrevista.class);
    }

    public void excluirEntrevista(Entrevista entrevista) throws PersistenciaException {
        Dao<Entrevista> entrevistaDAO = new GenericDAO<>(Entrevista.class);
        entrevistaDAO.excluir(entrevista);
    }

    public Entrevista buscarEntrevistaCandidato(int id) throws PersistenciaException {
        EntrevistaDAO eDAO = new EntrevistaDAO();
        return eDAO.buscarPorIdCandidato(id);
    }

}
