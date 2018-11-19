<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>

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
            <style>
            </style>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
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
            <br><br>
            <div class="container" style="width: 30%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content">
                            <div class="row">
                                <form class=" col s12" action="scripts/agendamentoCadastro.jsp" method="post" name="formulario">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input placeholder="Rua ..." id="first_name" type="text" name="local" class="validate">
                                            <label for="local">Local</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input placeholder="12/12/2012" id="first_name" type="text" name="dataSessao" class="datepicker">
                                            <label for="Data">Data da Sessão</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input placeholder="12:12:00" type="text" class="timepicker" name="hora" >
                                            <label for="Horario de Início">Horario de Início</label>
                                        </div>
                                    </div>
                                    <center>
                                        <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick="return validar()"><span>Cadastrar</span></button>
                                    </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }%>

        </main>
        <br>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('.datepicker').datepicker({format: 'dd/mm/yyyy'});
                                            });
        </script>
        <script>
            $(document).ready(function () {
                $('.timepicker').timepicker({
                    twelveHour:false
                });
            });
        </script>
        <script>
            function validar() {
                if (document.formulario.local.value == "") {
                    alert("Por favor, insira o local onde dessa sessão.");
                    return false;
                } else if (document.formulario.dataSessao.value == "") {
                    alert("Por favor, insira a data dessa sessão.");
                    return false;
                } else if (document.formulario.hora.value == "") {
                    alert("Por favor, insira o horário de início dessa sessão.");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
