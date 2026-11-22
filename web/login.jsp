<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .login-box {
            max-width: 450px;
            margin: 60px auto;
            background-color: #2a2a2a;
            padding: 35px;
            border-radius: 10px;
            border: 2px solid #3d5a2a;
        }
        .login-box h2 {
            text-align: center;
            border: none;
            padding: 0;
            margin-bottom: 25px;
        }
        .login-box input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 2px solid #8b6b3d;
            border-radius: 6px;
            background-color: #1a1a1a;
            color: #fff;
            font-size: 1em;
        }
        .login-box input[type="text"]:focus {
            outline: none;
            border-color: #7ec850;
        }
        .login-box .btn {
            width: 100%;
            text-align: center;
            cursor: pointer;
            font-size: 1.1em;
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
        .msg-info {
            background-color: #1e3a1e;
            color: #99ff99;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #44ff44;
            margin-bottom: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>⛏ MINECRAFT QUIZ ⛏</h1>
    </header>
    <nav>
        <a href="index.html">Início</a>
        <a href="sobre.html">Sobre</a>
        <a href="mundo.html">O Mundo</a>
        <a href="login.jsp">Fazer o Quiz</a>
    </nav>
    <div class="container">
        <div class="login-box">
            <h2>Entrar para o Quiz</h2>
            <%
                String erro = (String) request.getAttribute("erro");
                if (erro != null) {
            %>
                <div class="msg-erro"><%= erro %></div>
            <%
                }
                String aviso = (String) request.getAttribute("aviso");
                if (aviso != null) {
            %>
                <div class="msg-info"><%= aviso %></div>
            <%
                }
            %>
            <p style="text-align:center; margin-bottom:18px; color:#aaa;">
                Digite um nome para participar. Se já existir, escolha outro.
            </p>
            <form method="POST" action="processarLogin.jsp">
                <input type="text" name="nome" placeholder="Seu nome de usuário" required maxlength="100">
                <button type="submit" class="btn">Entrar e ir para o Quiz</button>
            </form>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>