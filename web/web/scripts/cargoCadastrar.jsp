
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            
            int qtdVagas=Integer.parseInt(request.getParameter("vargas"));
            
            String descricao = request.getParameter("descricao");
            String nomeCargo = request.getParameter("nome");
            String salario = request.getParameter("salario");
            String modalidade = request.getParameter("modalidade");
            

            Cargo c = new Cargo(0, qtdVagas, descricao, nomeCargo, salario,modalidade);

            ControleCargo controleCargo = new ControleCargo();
            controleCargo.inserirCargo(c);
            response.sendRedirect("../listaCargos.jsp");

        %>
    </body>
</html>
