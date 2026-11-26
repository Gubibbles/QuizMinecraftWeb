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
            max-width: 1000px;
            width: 100%;
        }
        .admin-card {
            background-color: rgba(139, 139, 139, 0.95);
            border: 4px solid;
            border-color: #a0a0a0 #565656 #565656 #a0a0a0;
            padding: 25px;
            text-align: center;
            box-shadow: 8px 8px 0 rgba(0,0,0,0.5);
            color: #1a1a1a;
        }
        .admin-card h3 {
            font-family: 'VT323', monospace;
            font-size: 1.8em;
            color: #1a1a1a;
            text-shadow: 1px 1px 0 #aaa;
            margin-bottom: 12px;
        }
        .admin-card p {
            color: #1a1a1a;
            text-align: center;
            margin-bottom: 15px;
        }
        .btn-sair {
            background-color: #8b2a2a;
            border-color: #c03a3a #5a1e1e #5a1e1e #c03a3a;
        }
        .btn-sair:hover {
            background-color: #c03a3a;
            border-color: #ff9999 #8b1a1a #8b1a1a #ff9999;
            color: #fff;
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
        <a href="adminLogin.jsp" class="admin-icon" title="Área do Administrador">
            <img src="img/admin-icon.png" alt="Admin">
        </a>
    </header>

    <div class="pagina-sistema" style="background-image: url('img/bg-quiz-v2.png');">
        <h2 style="font-family: 'VT323', monospace; font-size: 3em; color: #fff; text-shadow: 4px 4px 0 #1a1a1a; margin-bottom: 20px; text-align: center;">Painel do Administrador</h2>
        <p style="color: #ddd; font-size: 1.2em; text-align: center; margin-bottom: 20px;">Bem-vindo! Escolha uma opção abaixo.</p>

        <div class="admin-grid">
            <div class="admin-card">
                <img src="img/icone-usuarios.png" alt="Usuários" style="height: 60px; margin-bottom: 10px;">
                <h3>Relatório de Usuários</h3>
                <p>Veja cada usuário e todas as suas respostas do quiz.</p>
                <a href="relatorioUsuarios.jsp" class="btn-mc">Abrir</a>
            </div>
            <div class="admin-card">
                <img src="img/icone-resumo.png" alt="Resumo" style="height: 60px; margin-bottom: 10px;">
                <h3>Relatório Resumo</h3>
                <p>Número de entrevistados e percentuais de respostas por questão.</p>
                <a href="relatorioResumo.jsp" class="btn-mc">Abrir</a>
            </div>
            <div class="admin-card">
                <img src="img/icone-sair.png" alt="Sair" style="height: 60px; margin-bottom: 10px;">
                <h3>Sair</h3>
                <p>Encerrar a sessão de administrador.</p>
                <a href="logoutAdmin.jsp" class="btn-mc btn-sair">Sair</a>
            </div>
        </div>
    </div>

</body>
</html>