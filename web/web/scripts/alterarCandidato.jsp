
<%@page import="br.edu.ifpr.irati.modelo.Curriculo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            int id = Integer.parseInt(request.getParameter("idCandidato"));
            String escolaridade = request.getParameter("escolaridade");
            String cargoDesejado = request.getParameter("cargoDesejado");
            String nomeUsuario = "";
            String senha = "";
            String tipoUsuario = request.getParameter("tipoUsuario");
            String nomeCompleto = request.getParameter("nomeCompleto");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String sexo = request.getParameter("sexo");
            String enderecoEmail = request.getParameter("endereco");
            String idade = request.getParameter("idade");
            String formacoesAcademicas = request.getParameter("formacoesAcademicas");
            String formacoesComplementares = request.getParameter("formacoesComplementares");
            String formacoesProfissionais = request.getParameter("formacoesProfisionais");
            
            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato candidato = controleCandidato.consultarCandidatoPorId(id);
            Candidato c = new Candidato(escolaridade, cargoDesejado, idade, formacoesProfissionais, formacoesAcademicas, formacoesComplementares, tipoUsuario, id, nomeCompleto, cpf, rg, sexo, enderecoEmail);

            
            controleCandidato.alterarCandidato(c);
            response.sendRedirect("../listaCandidatos.jsp");

        %>
    </body>
</html>
