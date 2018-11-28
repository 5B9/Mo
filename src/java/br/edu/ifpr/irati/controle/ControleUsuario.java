/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.dao.UsuarioDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Usuario;
import java.util.List;

/**
 *
 * @author Altai
 */
public class ControleUsuario {

    public void inserirUsuario(Usuario usuario) throws PersistenciaException {
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        usuarioDAO.salvar(usuario);
    }

    public void alterarUsuario(Usuario usuario) throws PersistenciaException {
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        usuarioDAO.alterar(usuario);
    }

    public Usuario consultarUsuarioPorId(int idUsuario) throws PersistenciaException {
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        return usuarioDAO.buscarPorId(idUsuario);
    }

    public List<Usuario> consultarTodosUsuarios(Usuario usuario) throws PersistenciaException {
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        return usuarioDAO.buscarTodos(Usuario.class);
    }

    public Usuario consultarPorTipoUsuario(String tipoUsuario) throws PersistenciaException {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        return usuarioDAO.buscarPorTipoUsuario(tipoUsuario);
    }

    public Usuario consultarPorNomeUsuario(String nomeUsuario) throws PersistenciaException {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        return usuarioDAO.buscarPorTipoUsuario(nomeUsuario);
    }

    public void excluirUsuario(Usuario usuario) throws PersistenciaException {
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        usuarioDAO.excluir(usuario);
    }

}
