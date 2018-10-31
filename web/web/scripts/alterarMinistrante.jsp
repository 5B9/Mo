
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleMinistrante"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Ministrante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int id = Integer.parseInt(request.getParameter("id"));
            String nomeCompleto = request.getParameter("nomeCompleto");
            String curriculoResumido = request.getParameter("curriculoResumido");
            String foto = request.getParameter("foto");

            Ministrante u = new Ministrante( id,  nomeCompleto,  curriculoResumido,  foto);

            ControleMinistrante controleMinistrante = new ControleMinistrante();
            controleMinistrante.alterarMinistrante(u);
            response.sendRedirect("../index.jsp");

        %>
    </body>
</html>
