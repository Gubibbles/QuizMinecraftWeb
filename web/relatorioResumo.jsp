<%@page import="DAO.RespostaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    RespostaDAO dao = new RespostaDAO();
    int total = dao.contarEntrevistados();

    int[][] contagens = new int[8][4];
    for (int q = 0; q < 8; q++) {
        for (int a = 1; a <= 4; a++) {
            contagens[q][a-1] = dao.contarResposta(q + 1, a);
        }
    }

    String[] enunciados = {
        "1. Qual criatura explode ao se aproximar?",
        "2. Material usado para ferramentas e armaduras?",
        "3. Modo com recursos infinitos e voo?",
        "4. Quem criou o Minecraft?",
        "5. Bloco mais resistente a explosões?",
        "6. Bioma com areia e cactos?",
        "7. Criatura passiva que pode ser montada?",
        "8. Empresa que comprou a Mojang em 2014?"
    };
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório Resumo - Admin</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .resumo-container {
            max-width: 900px;
            width: 95%;
            margin: 0 auto;
        }
        .resumo-total {
            background-color: rgba(139, 139, 139, 0.95);
            border: 4px solid;
            border-color: #a0a0a0 #565656 #565656 #a0a0a0;
            padding: 20px;
            text-align: center;
            margin: 25px 0;
            box-shadow: 8px 8px 0 rgba(0,0,0,0.5);
        }
        .resumo-total .num {
            font-family: 'VT323', monospace;
            font-size: 4em;
            color: #1a1a1a;
            text-shadow: 2px 2px 0 #aaa;
            font-weight: bold;
        }
        .resumo-total p {
            color: #1a1a1a;
            text-align: center;
        }
        .questao-resumo {
            background-color: rgba(139, 139, 139, 0.95);
            border: 4px solid;
            border-color: #a0a0a0 #565656 #565656 #a0a0a0;
            padding: 18px;
            margin-bottom: 15px;
            box-shadow: 6px 6px 0 rgba(0,0,0,0.4);
        }
        .questao-resumo h3 {
            font-family: 'VT323', monospace;
            font-size: 1.3em;
            color: #1a1a1a;
            text-shadow: 1px 1px 0 #aaa;
            margin-bottom: 12px;
        }
        .barra-linha {
            display: flex;
            align-items: center;
            margin: 6px 0;
        }
        .barra-label {
            width: 30px;
            color: #1a1a1a;
            font-weight: bold;
        }
        .barra-container {
            flex: 1;
            background-color: #1a1a1a;
            border-radius: 4px;
            height: 22px;
            margin: 0 10px;
            overflow: hidden;
        }
        .barra-preenchida {
            height: 100%;
            background: linear-gradient(90deg, #3d5a2a, #7ec850);
            transition: width 0.5s;
        }
        .barra-valor {
            width: 80px;
            text-align: right;
            color: #1a1a1a;
            font-size: 0.9em;
            font-weight: bold;
        }
        .sem-dados {
            text-align: center;
            color: #ddd;
            padding: 30px;
            font-size: 1.2em;
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
        <div class="resumo-container">
            <h2 style="font-family: 'VT323', monospace; font-size: 3em; color: #fff; text-shadow: 4px 4px 0 #1a1a1a; margin-bottom: 20px; text-align: center;">Relatório Resumo</h2>

            <div class="resumo-total">
                <p style="color:#1a1a1a;">Total de entrevistados</p>
                <div class="num"><%= total %></div>
            </div>

            <h2 style="font-family: 'VT323', monospace; font-size: 2.2em; color: #fff; text-shadow: 3px 3px 0 #1a1a1a; margin: 20px 0; text-align: center;">Percentuais por Questão</h2>

            <%
                if (total == 0) {
            %>
                <p class="sem-dados">Nenhuma resposta registrada ainda.</p>
            <%
                } else {
                    for (int q = 0; q < 8; q++) {
                        int somaQ = 0;
                        for (int a = 0; a < 4; a++) somaQ += contagens[q][a];
            %>
                <div class="questao-resumo">
                    <h3><%= enunciados[q] %></h3>
                    <%
                        for (int a = 0; a < 4; a++) {
                            int qtd = contagens[q][a];
                            double pct = (somaQ > 0) ? (qtd * 100.0 / somaQ) : 0;
                    %>
                        <div class="barra-linha">
                            <div class="barra-label"><%= (a+1) %></div>
                            <div class="barra-container">
                                <div class="barra-preenchida" style="width: <%= pct %>%"></div>
                            </div>
                            <div class="barra-valor"><%= qtd %> (<%= String.format("%.1f", pct) %>%)</div>
                        </div>
                    <%
                        }
                    %>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>

</body>
</html>