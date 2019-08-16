
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            int id = Integer.parseInt(request.getParameter("id"));
            String data = request.getParameter("data");
            String nomeUsuario = request.getParameter("endereco");
            String senha = request.getParameter("senha");
            String tipoFuncionario = request.getParameter("tipoFuncionario");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String nomeCompleto = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String sexo = request.getParameter("sexo");
            String endereco = request.getParameter("endereco");
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            Date dataAdm = sdf.parse(data);
            Funcionario funcionario = new Funcionario(matricula,tipoFuncionario, dataAdm, nomeUsuario, senha, tipoUsuario, id, nomeCompleto, cpf, rg, sexo, endereco);

            ControleFuncionario controleFuncionario = new ControleFuncionario();
            controleFuncionario.alterarFuncionario(funcionario);
            response.sendRedirect("../funcionarioLista.jsp");

        %>
    </body>
</html>
