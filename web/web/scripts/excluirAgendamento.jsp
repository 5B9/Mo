<%-- 
    Document   : excluirAgendamento
    Created on : 09/08/2019, 08:27:26
    Author     : Altai
--%>

<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        int id = Integer.parseInt(request.getParameter("idAgendamento"));
        ControleAgendamento controleAgendamento = new ControleAgendamento();
        controleAgendamento.excluirAgendamento(controleAgendamento.consultarAgendamentoPorId(id));
        response.sendRedirect("../Agendamento.jsp");
      
    %>
</html>
