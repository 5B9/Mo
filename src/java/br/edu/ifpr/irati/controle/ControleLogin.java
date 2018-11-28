/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.UsuarioDAO;
import br.edu.ifpr.irati.modelo.Usuario;

/**
 *
 * @author Altai
 */
public class ControleLogin {

    public Usuario login(String nome, String senha) throws Exception {
        UsuarioDAO uDAO = new UsuarioDAO();
        return uDAO.loginUsuario(nome, senha); //faremos uma criptografia da senha; 
    }
}
