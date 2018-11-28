<%-- 
    Document   : index
    Created on : HOJE/DESSE MÊS/2018, 00:00:09
    Author     : EU!
--%>
<%@page import=" br.edu.ifpr.irati.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <header>
        
        <jsp:include page="cabecalho.jsp" flush="true" />
        
    </header>
    <body>

        <main>
            <% if (u != null) {
                 
            if(u.getTipoUsuario().equals("funcionario")){
                
            
                 
            %>
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
             }   }%>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
    </body>

    <script>
        $('.carousel.carousel-slider').carousel({
            fullWidth: true,
            indicators: true
        }
        );
    </script>
    <script>
   
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, options);
  });

  // Initialize collapsible (uncomment the lines below if you use the dropdown variation)
  // var collapsibleElem = document.querySelector('.collapsible');
  // var collapsibleInstance = M.Collapsible.init(collapsibleElem, options);
  </script>
</html>
