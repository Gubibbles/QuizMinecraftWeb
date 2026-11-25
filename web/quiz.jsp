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
        .quiz-container {
            max-width: 700px;
            width: 95%;
            margin: 0 auto;
        }
        .questao-slide {
            display: none;
        }
        .questao-slide.ativa {
            display: block;
        }
        .questao-slide h3 {
            font-family: 'VT323', monospace;
            font-size: 1.8em;
            color: #1a1a1a;
            text-shadow: 1px 1px 0 #aaa;
            margin-bottom: 20px;
            text-align: center;
        }
        .opcao-quiz {
            display: block;
            background-color: #6a6a6a;
            border: 2px solid;
            border-color: #aaa #565656 #565656 #aaa;
            color: #fff;
            font-family: 'VT323', monospace;
            font-size: 1.4em;
            padding: 12px 18px;
            margin: 8px 0;
            cursor: pointer;
            text-shadow: 2px 2px 0 #3f3f3f;
            transition: background-color 0.1s;
        }
        .opcao-quiz:hover {
            background-color: #7a7a7a;
            border-color: #bdc6ff #59639a #59639a #bdc6ff;
            color: #ffffa0;
        }
        .opcao-quiz input {
            margin-right: 12px;
            accent-color: #7ec850;
        }
        .botoes-nav {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 25px;
        }
        .botoes-nav .btn-mc {
            flex: 1;
            font-size: 1.3em;
            padding: 10px 15px;
        }
        .progresso {
            text-align: center;
            font-family: 'VT323', monospace;
            font-size: 1.3em;
            color: #1a1a1a;
            margin-bottom: 15px;
        }
        .btn-enviar-final {
            display: none;
            width: 100%;
            margin-top: 15px;
            font-size: 1.5em;
        }
        .btn-enviar-final.visivel {
            display: block;
        }
    </style>
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

    <!-- Página do quiz -->
    <div class="pagina-sistema" style="background-image: url('${pageContext.request.contextPath}/img/bg-quiz-v2.png');">
        <div class="caixa-sistema quiz-container">
            <h2>Quiz de Minecraft</h2>
            <p style="color:#1a1a1a;">Olá, <strong><%= usuarioNome %></strong>! Responda as 8 perguntas.</p>

            <form method="POST" action="processarQuiz.jsp" id="formQuiz">
                <div class="progresso">Questão <span id="numAtual">1</span> de 8</div>

                <!-- Questão 1 -->
                <div class="questao-slide ativa" data-questao="1">
                    <h3>1. Qual é o nome da criatura que explode ao se aproximar do jogador?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r1" value="1" required> 1) Zumbi</label>
                    <label class="opcao-quiz"><input type="radio" name="r1" value="2"> 2) Creeper</label>
                    <label class="opcao-quiz"><input type="radio" name="r1" value="3"> 3) Esqueleto</label>
                    <label class="opcao-quiz"><input type="radio" name="r1" value="4"> 4) Enderman</label>
                </div>

                <!-- Questão 2 -->
                <div class="questao-slide" data-questao="2">
                    <h3>2. Qual desses materiais é usado para criar ferramentas e armaduras no jogo?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r2" value="1" required> 1) Terra</label>
                    <label class="opcao-quiz"><input type="radio" name="r2" value="2"> 2) Areia</label>
                    <label class="opcao-quiz"><input type="radio" name="r2" value="3"> 3) Ferro</label>
                    <label class="opcao-quiz"><input type="radio" name="r2" value="4"> 4) Água</label>
                </div>

                <!-- Questão 3 -->
                <div class="questao-slide" data-questao="3">
                    <h3>3. Em qual modo de jogo o jogador tem recursos infinitos e pode voar?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r3" value="1" required> 1) Survival</label>
                    <label class="opcao-quiz"><input type="radio" name="r3" value="2"> 2) Adventure</label>
                    <label class="opcao-quiz"><input type="radio" name="r3" value="3"> 3) Creative</label>
                    <label class="opcao-quiz"><input type="radio" name="r3" value="4"> 4) Spectator</label>
                </div>

                <!-- Questão 4 -->
                <div class="questao-slide" data-questao="4">
                    <h3>4. Quem criou o Minecraft originalmente?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r4" value="1" required> 1) Bill Gates</label>
                    <label class="opcao-quiz"><input type="radio" name="r4" value="2"> 2) Markus "Notch" Persson</label>
                    <label class="opcao-quiz"><input type="radio" name="r4" value="3"> 3) Steve Jobs</label>
                    <label class="opcao-quiz"><input type="radio" name="r4" value="4"> 4) Gabe Newell</label>
                </div>

                <!-- Questão 5 -->
                <div class="questao-slide" data-questao="5">
                    <h3>5. Qual é o bloco mais resistente a explosões no jogo?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r5" value="1" required> 1) Madeira</label>
                    <label class="opcao-quiz"><input type="radio" name="r5" value="2"> 2) Pedra</label>
                    <label class="opcao-quiz"><input type="radio" name="r5" value="3"> 3) Obsidiana</label>
                    <label class="opcao-quiz"><input type="radio" name="r5" value="4"> 4) Vidro</label>
                </div>

                <!-- Questão 6 -->
                <div class="questao-slide" data-questao="6">
                    <h3>6. Qual desses biomas é caracterizado por areia e cactos?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r6" value="1" required> 1) Floresta</label>
                    <label class="opcao-quiz"><input type="radio" name="r6" value="2"> 2) Deserto</label>
                    <label class="opcao-quiz"><input type="radio" name="r6" value="3"> 3) Tundra</label>
                    <label class="opcao-quiz"><input type="radio" name="r6" value="4"> 4) Oceano</label>
                </div>

                <!-- Questão 7 -->
                <div class="questao-slide" data-questao="7">
                    <h3>7. Qual criatura é passiva e pode ser montada com uma sela?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r7" value="1" required> 1) Creeper</label>
                    <label class="opcao-quiz"><input type="radio" name="r7" value="2"> 2) Zumbi</label>
                    <label class="opcao-quiz"><input type="radio" name="r7" value="3"> 3) Porco</label>
                    <label class="opcao-quiz"><input type="radio" name="r7" value="4"> 4) Esqueleto</label>
                </div>

                <!-- Questão 8 -->
                <div class="questao-slide" data-questao="8">
                    <h3>8. Qual empresa comprou a Mojang (criadora do Minecraft) em 2014?</h3>
                    <label class="opcao-quiz"><input type="radio" name="r8" value="1" required> 1) Sony</label>
                    <label class="opcao-quiz"><input type="radio" name="r8" value="2"> 2) Nintendo</label>
                    <label class="opcao-quiz"><input type="radio" name="r8" value="3"> 3) Microsoft</label>
                    <label class="opcao-quiz"><input type="radio" name="r8" value="4"> 4) Valve</label>
                </div>

                <!-- Botões de navegação -->
                <div class="botoes-nav">
                    <button type="button" class="btn-mc" id="btnAnterior" onclick="mudarQuestao(-1)" disabled>◀ Questão anterior</button>
                    <button type="button" class="btn-mc" id="btnProxima" onclick="mudarQuestao(1)">Próxima questão ▶</button>
                </div>

                <!-- Botão de enviar -->
                <button type="submit" class="btn-mc btn-enviar-final" id="btnEnviar">ENVIAR RESPOSTAS</button>
            </form>

            <a href="index.html" class="link-voltar">← Voltar ao início</a>
        </div>
    </div>

    <script>
        let questaoAtual = 1;
        const totalQuestoes = 8;

        function mudarQuestao(direcao) {
            // Se for avançar, verifica se a questão atual foi respondida
            if (direcao === 1) {
                const radios = document.querySelectorAll('input[name="r' + questaoAtual + '"]');
                let respondida = false;
                radios.forEach(function(radio) {
                    if (radio.checked) respondida = true;
                });
                if (!respondida) {
                    alert('Por favor, selecione uma resposta antes de avançar.');
                    return;
                }
            }

            // Esconde a questão atual
            document.querySelector('.questao-slide[data-questao="' + questaoAtual + '"]').classList.remove('ativa');

            // Atualiza o número da questão
            questaoAtual += direcao;

            // Mostra a nova questão
            document.querySelector('.questao-slide[data-questao="' + questaoAtual + '"]').classList.add('ativa');

            // Atualiza o progresso
            document.getElementById('numAtual').textContent = questaoAtual;

            // Atualiza os botões
            document.getElementById('btnAnterior').disabled = (questaoAtual === 1);

            if (questaoAtual === totalQuestoes) {
                document.getElementById('btnProxima').style.display = 'none';
                document.getElementById('btnEnviar').classList.add('visivel');
            } else {
                document.getElementById('btnProxima').style.display = 'block';
                document.getElementById('btnEnviar').classList.remove('visivel');
            }
        }
    </script>

</body>
</html>