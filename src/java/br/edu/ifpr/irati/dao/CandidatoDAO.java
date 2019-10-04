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
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Altai
 */
public class CandidatoDAO {


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
    
     public Candidato buscarPorEmail(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from candidato c where c.enderecoEmail = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Candidato candidato = (Candidato) query.uniqueResult();
        session.clear();
        session.close();
        return candidato;
    }

   public boolean validarCadastroCandidatos(String nomeUsuario, String senha){
          ControleCandidato controleCandidato = new ControleCandidato();
          Candidato candidato = new Candidato();
         try {
             for(Candidato c:controleCandidato.consultarTodosCandidatos(candidato)){
                 if(c.getNomeUsuario().equals(nomeUsuario)&&c.getSenha().equals(senha)){
                 return true;
                 }else{
                 return false;
                 }
             }
         } catch (PersistenciaException ex) {
             Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
      return false;
      }

}
