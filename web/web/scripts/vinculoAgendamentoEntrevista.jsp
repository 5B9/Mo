
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleEntrevista"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAgendamento"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Entrevista"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Agendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            ControleAgendamento at = new ControleAgendamento();
            ControleEntrevista mt = new ControleEntrevista();

            Agendamento agendamento = new Agendamento();
            List<Entrevista> entrevistas = new ArrayList<>();
            
            

            int id = Integer.parseInt(request.getParameter("agendamento"));
            agendamento = at.buscarAgendamentoPorId(id);

            String mi[] = request.getParameterValues("entrevistas");

            int mid;

            for (String mis : mi) {
                mid = Integer.parseInt(mis);
                entrevistas.add(mt.buscarEntrevistaPorId(mid));
            }
                    /**Inserir Entrevistas num agendamento*/
            at.vinculoEntrevistasAgendamento(agendamento,enrtevistas);
            

             response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
