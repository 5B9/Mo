<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%

            int id=Integer.parseInt(request.getParameter("idCargo"));

            ControleCargo controleCargo = new ControleCargo();
            controleCargo.excluirCargo(controleCargo.consultarCargoPorId(id) );

            response.sendRedirect("../listaCargos.jsp");
         %>
    </body>
</html>
