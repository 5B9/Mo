
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         int id=Integer.parseInt(request.getParameter("id"));

            ControleUsuario controleUsuario = new ControleUsuario();
            controleUsuario.excluirUsuario(controleUsuario.consultarUsuarioPorId(id));
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
