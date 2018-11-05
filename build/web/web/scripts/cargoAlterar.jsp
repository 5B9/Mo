
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
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

            int id = Integer.parseInt(request.getParameter("id"));
            int qtdVagas = Integer.parseInt(request.getParameter("vagas"));
            String descricao = request.getParameter("descricao");
            String nomeCargo = request.getParameter("nome");
            String salario = request.getParameter("salario");
            String modalidade = request.getParameter("modalidade");
 
           Cargo c = new Cargo(id, qtdVagas, descricao, nomeCargo, salario,modalidade);

            ControleCargo controleCargo = new ControleCargo();
            controleCargo.alterarCargo(c);
             response.sendRedirect("../listaCargos.jsp");

        %>
    </body>
</html>
