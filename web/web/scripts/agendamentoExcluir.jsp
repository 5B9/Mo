


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

           int id=Integer.parseInt(request.getParameter("idAgendamento"));

           ControleAgendamento controleAgendamento = new ControleAgendamento();
           controleAgendamento.excluirAgendamento(controleAgendamento.consultarAgendamentoPorId(id));

           response.sendRedirect("../Agendamento.jsp");
        %>
    </body>
</html>
