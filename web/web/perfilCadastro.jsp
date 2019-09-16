
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
            %>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>



            <br><br>
            <div class="container" style=" width:60%; ">
                <div class="col s12 m6">
                    <div class="card blue-grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row">
                                <form class="col s12" action="scripts/perfilCadastrar.jsp" method="post" name="formulario" >

                                    <input placeholder="" id="tipoUsuario" type="hidden" name="tipoUsuario" value="candidato" class="validate">
                                    <input placeholder="" id="idCandidato" type="hidden" name="idCandidato" value="<%=u.getIdPessoa()%>" class="validate">
                                    <input placeholder="" id="nomeUsuario" type="hidden" name="nomeUsuario" value="<%=u.getNomeUsuario()%>" class="validate">
                                    <input placeholder="" id="senha" type="hidden" name="senha" value="<%=u.getSenha()%>" class="validate">
                                    <div class="center-row">
                                        <div class="input-field col s8">
                                            <i class="material-icons prefix">person</i>
                                            <input placeholder=""  id="nomeCompleto" type="text" name="nomeCompleto" class="validate" maxlength="60">
                                            <label for="nomeCompleto">Nome Completo*</label>
                                        </div>
                                    </div>

                                    <div class="center-row">
                                        <div class="input-field col s3">
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">wc</i>
                                                <select name="sexo">
                                                    <option value="" disabled selected>Sexo</option>
                                                    <option value="M">Masculino</option>
                                                    <option value="F">Feminino</option>
                                                </select>
                                                <label>Sexo*</label>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="center-row">
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">perm_contact_calendar</i>
                                            <input placeholder=""  id="idade" type="text" name="idade" class="validate" maxlength="2">
                                            <label for="idade">Idade*</label>
                                        </div>
                                    </div>

                                    <div class="center-row">
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix"> description</i>
                                            <input placeholder="" id="cpf" type="text" name="cpf" class="validate"   maxlength="11">
                                            <label for="cpf">CPF*</label>
                                        </div>
                                    </div>

                                    <div class="center-row">
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix"> featured_play_list</i>
                                            <input placeholder="" id="rg"  type="text" name="rg" class="validate" maxlength="9">
                                            <label for="rg">RG*</label>
                                        </div>
                                    </div>

                                    <div class="row">                        
                                        <div class="input-field col s11">
                                            <i class="material-icons prefix">alternate_email</i>
                                            <input id="endereco" value="" name="endereco" type="email" class="validate">
                                            <label for="email">Email</label>
                                            <span class="helper-text" data-error="E-mail inv�lido" data-success="Ok!">Obrigat�rio caso deseje receber nossa resposta.</span>
                                        </div>
                                    </div>
                                    <br>
                                    <hr>
                                    <br>
                                    <div class="center-row" >
                                        <div class="input-field col s6">
                                            <div class="input-field col s9">
                                                <i class="material-icons prefix">school</i>
                                                <select name="escolaridade">
                                                    <option value="" disabled selected>Escolaridade</option>
                                                    <option value="Ensino Fudamental Incompleto">Ensino Fundamental Incompleto</option>
                                                    <option value="Ensino Fundamental Completo">Ensino Fundamental Completo</option>
                                                    <option value="Ensino M�dio Incompleto">Ensino M�dio Incompleto</option>
                                                    <option value="Ensino M�dio Completo">Ensino M�dio Completo</option>
                                                    <option value="Ensino Superior Incompleto">Ensino Superior Incompleto</option>
                                                    <option value="Ensino Superior Completo">Ensino Superior Completo</option>
                                                </select>
                                                <label>Escolaridade*</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <div class="input-field col s10">
                                                <i class="material-icons prefix">work</i>
                                                <select name="cargoDesejado">
                                                    <option value="" disabled selected>Cargo Desejado</option>
                                                    <%ControleCargo cr = new ControleCargo();

                                                        for (Cargo c : cr.consultarTodosCargos()) {%>
                                                    <option value="<%=c.getNomeCargo()%>"><%=c.getNomeCargo()%></option>
                                                    <%}%>
                                                </select>
                                                <label>Cargo Desejado*</label>
                                            </div>
                                        </div>
                                    </div>


                                    <center>
                                        <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick=" return validar()"><span>Cadastrar</span></button>
                                    </center>
                                </form>
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
                if (document.formulario.escolaridade.value == "") {
                    alert("Por favor, insira o n�vel de escolaridade do candidato.");
                    return false;
                } else if (document.formulario.cargoDesejado.value == "") {
                    alert("Por favor, insira o cargo desejado.");
                    return false;
                } else if (document.formulario.nomeUsuario.value == "") {
                    alert("Por favor, insira o seu nome de usu�rio.");
                    return false;
                } else if (document.formulario.senha.value == "") {
                    alert("Por favor, insira a sua senha.");
                    return false;
                } else if (document.formulario.nomeCompleto.value == "") {
                    alert("Por favor, insira o seu nome completo.");
                    return false;
                } else if (document.formulario.cpf.value == "") {
                    alert("Por favor, insira o seu CPF.");
                    return false;
                } else if (document.formulario.rg.value == "") {
                    alert("Por favor, insira o seu RG.");
                    return false;
                } else if (document.formulario.sexo.value == "") {
                    alert("Por favor, insira o seu sexo.");
                    return false;
                } else if (document.formulario.curriculo.value == "") {
                    alert("Por favor, insira o seu curr�culo.");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
