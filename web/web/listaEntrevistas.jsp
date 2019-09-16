
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Entrevistas</title>
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
            <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <div class="row">
                <a href="listaEntrevistas.jsp" class="  light-blue darken-4 waves-effect waves-light btn col s6" value="" style="color: white;">Entrevistas em Andamento</a>
                <a href="telaHabilitarEntrevistas.jsp" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Entrevistas finalizadas</a>
            </div>
            <br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row" white-text>
                                <table class="highlight">
                                    <thead>
                                        <tr>
                                            <th>Funcionarios Presidindo</th>
                                            <th>Candidatos</th>
                                            <th>Fase Psicol�gica</th>
                                            <th>Fase T�cnica</th>
                                            <th>Cargo</th>
                                            <th>Enviar Mensagem</th>
                                            <th>Alterar</th>
                                            <th>Excluir</th>
                                            <th>Finalizar Processo</th>
                                        </tr>
                                    </thead>
                                    <%ControleEntrevista controleEntrevista = new ControleEntrevista();
                                        Entrevista entrevista = new Entrevista();
                                        if (controleEntrevista.consultarTodasEntrevistas(entrevista) == null) { %>
                                    <tbody>
                                        <tr>
                                            <td>N�o h� nenhum processo de entrevista no momento</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                        </tr>
                                    </tbody>   

                                    <tbody>

                                        <% } else {

                                            for (Entrevista e : controleEntrevista.consultarTodasEntrevistas(entrevista)) {
                                                if (e.isDesabilitar() == false) {
                                                    if (e.isSituacaoProcesso() == false) {
                                        %>
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

                                            <td>
                                                <a href="mensagens.jsp?idCandidato=<%=e.getCandidato().getIdPessoa()%>"  class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">send</i></a>
                                            </td>

                                            <td>
                                                <a href="entrevistaAlterar.jsp?idEntrevista=<%=e.getIdEntrevista()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                                            </td>

                                            <td>
                                                <a href="scripts/entrevistaExcluir.jsp?idEntrevista=<%=e.getIdEntrevista()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">delete</i></a>
                                            </td>

                                            <% if (!e.isSituacaoProcesso()) {%>
                                            <td>
                                                <a href="finalizarProcesso.jsp?idEntrevista=<%=e.getIdEntrevista()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">done_all</i></a>
                                            </td>
                                            <%}%>
                                        </tr>

                                    </tbody>
                                    <%}
                                                }
                                            }
                                        }%>
                                </table>
                            </div>
                            <br>

                            <center>
                                <a href="entrevistaCadastro.jsp"class="waves-effect waves-indigo btn-small indigo "><i class="material-icons right">create</i>Cadastrar</a>

                            </center>

                            <%}
                            %>
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
                $('select').formSelect();
            });


        </script>
    </body>
</html>
