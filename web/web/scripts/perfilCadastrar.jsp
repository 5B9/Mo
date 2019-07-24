
<<<<<<< HEAD
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCurriculo"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="br.edu.ifpr.irati.modelo.Curriculo"%>
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
            request.setCharacterEncoding("UTF-8");

            int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
            String escolaridade = request.getParameter("escolaridade");
            String cargoDesejado = request.getParameter("cargoDesejado");
            String nomeUsuario = request.getParameter("nomeUsuario");
            String senha = request.getParameter("senha");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String nomeCompleto = request.getParameter("nomeCompleto");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String sexo = request.getParameter("sexo");
            String enderecoEmail = request.getParameter("endereco"); 
            boolean perfil = true;
            String idade = request.getParameter("idade"); 
            

           /* Candidato c = new Candidato(escolaridade, cargoDesejado, idade, "", perfil, nomeUsuario, senha, tipoUsuario, idCandidato , nomeCompleto, cpf, rg, sexo, enderecoEmail);
            ControleCandidato controleCandidato = new ControleCandidato();
            controleCandidato.alterarCandidato(c);
            */
           response.sendRedirect("../index.jsp");

        %>
    </body>
</html>
