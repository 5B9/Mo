
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.AgendamentoEntrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleAgendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agendamentos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm:ss");
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>

        <main>
            <%
                if (!logado) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <table class="highlight">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Local</th>
                        <th>Horário</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>


                <tbody>
                    <%ControleAgendamento controleAgendamento = new ControleAgendamento();
                        AgendamentoEntrevista agendamento = new AgendamentoEntrevista();
                        for (AgendamentoEntrevista a : controleAgendamento.consultarTodosAgendamentos(agendamento)) {%>
                    <tr>
                        <%----%><td><%=sdf.format(a.getDataSessao().getTime())%></td>


                        <td><%=a.getLocalSessao()%></td>
                        <td><%=sdfHora.format(a.getHoraInicio().getTime())%></td>
                        <td>
                            <a href="agendamentoAlterar.jsp?idAgendamento=<%=a.getIdSessao()%>" class="waves-effect waves-indigo btn-flat "><i class="material-icons right">refresh</i>Alterar</a>
                        </td>
                        <td><a href="scripts/agendamentoExcluir.jsp?idAgendamento=<%=a.getIdSessao()%>" class="waves-effect waves-indigo btn-flat "><i class="material-icons right">delete</i>Excluir</a>
                        </td>

                    </tr>
                </tbody>
                <%}%>

            </table>
            <a href="agendamentoCadastro.jsp"class="waves-effect waves-indigo btn-flat "><i class="material-icons right">create</i>Cadastrar</a>
            <% }%>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
    </body>
</html>
