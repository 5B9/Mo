/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.CurriculoDAO;
import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Curriculo;
import br.edu.ifpr.irati.modelo.Curriculo;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleCurriculo {

    public void inserirCurriculo(Curriculo curriculo) throws PersistenciaException {
        Dao<Curriculo> curriculoDAO = new GenericDAO<>(Curriculo.class);
        curriculoDAO.salvar(curriculo);
    }

    public void alterarCurriculo(Curriculo curriculo) throws PersistenciaException {
        Dao<Curriculo> curriculoDAO = new GenericDAO<>(Curriculo.class);
        curriculoDAO.alterar(curriculo);
    }

    public Curriculo consultarCurriculoPorId(int idCurriculo) throws PersistenciaException {
        Dao<Curriculo> curriculoDAO = new GenericDAO<>(Curriculo.class);
        return curriculoDAO.buscarPorId(idCurriculo);
    }

    public List<Curriculo> consultarTodosCurriculos(Curriculo curriculo) throws PersistenciaException {
        Dao<Curriculo> curriculoDAO = new GenericDAO<>(Curriculo.class);
        return curriculoDAO.buscarTodos(Curriculo.class);
    }

    public void excluirCurriculo(Curriculo curriculo) throws PersistenciaException {
        Dao<Curriculo> curriculoDAO = new GenericDAO<>(Curriculo.class);
        curriculoDAO.excluir(curriculo);
    }

}
