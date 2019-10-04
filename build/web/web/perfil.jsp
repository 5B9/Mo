
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
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
                ControleCandidato cc = new ControleCandidato();
                Candidato candidato = cc.consultarCandidatoPorId(u.getIdPessoa());
            %>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>
            <br>
            <div class="container" style="width: 50%;" >
                <div class="col s12 m5" align="center">

                    <span class="card-title" align="center"></span>
                    <ul class="collection">
                        <input placeholder="" id="first_name" type="hidden" name="nomeUsuario" value="<%=candidato.getNomeUsuario()%>" class="validate"/>
                        <input placeholder="" id="first_name" type="hidden" name="senha" value="<%=candidato.getSenha()%>" class="validate"/>
                        <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="<%=candidato.getTipoUsuario()%>" class="validate"/>
                        <li class="collection-item" id="idCandidato" name="idCandidato">Identificador de Usuário: <%=candidato.getIdPessoa()%></li>
                        <li class="collection-item"  id="nome" name="nome"> Nome Completo: <%=candidato.getNomeCompleto()%></li>
                        <li class="collection-item"  id="endereco" name="endereco"> Email: <%=candidato.getEnderecoEmail()%></li>
                        <li class="collection-item"  id="rg" name="rg"> RG: <%=candidato.getRg()%></li>
                        <li class="collection-item"  id="cpf" name="cpf"> CPF: <%=candidato.getCpf()%></li>
                        <li class="collection-item"  id="sexo" name="sexo"> Sexo: <%=candidato.getSexo()%></li>
                        <li class="collection-item"  id="escolaridade" name="escolaridade"> Escolaridade: <%=candidato.getEscolaridade()%></li>
                        <li class="collection-item"  id="cargoDesejado" name="cargoDesejado"> Cargo Desejado: <%=candidato.getCargoDesejado()%></li>
                        <li class="collection-item"  id="idade" name="idade"> Idade: <%=candidato.getIdade()%></li>
                    </ul>
                    <center>
                        <a  class="waves-effect waves-light btn indigo darken-4" href="perfilAlterar.jsp?idCandidato=<%=candidato.getIdPessoa()%>" ><span>Alterar</span></a>
                    </center>

                </div>

            </div>

            <br>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                var $campoCpf = $("#cpf");
                var $campoRg = $("#rg");
                $campoCpf.mask('000.000.000-00', {reverse: true});
                $campoRg.mask('000.000.000-00', {reverse: true});
            });
        </script>
        <script>
            $(document).ready(function () {
                $('select').formSelect();
            });
        </script>
    </body>
</html>
