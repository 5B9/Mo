
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #titulo{
        text-align: center;
    }
</style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agendamentos</title>
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
            <div class="row">
                <a href="Agendamento.jsp" class="  light-blue darken-4 waves-effect waves-light btn col s6" value="" style="color: white;">Sessões abertas</a>
                <a href="agendamentoFinalizado.jsp" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Sessões finalizadas</a>
            </div>
            <br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <th>Data</th>
                                        <th>Local</th>
                                        <th>Horário</th>
                                        <th>Cargo</th>
                                        <th>Tipo Sessão</th>
                                        <th>Alterar</th>
                                        <th>Finalizar</th>
                                        <th>Excluir</th>
                                        <th>Entrevistas</th>
                                    </tr>
                                </thead>
                                <%ControleAgendamento controleAgendamento = new ControleAgendamento();
                                    AgendamentoEntrevista agendamento = new AgendamentoEntrevista();%>

                                <%
                                    if (controleAgendamento.consultarTodosAgendamentos(agendamento) != null) {
                                        for (AgendamentoEntrevista a : controleAgendamento.consultarTodosAgendamentos(agendamento)) {
                                            if (a.isDesabilitar() == false) {
                                                if (a.getTipoSessao().equals("Técnica")) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=sdf.format(a.getDataSessao().getTime())%></td>
                                        <td><%=a.getLocalSessao()%></td>
                                        <td><%=sdfHora.format(a.getHoraInicio().getTime())%></td>
                                        <td><%=a.getCargoSessao()%></td>
                                        <td><%=a.getTipoSessao()%></td>
                                        <td>
                                            <a href="agendamentoAlterar.jsp?idAgendamento=<%=a.getIdSessao()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">refresh</i></a>
                                        </td>
                                        <td>
                                            <a href="scripts/agendamentoExcluir.jsp?idAgendamento=<%=a.getIdSessao()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">cancel</i></a>
                                        </td>
                                        <td>
                                            <a href="scripts/agendamentoExcluir.jsp?idAgendamento=<%=a.getIdSessao()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">delete</i></a>
                                        </td>
                                        <td>
                                            <a href="#modal1" class="waves-effect waves-light indigo btn modal-trigger"><i class="material-icons">assignment</i></a>
                                        </td>
                                    </tr>
                                </tbody>
                                <%}
                                        }
                                    } %>
                            </table>
                            <%
                            } else {
                            %>
                            <tbody>
                                <tr>
                                    <td>Não há nenhum processo de entrevista no momento</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>  
                            <%    }    %>

                            <div id="modal1" class="modal">
                                <div class="modal-content">
                                    <h4 id="titulo">Entrevistas</h4>
                                    <div class="modal-body">
                                        <table class="highlight">
                                            <thead>
                                                <tr>
                                                    <th>Funcionarios Presidindo</th>
                                                    <th>Candidatos</th>
                                                    <th>Fase Psicológica</th>
                                                    <th>Fase Técnica</th>
                                                    <th>Cargo</th>
                                                </tr>
                                            </thead>
                                            <%    ControleEntrevista controleEntrevista = new ControleEntrevista();
                                                Entrevista entrevista = new Entrevista();%>
                                            <%
                                                if (controleEntrevista.consultarTodasEntrevistas(entrevista) == null) { %>
                                            <tbody>
                                                <tr>
                                                    <td>Não há nenhum processo de entrevista no momento</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tbody>   
                                            <% } else {

                                                for (Entrevista e : controleEntrevista.consultarTodasEntrevistas(entrevista)) {

                                            %>
                                            <tbody>
                                                <tr>
                                                    <td><%=e.getFuncionarioMinistrante().getNomeCompleto()%></td>
                                                    <td><%=e.getCandidato().getNomeCompleto()%></td>
                                                    <%if (e.getFasePsicologica().equals("aprovado")) {%>
                                                    <td>Aprovado</td>
                                                    <%
                                                    } else if (e.getFasePsicologica().equals("reprovado")) {%>
                                                    <td>Reprovado</td>
                                                    <%} else { %>
                                                    <td>Em Andamento...</td>
                                                    <%}%>
                                                    <%if (e.isFaseTecnica() == true) {%>
                                                    <td>Aprovado</td>
                                                    <%} else {%>
                                                    <td>Reprovado</td>
                                                    <%}%>
                                                    <td><%= e.getCargo().getNomeCargo()%></td>
                                                </tr>
                                            </tbody>
                                            <%}
                                                }%>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Fechar</a>
                                </div>
                            </div>
                            <br>
                            <center>
                                <a href="agendamentoCadastro.jsp"class="waves-effect waves-indigo btn-small indigo "><i class="material-icons right">create</i>Cadastrar</a>
                            </center>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.modal').modal();
            });
        </script>
        
    </body>
</html>
