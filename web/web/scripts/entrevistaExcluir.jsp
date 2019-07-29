<%-- 
    Document   : excluirEntrevista
    Created on : 03/10/2018, 20:49:49
    Author     : Altai
--%>

<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%

            int id=Integer.parseInt(request.getParameter("idEntrevista"));

            ControleEntrevista controleEntrevista = new ControleEntrevista();
            Entrevista entrevista = controleEntrevista.consultarEntrevistaPorId(id);
            Entrevista e = new Entrevista(entrevista.getIdEntrevista(), entrevista.getFuncionarioMinistrante(), entrevista.getCargo(), entrevista.getFasePsicologica(), entrevista.isFaseTecnica(), entrevista.getCandidato(), true);
            controleEntrevista.alterarEntrevista(entrevista);
            response.sendRedirect("../listaEntrevistas.jsp");
         %>
    </body>
</html>
