/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.AgendamentoEntrevistaDAO;
import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.AgendamentoEntrevista;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleAgendamento {
    
    public void inserirAgendamento(AgendamentoEntrevista agendamento) throws PersistenciaException{
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        agendamentoDAO.salvar(agendamento);
    }
    
    public void alterarAgendamento(AgendamentoEntrevista agendamento) throws PersistenciaException{
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        agendamentoDAO.alterar(agendamento);
    }
    
    public AgendamentoEntrevista consultarAgendamentoPorId(int id) throws PersistenciaException{
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        return agendamentoDAO.buscarPorId(id);
    }
    
    public List<AgendamentoEntrevista> consultarTodosAgendamentos(AgendamentoEntrevista agendamento) throws PersistenciaException{
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        return agendamentoDAO.buscarTodos(AgendamentoEntrevista.class);
    }
    
    public AgendamentoEntrevista consultarAgendamentoPorLocal(String local) throws PersistenciaException{
        AgendamentoEntrevistaDAO agendamentoDAO = new AgendamentoEntrevistaDAO();
        return agendamentoDAO.buscarLocal(local);
    }
    
    public void excluirAgendamento(AgendamentoEntrevista agendamento) throws PersistenciaException{
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        agendamentoDAO.excluir(agendamento);
    }
    
}
