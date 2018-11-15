

<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <center>
                <%
                    if (!logado || u.getTipoUsuario().equals("candidato")) {
                %> <p> Acesso Negado </p>
                <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
                <%} else { %>
                <div class="container" style="width: 50%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content white-text ">

                                <div class="row">
                                    <form class="col s12" action="scripts/cargoCadastrar.jsp" method="post" name="formulario">

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="..." id="first_name" type="text" name="vargas"class="validate">
                                                <label for="vagas">Quantidade de Vagas</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="..." id="first_name" type="text" name="descricao"class="validate">
                                                <label for="descricao">Descrição</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="...." id="first_name" type="text" name="nome"class="validate">
                                                <label for="nome">Nome Cargo</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="1300" id="first_name" type="text" name="salario"class="validate">
                                                <label for="salario">Salário</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <select  name="modalidade">
                                                    <option value="" disabled selected>Modalidade</option>
                                                    <option value="CLT">CLT</option>
                                                    <option value="Contrato">Contrato</option>
                                                </select>
                                                <label for="modalidade">Modalidade</label>
                                            </div>
                                        </div>

                                        <input type="submit" name="salvar" value="Cadastrar" onclick="return validar()" class="waves-effect waves-teal btn indigo"/>
                                    </form>

                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </center>
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
        <!--Receber os clientes pela cabeça, assim, pela cabeça, agarrá-los cabeça e ,com toda a sua cabeça, jooj-->
        <script>
            function validar() {
                if (document.formulario.vargas.value == "") {
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
