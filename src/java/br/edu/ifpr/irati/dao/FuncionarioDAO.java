/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.controle.ControleFuncionario;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Funcionario;
import br.edu.ifpr.irati.modelo.Usuario;
import gerais.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class FuncionarioDAO {

    public boolean validarCadastroFuncionarios(String nome, String senha) {
        int flare = 0;
        ControleFuncionario controleFuncionario = new ControleFuncionario();
        try {
            for (Funcionario funcionario : controleFuncionario.consultarTodosFuncionarios()) {
                if (funcionario.getNomeUsuario().equals(nome) && funcionario.getSenha().equals(senha)) {
                    flare++;
                }
                if (flare > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (PersistenciaException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public Funcionario buscarPorTipoFuncionario(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from funcionario f where f.tipoFuncionario = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Funcionario funcionario = (Funcionario) query.uniqueResult();
        session.clear();
        session.close();
        return funcionario;
    }

    public Funcionario buscarFuncionarioPorMatricula(int matricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from funcionario f where f.matricula = '" + matricula + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Funcionario funcionario = (Funcionario) query.uniqueResult();
        session.clear();
        session.close();
        return funcionario;
    }

}
