<%-- 
    Document   : cabecalho
    Created on : 08/05/2018, 13:20:35
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.ItemMenu"%>
<%@page import="br.edu.ifpr.irati.controle.ControlePaginas"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav>
    <div class="nav-wrapper indigo darken-3">
        <a href="index.jsp" class="brand-logo">Currículos</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons left left">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <%

                session = request.getSession();
                Usuario u = (Usuario) session.getAttribute("usuario");
                boolean logado = false;
                if (u != null) {
                    logado = true;
                }

            %>


            <%                        if (u != null) {
                    if (u.getTipoUsuario().equals("funcionario")) {

            %>

            <li><a href="listaCandidatos.jsp"><i class="material-icons left">face</i>Candidatos</a></li>
            <li><a href="listaFuncionarios.jsp"><i class="material-icons left">person</i>Funcionários</a></li>
            <li><a href="listaEntrevistas.jsp"><i class="material-icons left">add_box</i>Entrevistas</a></li>
            <li><a href="listaCargos.jsp"><i class="material-icons left">border_color</i>Cargos</a></li>
            <li><a href="Agendamento.jsp"><i class="material-icons left">insert_invitation</i>Agendamentos</a></li>
            <li><a href="scripts/logout.jsp"><i class="material-icons left">cancel</i>Logout</a></li> 
                <%                    }
                    }

                %>


            <%                        if (u != null) {
                    if (u.getTipoUsuario().equals("candidato")) {

            %>

            <li><a href="perfil.jsp"><i class="material-icons left">face</i>Perfil Candidato</a></li>
            <li><a href="scripts/logout.jsp"><i class="material-icons left">cancel</i>Logout</a></li> 

            <%                }
            } else {


            %>
            <li><a href="usuarioCadastro.jsp"><i class="material-icons left">account_circle</i>Usuario</a></li> 
            <li><a href="login.jsp"><i class="material-icons left">power_settings_new</i>Login</a></li> 

            <% }
            %>
        </ul>
    </div>
</nav>

<script type="text/javascript">
    /*
     document.addEventListener('DOMContentLoaded', function () {
     var elems = document.querySelectorAll('.sidenav');
     var instances = M.Sidenav.init(elems, options);
     }); */

    // Or with jQuery

    $(document).ready(function () {
        $('.sidenav').sidenav();
    });
</script>