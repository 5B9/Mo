
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
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
            <center>
                <%
                    if (!logado || u.getTipoUsuario().equals("candidato")) {
                %> <p> Acesso Negado </p>
                <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
                <%} else { %>
                <div class="container" style="width: 60%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content white-text ">

                                <div class="row">
                                    <form class="col s12" action="scripts/funcionarioCadastro.jsp" method="post">
                                        <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="funcionario"class="validate"/>
                                        
                                        <div class="center-row">
                                            <div class="input-field col s8">
                                                <div class="input-field col s6">
                                                    <select name="tipoFuncionario">
                                                        <option value="" disabled selected>Escolha o Tipo</option>
                                                        <option value="gerente">Gerente</option>
                                                        <option value="funcionario">Funcionário</option>
                                                    </select>
                                                    <label>Tipo de Funcionário</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="center-row">
                                            <div class="input-field col s4">
                                                <input placeholder="" id="first_name" type="text" name="matricula" class="validate">
                                                <label for="matricula">Nº matrícula</label>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="12/12/2012" id="first_name" type="text" name="data" class="validate">
                                                <label for="data">Data de admissão</label>
                                            </div>
                                        </div>

                                        <!--<div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="nomeUsuario" class="validate">
                                                <label for="nomeUsuario">Nome de Usuário</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="password" name="senha" class="validate">
                                                <label for="senha">senha</label>
                                            </div>
                                        </div>-->

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="nome" class="validate">
                                                <label for="nome">Nome Completo</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="cpf" class="validate">
                                                <label for="cpf">CPF</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="rg" class="validate">
                                                <label for="rg">RG</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <div class="input-field col s12">
                                                    <select name="sexo">
                                                        <option value="" disabled selected>Sexo</option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Feminino</option>
                                                    </select>
                                                    <label>Sexo</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="endereco" class="validate">
                                                <label for="endereco">Endereço de Email</label>
                                            </div>
                                        </div>


                                        <!--    <input type="submit" name="salvar" value="Cadastrar" class="waves-effect waves-ligth  btn indigo"/> -->
                                        <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar"><span>Cadastrar</span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <% }%>
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

    </body>
</html>
