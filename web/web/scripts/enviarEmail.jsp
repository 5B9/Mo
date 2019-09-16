<%-- 
    Document   : enviarEmail
    Created on : 10/08/2019, 16:16:17
    Author     : Altai
--%>
 <meta charset="utf-8"/>
<%@page import="br.edu.ifpr.irati.util.EnviarEmail"%>
<!DOCTYPE html>
<html>
    <%
        String email = request.getParameter("enderecoEmail");
        String assunto = request.getParameter("assunto");
        String mensagem = request.getParameter("mensagem");

        StringBuffer texto = new StringBuffer();
        texto.append("<h2 align='center'>"+assunto+"</h2>");
        texto.append("<p align='center'> Informações Enviadas:</p><br/>");
        texto.append("<p align='center'>"+mensagem+"</p>");

        EnviarEmail enviar = new EnviarEmail();
        enviar.setEmailDestinatario(email);
        enviar.setAssunto(assunto);
        enviar.setMsg(texto.toString());

        enviar.enviarGmail();
        response.sendRedirect("../listaEntrevistas.jsp");
    %>
</html>
