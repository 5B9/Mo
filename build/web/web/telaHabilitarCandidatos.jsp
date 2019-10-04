
<%@page import="java.io.File"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidatos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>

    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
             <div class="row">
                <a href="candidatoLista.jsp" class="grey lighten-5 waves-effect waves-light btn col s6  " value="" style="color: gray;">Candidatos Habilitados</a>
                <a href="telaHabilitarCandidatos.jsp" class="light-blue darken-4 waves-effect waves-light btn col s6" value="" style="color: white;">Candidatos Desabilitados</a>
            </div>
            <br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row" white-text>
                                <table class="highlight" >
                                    <thead>
                                        <tr>
                                            <th>Nome Completo</th>
                                            <th>Cargo Desejado</th>
                                            <th>Email</th>
                                            <th>Escolaridade</th>
                                            <th>Idade</th>
                                            <th>Sexo</th>
                                            <!--  <th>Formações</th> -->
                                            <th>CPF</th>
                                            <th>Alterar</th>
                                            <th>Habilitar Candidato</th>
                                           
                                        </tr>
                                    </thead>


                                    <tbody>
                                        <%

                                            ControleCandidato controleCandidato = new ControleCandidato();
                                            Candidato candidato = new Candidato();
                                            for (Candidato c : controleCandidato.consultarTodosCandidatos(candidato)) {
                                                if (c.isDesabilitar()) {%>
                                        <tr>
                                            <td><%=c.getNomeCompleto()%></td>
                                            <td><%=c.getCargoDesejado()%></td>
                                            <td><%=c.getEnderecoEmail()%></td>
                                            <td><%=c.getEscolaridade()%></td>
                                            <td><%=c.getIdade()%> </td>
                                            <td><%=c.getSexo()%></td>
                                     <!--   <td><%=c.getFormacoesProfissionais()%></td> -->
                                            <td><%=c.getCpf()%></td>
                                  
                                            <td>
                                                <a href="candidatoAlterar.jsp?idCandidato=<%=c.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                                            </td>
                                            <td>
                                                <a href="scripts/habilitarCandidato.jsp?idCandidato=<%=c.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">add</i></a>
                                            </td>

                                        </tr>
                                    </tbody>
                                    <%} else {

                                            }
                                        }%>

                                </table>
                            </div>
                            <br>
                          
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
    </body>
</html>
