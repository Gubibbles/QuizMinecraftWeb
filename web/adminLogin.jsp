<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .login-box {
            max-width: 400px;
            margin: 60px auto;
            background-color: #2a2a2a;
            padding: 35px;
            border-radius: 10px;
            border: 2px solid #8b6b3d;
        }
        .login-box h2 {
            text-align: center;
            border: none;
            padding: 0;
            margin-bottom: 25px;
        }
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 2px solid #8b6b3d;
            border-radius: 6px;
            background-color: #1a1a1a;
            color: #fff;
            font-size: 1em;
        }
        .login-box input[type="password"]:focus {
            outline: none;
            border-color: #7ec850;
        }
        .login-box .btn {
            width: 100%;
            text-align: center;
            cursor: pointer;
        }
        .msg-erro {
            background-color: #5a1e1e;
            color: #ff9999;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ff4444;
            margin-bottom: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>⛏ MINECRAFT QUIZ - ADMIN ⛏</h1>
    </header>
    <nav>
        <a href="index.html">Início</a>
        <a href="sobre.html">Sobre</a>
        <a href="mundo.html">O Mundo</a>
        <a href="login.jsp">Fazer o Quiz</a>
    </nav>
    <div class="container">
        <div class="login-box">
            <h2>Área do Administrador</h2>
            <%
                String erro = (String) request.getAttribute("erro");
                if (erro != null) {
            %>
                <div class="msg-erro"><%= erro %></div>
            <%
                }
            %>
            <form method="POST" action="processarAdminLogin.jsp">
                <input type="password" name="senha" placeholder="Senha do administrador" required>
                <button type="submit" class="btn">Entrar</button>
            </form>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>