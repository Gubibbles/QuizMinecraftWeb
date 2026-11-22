<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel Admin - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .admin-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        .admin-card {
            background-color: #2a2a2a;
            border: 2px solid #8b6b3d;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            transition: transform 0.3s, border-color 0.3s;
        }
        .admin-card:hover {
            transform: translateY(-5px);
            border-color: #7ec850;
        }
        .admin-card h3 {
            color: #7ec850;
            margin-bottom: 12px;
        }
        .admin-card p {
            color: #aaa;
            text-align: center;
            margin-bottom: 15px;
        }
        .btn-sair {
            background-color: #5a1e1e;
            border-color: #ff4444;
        }
        .btn-sair:hover {
            background-color: #ff4444;
            color: #fff;
        }
    </style>
</head>
<body>
    <header>
        <h1>⛏ PAINEL DO ADMINISTRADOR ⛏</h1>
    </header>
    <nav>
        <a href="admin.jsp">Painel</a>
        <a href="relatorioUsuarios.jsp">Relatório de Usuários</a>
        <a href="relatorioResumo.jsp">Relatório Resumo</a>
        <a href="logoutAdmin.jsp">Sair</a>
    </nav>
    <div class="container">
        <h2>Bem-vindo, Administrador</h2>
        <p>Escolha uma das opções abaixo para gerenciar o quiz.</p>

        <div class="admin-grid">
            <div class="admin-card">
                <h3>👥 Relatório de Usuários</h3>
                <p>Veja cada usuário e todas as suas respostas do quiz.</p>
                <a href="relatorioUsuarios.jsp" class="btn">Abrir</a>
            </div>
            <div class="admin-card">
                <h3>📊 Relatório Resumo</h3>
                <p>Número de entrevistados e percentuais de respostas por questão.</p>
                <a href="relatorioResumo.jsp" class="btn">Abrir</a>
            </div>
            <div class="admin-card">
                <h3>🚪 Sair</h3>
                <p>Encerrar a sessão de administrador.</p>
                <a href="logoutAdmin.jsp" class="btn btn-sair">Sair</a>
            </div>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>