
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.modelo.Entrevista"%>
<%@page import="br.edu.ifpr.irati.controle.ControleEntrevista"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8"/>
        <title>SGC Acome</title>
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
            <%
                int idEntevista = Integer.parseInt(request.getParameter("idEntrevista"));
                ControleEntrevista e = new ControleEntrevista();
                Entrevista ei = e.consultarEntrevistaPorId(idEntevista);
            %>

                <br>
                <div class="container" style="width: 40%; height:30%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content">
                                <div class="row">
                                    <form class="col s12" action="scripts/finalizarProcesso.jsp" method="post" name="formulario">



                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="hidden" name="idEntrevista" value="<%= idEntevista%>"class="validate"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <div class="input-field col s12">
                                                    <i class="material-icons prefix">people_outline</i>
                                                    <select name="fasePsicologica">


                                                        <option value="aprovado">Aprovado</option>

                                                        <option value="reprovado">Reprovado</option>

                                                    </select>
                                                    <label>Andamento na Entrevista Psicológica</label>
                                                </div>
                                            </div>
                                        </div>
                                            <center>
                                        <button  class="waves-effect waves-light btn indigo " type="submit" name="salvar" onclick="return validar()"><span>Finalizar</span></button>
                                            </center>

                                    </form>


                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
  <% }%>
            
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js">

        </script>  
        <script>
            $(document).ready(function () {
                $('select').formSelect();
            });
        </script>
        <script>
            function validar() {
                if (document.formulario.funcionario.value == "") {
                    alert("Por favor, insira o nível de escolaridade do candidato.");
                    return false;
                } else if (document.formulario.cargo.value == "") {
                    alert("Por favor, insira o cargo desejado.");
                    return false;
                } else if (document.formulario.candidato.value == "") {
                    alert("Por favor, insira o candidato que fará a entrevista.");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
