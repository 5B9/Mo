

<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat stf = new SimpleDateFormat("HH:mm");
            
            int id=Integer.parseInt(request.getParameter("idAgendamento"));
            String local = request.getParameter("local");
            String data = request.getParameter("dia");
            String horaIn = request.getParameter("hora");
            String cargo = request.getParameter("cargo");

            
            String entrevistas[] = request.getParameterValues("entrevistas");



            Date deto = sdf.parse(data);

            Date hora = stf.parse(horaIn);

            

            AgendamentoEntrevista a = new AgendamentoEntrevista(0, local, hora, deto, entrevistas, cargo, false);
            ControleAgendamento controleAgendamento = new ControleAgendamento();
            controleAgendamento.alterarAgendamento(a);

            response.sendRedirect("../agendamentoLista.jsp");
        %>
    </body>
</html>
