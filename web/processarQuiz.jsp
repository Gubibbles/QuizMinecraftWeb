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

    int r1 = Integer.parseInt(request.getParameter("r1"));
    int r2 = Integer.parseInt(request.getParameter("r2"));
    int r3 = Integer.parseInt(request.getParameter("r3"));
    int r4 = Integer.parseInt(request.getParameter("r4"));
    int r5 = Integer.parseInt(request.getParameter("r5"));
    int r6 = Integer.parseInt(request.getParameter("r6"));
    int r7 = Integer.parseInt(request.getParameter("r7"));
    int r8 = Integer.parseInt(request.getParameter("r8"));

    RespostaBean rb = new RespostaBean();
    rb.setUsuarioId(usuarioId);
    rb.setR1(r1); rb.setR2(r2); rb.setR3(r3); rb.setR4(r4);
    rb.setR5(r5); rb.setR6(r6); rb.setR7(r7); rb.setR8(r8);

    RespostaDAO dao = new RespostaDAO();
    boolean ok = dao.inserirRespostas(rb);

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
        .nota-grande {
            font-family: 'VT323', monospace;
            font-size: 4em;
            color: #1a1a1a;
            text-shadow: 2px 2px 0 #aaa;
            margin: 15px 0;
            text-align: center;
        }
        .msg-resultado {
            font-size: 1.1em;
            color: #1a1a1a;
            text-align: center;
            margin: 15px 0;
        }
    </style>
</head>
<body>

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

    <div class="pagina-sistema" style="background-image: url('img/bg-quiz.jpg');">
        <div class="caixa-sistema">
            <h2>Resultado do Quiz</h2>
            <p>Jogador: <strong><%= usuarioNome %></strong></p>
            <div class="nota-grande"><%= acertos %> / 8</div>
            <%
                if (ok) {
            %>
                <p class="msg-resultado" style="color:#0a5a0a;">✔ Suas respostas foram salvas com sucesso!</p>
            <%
                } else {
            %>
                <p class="msg-resultado" style="color:#8b1a1a;">✘ Houve um erro ao salvar suas respostas.</p>
            <%
                }
            %>
            <p class="msg-resultado">
                <% if (acertos >= 6) { %>
                    Excelente! Você é um verdadeiro especialista em Minecraft! 🏆
                <% } else if (acertos >= 4) { %>
                    Bom trabalho! Você conhece bem o mundo dos blocos. 👍
                <% } else { %>
                    Continue explorando! Leia as seções Sobre e O Mundo para aprender mais. 📚
                <% } %>
            </p>
            <a href="index.html" class="btn-mc" style="display:block; margin-top:20px;">Voltar ao início</a>
        </div>
    </div>

</body>
</html>