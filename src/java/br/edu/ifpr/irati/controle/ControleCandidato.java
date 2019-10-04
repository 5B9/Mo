/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.CandidatoDAO;
import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Candidato;
import br.edu.ifpr.irati.modelo.Entrevista;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleCandidato {

    public void inserirCandidato(Candidato candidato) throws PersistenciaException {
        Dao<Candidato> candidatoDAO = new GenericDAO<>(Candidato.class);
        candidatoDAO.salvar(candidato);
    }

    public void alterarCandidato(Candidato candidato) throws PersistenciaException {
        Dao<Candidato> candidatoDAO = new GenericDAO<>(Candidato.class);
        candidatoDAO.alterar(candidato);
    }

    public Candidato consultarCandidatoPorId(int id) throws PersistenciaException {
        Dao<Candidato> candidatoDAO = new GenericDAO<>(Candidato.class);
        return candidatoDAO.buscarPorId(id);
    }

    public List<Candidato> consultarTodosCandidatos(Candidato candidato) throws PersistenciaException {
        Dao<Candidato> candidatoDAO = new GenericDAO<>(Candidato.class);
        return candidatoDAO.buscarTodos(Candidato.class);
    }

    public Candidato consultarPorCargoDesejado(String cargoDesejado) throws PersistenciaException {
        CandidatoDAO candidatoDAO = new CandidatoDAO();
        return candidatoDAO.buscarPorCargoDesejado(cargoDesejado);
    }

    public Candidato consultarCandidatoPorEmail(String email) throws PersistenciaException {
        CandidatoDAO candidatoDAO = new CandidatoDAO();
        return candidatoDAO.buscarPorEmail(email);
    }

    public void excluirCandidato(Candidato candidato) throws PersistenciaException {
        Dao<Candidato> candidatoDAO = new GenericDAO<>(Candidato.class);
        candidatoDAO.excluir(candidato);
    }

    public boolean validarCadastroCandidatos(String nomeUsuario, String senha) throws PersistenciaException {
        CandidatoDAO candidatoDAO = new CandidatoDAO();
        return candidatoDAO.validarCadastroCandidatos(nomeUsuario, senha);

    }

}
