<%-- 
    Document   : esqueceuSenha
    Created on : 20/09/2019, 08:20:21
    Author     : Altair
--%>

<%@page import="br.edu.ifpr.irati.util.EnviarEmail"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String email =  request.getParameter("email"); ;
           

    ControleCandidato controleCandidato = new ControleCandidato();
    Candidato candidato = controleCandidato.consultarCandidatoPorEmail(email);
    
    if (candidato != null) {
       
        String[] carct = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

        String senha = "";

        for (int x = 0; x < 5; x++) {
            int j = (int) (Math.random() * carct.length);
            senha += carct[j];
       
                  }
       
        candidato.setSenha(senha);
        
       
        String assunto = "Recuperar Senha";
        String mensagem = senha;
        
        StringBuffer texto = new StringBuffer();
        texto.append("<h2 align='center'>"+assunto+"</h2>");
        texto.append("<p align='center'> Este é o seu código para recuperar sua senha:</p><br/>");
        texto.append("<p align='center'>"+mensagem+"</p>");
        
        EnviarEmail enviar = new EnviarEmail();
        enviar.setEmailDestinatario(email);
        enviar.setAssunto(assunto);
        enviar.setMsg(texto.toString());
        enviar.enviarGmail();
        
      
        response.sendRedirect("../esqueceuSenha.jsp");
}else{
        
    }

%>
</html>