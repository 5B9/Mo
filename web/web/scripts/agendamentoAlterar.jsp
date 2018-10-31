

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
            SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
            
            int id=Integer.parseInt(request.getParameter("idAgendamento"));
            String local = request.getParameter("local");
            String data = request.getParameter("dia");
            String horaIn = request.getParameter("hora");

            
            String entrevistas[] = request.getParameterValues("entrevistas");



            Date deto = sdf.parse(data);

            Date hora = stf.parse(horaIn);

            

            AgendamentoEntrevista a = new AgendamentoEntrevista(id,local, hora,deto);
            ControleAgendamento controleAgendamento = new ControleAgendamento();
            controleAgendamento.alterarAgendamento(a);

            response.sendRedirect("../Agendamento.jsp");
        %>
    </body>
</html>
