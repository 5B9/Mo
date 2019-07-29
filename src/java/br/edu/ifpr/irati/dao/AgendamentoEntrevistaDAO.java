/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.jmail.configuracao.Conexao;
import br.edu.ifpr.irati.modelo.AgendamentoEntrevista;
import gerais.HibernateUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class AgendamentoEntrevistaDAO {
    
     
     public AgendamentoEntrevista buscarLocal(String local){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from AgendamentoEntrevista sessao where sessao.local = '"+local+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        AgendamentoEntrevista sessao = (AgendamentoEntrevista) query.uniqueResult();        
        session.clear();
        session.close();
        return sessao;
    }
     
    

}

   
