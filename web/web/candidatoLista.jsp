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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
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
            <br><br><br>
            <div class="container" >
                <div class="col s12 m8">
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
                                            <th>Desabilitar</th>
                                        </tr>
                                    </thead>


                                    <tbody>
                                        <%

                                            ControleCandidato controleCandidato = new ControleCandidato();
                                            Candidato candidato = new Candidato();
                                            for (Candidato c : controleCandidato.consultarTodosCandidatos(candidato)) {
                                                if (c.isDesabilitar()) {%>
                                        <%} else {%>
                                        <tr>
                                            <td><%=c.getNomeCompleto()%></td>
                                            <td><%=c.getCargoDesejado()%></td>
                                            <td><%=c.getEnderecoEmail()%></td>
                                            <td><%=c.getEscolaridade()%></td>
                                            <td><%=c.getIdade()%> </td>
                                            <td><%=c.getSexo()%></td>
                                     <!--       <td><%//=c.getFormacoesProfissionais()%></td> -->
                                            <td id="cpf"><%=c.getCpf()%></td>
                                            <td>
                                                <a href="candidatoAlterar.jsp?idCandidato=<%=c.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                                            </td>
                                            <td>
                                                <a href="scripts/excluirCandidato.jsp?idCandidato=<%=c.getIdPessoa()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">delete</i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <script>
                                        $(document).ready(function () {
                                            var $campoCpf = $("#cpf");
                                            var $campoRg = $("#rg");
                                            $campoCpf.mask('000.000.000-00', {reverse: true});
                                            $campoRg.mask('000.000.000-00', {reverse: true});
                                        });
                                    </script>
                                    <%
                                            }
                                        }%>
                                </table>
                            </div>
                            <br>
                            <center>
                                <a href="candidatoCadastro.jsp" class="waves-effect waves-indigo btn-small indigo "><i class="material-icons right">create</i>Cadastrar</a>
                                <a href="telaHabilitarCandidatos.jsp" class="waves-effect waves-indigo btn-small indigo "><i class="material-icons right">loupe</i>Habilitar Candidatos</a>
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
    </body>
</html>