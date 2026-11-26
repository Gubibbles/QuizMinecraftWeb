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
        .form-edicao {
            max-width: 600px;
            width: 95%;
            margin: 0 auto;
        }
        .form-edicao label {
            display: block;
            margin: 12px 0 5px;
            color: #1a1a1a;
            font-family: 'VT323', monospace;
            font-size: 1.3em;
        }
        .form-edicao input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 2px solid #565656;
            background-color: #1a1a1a;
            color: #fff;
            font-size: 1.1em;
        }
        .form-edicao input[type="number"]:focus {
            outline: none;
            border-color: #7ec850;
        }
        .form-edicao .botoes {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }
        .form-edicao .botoes .btn-mc {
            flex: 1;
        }
    </style>
</head>
<body>

    <header class="site-header">
        <a href="index.html">
            <img src="img/logo-minecraft.png" alt="Minecraft" class="logo-img">
        </a>
        <nav>
            <a href="admin.jsp">Painel</a>
            <a href="relatorioUsuarios.jsp">Usuários</a>
            <a href="relatorioResumo.jsp">Resumo</a>
            <a href="logoutAdmin.jsp">Sair</a>
        </nav>
        <a href="adminLogin.jsp" class="admin-icon" title="Área do Administrador">⚙</a>
    </header>

    <div class="pagina-sistema" style="background-image: url('img/bg-quiz-v2.png');">
        <div class="caixa-sistema form-edicao">
            <h2>Editar Respostas</h2>
            <p>Jogador: <strong><%= nomeUsuario %></strong></p>

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

                <div class="botoes">
                    <button type="submit" class="btn-mc">Salvar Alterações</button>
                    <a href="relatorioUsuarios.jsp" class="btn-mc">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>