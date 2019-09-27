
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>

            <%
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <br><br>


            <%
                int idCargo = Integer.parseInt(request.getParameter("idCargo"));
                ControleCargo cc = new ControleCargo();
                Cargo c = cc.consultarCargoPorId(idCargo);
            %>
            <div class="container" style="width: 40%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content">
                            <div class="row">

                                <form name="formulario"class="col s12" action="scripts/abrirVagas.jsp" method="post">
                                    <center>
                                    <div class="row"><input placeholder="" id="first_name" type="hidden" name="idCargo" value="<%=idCargo%>" class="validate"/>
                                        <div class="row">
                                            <div class="input-field col s11">
                                                <i class="material-icons prefix">looks_one</i>
                                                <input placeholder="" id="vagas" type="number" name="vagas" value="..." class="validate">
                                                <label for="vagas">Quantidade de Vagas para abertura</label>
                                            </div>
                                        </div>
                                    </div>
                                    </center>
                                    <div class="row" >
                                        <center>
                                            <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick="return validar()"><span>Adicionar</span></button>
                                        </center>  
                                    </div>

                                </form>



                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


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
                if (document.formulario.vagas.value == "") {
                    alert("Por favor, insira a quantdade de vagas.");
                    return false;
                } else if (document.formulario.descricao.value == "") {
                    alert("Por favor, insira a descrição desse cargo.");
                    return false;
                } else if (document.formulario.nome.value == "") {
                    alert("Por favor, insira o nome desse cargo.");
                    return false;
                } else if (document.formulario.salario.value == "") {
                    alert("Por favor, insira o motivo desse cargo.");
                    return false;
                } else if (document.formulario.modalidade.value == "") {
                    alert("Por favor, insira a modalidade.");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
