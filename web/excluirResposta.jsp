<%@page import="DAO.RespostaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String usuarioIdStr = request.getParameter("usuarioId");
    if (usuarioIdStr != null) {
        int usuarioId = Integer.parseInt(usuarioIdStr);
        RespostaDAO dao = new RespostaDAO();
        dao.excluirUsuario(usuarioId);
    }
    response.sendRedirect("relatorioUsuarios.jsp");
%>