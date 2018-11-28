/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.modelo.Usuario;
import br.edu.ifpr.irati.util.Digest;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class UsuarioDAO {

    public Usuario buscarPorTipoUsuario(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from usuario u where u.tipoUsuario = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Usuario usuario = (Usuario) query.uniqueResult();
        session.clear();
        session.close();
        return usuario;
    }

    public Usuario buscarPorNomeUsuario(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from usuario u where u.nomeUsuario = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Usuario usuario = (Usuario) query.uniqueResult();
        session.clear();
        session.close();
        return usuario;
    }

    public Usuario loginUsuario(String nomeUsuario, String senha) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        // String senhaResumo = Digest.hashString(senha, "SHA-512");
        String hql = "from usuario u where u.nomeUsuario = '" + nomeUsuario + "' and senha='" + senha + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        // Usuario usuario = new Usuario(nomeUsuario, senhaResumo, "");
        Usuario usuario = (Usuario) query.uniqueResult();
        if (usuario != null) {
            session.clear();
            session.close();
            return usuario;
        } else {
            session.clear();
            session.close();
            throw new Exception("Acesso Negado!");
        }

    }

}
