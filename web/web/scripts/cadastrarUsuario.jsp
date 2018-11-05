
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String tipoUsuario = request.getParameter("tipo");
            String nomeUsuario = request.getParameter("nomeUsuario");
            String senha = request.getParameter("senha");

            Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);

            ControleUsuario controleUsuario = new ControleUsuario();
            controleUsuario.inserirUsuario(u);

                 response.sendRedirect("../login.jsp");
            
        %>
    </body>
</html>
