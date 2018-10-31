
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Cargo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
               <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>
            <%
                    if (!logado || u.getTipoUsuario().equals("candidato")) {
                %> <p> Acesso Negado </p>
                <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
                <%} else { %>
            <center>
                <div class="row">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content black-text ">
                                <div class="row">
                                    <form class="col s12" action="scripts/candidatoCadastro.jsp" method="post">




                                        <div class="row">
                                            <div class="input-field col s12">
                                                <div class="input-field col s12">
                                                    <select name="escolaridade">
                                                        <option value="" disabled selected>Escolaridade</option>
                                                        <option value="Ensino Fudamental Incompleto">Ensino Fundamental Incompleto</option>
                                                        <option value="Ensino Fundamental Completo">Ensino Fundamental Completo</option>
                                                        <option value="Ensino Médio Incompleto">Ensino Médio Incompleto</option>
                                                        <option value="Ensino Médio Completo">Ensino Médio Completo</option>
                                                        <option value="Ensino Superior Incompleto">Ensino Superior Incompleto</option>
                                                        <option value="Ensino Superior Completo">Ensino Superior Completo</option>
                                                    </select>
                                                    <label>Escolaridade</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <div class="input-field col s12">
                                                    <select name="cargoDesejado">
                                                        <optgroup label="Cargo">
                                                            <%ControleCargo cr = new ControleCargo();
                                                                Usuario uu = (Usuario) session.getAttribute("usuario");
                                                                for (Cargo c : cr.consultarTodosCargos()) {%>
                                                            <option value="<%=c.getNomeCargo()%>"><%=c.getNomeCargo()%></option>
                                                            <%}%>
                                                    </select>
                                                    <label>Cargo Desejado</label>
                                                </div>
                                            </div>
                                        </div>

                                        <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="candidato" class="validate"/>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" value="<%=u.getNomeUsuario()%>" id="nomeUsuario" type="text" name="nomeUsuario" class="validate">
                                                <label for="nomeUsuario">Nome de Usuário</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" value="<%=u.getSenha()%>" id="senha" type="password" name="senha" class="validate">
                                                <label for="senha">SENHA</label>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="nomeCompleto" type="text" name="nomeCompleto" class="validate">
                                                <label for="nomeCompleto">Nome Completo</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="cpf" type="text" name="cpf" class="validate">
                                                <label for="cpf">CPF</label>
                                            </div>
                                        </div
                                        >
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="rg" type="text" name="rg" class="validate">
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
                                                <input placeholder="" id="endereco" type="text" name="endereco" class="validate">
                                                <label for="endereco">Endereço de email</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="file-field input-field">
                                                <div class="btn">
                                                    <span>File</span>
                                                    <input type="file" name="curriculo">
                                                </div>
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text">
                                                </div>
                                            </div>
                                        </div>

                                        <input type="submit" name="salvar" value="Cadastrar!" class="waves-effect waves-indigo darken-3 btn-flat"/>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </center>
                                                  <% }%>
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
