
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar?</title>
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
        <style>
            body{
                background-color: #263238;
            }
        </style>
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


                                <%

                                    int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
                                    ControleFuncionario f = new ControleFuncionario();
                                    Funcionario funcionario = f.consultarFuncionarioPorId(idFuncionario);

                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                                %>
                                <div class="row">
                                    <form class="col s12" action="scripts/funcionarioAlterar.jsp" method="post">
                                        <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="funcionario"class="validate"/>
                                        <input placeholder="" id="first_name" type="hidden" name="id" value="<%=funcionario.getIdPessoa()%>"class="validate"/>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <div class="input-field col s12">
                                                    <select name="tipoFuncionario">

                                                        <option value="<%=funcionario.getTipoFuncionario()%>"><%=funcionario.getTipoFuncionario()%></option>
                                                    </select>
                                                    <label>Tipo</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="matricula" value="<%=funcionario.getMatricula()%>"class="validate">
                                                <label for="matricula">Nº matrícula</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="12/12/2012" id="first_name" type="text" name="data" value="<%=sdf.format(funcionario.getDataAdmissao())%>"class="validate">
                                                <label for="Dia do Evento">Data de admissão</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="nomeUs"  value="<%=funcionario.getNomeUsuario()%>"class="validate">
                                                <label for="tipo">Nome de Usuário</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="password" name="senha" value="<%=funcionario.getSenha()%>" class="validate">
                                                <label for="tipo">SENHA</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="nome" value="<%=funcionario.getNomeCompleto()%>"class="validate">
                                                <label for="tipo">Nome Completo</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="cpf" value="<%=funcionario.getCpf()%>"class="validate">
                                                <label for="tipo">CPF</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="rg" value="<%=funcionario.getRg()%>"class="validate">
                                                <label for="tipo">RG</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="sexo" value="<%=funcionario.getSexo()%>"class="validate">
                                                <label for="tipo">Sexo</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input placeholder="" id="first_name" type="text" name="endereco" value="<%=funcionario.getEnderecoEmail()%>"class="validate">
                                                <label for="tipo">Endereço de Email</label>
                                            </div>
                                        </div>


                                        <button  class="waves-effect waves-light btn indigo " type="submit" name="salvar"><span>Alterar</span></button>
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

    </body>
</html>
