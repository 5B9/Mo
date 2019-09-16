
<%@page import="br.edu.ifpr.irati.dao.FuncionarioDAO"%>
<%@page import="java.util.Date"%>
<
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

            String tipoFuncionario = request.getParameter("tipoFuncionario");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String data = request.getParameter("data");
            String nomeUsuario = request.getParameter("nomeUsuario");
            String senha = request.getParameter("senha");
            String nomeCompleto = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String sexo = request.getParameter("sexo");
            String endereco = request.getParameter("endereco");
            int matricula = Integer.parseInt(request.getParameter("matricula"));

            Date dataAdm = sdf.parse(data);

            if (funcionarioDAO.validarCadastros(nomeUsuario, senha)){
                Funcionario f = new Funcionario(matricula, tipoFuncionario, dataAdm, tipoUsuario, 0, nomeCompleto, cpf, rg, sexo, endereco);
                ControleFuncionario controleFuncionario = new ControleFuncionario();
                controleFuncionario.inserirFuncionario(f);
                response.sendRedirect("../funcionarioLista.jsp");
            }else{
                response.sendRedirect("../funcionarioLista.jsp");
                }
        %>
    </body>
</html>
