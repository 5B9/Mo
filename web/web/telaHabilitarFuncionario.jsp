
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários</title>
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
                <a href="listaFuncionarios.jsp" class="grey lighten-5 waves-effect waves-light btn col s6  " value="" style="color: gray;">Funcionários Habilitados</a>
                <a href="telaHabilitarFuncionario.jsp" class="light-blue darken-4 waves-effect waves-light btn col s6" value="" style="color: white;">Funcionários Desabilitados</a>
            </div>
            <br>
            <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <table class="highlight">
                                <thead>
                                    <tr>
                                        <th>Nome Completo</th>
                                        <th>Tipo</th>
                                        <th>Matrícula</th>
                                        <th>Alterar</th>
                                        <th>Desabilitar</th>
                                    </tr>
                                </thead>


                                <tbody>
                                    <%ControleFuncionario controleFuncionario = new ControleFuncionario();

                                        for (Funcionario f : controleFuncionario.consultarTodosFuncionarios()) {
                                            if (f.isDesabilitar()) {

                                    %>
                                    <tr>
                                        <td><%=f.getNomeCompleto()%></td>
                                        <td><%=f.getTipoFuncionario()%></td>
                                        <td><%=f.getMatricula()%></td>

                                        <td>
                                            <a href="funcionarioAlterar.jsp?idFuncionario=<%=f.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                                        </td>
                                        <td>
                                            <a href="scripts/funcionarioExcluir.jsp?idFuncionario=<%=f.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">delete</i></a>
                                        </td>

                                    </tr>
                                </tbody>
                                <%} else {
                                %>
                                <tr>

                                    <td>Nenhum funcionário desabilitado</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                                <%
                                        }
                                    }%>

                            </table>

                            <br>
                            <center>
                                <a href="funcionarioCadastro.jsp"class="waves-effect  btn-small indigo "><i class="material-icons right">create</i>Cadastrar</a> 

                            </center>
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
