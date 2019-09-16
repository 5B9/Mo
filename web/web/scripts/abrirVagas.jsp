<%-- 
    Document   : abrirVagas
    Created on : 09/08/2019, 07:46:09
    Author     : Altai
--%>

<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        int idCargo = Integer.parseInt(request.getParameter("idCargo"));
        int qtdVagas = Integer.parseInt(request.getParameter("vagas"));

        ControleCargo controleCargo = new ControleCargo();
        Cargo cargo = controleCargo.consultarCargoPorId(idCargo);
        int novaQtdVagas = cargo.getQtdVagas() + qtdVagas;
        Cargo c = new Cargo(idCargo, novaQtdVagas, cargo.getDescricao(), cargo.getNomeCargo(), cargo.getSalario(), cargo.getModalidade());
        controleCargo.alterarCargo(c);
        response.sendRedirect("../listaCargos.jsp");

    %>
</html>
