/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.CargoDAO;
import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Cargo;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleCargo {

    public void inserirCargo(Cargo cargo) throws PersistenciaException {
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        cargoDAO.salvar(cargo);
    }

    public void alterarCargo(Cargo cargo) throws PersistenciaException {
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        cargoDAO.alterar(cargo);
    }

    public Cargo consultarCargoPorId(int idCargo) throws PersistenciaException {
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        return cargoDAO.buscarPorId(idCargo);
    }

    public List<Cargo> consultarTodosCargos() throws PersistenciaException {
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        return cargoDAO.buscarTodos(Cargo.class);
    }

    public Cargo consultarCargoPorModalidade(String modalidade) throws PersistenciaException {
        CargoDAO cargoDAO = new CargoDAO();
        return cargoDAO.buscarPorModalidadeCargo(modalidade);
    }

    public void excluirCargo(Cargo cargo) throws PersistenciaException {
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        cargoDAO.excluir(cargo);
    }

}
