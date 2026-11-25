<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

    <!-- Header fixo -->
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
    </header>

    <!-- Página de login -->
    <div class="pagina-sistema" style="background-image: url('img/bg-quiz-v2.png');">
        <div class="caixa-sistema">
            <h2>Entrar para o Quiz</h2>
            <%
                String erro = (String) request.getAttribute("erro");
                if (erro != null) {
            %>
                <div class="msg-erro-sistema"><%= erro %></div>
            <%
                }
            %>
            <p>Digite um nome para participar. Se já existir, escolha outro.</p>
            <form method="POST" action="processarLogin.jsp">
                <input type="text" name="nome" placeholder="Seu nome de usuário" required maxlength="100">
                <button type="submit" class="btn-mc">Entrar e ir para o quiz</button>
            </form>
            <a href="index.html" class="link-voltar">← Voltar ao início</a>
        </div>
    </div>

</body>
</html>