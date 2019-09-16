<%-- 
    Document   : gerarPDF
    Created on : 14/08/2019, 19:55:47
    Author     : Altai
--%>

<%@page import="br.edu.ifpr.irati.util.iText"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
    iText pdf = new iText();
    pdf.gerarCurriculo(idCandidato);
    response.sendRedirect("../relatorios.jsp");
    %>
</html>
