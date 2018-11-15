

<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
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
            String fasePsicologica = request.getParameter("fasePsicologica");
            boolean faseTecnica;

            String prasix = request.getParameter("faseTecnica");


            if (prasix.equals("aprovado")) {

                faseTecnica = true;

            } else {
                faseTecnica = false;
            }

            int idFuncionario = Integer.parseInt(request.getParameter("funcionario"));
            ControleFuncionario cf = new ControleFuncionario();
            Funcionario funcionario = cf.consultarFuncionarioPorId(idFuncionario);

            int idCargo = Integer.parseInt(request.getParameter("cargo"));
            ControleCargo cc = new ControleCargo();
            Cargo cargo = cc.consultarCargoPorId(idCargo);

            int idCandidato = Integer.parseInt(request.getParameter("candidato"));
            ControleCandidato cca = new ControleCandidato();
            Candidato candidato = cca.consultarCandidatoPorId(idCandidato);

            int idSessao = Integer.parseInt(request.getParameter("sessao"));
            ControleAgendamento controleAgendamento = new ControleAgendamento();
            AgendamentoEntrevista a = controleAgendamento.consultarAgendamentoPorId(idSessao);

            Entrevista e = new Entrevista(0, funcionario, cargo, fasePsicologica, faseTecnica, candidato);
            ControleEntrevista controleEntrevista = new ControleEntrevista();

            //a.getEntrevistas().add(e);
            controleEntrevista.inserirEntrevista(e);
            response.sendRedirect("../listaEntrevistas.jsp");

        %>
    </body>
</html>
