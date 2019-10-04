


<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
/*
            int id=Integer.parseInt(request.getParameter("idAgendamento"));

            ControleAgendamento controleAgendamento = new ControleAgendamento();
            AgendamentoEntrevista ag = controleAgendamento.consultarAgendamentoPorId(id);
            AgendamentoEntrevista  agendamento = new AgendamentoEntrevista(id, ag.getLocalSessao(), ag.getHoraInicio(), ag.getDataSessao(), ag.getCargoSessao(), true);
            controleAgendamento.alterarAgendamento(agendamento);
*/
            response.sendRedirect("../agendamentoLista.jsp");
         %>
    </body>
</html>
