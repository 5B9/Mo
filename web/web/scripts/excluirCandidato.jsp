
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id =Integer.parseInt(request.getParameter("idCandidato"));

            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato candidato = controleCandidato.consultarCandidatoPorId(id);
            controleCandidato.excluirCandidato(candidato);
            response.sendRedirect("../listaCandidatos.jsp");
        %>
    </body>
</html>

