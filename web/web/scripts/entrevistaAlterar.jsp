
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

                String fasePsicologica= request.getParameter("fasePsicologica");
                boolean faseTecnica;

                String prasix = request.getParameter("faseTeorica");
                

                int idEntrevista = Integer.parseInt(request.getParameter("idEntrevista"));

                int id = Integer.parseInt(request.getParameter("funcionario"));
                ControleFuncionario cf = new ControleFuncionario();
                Funcionario funcionario = cf.consultarFuncionarioPorId(id);

                int idCargo = Integer.parseInt(request.getParameter("cargo"));
                ControleCargo cc = new ControleCargo();
                Cargo cargo = cc.consultarCargoPorId(idCargo);

                int idCandidato = Integer.parseInt(request.getParameter("candidato"));
                ControleCandidato cca = new ControleCandidato();
                Candidato candidato = cca.consultarCandidatoPorId(idCandidato);

               
            if (prasix.equals("aprovado")) {

                faseTecnica = true;
                
            } else {
                faseTecnica = false;
                
           
            }
            
                Entrevista e = new Entrevista(idEntrevista, funcionario, cargo, fasePsicologica, faseTecnica, candidato, true);
                ControleEntrevista controleEntrevista = new ControleEntrevista();
                controleEntrevista.alterarEntrevista(e);

                response.sendRedirect("../listaEntrevistas.jsp");
            


        %>
    </body>
</html>
