<%@page import="DAO.RespostaDAO"%>
<%@page import="model.RespostaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Integer usuarioId = (Integer) session.getAttribute("usuarioId");
    String usuarioNome = (String) session.getAttribute("usuarioNome");
    if (usuarioId == null || usuarioNome == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Lê as 8 respostas do formulário
    int r1 = Integer.parseInt(request.getParameter("r1"));
    int r2 = Integer.parseInt(request.getParameter("r2"));
    int r3 = Integer.parseInt(request.getParameter("r3"));
    int r4 = Integer.parseInt(request.getParameter("r4"));
    int r5 = Integer.parseInt(request.getParameter("r5"));
    int r6 = Integer.parseInt(request.getParameter("r6"));
    int r7 = Integer.parseInt(request.getParameter("r7"));
    int r8 = Integer.parseInt(request.getParameter("r8"));

    // Monta o bean e insere no banco
    RespostaBean rb = new RespostaBean();
    rb.setUsuarioId(usuarioId);
    rb.setR1(r1); rb.setR2(r2); rb.setR3(r3); rb.setR4(r4);
    rb.setR5(r5); rb.setR6(r6); rb.setR7(r7); rb.setR8(r8);

    RespostaDAO dao = new RespostaDAO();
    boolean ok = dao.inserirRespostas(rb);

    // Gabarito das respostas corretas
    int[] gabarito = {2, 3, 3, 2, 3, 2, 3, 3};
    int[] respostas = {r1, r2, r3, r4, r5, r6, r7, r8};
    int acertos = 0;
    for (int i = 0; i < 8; i++) {
        if (respostas[i] == gabarito[i]) acertos++;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .resultado-box {
            max-width: 600px;
            margin: 40px auto;
            background-color: #2a2a2a;
            padding: 35px;
            border-radius: 10px;
            border: 2px solid #3d5a2a;
            text-align: center;
        }
        .resultado-box h2 {
            text-align: center;
            border: none;
            padding: 0;
        }
        .nota {
            font-size: 3.5em;
            color: #7ec850;
            font-weight: bold;
            text-shadow: 3px 3px 0 #1a1a1a;
            margin: 20px 0;
        }
        .msg-sucesso { color: #99ff99; margin: 15px 0; }
        .msg-erro { color: #ff9999; margin: 15px 0; }
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
        <div class="resultado-box">
            <h2>Resultado do Quiz</h2>
            <p>Jogador: <strong style="color:#7ec850;"><%= usuarioNome %></strong></p>
            <div class="nota"><%= acertos %> / 8</div>
            <%
                if (ok) {
            %>
                <p class="msg-sucesso">✔ Suas respostas foram salvas com sucesso!</p>
            <%
                } else {
            %>
                <p class="msg-erro">✘ Houve um erro ao salvar suas respostas.</p>
            <%
                }
            %>
            <p style="color:#aaa; margin-top:20px;">
                <% if (acertos >= 6) { %>
                    Excelente! Você é um verdadeiro especialista em Minecraft! 🏆
                <% } else if (acertos >= 4) { %>
                    Bom trabalho! Você conhece bem o mundo dos blocos. 👍
                <% } else { %>
                    Continue explorando! Leia as seções Sobre e O Mundo para aprender mais. 📚
                <% } %>
            </p>
            <a href="index.html" class="btn">Voltar ao Início</a>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>