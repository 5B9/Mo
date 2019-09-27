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
        
         <meta charset="utf-8"/>
        <title>Envio de Mensagens</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>

        <main>
            <%
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %>
            <p> Acesso Negado </p>
            <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
            <%} else {%>
            <br>
            <%
                int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
                ControleCandidato controleCandidato = new ControleCandidato();
                Candidato c = controleCandidato.consultarCandidatoPorId(idCandidato);


            %>

            <div class="container" style="width: 50%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                              
                            <form class="col s12" action="scripts/enviarEmail.jsp" method="post" >

                                <div class="row">
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">alternate_email</i>
                                        <input placeholder="" id="enderecoEmail" type="text" name="enderecoEmail" value="<%=c.getEnderecoEmail()%>"class="validate">
                                        <label for="enderecoEmail">Endereço de Email</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">email</i>
                                        <input placeholder="" id="assunto" type="text" name="assunto" class="validate">
                                        <label for="assunto">Assunto</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                         <i class="material-icons prefix">chat</i>
                                        <textarea id="mensagem" name="mensagem" class="materialize-textarea" data-length="250"></textarea>
                                        <label for="mensagem">Mensagem</label>
                                    </div>
                                </div>

                                <center>
                                <div class='row'>
                                    <button type='submit' name='email' value="Enviar" class='col s12 btn btn-large waves-effect indigo'>Enviar</button>
                                </div>
                            </center>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
    </body>
</html>
