<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

           int id = Integer.parseInt(request.getParameter("idFuncionario"));

           ControleFuncionario controleFuncionario = new ControleFuncionario();
           controleFuncionario.excluirFuncionario(controleFuncionario.consultarFuncionarioPorId(id));

           response.sendRedirect("../listaFuncionarios.jsp");
        %>
    </body>
</html>
