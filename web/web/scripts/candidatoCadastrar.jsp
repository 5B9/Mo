

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
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
            String formacoesProfissionais = request.getParameter("formacoes");
            String idade = request.getParameter("idade");
            ControleCandidato controleCandidato = new ControleCandidato();
            if (controleCandidato.validarCadastroCandidatos(nomeUsuario, senha)) {
                response.sendRedirect("../candidatoLista.jsp?e=Cadastro inv�lido");
            } else {
                Candidato c = new Candidato(escolaridade, cargoDesejado, idade, formacoesProfissionais, "", "", tipoUsuario, 0, nomeCompleto, cpf, rg, sexo, enderecoEmail);
                controleCandidato.inserirCandidato(c);
                response.sendRedirect("../candidatoLista.jsp");
            }
            

        %>
    </body>
</html>
