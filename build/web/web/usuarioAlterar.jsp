<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page import="br.edu.ifpr.irati.modelo.Curriculo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCurriculo"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
 
        <main>
            <center>
                <br>
                <div class="container" style="width: 30%; height:70%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content white-text ">
                                <%
                                    int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
                                    ControleFuncionario controle = new ControleFuncionario();
                                    Funcionario f = new Funcionario();
                                    f = controle.consultarFuncionarioPorId(idFuncionario);
                                %>
                                <div class="row">
                                    <form class="col s12" action="scripts/usuarioAlterar.jsp" name="formulario" method="post">



                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="nomeUsuario"  value="<%=f.getNomeUsuario()%>" class="validate">
                                                <label for="nomeUsuario">Nome de Usuário</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="password" name="senha" value="<%=f.getSenha()%>" class="validate">
                                                <label for="senha">senha</label>
                                            </div>
                                        </div>

                                   


                                        <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick="return validar()"><span>Alterar</span></button>
                                    </form>    
                                </div>

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
        <script>
            function validar() {
                 if (document.formulario.nomeUsuario.value == "") {
                    alert("Por favor, insira o seu nome de usuário.");
                    return false;
                } else if (document.formulario.senha.value == "") {
                    alert("Por favor, insira a sua senha.");
                    return false;
                
            }
        </script>        
    </body>
</html>
