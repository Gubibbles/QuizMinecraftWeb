<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String senha = request.getParameter("senha");

    // Senha do admin
    String SENHA_ADMIN = "Antenor";

    if (SENHA_ADMIN.equals(senha)) {
        session.setAttribute("adminLogado", true);
        response.sendRedirect("admin.jsp");
    } else {
        request.setAttribute("erro", "Senha incorreta. Tente novamente.");
        request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
    }
%>