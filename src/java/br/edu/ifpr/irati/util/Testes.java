/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.util;

import br.edu.ifpr.irati.controle.ControleAgendamento;
import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.AgendamentoEntrevista;
import br.edu.ifpr.irati.modelo.Candidato;
import br.edu.ifpr.irati.modelo.Cargo;
import br.edu.ifpr.irati.modelo.Curriculo;
import br.edu.ifpr.irati.modelo.Entrevista;
import br.edu.ifpr.irati.modelo.Funcionario;
import br.edu.ifpr.irati.modelo.ItemMenu;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Altai
 */
public class Testes {

    public static void main(String[] args) {

        Dao<Funcionario> fDAO = new GenericDAO<>(Funcionario.class);
        Dao<Candidato> cDAO = new GenericDAO<>(Candidato.class);
        Dao<Curriculo> cuDAO = new GenericDAO<>(Curriculo.class);
        Dao<Cargo> cargoDAO = new GenericDAO<>(Cargo.class);
        Dao<AgendamentoEntrevista> agendamentoDAO = new GenericDAO<>(AgendamentoEntrevista.class);
        Dao<Entrevista> eDAO = new GenericDAO<>(Entrevista.class);
        Dao<ItemMenu> iDAO = new GenericDAO<>(ItemMenu.class);
//        FUNCIONARIO
       // Funcionario funcionario = new Funcionario("gerente", new Date(), "gerenteRH", "16452155", "funcionario", 0, "Altair Stª Clara de Oliveira Neto", "111.111.111-11", "11.111.111-1", "M", "altair@empresa.com.br");

       // fDAO.salvar(funcionario);
        
        
//        CANDIDATO-CURRICULO
        Curriculo curriculo = new Curriculo();
        Candidato candidato = new Candidato("Ensino Superior Completo", "Gerente", curriculo, "zeSilva", "123456", "candidato", 0, "Ze da Silva", "222.222.222-22", "22.222.222-2", "M", "zeSilva@gmail.com");
        Candidato candidato2 = new Candidato("Ensino Superior Incompleto", "Gerente", curriculo, "joaoSilva", "654321", "candidato", 0, "João da Silva", "333.333.333-33", "33.333.333-3", "M", "joaoSilva@gmail.com");
        //cuDAO.salvar(curriculo);
        //cDAO.salvar(candidato2);
        
        
//          CARGO
        Cargo cargo = new Cargo(0, 1, "Gerente da empresa", "Gerente", "R$5000,00", "CLT");

      ///  cargoDAO.salvar(cargo);
        
        //      ENTREVISTAS

  //      Entrevista entrevista = new Entrevista(0, funcionario, cargo, true, true, candidato);
        Entrevista entrevista2 = new Entrevista(0, fDAO.buscarPorId(1), cargoDAO.buscarPorId(1), false, true, cDAO.buscarPorId(3));
        //eDAO.salvar(entrevista2);
        
//        AGENDAMENTO
      
        //   List<Entrevista> entrevistas = eDAO.buscarTodos(Entrevista.class);
        
        AgendamentoEntrevista agendamento = new AgendamentoEntrevista(0, "Rua do Desemprego", new Date(), new Date());
        //agendamento.adicionarEntrevista(eDAO.buscarPorId(2));
        ControleAgendamento agendamentoControle = new ControleAgendamento();
 
            //agendamentoControle.inserirAgendamento(agendamento);
       
        ItemMenu item = new ItemMenu(0, "w7rt7y37r", "cadastros.jsp","person", true, true);
        iDAO.salvar(item);

    
        
        

        System.exit(0);
    }

}
