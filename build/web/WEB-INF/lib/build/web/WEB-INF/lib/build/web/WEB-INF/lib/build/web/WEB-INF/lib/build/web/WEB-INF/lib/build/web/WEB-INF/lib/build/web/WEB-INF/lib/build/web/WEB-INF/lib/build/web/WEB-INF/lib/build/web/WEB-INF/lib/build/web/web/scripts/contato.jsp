<%@page import="br.edu.ifpr.irati.jsp.controle.ContatoControle"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Contato"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    
    String assunto = request.getParameter("assunto");
    
    String email = request.getParameter("email");
    
    String texto = request.getParameter("texto");
    
    Date dataHoraContato = new Date();
    
    Contato  contato = new Contato(0, nome, assunto, texto, email, dataHoraContato);
    
    ContatoControle  contatoControle = new ContatoControle();
    
    // caminho de contexto da aplicação, ou seja, onde está executando! É alterado a depender da instalação e configuração do servidor
    String path = this.getServletContext().getRealPath("");
    
    
    contatoControle.salvarContato(contato,path);            
    
    response.sendRedirect("../index.jsp");
%>