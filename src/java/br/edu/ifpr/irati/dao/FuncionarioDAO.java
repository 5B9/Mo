/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.dao;

import br.edu.ifpr.irati.controle.ControleFuncionario;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Funcionario;
import gerais.HibernateUtil;
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
    
    
    
     public Funcionario buscarPorTipoFuncionario(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from funcionario f where f.tipoFuncionario = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Funcionario funcionario = (Funcionario) query.uniqueResult();        
        session.clear();
        session.close();
        return funcionario;
    }
    
      public Funcionario buscarFuncionarioPorMatricula(int matricula){
        Session session = HibernateUtil.getSessionFactory().openSession();
       String hql = "from funcionario f where f.matricula = '"+matricula +"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Funcionario funcionario = (Funcionario) query.uniqueResult();        
        session.clear();
        session.close();
        return funcionario;
    }
      
      public boolean validarCadastroFuncionarios(String nomeUsuario, String senha){
          ControleFuncionario controleFuncionario = new ControleFuncionario();
          Funcionario funcionario = new Funcionario();
         try {
             for(Funcionario f:controleFuncionario.consultarTodosFuncionarios()){
                 if(f.getNomeUsuario().equals(nomeUsuario)&&f.getSenha().equals(senha)){
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
