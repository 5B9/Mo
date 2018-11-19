<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>
            <%
                session = request.getSession();
                Usuario u = (Usuario) session.getAttribute("usuario");
                boolean logado = false;
                if (u != null) {
                    logado = true;
                }
            %>
            <%
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <%
                int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));
                ControleAgendamento a = new ControleAgendamento();
                AgendamentoEntrevista agendamento = a.consultarAgendamentoPorId(idAgendamento);
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm:ss");
            %>
            <div class="container" style="width: 30%;">
                <form class="col s12" action="scripts/agendamentoAlterar.jsp" method="post" name="formulario">
                    <div class="card grey lighten-5">
                        <div class="card-content white-text ">
                            <input placeholder="" id="first_name" type="hidden" name="idAgendamento" value="<%= idAgendamento%>" class="validate"/>

                            <div class="row">
                                <div class="input-field col s12">
                                    <input placeholder="" id="first_name" type="text" name="local" value="<%=agendamento.getLocalSessao()%>"class="validate">
                                    <label for="local">Local</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <input placeholder="12/12/2012" id="first_name" type="text" name="dia" value="<%=sdf.format(agendamento.getDataSessao().getTime())%>"class="datepicker">
                                    <label for="Dia do Evento">Data da Sessão</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <input placeholder="12:12:00" id="first_name" type="text" name="hora" value="<%=sdfHora.format(agendamento.getHoraInicio().getTime())%>"class="timepicker">
                                    <label for="Horario de Início">Horario de Início</label>
                                </div>
                            </div>

                            <center>
                                <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick="return validar()"><span>Cadastrar</span></button>
                            </center>

                        </div>
                        <% }%>
                    </div>
                </form>
            </div>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.datepicker').datepicker({format: 'mm/dd/yyyy'});
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.timepicker').timepicker({});
            });
        </script>
        <script>
            function validar() {
                if (document.formulario.local.value == "") {
                    alert("Por favor, insira o local onde dessa sessão");
                    return false;
                } else if (document.formulario.dia.value == "") {
                    alert("Por favor, insira a data dessa sessão");
                    return false;
                } else if (document.formulario.hora.value == "") {
                    alert("Por favor, insira o horário de início dessa sessão");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
