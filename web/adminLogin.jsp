<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

    <!-- Header fixo (mesmo das outras páginas) -->
    <header class="site-header">
        <a href="index.html">
            <img src="img/logo-minecraft.png" alt="Minecraft" class="logo-img">
        </a>
        <nav>
            <a href="index.html#inicio">Início</a>
            <a href="index.html#sobre">Sobre</a>
            <a href="index.html#mundo">O Mundo</a>
            <a href="index.html#quiz">Quiz</a>
        </nav>
        <a href="adminLogin.jsp" class="admin-icon" title="Área do Administrador">
            <img src="img/admin-icon.png" alt="Admin">
        </a>
    </header>

    <!-- Página de login do admin -->
    <div class="pagina-sistema" style="background-image: url('img/bg-quiz-v2.png');">
        <div class="caixa-sistema">
            <h2>Área do Administrador</h2>
            <%
                String erro = (String) request.getAttribute("erro");
                if (erro != null) {
            %>
                <div class="msg-erro-sistema"><%= erro %></div>
            <%
                }
            %>
            <p>Digite a senha para acessar o painel.</p>
            <form method="POST" action="processarAdminLogin.jsp">
                <input type="password" name="senha" placeholder="Senha do administrador" required>
                <button type="submit" class="btn-mc">Entrar</button>
            </form>
            <a href="index.html" class="link-voltar">← Voltar ao início</a>
        </div>
    </div>

</body>
</html>