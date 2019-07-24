
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
            String tipo = request.getParameter("tipo");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");

            Usuario u = new Usuario(nome, senha, tipo);

            ControleUsuario controleUsuario = new ControleUsuario();
            controleUsuario.alterarUsuario(u);
            response.sendRedirect("../index.jsp");

        %>
    </body>
</html>
