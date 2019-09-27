/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.FuncionarioDAO;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Funcionario;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleFuncionario {

    public void inserirFuncionario(Funcionario funcionario) throws PersistenciaException {
        Dao<Funcionario> usuarioDAO = new GenericDAO<>(Funcionario.class);
        usuarioDAO.salvar(funcionario);
    }

    public void alterarFuncionario(Funcionario funcionario) throws PersistenciaException {
        Dao<Funcionario> usuarioDAO = new GenericDAO<>(Funcionario.class);
        usuarioDAO.alterar(funcionario);
    }

    public Funcionario consultarFuncionarioPorId(int id) throws PersistenciaException {
        Dao<Funcionario> usuarioDAO = new GenericDAO<>(Funcionario.class);
        return usuarioDAO.buscarPorId(id);
    }

    public List<Funcionario> consultarTodosFuncionarios() throws PersistenciaException {
        Dao<Funcionario> usuarioDAO = new GenericDAO<>(Funcionario.class);
        return usuarioDAO.buscarTodos(Funcionario.class);
    }

    public Funcionario consultarPorTipoFuncionario(String tipoFuncionario) throws PersistenciaException {
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        return funcionarioDAO.buscarPorTipoFuncionario(tipoFuncionario);
    }

    public Funcionario consultarFuncionarioPorMatricula(int matricula) throws PersistenciaException {
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        return funcionarioDAO.buscarFuncionarioPorMatricula(matricula);
    }

    public void excluirFuncionario(Funcionario funcionario) throws PersistenciaException {
        Dao<Funcionario> usuarioDAO = new GenericDAO<>(Funcionario.class);
        usuarioDAO.excluir(funcionario);
    }

    public boolean validarCadastroFuncionarios(String nome, String senha) throws PersistenciaException {
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        return funcionarioDAO.validarCadastroFuncionarios(nome, senha);
    }
}
