<%-- 
    Document   : finalizarProcesso
    Created on : 05/08/2019, 09:42:40
    Author     : Altair
--%>

<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

        String fasePsicologica = request.getParameter("fasePsicologica");

        int idEntrevista = Integer.parseInt(request.getParameter("idEntrevista"));
        ControleEntrevista controleEntrevista = new ControleEntrevista();
        Entrevista entrevista = controleEntrevista.consultarEntrevistaPorId(idEntrevista);
        String nomeCargo = entrevista.getCargo().getNomeCargo();
        ControleCargo controleCargo = new ControleCargo();
        if (fasePsicologica.equals("aprovado")) {
            for (Cargo c : controleCargo.consultarTodosCargos()) {
                if (c.getNomeCargo().equals(nomeCargo)) {
                    Cargo cargo = controleCargo.consultarCargoPorId(c.getIdCargo());
                    int qtd = cargo.getQtdVagas();
                    qtd = c.getQtdVagas() - 1;
                    Cargo ca = new Cargo(c.getIdCargo(), qtd, c.getDescricao(), c.getNomeCargo(), c.getSalario(), c.getModalidade());
                    controleCargo.alterarCargo(ca);
                    Entrevista e = new Entrevista(entrevista.getIdEntrevista(), entrevista.getFuncionarioMinistrante(), cargo, fasePsicologica, entrevista.isFaseTecnica(), entrevista.getCandidato(), false, true);
                    controleEntrevista.alterarEntrevista(e);
                    response.sendRedirect("../listaEntrevistas.jsp");
                }
            }
        } else {
            Entrevista e = new Entrevista(entrevista.getIdEntrevista(), entrevista.getFuncionarioMinistrante(), entrevista.getCargo(), fasePsicologica, entrevista.isFaseTecnica(), entrevista.getCandidato(), false, true);
            controleEntrevista.alterarEntrevista(e);
            response.sendRedirect("../entrevistaLista.jsp");
        }
    %>
</html>
