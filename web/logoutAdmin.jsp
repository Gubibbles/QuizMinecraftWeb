<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("adminLogado");
    response.sendRedirect("adminLogin.jsp");
%>