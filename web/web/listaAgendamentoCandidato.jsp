
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agendamentos de Entrevistas</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>

        <main>
            <%
                if (!logado) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <br><br><br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <table class="highlight" >
                                <thead>
                                    <tr>
                                        <th>Data</th>
                                        <th>Local</th>
                                        <th>Horário</th>
                                        <th>Cargo</th>
                                        <th>Entrar no processo</th>
                                    </tr>
                                </thead>



                                <% ControleAgendamento controleAgendamento = new ControleAgendamento();
                                    AgendamentoEntrevista agendamento = new AgendamentoEntrevista();
                                    ControleCandidato controleCandidato = new ControleCandidato();
                                    Candidato candidato = new Candidato();
                                    candidato = controleCandidato.consultarCandidatoPorId(u.getIdPessoa());
                                    if (controleAgendamento.consultarTodosAgendamentos(agendamento) == null) { %>
                                <tbody>
                                    <tr>
                                        <td>Não há agendamentos para o seu cargo desejado no momento</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>   
                                <%      } else {
                                    for (AgendamentoEntrevista a : controleAgendamento.consultarTodosAgendamentos(agendamento)) {
                                        if (candidato.getCargoDesejado().equals(a.getCargoSessao()) != false) {


                                %>
                              
                               
                                <tbody>
                                    <tr>
                                        <td><%=sdf.format(a.getDataSessao().getTime())%></td>
                                        <td><%=a.getLocalSessao()%></td>
                                        <td><%=sdfHora.format(a.getHoraInicio().getTime())%></td>
                                        <td><%=a.getCargoSessao()%></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn-floating btn waves-effect waves-light indigo"><i class="material-icons">add</i></a></td>
                                    </tr>
                                </tbody>
                                <%
                                } %>

                                <%
                                            
                                        }
                                    }

                                %>

                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <% 
                }%>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
    </body>
</html>
