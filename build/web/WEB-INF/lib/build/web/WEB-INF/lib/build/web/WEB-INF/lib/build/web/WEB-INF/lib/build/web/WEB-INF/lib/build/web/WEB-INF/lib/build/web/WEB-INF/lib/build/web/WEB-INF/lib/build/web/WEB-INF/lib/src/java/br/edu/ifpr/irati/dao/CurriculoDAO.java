/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.modelo.Curriculo;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class CurriculoDAO {
    
     public Curriculo buscarPorTipoUsuario(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from curriculo c where c.tipoUsuario = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Curriculo curriculo = (Curriculo) query.uniqueResult();        
        session.clear();
        session.close();
        return curriculo;
    }
    
}
