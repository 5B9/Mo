

<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar</title>
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
            <div class="row">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content">
                            <div class="row">
                                <form class="col s12" action="scripts/agendamentoCadastro.jsp" method="post">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input placeholder="" id="first_name" type="text" name="local" class="validate">
                                            <label for="local">Local</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                  <input placeholder="12/12/2012" id="first_name" type="date" name="dataSessao" class="validate">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input placeholder="10:30:15" id="first_name" type="text" name="hora" class="validate">
                                            <label for="Horario de Início">Horario de Início</label>
                                        </div>
                                    </div>

                                    <input type="submit" name="salvar" value="Cadastrar!" class="waves-effect waves-purple btn-flat"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('select').formSelect();
            });
        </script>
        <script>
            $(document).ready(
                    function () {
                        $('.datepicker').datepicker();
                       
                    }
            );

        </script>
    </body>
</html>
