
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

                int matricula = Integer.parseInt(request.getParameter("matricula"));
                ControleFuncionario controle = new ControleFuncionario();
                Funcionario f = controle.consultarFuncionarioPorMatricula(matricula);
                if (f != null) {
                    Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);

                    ControleUsuario controleUsuario = new ControleUsuario();
                    controleUsuario.inserirUsuario(u);

                    response.sendRedirect("../login.jsp");
                }else{
                    
                    response.sendRedirect("../index.jsp?e= Cadastro Inválido!" );
                }
            }else{
                 Usuario u = new Usuario(nomeUsuario, senha, tipoUsuario);

                    ControleUsuario controleUsuario = new ControleUsuario();
                    controleUsuario.inserirUsuario(u);
                     response.sendRedirect("../login.jsp");
            }


        %>
    </body>
</html>
