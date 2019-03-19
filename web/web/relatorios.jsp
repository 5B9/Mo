<%-- 
    Document   : index
    Created on : 03/12/2018, 00:00:09
    Author     : Altair & Guilherme
--%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorios</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%            if (!logado || u.getTipoUsuario().equals("candidato")) {
        %> <p> Acesso Negado </p>
        <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
        <%} else { %>
        <main>
            <nav>
                <div class="nav-wrapper">
                    <form>
                        <div class="input-field" style="width: 50%;">
                            <input id="search" type="search" required>
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>

                        </div>


                    </form>
                </div>
            </nav>

            <br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row" white-text>
                                <table class="highlight" 
                                       <thead>
                                        <tr>
                                            <th>Nome Completo</th>
                                            <th>Cargo Desejado</th>
                                            <th>Email</th>
                                            <th>Escolaridade</th>
                                            <th>Currículo</th>

                                           
                                        </tr>
                                    </thead>


                                    <tbody>
                                        <%
                                            ControleCandidato controleCandidato = new ControleCandidato();
                                            Candidato candidato = new Candidato();
                                            for (Candidato c : controleCandidato.consultarTodosCandidatos(candidato)) {%>
                                        <tr>
                                            <%----%><td><%=c.getNomeCompleto()%></td>
                                            <%----%><td><%=c.getCargoDesejado()%></td>
                                            <td><%=c.getEnderecoEmail()%></td>
                                            <td><%=c.getEscolaridade()%></td>
                                            <td><%=c.getCurriculo()%></td>
                                           

                                        </tr>
                                    </tbody>
                                    <%}%>

                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <% }%>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
