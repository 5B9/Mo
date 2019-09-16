<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%

            int id = Integer.parseInt(request.getParameter("idFuncionario"));

            ControleFuncionario controleFuncionario = new ControleFuncionario();
            Funcionario f = controleFuncionario.consultarFuncionarioPorId(id);
            Funcionario funcionario = new Funcionario(f.getMatricula(), f.getTipoFuncionario(), f.getDataAdmissao(), f.getTipoUsuario(), id, f.getNomeCompleto(), f.getCpf(), f.getRg(), f.getSexo(), f.getEnderecoEmail(), true);
            controleFuncionario.alterarFuncionario(funcionario);

            response.sendRedirect("../listaFuncionarios.jsp");
         %>
    </body>
</html>
