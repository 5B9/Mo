<%-- 
    Document   : index
    Created on : 03/12/2018, 00:00:09
    Author     : Altair & Guilherme
--%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>

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
        <meta charset="utf-8"/>
        <title>Relatorios</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
            <br>
            <div class="container" style="width: 20%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="center-row">
                                <div class="input-field col s10">
                                    <div class="form-group input-group">
                                        <i class="material-icons prefix">search</i>
                                        <input placeholder="Consultar"  id="txt_consulta" type="text" name="consulta" class="form-control" >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row" white-text>
                                <table class="highlight" name="tabela" id="tabela"> 
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
                                            <td><%=c.getNomeCompleto()%></td>
                                            <td><%=c.getCargoDesejado()%></td>
                                            <td><%=c.getEnderecoEmail()%></td>
                                            <td><%=c.getEscolaridade()%></td>
                                            <td>  <a href="scripts/gerarCurriculo.jsp?idCandidato=<%=c.getIdPessoa()%>" class="btn-floating btn-large waves-effect waves-light  btn-small indigo "><i class="material-icons">description</i></a>


                                        </tr>
                                    </tbody>
                                    <%}%>

                                </table>



                            </div>

                            <center>
                                <a href="scripts/gerarPDF.jsp"class="waves-effect waves-light waves-darken-3 btn-small indigo "><i class="material-icons right"></i>Gerar Relatórios</a>
                            </center>



                        </div>
                    </div>
                </div>
            </div>
            <br><% }%>
        </main>


        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>  


        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $('input#txt_consulta').quicksearch('table#tabela tbody tr');
        </script>

    </body>
</html>
