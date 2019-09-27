

<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControleEntrevista ce = new ControleEntrevista();
            List<Entrevista> entrevistas = new ArrayList<>();

           

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat stf = new SimpleDateFormat("HH:mm");

            String local = request.getParameter("local");
            String data = request.getParameter("dataSessao");
            String horaIn = request.getParameter("hora");
            String cargo = request.getParameter("cargo");
            String tipo = request.getParameter("tipoSessao");

            Date deto = sdf.parse(data);

            Date hora = stf.parse(horaIn);

            

            AgendamentoEntrevista a = new AgendamentoEntrevista(0, local, hora, deto,cargo, false,tipo);
            ControleAgendamento controleAgendamento = new ControleAgendamento();
            controleAgendamento.inserirAgendamento(a);

            response.sendRedirect("../Agendamento.jsp");

        %>
    </body>
</html>
