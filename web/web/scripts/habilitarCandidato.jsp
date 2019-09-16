<%-- 
    Document   : habilitarCandidato
    Created on : 05/08/2019, 16:23:00
    Author     : Altai
--%>

<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
          int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
          
            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato candidato = controleCandidato.consultarCandidatoPorId(idCandidato);
            Candidato c = new Candidato(candidato.getEscolaridade(), candidato.getCargoDesejado(), candidato.getIdade(), candidato.getFormacoesProfissionais(),true,false, candidato.getNomeUsuario(),candidato.getSenha(),  candidato.getTipoUsuario(), idCandidato, candidato.getNomeCompleto(), candidato.getCpf(), candidato.getRg(), candidato.getSexo(), candidato.getEnderecoEmail());

            
            controleCandidato.alterarCandidato(c);
            response.sendRedirect("../telaHabilitarCandidatos.jsp");

        %>
</html>
