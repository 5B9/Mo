
<%@page import="br.edu.ifpr.irati.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nome = request.getParameter("usuario");
            String senha = request.getParameter("senha");

            session = request.getSession();

            if (nome != null && senha != null) {
                ControleLogin lc = new ControleLogin();
                try {

                  
                        Usuario u = lc.login(nome, senha);
                        session.setAttribute("usuario", u);
                        if(u.getTipoUsuario().equals("funcionario")){
                        response.sendRedirect("../index.jsp");
                        }else{
                            response.sendRedirect("../perfilCadastro.jsp");
                        }
                } catch (Exception e) {
                    session.setAttribute("usuario", null);
                    //alterar o valor na variável de sessão

                    response.sendRedirect("../login.jsp?e=" + e.getMessage());
                }
            } else {
                session.setAttribute("usuario", null);
                response.sendRedirect("../login.jsp?e= Acesso Negado");
            }


        %>
    </body>
</html>