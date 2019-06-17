
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
                                    int idCargo = Integer.parseInt(request.getParameter("idCargo"));
                                    ControleCargo cc = new ControleCargo();
                                    Cargo c = cc.consultarCargoPorId(idCargo);
                                %>
                                <div class="row">

                                    <form name="formulario"class="col s12" action="scripts/cargoAlterar.jsp" method="post">

                                        <div class="row">

                                            <form class="col s12" action="scripts/cargoAlterar.jsp" method="post">

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <input placeholder="" id="first_name" type="hidden" name="id" value="<%= idCargo%>" class="validate"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <input placeholder="...." id="first_name" type="text" name="descricao" vagas="<%=c.getDescricao()%>" class="validate">
                                                        <label for="descricao">DescriÃ§Ã£o</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <input placeholder="..." id="first_name" type="text" name="nome" value="<%=c.getNomeCargo()%>" class="validate">
                                                        <label for="nome">Nome Cargo</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <input placeholder="1300" id="first_name" type="text" name="salario" value="<%=c.getSalario()%>" class="validate">
                                                        <label for="salario">SalÃ¡rio</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <input placeholder="..." id="first_name" type="text" name="modalidade" value="<%=c.getModalidade()%>" class="validate">
                                                        <label for="modalidade">Modalidade</label>
                                                    </div>
                                                </div>

                                                <input onclick="return validar()" type="submit" name="salvar" value="Alterar!" class="waves-effect waves-indigo darken-3 btn-flat"/>

                                            </form>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input placeholder="..." id="vagas" type="number" name="vagas" value="<%=c.getQtdVagas()%>" class="validate">
                                                    <label for="vagas">Quantidade de Vagas</label>
                                                </div>
                                            </div>
                                            <div class="row" >

                                                <div class="input-field col s12">
                                                    <select name="descricao">
                                                        <option value="Ensino Fudamental Incompleto">Ensino Fundamental Incompleto</option>
                                                        <option value="Ensino Fundamental Completo">Ensino Fundamental Completo</option>
                                                        <option value="Ensino Médio Incompleto">Ensino Médio Incompleto</option>
                                                        <option value="Ensino Médio Completo">Ensino Médio Completo</option>
                                                        <option value="Ensino Superior Incompleto">Ensino Superior Incompleto</option>
                                                        <option value="Ensino Superior Completo">Ensino Superior Completo</option>
                                                    </select>
                                                    <label>Exigências</label>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input placeholder="..." id="first_name" type="text" name="nome" value="<%=c.getNomeCargo()%>" class="validate">
                                                    <label for="nome">Nome Cargo</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input placeholder="1300" id="first_name" type="text" name="salario" value="<%=c.getSalario()%>" class="validate">
                                                    <label for="salario">Salário</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <select  name="modalidade">
                                                        
                                                        <option value="CLT">CLT</option>
                                                        <option value="Contrato">Contrato</option>
                                                    </select>
                                                    <label for="modalidade">Modalidade</label>
                                                </div>
                                            </div>

                                            <button  class="waves-effect waves-light btn indigo" onclick="return validar()" type="submit" name="salvar"><span>Alterar</span></button>

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
