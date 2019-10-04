
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>


    </head>
    <header>
        <jsp:include page="cabecalho.jsp" flush="true" />
    </header>
    <body>
       

        <main>
            <br>
            
            <div class="container" style="width: 30%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row">
                                <form class="col s12" name="formulario" action="scripts/usuarioCadastrar.jsp" method="post">

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <div class="input-field col s12">
                                                <i class="material-icons prefix">person</i>
                                                <select onchange="aparece()" name="tipo" id="tipo">
                                                    <option value="" disabled selected>Tipo Usuário</option>

                                                    <option value="funcionario">funcionário</option>

                                                    <option value="candidato" >candidato</option>

                                                </select>
                                                <label>Tipo de Usuário</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">perm_identity</i>
                                            <input placeholder="" id="nomeUsuario" type="text" name="nomeUsuario" class="validate">
                                            <label for="nomeUsuario">Nome de Usuário:</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix"> vpn_key</i>
                                            <input placeholder="" id="senha" type="password" name="senha" class="validate">
                                            <label for="senha">Senha:</label>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i  id="icone" style="display:none;" class="material-icons prefix">confirmation_number</i>
                                            <input placeholder="..." id="matricula" type="hidden" name="matricula" class="validate">
                                            <label id="mabel" style="display:none;" for="Ma">Nº de matrícula</label>
                                        </div>
                                    </div>
                                    <center>
                                        <button  class="waves-effect waves-light btn indigo" type="submit" name="salvar" onclick="return validar()"><span>Cadastrar</span></button>
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
            function aparece()//Função referente ao input número de matrícula
            {
                //Variável contendo o valor da option
                var comboBox = document.getElementById("tipo").value;
                //Variável contendo o input do nº da matrícula 
                var mathmagic = document.getElementById("matricula");
                //Variável referente a Label
                var label = document.getElementById("mabel");
                //Variável referente ao ícone
                var icon = document.getElementById("icone");

                if (comboBox == "funcionario") {
                    icon.style.display = "block";
                    label.style.display = "block";
                    mathmagic.setAttribute("type", "text");
                } else {
                    icon.style.display = "none";
                    label.style.display = "none";
                    mathmagic.setAttribute("type", "hidden");


                }



            }

        </script>
        <script>
            function validar() {
    
          if(document.formulario.tipo.value == "funcionario"){
                    if (document.formulario.nomeUsuario.value == "") {
                    alert("Por favor, insira o nome de usuário.");
                    return false;
                } else if (document.formulario.senha.value == "") {
                    alert("Por favor, insira a senha.");
                    return false;
                 
                } else if(document.formulario.matricula.value == ""){
                    alert("Por favor, insira o número de matrícula.");
                    return false;
                }
                
        }else{
             if (document.formulario.nomeUsuario.value == "") {
                    alert("Por favor, insira o nome de usuário.");
                    return false;
                } else if (document.formulario.senha.value == "") {
                    alert("Por favor, insira a senha.");
                    return false;
                 
                } 
        }
              
            }
        </script>
    </body>
</html>
