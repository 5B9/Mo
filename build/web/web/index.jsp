<%-- 
    Document   : index
    Created on : HOJE/DESSE MÊS/2018, 00:00:09
    Author     : EU!
--%>
<%@page import=" br.edu.ifpr.irati.modelo.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
            //lel
        %>
        <meta charset="utf-8"/>
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
    <header>

        <jsp:include page="cabecalho.jsp" flush="true" />

    </header>
   
        

        <main>
            <% if (u != null) {
                 
                    if (u.getTipoUsuario().equals("funcionario")) {


            %>
            <ul id="slide-out" class="sidenav" style="background-color: #004080;">
                <li><div class="user-view">
                        <div class="background">
                            <img src="imagens/Acome_1.jpeg">
                        </div>
                        <a href="#user"><img class="circle" src="imagens/fotos/foto5.png"></a>
                        <a href="#name"><span class="black-text name"><%=u.getNomeUsuario()%></span></a>
                        <a href="#email"><span class="black-text email"><%=u.getEnderecoEmail()%></span></a>
                    </div></li>

                <li><a href="funcionarioAlterar.jsp?idFuncionario=<%=u.getIdPessoa()%>" class="white-text">Alterar Dados Pessoais</a></li>
                <li><div class="divider"></div></li>

                <li><a class="waves-effect white-text" href="usuarioAlterar.jsp?idFuncionario=<%=u.getIdPessoa()%>" > Alterar dados de usuário</a></li>
            </ul>
            <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>


            <% } else { %>

            <div class="carousel carousel-slider center" >
                <div class="carousel-fixed-item center">

                </div>
                <div class="carousel-item red white-text" href="#one!">
                    <h2>Deseja criar uma conta?</h2>
                    <p class="white-text"></p>
                    <a class="btn waves-effect white grey-text darken-text-2" href="usuarioCadastro.jsp">Criar Conta</a>
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

            <%
                    }
                }%>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
    

    <script>
        $('.carousel.carousel-slider').carousel({
            fullWidth: true,
            indicators: true
        }
        );
    </script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems, options);
        });

        // Initialize collapsible (uncomment the lines below if you use the dropdown variation)
        // var collapsibleElem = document.querySelector('.collapsible');
        // var collapsibleInstance = M.Collapsible.init(collapsibleElem, options);
    </script>
    </body>
</html>

