
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargos</title>
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
                if(!logado || u.getTipoUsuario().equals("candidato")){
                   %> <p> Acesso Negado </p>
                    <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
             <%} else{ %>
             <br><br><br>
             <div class="container" >
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
            <table class="highlight">
                <thead>
                    <tr>
                        <th>Nome Cargo</th>
                        <th>Quantidade Vagas</th>
                        <th>Descrição</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>


                <tbody>
                    <%ControleCargo controleCargo = new ControleCargo();
                        for (Cargo c : controleCargo.consultarTodosCargos()){%>
                    <tr>
                        <%----%><td><%=c.getNomeCargo()%></td>
                        <%----%><td><%=c.getQtdVagas()%></td>
                        <%----%><td><%=c.getDescricao()%></td>
                        <td>
                           <!-- <a href="cargoAlteracao.jsp?idCargo=<%=c.getIdCargo()%>" class="waves-effect waves-indigo darken-3 btn-flat "><i class="material-icons right">refresh</i>Alterar</a> -->
                            <a href="cargoAlteracao.jsp?idCargo=<%=c.getIdCargo()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                        </td>
                        <td><!--<a href="scripts/cargoExcluir.jsp?idCargo=<%=c.getIdCargo()%>" class="waves-effect  btn-flat "><i class="material-icons right">delete</i>Excluir</a> -->
                            <a href="scripts/cargoExcluir.jsp?idCargo=<%=c.getIdCargo()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">delete</i></a>
                        </td>
                       
                    </tr>
                </tbody>
                <%}%>

            </table>
                <br>
                <center>
            <a href="cargoCadastro.jsp"class="waves-effect waves-light waves-darken-3 btn-small indigo "><i class="material-icons right">create</i>Cadastrar</a>
                </center>
            <% } %>
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
