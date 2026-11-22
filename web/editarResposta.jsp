<%@page import="java.sql.*"%>
<%@page import="util.ConectaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String idStr = request.getParameter("id");
    int id = 0;
    String nomeUsuario = "";
    int r1=0,r2=0,r3=0,r4=0,r5=0,r6=0,r7=0,r8=0;
    int usuarioId = 0;

    try {
        id = Integer.parseInt(idStr);
        Connection conexao = ConectaBD.conectar();
        PreparedStatement sql = conexao.prepareStatement(
            "SELECT u.nome, u.id AS uid, r.* FROM respostas r " +
            "INNER JOIN usuarios u ON u.id = r.usuario_id WHERE r.id = ?"
        );
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        if (rs.next()) {
            nomeUsuario = rs.getString("nome");
            usuarioId = rs.getInt("uid");
            r1 = rs.getInt("r1"); r2 = rs.getInt("r2"); r3 = rs.getInt("r3"); r4 = rs.getInt("r4");
            r5 = rs.getInt("r5"); r6 = rs.getInt("r6"); r7 = rs.getInt("r7"); r8 = rs.getInt("r8");
        }
        rs.close(); sql.close(); conexao.close();
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Respostas - Admin</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .form-box {
            background-color: #2a2a2a;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid #8b6b3d;
            max-width: 700px;
            margin: 0 auto;
        }
        .form-box label { display: block; margin: 12px 0 5px; color: #7ec850; font-weight: bold; }
        .form-box input[type="number"] {
            width: 100%; padding: 8px; border-radius: 5px;
            border: 1px solid #8b6b3d; background-color: #1a1a1a; color: #fff;
        }
    </style>
</head>
<body>
    <header>
        <h1>⛏ EDITAR RESPOSTAS ⛏</h1>
    </header>
    <nav>
        <a href="admin.jsp">Painel</a>
        <a href="relatorioUsuarios.jsp">Relatório de Usuários</a>
        <a href="relatorioResumo.jsp">Relatório Resumo</a>
        <a href="logoutAdmin.jsp">Sair</a>
    </nav>
    <div class="container">
        <h2>Editar respostas de: <%= nomeUsuario %></h2>
        <div class="form-box">
            <form method="POST" action="salvarEdicao.jsp">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="hidden" name="usuarioId" value="<%= usuarioId %>">

                <label>Questão 1 (1-4):</label>
                <input type="number" name="r1" min="1" max="4" value="<%= r1 %>" required>

                <label>Questão 2 (1-4):</label>
                <input type="number" name="r2" min="1" max="4" value="<%= r2 %>" required>

                <label>Questão 3 (1-4):</label>
                <input type="number" name="r3" min="1" max="4" value="<%= r3 %>" required>

                <label>Questão 4 (1-4):</label>
                <input type="number" name="r4" min="1" max="4" value="<%= r4 %>" required>

                <label>Questão 5 (1-4):</label>
                <input type="number" name="r5" min="1" max="4" value="<%= r5 %>" required>

                <label>Questão 6 (1-4):</label>
                <input type="number" name="r6" min="1" max="4" value="<%= r6 %>" required>

                <label>Questão 7 (1-4):</label>
                <input type="number" name="r7" min="1" max="4" value="<%= r7 %>" required>

                <label>Questão 8 (1-4):</label>
                <input type="number" name="r8" min="1" max="4" value="<%= r8 %>" required>

                <br><br>
                <button type="submit" class="btn">Salvar Alterações</button>
                <a href="relatorioUsuarios.jsp" class="btn">Cancelar</a>
            </form>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>