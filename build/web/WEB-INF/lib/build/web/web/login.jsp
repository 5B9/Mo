<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<html>
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
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <title>Login</title>
    </head>
    <%String e = request.getParameter("e");
        String mensagem = "";
        if (e != null) {
            mensagem = e;
        }%>
    <body>

        <div class="section"></div>
        <main>
            <center>
                <img class="responsive-img" style="width: 60px; height: 60px;" src="imagens/acome.jpg"/>    
                <div class="section"></div>
            </center>
            <p><%=mensagem%></p>
            <div class="row">
                <%
                    ControleCargo Controlecargos = new ControleCargo();
                    for (Cargo c : Controlecargos.consultarTodosCargos()) {%>
                <div class="col s12 m6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title"><%=c.getNomeCargo()%></span>
                            <p><%=c.getDescricao()%></p>
                        </div>
                        <div class="card-action">
                            <a href="#">This is a link</a>
                            <a href="#">This is a link</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
                <div class="carousel carousel-slider center">
                    <div class="carousel-fixed-item center">
                        <a class="btn waves-effect white grey-text darken-text-2">button</a>
                    </div>
                    <div class="carousel-item red white-text" href="#one!">
                        <h2>First Panel</h2>
                        <p class="white-text">This is your first panel</p>
                    </div>
                    <div class="carousel-item amber white-text" href="#two!">
                        <h2>Second Panel</h2>
                        <p class="white-text">This is your second panel</p>
                    </div>
                    <div class="carousel-item green white-text" href="#three!">
                        <h2>Third Panel</h2>
                        <p class="white-text">This is your third panel</p>
                    </div>
                    <div class="carousel-item blue white-text" href="#four!">
                        <h2>Fourth Panel</h2>
                        <p class="white-text">This is your fourth panel</p>
                    </div>
                </div>
            
                <div class="col s12 m6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <form class="col s12" action="scripts/login.jsp" method="post">
                                <div class='row'>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='text' name='usuario' id='usuario' />
                                        <label for='usuario'>Usuário:</label>
                                    </div>
                                </div>
                                <div class='row'>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='password' name='senha' id='senha' />
                                        <label for='senha'>Senha: </label>
                                    </div>
                                    <label style='float: right;'>
                                        <a class='pink-text' href="esqueceuSenha.jsp"><b>Esqueceu a senha?</b></a>
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
                        <div class="card-action">
                            <a href="#">This is a link</a>
                            <a href="#">This is a link</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="usuarioCadastro.jsp">Criar Conta</a><br>
            <a href="index.jsp">Voltar</a><br>
            <div class="section"></div>
            <div class="section"></div>
        </main>
    </body>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

    <script>
    </script>

</html>

