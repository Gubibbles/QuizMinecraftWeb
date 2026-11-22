<%@page import="java.sql.*"%>
<%@page import="util.ConectaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    int r1 = Integer.parseInt(request.getParameter("r1"));
    int r2 = Integer.parseInt(request.getParameter("r2"));
    int r3 = Integer.parseInt(request.getParameter("r3"));
    int r4 = Integer.parseInt(request.getParameter("r4"));
    int r5 = Integer.parseInt(request.getParameter("r5"));
    int r6 = Integer.parseInt(request.getParameter("r6"));
    int r7 = Integer.parseInt(request.getParameter("r7"));
    int r8 = Integer.parseInt(request.getParameter("r8"));

    try {
        Connection conexao = ConectaBD.conectar();
        PreparedStatement sql = conexao.prepareStatement(
            "UPDATE respostas SET r1=?, r2=?, r3=?, r4=?, r5=?, r6=?, r7=?, r8=? WHERE id=?"
        );
        sql.setInt(1, r1); sql.setInt(2, r2); sql.setInt(3, r3); sql.setInt(4, r4);
        sql.setInt(5, r5); sql.setInt(6, r6); sql.setInt(7, r7); sql.setInt(8, r8);
        sql.setInt(9, id);
        sql.executeUpdate();
        sql.close(); conexao.close();
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
    response.sendRedirect("relatorioUsuarios.jsp");
%>