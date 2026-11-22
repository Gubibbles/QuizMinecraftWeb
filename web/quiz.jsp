<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verifica se o usuário está logado na sessão
    Integer usuarioId = (Integer) session.getAttribute("usuarioId");
    String usuarioNome = (String) session.getAttribute("usuarioNome");
    if (usuarioId == null || usuarioNome == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - Minecraft Quiz</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .quiz-box {
            background-color: #2a2a2a;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid #3d5a2a;
            margin-bottom: 25px;
        }
        .questao {
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid #444;
        }
        .questao:last-child {
            border-bottom: none;
        }
        .questao p.enunciado {
            font-weight: bold;
            color: #7ec850;
            margin-bottom: 12px;
            text-align: left;
        }
        .opcao {
            display: block;
            padding: 8px 12px;
            margin: 5px 0;
            background-color: #1a1a1a;
            border: 1px solid #444;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s, border-color 0.2s;
        }
        .opcao:hover {
            background-color: #333;
            border-color: #7ec850;
        }
        .opcao input {
            margin-right: 10px;
            accent-color: #7ec850;
        }
        .btn-enviar {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #3d5a2a;
            color: #fff;
            border: 2px solid #7ec850;
            border-radius: 6px;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-enviar:hover {
            background-color: #7ec850;
            color: #1a1a1a;
            transform: scale(1.02);
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
        <h2>Quiz de Minecraft</h2>
        <p style="color:#aaa;">Olá, <strong style="color:#7ec850;"><%= usuarioNome %></strong>! Responda as 8 perguntas abaixo. Cada questão tem 4 alternativas (1, 2, 3 e 4).</p>

        <form method="POST" action="processarQuiz.jsp">
            <div class="quiz-box">

                <!-- Questão 1 -->
                <div class="questao">
                    <p class="enunciado">1. Qual é o nome da criatura que explode ao se aproximar do jogador?</p>
                    <label class="opcao"><input type="radio" name="r1" value="1" required> 1) Zumbi</label>
                    <label class="opcao"><input type="radio" name="r1" value="2"> 2) Creeper</label>
                    <label class="opcao"><input type="radio" name="r1" value="3"> 3) Esqueleto</label>
                    <label class="opcao"><input type="radio" name="r1" value="4"> 4) Enderman</label>
                </div>

                <!-- Questão 2 -->
                <div class="questao">
                    <p class="enunciado">2. Qual desses materiais é usado para criar ferramentas e armaduras no jogo?</p>
                    <label class="opcao"><input type="radio" name="r2" value="1" required> 1) Terra</label>
                    <label class="opcao"><input type="radio" name="r2" value="2"> 2) Areia</label>
                    <label class="opcao"><input type="radio" name="r2" value="3"> 3) Ferro</label>
                    <label class="opcao"><input type="radio" name="r2" value="4"> 4) Água</label>
                </div>

                <!-- Questão 3 -->
                <div class="questao">
                    <p class="enunciado">3. Em qual modo de jogo o jogador tem recursos infinitos e pode voar?</p>
                    <label class="opcao"><input type="radio" name="r3" value="1" required> 1) Survival</label>
                    <label class="opcao"><input type="radio" name="r3" value="2"> 2) Adventure</label>
                    <label class="opcao"><input type="radio" name="r3" value="3"> 3) Creative</label>
                    <label class="opcao"><input type="radio" name="r3" value="4"> 4) Spectator</label>
                </div>

                <!-- Questão 4 -->
                <div class="questao">
                    <p class="enunciado">4. Quem criou o Minecraft originalmente?</p>
                    <label class="opcao"><input type="radio" name="r4" value="1" required> 1) Bill Gates</label>
                    <label class="opcao"><input type="radio" name="r4" value="2"> 2) Markus "Notch" Persson</label>
                    <label class="opcao"><input type="radio" name="r4" value="3"> 3) Steve Jobs</label>
                    <label class="opcao"><input type="radio" name="r4" value="4"> 4) Gabe Newell</label>
                </div>

                <!-- Questão 5 -->
                <div class="questao">
                    <p class="enunciado">5. Qual é o bloco mais resistente a explosões no jogo?</p>
                    <label class="opcao"><input type="radio" name="r5" value="1" required> 1) Madeira</label>
                    <label class="opcao"><input type="radio" name="r5" value="2"> 2) Pedra</label>
                    <label class="opcao"><input type="radio" name="r5" value="3"> 3) Obsidiana</label>
                    <label class="opcao"><input type="radio" name="r5" value="4"> 4) Vidro</label>
                </div>

                <!-- Questão 6 -->
                <div class="questao">
                    <p class="enunciado">6. Qual desses biomas é caracterizado por areia e cactos?</p>
                    <label class="opcao"><input type="radio" name="r6" value="1" required> 1) Floresta</label>
                    <label class="opcao"><input type="radio" name="r6" value="2"> 2) Deserto</label>
                    <label class="opcao"><input type="radio" name="r6" value="3"> 3) Tundra</label>
                    <label class="opcao"><input type="radio" name="r6" value="4"> 4) Oceano</label>
                </div>

                <!-- Questão 7 -->
                <div class="questao">
                    <p class="enunciado">7. Qual criatura é passiva e pode ser montada com uma sela?</p>
                    <label class="opcao"><input type="radio" name="r7" value="1" required> 1) Creeper</label>
                    <label class="opcao"><input type="radio" name="r7" value="2"> 2) Zumbi</label>
                    <label class="opcao"><input type="radio" name="r7" value="3"> 3) Porco</label>
                    <label class="opcao"><input type="radio" name="r7" value="4"> 4) Esqueleto</label>
                </div>

                <!-- Questão 8 -->
                <div class="questao">
                    <p class="enunciado">8. Qual empresa comprou a Mojang (criadora do Minecraft) em 2014?</p>
                    <label class="opcao"><input type="radio" name="r8" value="1" required> 1) Sony</label>
                    <label class="opcao"><input type="radio" name="r8" value="2"> 2) Nintendo</label>
                    <label class="opcao"><input type="radio" name="r8" value="3"> 3) Microsoft</label>
                    <label class="opcao"><input type="radio" name="r8" value="4"> 4) Valve</label>
                </div>

            </div>
            <button type="submit" class="btn-enviar">ENVIAR RESPOSTAS</button>
        </form>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>