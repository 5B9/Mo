/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.controle.ControleCandidato;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Candidato;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class CandidatoDAO {

    public boolean validarCadastroCandidatos(String nome, String senha) throws PersistenciaException {
        int flare = 0;
        ControleCandidato controleCandidato = new ControleCandidato();
        Candidato cn = new Candidato();
        for (Candidato candidato : controleCandidato.consultarTodosCandidatos(cn)) {
            if (candidato.getNomeUsuario().equals(nome) && candidato.getSenha().equals(senha)) {
                flare++;
            }
        }
        if (flare > 0) {
            return false;
        } else {
            return true;
        }
    }

    public Candidato buscarPorCargoDesejado(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from candidato c where c.cargoDesejado = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Candidato candidato = (Candidato) query.uniqueResult();
        session.clear();
        session.close();
        return candidato;
    }

}
