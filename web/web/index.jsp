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
            <p>
                <% if (u != null) {
                %><p><%u.getNomeCompleto();%></p>
            <% } else { %><p>Nenhum usuário Logado! 
            </p><% }%>
        </main>
  
    <footer>
        <jsp:include page="rodape.jsp" flush="true" />
    </footer>                
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>        
  </body>
</html>
