
<!DOCTYPE html>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>

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
                 <%
                    if (!logado || u.getTipoUsuario().equals("candidato")) {
                %> <p> Acesso Negado </p>
                <p> Clique <a href="index.jsp"> aqui</a> para fazer o login. </p> 
                <%} else { %>
                <br>
                <div class="container" style="width: 50%;">
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content black-text ">

                                <div class="row">
                                    <form class="col s12" action="scripts/cargoCadastrar.jsp" method="post" name="formulario">

                                        <div class="center-row">
                                            <div class="input-field col s5">
                                                <i class="material-icons prefix">looks_one</i>
                                                <input placeholder="..."  value="0" type="number" name="vagas">
                                                <label for="vagas">Quantidade de Vagas</label>
                                            </div>
                                        </div>

                                        <div class="center-row" >

                                            <div class="input-field col s6">
                                                <i class="material-icons prefix">school</i>
                                                <select name="descricao">
                                                    <option value="Ensino Fudamental Incompleto">Ensino Fundamental Incompleto</option>
                                                    <option value="Ensino Fundamental Completo">Ensino Fundamental Completo</option>
                                                    <option value="Ensino M�dio Incompleto">Ensino M�dio Incompleto</option>
                                                    <option value="Ensino M�dio Completo">Ensino M�dio Completo</option>
                                                    <option value="Ensino Superior Incompleto">Ensino Superior Incompleto</option>
                                                    <option value="Ensino Superior Completo">Ensino Superior Completo</option>
                                                </select>
                                                <label>Exig�ncias</label>

                                            </div>
                                        </div>


                                        <div class="center-row">
                                            <div class="input-field col s4">
                                                <i class="material-icons prefix">edit</i>
                                                <input placeholder="...." id="first_name" type="text" name="nome"class="validate">
                                                <label for="nome">Nome Cargo</label>
                                            </div>
                                        </div>
                                        
                                        <div class="center-row">
                                            <div class="input-field col s4">
                                                 <i class="material-icons prefix">attach_money</i>
                                                <input placeholder="1300" id="first_name" type="text" name="salario"class="validate">
                                                <label for="salario">Sal�rio</label>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <i class="material-icons prefix">receipt</i>
                                                <select  name="modalidade">
                                                    <option value="CLT">CLT</option>
                                                    <option value="Contrato">Contrato</option>
                                                </select>
                                                <label for="modalidade">Modalidade</label>
                                            </div>
                                        </div>

                                        <center>
                                            <button  class="waves-effect waves-light btn indigo " type="submit" name="salvar" onclick="return validar()"><span>Cadastrar</span></button>
                                        </center>
                                    </form>

                                </div>
                                <% }%>
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
        <!--Receber os clientes pela cabe�a, assim, pela cabe�a, agarr�-los cabe�a e ,com toda a sua cabe�a, jooj-->
        <script>
            function validar() {
                if (document.formulario.descricao.value == "") {
                    alert("Por favor, insira a descri��o desse cargo.");
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
