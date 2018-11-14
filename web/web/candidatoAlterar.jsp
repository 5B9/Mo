

<%@page import="br.edu.ifpr.irati.modelo.Curriculo"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCurriculo"%>
<%@page import="br.edu.ifpr.irati.modelo.Candidato"%>
<%@page import="br.edu.ifpr.irati.controle.ControleCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Candidato</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <center>
                <div class="container" style="width: 50%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content white-text ">
            <%
                int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
                ControleCandidato controleCandidato = new ControleCandidato();
                Candidato c = new Candidato();
                c = controleCandidato.consultarCandidatoPorId(idCandidato);
            %>
            <div class="row">
            <form class="col s12" action="scripts/alterarCandidato.jsp" method="post">

                
                <div class="row">
                        <div class="input-field col s12">
                            <div class="input-field col s12">
                                <select name="escolaridade">
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

                <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="candidato" class="validate"/>
                <input placeholder="" id="first_name" type="hidden" name="idCandidato" value="<%= idCandidato %>" class="validate"/>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="..." id="first_name" type="text" name="cargoDesejado" value="<%=c.getCargoDesejado()%>" class="validate">
                            <label for="cargoDesejado">Cargo Desejado</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="text" name="nomeUsuario"  value="<%=c.getNomeUsuario()%>" class="validate">
                            <label for="nomeUsuario">Nome de Usuário</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="password" name="senha" value="<%=c.getSenha()%>" class="validate">
                            <label for="senha">senha</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="nomeCompleto" type="text" name="nome" value="<%=c.getNomeCompleto()%>"class="validate">
                            <label for="nomeCompleto">Nome Completo</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="text" name="cpf" value="<%=c.getCpf()%>" class="validate">
                            <label for="cpf">CPF</label>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="text" name="rg" value="<%=c.getRg()%>" class="validate">
                            <label for="rg">RG</label>
                        </div>
                    </div>
                            
                   <div class="row">
                        <div class="input-field col s12">
                            <div class="input-field col s12">
                                <select name="sexo">
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                </select>
                                <label>Sexo</label>
                            </div>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="input-field col s12">
                            <input placeholder="" id="first_name" type="text" name="endereco" value="<%=c.getEnderecoEmail()%>"class="validate">
                            <label for="enderecoEmail">Endereço de Email</label>
                        </div>
                    </div>
                            
                   
                            <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar"><span>Alterar</span></button>
             </form>    
            </div>
           
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
 </script>
        <script>
            function validar() {
                if (document.formulario.escolaridade.value == "") {
                    alert("Por favor, insira o nível de escolaridade do candidato.");
                    return false;
                } else if (document.formulario.cargoDesejado.value == "") {
                    alert("Por favor, insira o cargo desejado.");
                    return false;
                } else if (document.formulario.nomeUsuario.value == "") {
                    alert("Por favor, insira o seu nome de usuário.");
                    return false;
                } else if (document.formulario.senha.value == "") {
                    alert("Por favor, insira a sua senha.");
                    return false;
                } else if (document.formulario.nome.value == "") {
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
                } else if (document.formulario.endereco.value == "") {
                    alert("Por favor, insira o seu endereço de e-mail.");
                    return false;
                } else if (document.formulario.curriculo.value == "") {
                    alert("Por favor, insira o seu currículo.");
                    return false;
                } else {
                    return true;
                }
            }
        </script>        
    </body>
</html>
