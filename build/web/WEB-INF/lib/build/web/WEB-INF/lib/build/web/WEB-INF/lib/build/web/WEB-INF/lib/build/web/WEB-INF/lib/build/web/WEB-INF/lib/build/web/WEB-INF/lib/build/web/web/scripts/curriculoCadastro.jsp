
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
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

            String curriculo = request.getParameter("curriculo");
            String data = request.getParameter("data");

            Date dataAdm = sdf.parse(data);
            
            Curriculo c = new curriculo( curriculo, dataAdm, 0);

            ControleCandidato controleCandidatoo = new ControleCandidato();
            controleCandidato.cadastrarCurriculo(c);
            response.sendRedirect("../index.jsp");

        %>
    </body>
</html>
