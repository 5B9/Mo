
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
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
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <div class="row">
                <a href="listaCargos.jsp" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Cargos com Vagas Abertas</a>
                <a href="" class="light-blue darken-4 waves-effect waves-light btn col s6" value="" style="color: white;">Cargos sem Vagas Abertas</a>
            </div>
            <br>
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
                                        <th>Modalidade</th>
                                        <th>Excluir</th>
                                        <th>Abrir Vaga</th>
                                    </tr>
                                </thead>


                                <tbody>
                                    <%ControleCargo controleCargo = new ControleCargo();
                                      List<Cargo> cargos = controleCargo.consultarTodosCargos();
                                      
                                      
                                        for(int i = 0; i < cargos.size(); i++) {
                                            if (cargos.get(i).getQtdVagas() == 0) {
                                    %>
                                    <tr>
                                        <td><%= cargos.get(i).getNomeCargo()%></td>
                                        <td><%=cargos.get(i).getQtdVagas()%></td>
                                        <td><%=cargos.get(i).getDescricao()%></td>
                                        <td><%=cargos.get(i).getModalidade()%></td>
                                        <td>
                                           <!-- <a href="cargoAlteracao.jsp?idCargo=<%=cargos.get(i).getIdCargo()%>" class="waves-effect waves-indigo darken-3 btn-flat "><i class="material-icons right">refresh</i>Alterar</a> -->
                                            <a href="cargoAlteracao.jsp?idCargo=<%=cargos.get(i).getIdCargo()%>" class="btn-floating btn waves-effect waves-light  indigo "><i class="material-icons">refresh</i></a>
                                        </td>
                                        <td><!--<a href="scripts/cargoExcluir.jsp?idCargo=<%=cargos.get(i).getIdCargo()%>" class="waves-effect  btn-flat "><i class="material-icons right">delete</i>Excluir</a> -->
                                            <a href="scripts/cargoExcluir.jsp?idCargo=<%=cargos.get(i).getIdCargo()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">delete</i></a>
                                        </td>

                                        <td>
                                            <a href="abrirVagas.jsp?idCargo=<%=cargos.get(i).getIdCargo()%>" class="btn-floating btn waves-effect waves-light indigo "><i class="material-icons">add</i></a>
                                        </td>

                                    </tr>
                                </tbody>

                                <%  } else { %> 
                  
                            
                                    <%

                                        }
                                    %>





                                    <%
                                        }
                                    %>

                            </table>
                         
                            
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
