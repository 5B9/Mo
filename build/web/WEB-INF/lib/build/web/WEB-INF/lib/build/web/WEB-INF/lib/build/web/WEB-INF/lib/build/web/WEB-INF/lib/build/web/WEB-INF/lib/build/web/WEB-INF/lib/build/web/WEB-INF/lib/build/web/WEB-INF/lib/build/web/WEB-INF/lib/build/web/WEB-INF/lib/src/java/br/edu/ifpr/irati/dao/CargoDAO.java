/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.modelo.Cargo;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class CargoDAO {
    
    public Cargo buscarPorModalidadeCargo(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from cargo c where c.modalidade = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Cargo cargo = (Cargo) query.uniqueResult();        
        session.clear();
        session.close();
        return cargo;
    }
    
}
