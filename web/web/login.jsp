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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
<header>

        <jsp:include page="cabecalho.jsp" flush="true" />

    </header>


    <%String e = request.getParameter("e");
        String mensagem = "";
        if (e != null) {
            mensagem = e;
        }%>
    <body>
        <div class="section"></div>
        <main>
            <center>
                
                <div class="section"></div>

                <p><%=mensagem%></p>
                <div class="section"></div>
              <!--   <img class="responsive-img" style="width: 60px; height: 60px; margin-top: -47px;" src="imagens/acome.jpg"/> --> 
                <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 40px 0px 20px; border: 1px solid #EEE;">

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
            </center>

            <div class="section"></div>
            <div class="section"></div>
        </main>
                 <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script> 
    </body>
   
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

    <script>
     document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.autocomplete');
    var instances = M.Autocomplete.init(elems, options);
  });

    </script>
    
</html>
