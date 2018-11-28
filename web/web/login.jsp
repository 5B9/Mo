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

                <p><%=mensagem%></p>
                <div class="section"></div>

                <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 40px 0px 38px; border: 1px solid #EEE;">

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
                </div>
                <a href="usuarioCadastro.jsp">Criar Conta</a><br>
                <a href="index.jsp">Voltar</a><br>
            </center>

            <div class="section"></div>
            <div class="section"></div>
        </main>
    </body>
   
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.autocomplete');
            var instances = M.Autocomplete.init(elems, options);
        });


        // Or with jQuery

        $(document).ready(function () {
            $('input.autocomplete').autocomplete({
                data: {
                    "Apple": null,
                    "Microsoft": null,
                    "Google": 'https://placehold.it/250x250'
                },
            });
        });
    </script>
</html>
