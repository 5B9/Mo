<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.modelo.Funcionario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
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
                <%
                    int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
                    ControleFuncionario f = new ControleFuncionario();
                    Funcionario funcionario = f.consultarFuncionarioPorId(idFuncionario);
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String dataAdmissao;
                    dataAdmissao = sdf.format(funcionario.getDataAdmissao());
                %>
                <div class="container" style="width: 60%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content black-text ">
                                <div class="row">
                                    <form class="col s12" action="scripts/funcionarioAlterar.jsp" method="post">
                                        <input placeholder="..." id="first_name" type="hidden" name="id" value="<%=funcionario.getIdPessoa()%>" class="">
                                        <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="funcionario"class="validate"/>
                                        <div class="center-row">
                                            <div class="input-field col s6">
                                                <div class="input-field col s7">
                                                    <select name="tipoFuncionario">
                                                        <option value="<%=funcionario.getTipoFuncionario()%>" disabled selected>Escolha o Tipo</option>
                                                        <option value="gerente">Gerente</option>
                                                        <option value="funcionario">Funcion�rio</option>
                                                    </select>
                                                    <label>Tipo de Funcion�rio</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="center-row">
                                            <div class="input-field col s5">
                                                <i class="material-icons prefix">call_to_action</i>
                                                <input placeholder="" id="first_name" type="text" name="matricula" value="<%=funcionario.getMatricula()%>" class="validate">
                                                <label for="matricula">N� matr�cula</label>
                                            </div>
                                        </div>
                                        <div class="center-row">
                                            <div class="input-field col s8">
                                                <i class="material-icons prefix">person</i>
                                                <input placeholder="" id="first_name" type="text" name="nome" value="<%=funcionario.getNomeCompleto()%>"class="validate">
                                                <label for="nome">Nome Completo</label>
                                            </div>
                                        </div>
                                        <div class="center-row">
                                            <div class="input-field col s4">
                                                <i class="material-icons prefix"> description</i>
                                                <input placeholder="" id="cpf" type="text" name="cpf" value="<%=funcionario.getCpf()%>"class="validate">
                                                <label for="cpf">CPF</label>
                                            </div>
                                        </div>
                                        <div class="center-row">
                                            <div class="input-field col s4">
                                                <i class="material-icons prefix"> featured_play_list</i>
                                                <input placeholder="" id="rg" type="text" name="rg" value="<%=funcionario.getRg()%>"class="validate">
                                                <label for="rg">RG</label>
                                            </div>
                                        </div>
                                        <div class="center-row">
                                            <div class="input-field col s5">
                                                <div class="input-field col s5">
                                                    <select name="sexo">
                                                        <option value="<%=funcionario.getSexo()%>" disabled selected></option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Feminino</option>
                                                    </select>
                                                    <label>Sexo</label>
                                                </div>
                                            </div>
                                        </div>
                                        <%%>
                                        <div class="center-row">
                                            <div class="input-field col s3">
                                                <i class="material-icons prefix">today</i>
                                                <input placeholder="..." id="first_name" type="text" name="data" value="<%=dataAdmissao%>" class="datepicker">
                                                <label for="data">Data de admiss�o</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">alternate_email</i>
                                                <input placeholder="" id="first_name" type="text" value="<%=funcionario.getEnderecoEmail()%>" name="endereco" class="validate">
                                                <label for="endereco">Endere�o de Email</label>
                                                <span class="helper-text" data-error="E-mail inv�lido" data-success="Ok!"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                
                                                <input placeholder="" id="first_name" type="password" value="<%=funcionario.getSenha()%>" name="senha" class="validate">
                                                <label for="endereco">Senha</label>
                                            </div>
                                        </div>

                                        <center>
                                            <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar"><span>Cadastrar</span></button>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </center>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.datepicker').datepicker({format: 'dd/mm/yyyy'});
                $('.datepicker-date-display').css("background-color", "#003366");
            });
        </script>
        <script>
            $(document).ready(function () {
            $('.timepicker').timepicker({
            twelveHour: false;
            })
            });
        </script>
        <script>
            $(document).ready(function () {
                $('select').formSelect();
            });
        </script>
        <script>
            $(document).ready(function () {
                var $campoCpf = $("#cpf");
                var $campoRg = $("#rg");
                $campoCpf.mask('000.000.000-00', {reverse: true});
                $campoRg.mask('000.000.000-00', {reverse: true});
            })
        </script>
        <script>
            $(document).ready(function () {

            })
            )}
        </script>
    </body>
</html>
