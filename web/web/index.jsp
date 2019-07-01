<%-- 
    Document   : index
    Created on : 03/12/2018, 00:00:09
    Author     : Altair & Guilherme
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
            
        %>
        <meta charset="utf-8"/>
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
           
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
    </body>

    
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems, options);
        });

         //Initialize collapsible (uncomment the lines below if you use the dropdown variation)
       var collapsibleElem = document.querySelector('.collapsible');
        var collapsibleInstance = M.Collapsible.init(collapsibleElem, options);
    </script>
</html>
