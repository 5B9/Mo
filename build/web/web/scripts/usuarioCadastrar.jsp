<%@page import="br.edu.ifpr.irati.exception.PersistenciaException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
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
                ControleFuncionario controleFuncionario = new ControleFuncionario();
                ControleCandidato controleCandidato = new ControleCandidato();
                if (tipoUsuario.equals("funcionario")) {
                    if (controleFuncionario.validarCadastroFuncionarios(nomeUsuario, senha)) {
                        response.sendRedirect("../login.jsp?e=Nome de Usuário e senha inválidos");
                    } else {
                        //   int matricula = Integer.parseInt(request.getParameter("matricula"));
                        //   ControleFuncionario controle = new ControleFuncionario();
                        //   Funcionario f = controle.consultarFuncionarioPorMatricula(matricula);
                        //    if (f != null) {
                        Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);
                        Funcionario f = new Funcionario(0, "gerente", new Date(), nomeUsuario, senha, tipoUsuario, u.getIdPessoa(), "", "", "", "", "");
                        controleFuncionario.inserirFuncionario(f);
                        ControleUsuario controleUsuario = new ControleUsuario();
                        response.sendRedirect("../login.jsp");
                    }
                } else if (tipoUsuario.equals("candidato")) {
                    if (controleCandidato.validarCadastroCandidatos(nomeUsuario, senha)) {
                        response.sendRedirect("../login.jsp");
                    } else {
                        Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);
                        Candidato c = new Candidato("", "", "", "", false, false, nomeUsuario, senha, tipoUsuario, 0, "", "", "", "", "");
                        ControleUsuario controleUsuario = new ControleUsuario();
                        controleCandidato.inserirCandidato(c);
                        response.sendRedirect("../login.jsp");
                    }
                } else {
                    response.sendRedirect("../login.jsp?e=Nome de Usuario e senha inválidos");
                }
            
        %>
    </body>
</html>
