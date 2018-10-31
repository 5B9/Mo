
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
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
              <center>
                      <%
                if(!logado || u.getTipoUsuario().equals("candidato")){
                   %> <p> Acesso Negado </p>
                    <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
             <%} else{ %>
                <div class="row">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content white-text ">
        
            <%
                int idCargo = Integer.parseInt(request.getParameter("idCargo"));
                ControleCargo cc = new ControleCargo();
                Cargo c = cc.consultarCargoPorId(idCargo);
            %>

            <div class="row">
                
                <form class="col s12" action="scripts/cargoAlterar.jsp" method="post">

                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="hidden" name="id" value="<%= idCargo %>" class="validate"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="..." id="first_name" type="text" name="vagas" value="<%=c.getQtdVagas()%>" class="validate">
                            <label for="vagas">Quantidade de Vagas</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="...." id="first_name" type="text" name="descricao" vagas="<%=c.getDescricao()%>" class="validate">
                            <label for="descricao">Descrição</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="..." id="first_name" type="text" name="nome" value="<%=c.getNomeCargo()%>" class="validate">
                            <label for="nome">Nome Cargo</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="1300" id="first_name" type="text" name="salario" value="<%=c.getSalario()%>" class="validate">
                            <label for="salario">Salário</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="..." id="first_name" type="text" name="modalidade" value="<%=c.getModalidade()%>" class="validate">
                            <label for="modalidade">Modalidade</label>
                        </div>
                    </div>
                            
                    <input type="submit" name="salvar" value="Alterar!" class="waves-effect waves-indigo darken-3 btn-flat"/>
                
                </form>

            </div>
<% } %>
                            </div>
                        </div>
                    </div>
                </div>
              </center>
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
