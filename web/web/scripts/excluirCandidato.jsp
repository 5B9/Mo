
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id =Integer.parseInt(request.getParameter("idCandidato"));

            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato candidato = controleCandidato.consultarCandidatoPorId(id);
            Candidato c = new Candidato(candidato.getEscolaridade(), candidato.getCargoDesejado(), candidato.getIdade(), candidato.getFormacoesProfissionais(),true,true, candidato.getNomeUsuario(), candidato.getSenha(), candidato.getTipoUsuario(), id, candidato.getNomeCompleto(), candidato.getCpf(), candidato.getRg(), candidato.getSexo(), candidato.getEnderecoEmail()); 
            //controleCandidato.excluirCandidato(controleCandidato.consultarCandidatoPorId(id));
            controleCandidato.alterarCandidato(c);
            response.sendRedirect("../listaCandidatos.jsp");
        %>
    </body>
</html>

