<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<html>
    <head>
        <style>
            body {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }
            main {
                flex: 1 0 auto;
            }
            body {
                background: #fff;
            }
            .input-field input[type=date]:focus + label,
            .input-field input[type=text]:focus + label,
            .input-field input[type=email]:focus + label,
            .input-field input[type=password]:focus + label {
                color: #e91e63;
            }
            .input-field input[type=date]:focus,
            .input-field input[type=text]:focus,
            .input-field input[type=email]:focus,
            .input-field input[type=password]:focus {
                border-bottom: 2px solid #e91e63;
                box-shadow: none;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%String e = request.getParameter("e");
            String mensagem = "";
            if (e != null) {
                mensagem = e;
            }%>
        <div class="section"></div>
        <main>
            <p><%=mensagem%></p>
            <!--   <img class="responsive-img" style="width: 60px; height: 60px; margin-top: -47px;" src="imagens/acome.jpg"/> --> 
            <div class="row">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <table class="highlight">
                                <tr>
                                    <th>Cargo</th>
                                    <th>Vagas</th>
                                    <th>Descrição</th>
                                    <th>?</th>
                                </tr>
                                <%ControleCargo controleCargo = new ControleCargo();
                                    for (Cargo c : controleCargo.consultarTodosCargos()) {%>
                                <tr>
                                    <td><%=c.getNomeCargo()%></td>
                                    <td><%=c.getQtdVagas()%></td>
                                    <td><%=c.getDescricao()%></td>
                                    <td>?</td>
                                </tr>
                                <%}%>
                            </table>
                            <br>
                            </div>
                    </div>
                </div>
                <div class="z-depth-1 grey lighten-4 row" style="display:inline-block; padding: 30px 40px 0px 20px; border: 1px solid #EEE;margin-top: 8px;">
                    <form class="col s12" action="scripts/login.jsp" method="post">
                        <div class='row'>
                            <div class='input-field col s12'>                                 
                                <input class='autocomplete' type='text' name='usuario' id='usuario' />
                                <label for='usuario'>Usuário:</label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='input-field col s12'>
                                <input class='autocomplete' type='password' name='senha' id='senha' />
                                <label for='senha'>Senha: </label>
                                <span class="helper-text" data-error="E-mail inválido" data-success="Ok!"></span>
                            </div>
                            <label style='float: right;'>
                                <a class='pink-text' href="esqueceuSenha.jsp"><b>Esqueceu a senha?</b></a>
                            </label>
                            <label style='float:left;'>
                                <a class='blue-text' href="usuarioCadastro.jsp"><b>Criar Conta</b></a><br>
                            </label>
                        </div>
                        <br>
                        <center>
                            <div class='row'>
                                <button type='submit' name='btn_login' value="Login" class='col s12 btn btn-large waves-effect indigo'>Login</button>
                            </div>
                        </center>
                    </form>
                </div>
            </div>
            <div class="section"></div>
            <div class="section"></div>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script> 
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js">

    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.autocomplete');
            var instances = M.Autocomplete.init(elems, options);
        });

    </script>

</html>
