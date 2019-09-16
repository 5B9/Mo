
<%@page import="br.edu.ifpr.irati.util.Digest"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCurriculo"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Curriculo"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.dao.FuncionarioDAO"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String tipoUsuario = request.getParameter("tipo");
            String nomeUsuario = request.getParameter("nomeUsuario");
            String senha = request.getParameter("senha");

            if (tipoUsuario.equals("funcionario")) {

                //   int matricula = Integer.parseInt(request.getParameter("matricula"));
                //   ControleFuncionario controle = new ControleFuncionario();
                //   Funcionario f = controle.consultarFuncionarioPorMatricula(matricula);
                //    if (f != null) {
                Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);
                ControleUsuario controleUsuario = new ControleUsuario();
                ControleFuncionario controleFuncionario = new ControleFuncionario();
                String resumo2 = Digest.hashString(senha, "SHA-512");
                Funcionario f = new Funcionario(0, "gerente", new Date(), nomeUsuario, resumo2, tipoUsuario, u.getIdPessoa(), "", "", "", "", "");
                controleFuncionario.inserirFuncionario(f);
                response.sendRedirect("../login.jsp");
                // } else {

                //       response.sendRedirect("../index.jsp?e= Cadastro Inválido!");
                // }
            } else {
                Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);
                ControleUsuario controleUsuario = new ControleUsuario();
                ControleCandidato controleCandidato = new ControleCandidato();
                String resumo2 = Digest.hashString(senha, "SHA-512");
                Candidato c = new Candidato("", "", "", "", false, false, nomeUsuario, resumo2, tipoUsuario, u.getIdPessoa(), "", "", "", "", "");
                controleCandidato.inserirCandidato(c);
                response.sendRedirect("../login.jsp");
            }


        %>
    </body>
</html>
