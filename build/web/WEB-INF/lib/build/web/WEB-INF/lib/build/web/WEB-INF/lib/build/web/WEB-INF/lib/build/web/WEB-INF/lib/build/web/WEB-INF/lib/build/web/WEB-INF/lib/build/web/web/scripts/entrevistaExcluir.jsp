<%-- 
    Document   : excluirEntrevista
    Created on : 03/10/2018, 20:49:49
    Author     : Altai
--%>

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
                   controleEntrevista.excluirEntrevista(controleEntrevista.consultarEntrevistaPorId(id) );

                   response.sendRedirect("../listaEntrevistas.jsp");
        %>
    </body>
</html>
