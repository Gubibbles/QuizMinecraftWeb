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

    // Matriz de contagens
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
        .resumo-total {
            background-color: #2a2a2a;
            border: 2px solid #7ec850;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            margin: 25px 0;
        }
        .resumo-total .num {
            font-size: 3em;
            color: #7ec850;
            font-weight: bold;
        }
        .questao-resumo {
            background-color: #2a2a2a;
            border: 1px solid #444;
            border-radius: 8px;
            padding: 18px;
            margin-bottom: 15px;
        }
        .questao-resumo h3 {
            color: #7ec850;
            margin-bottom: 12px;
            font-size: 1.05em;
        }
        .barra-linha {
            display: flex;
            align-items: center;
            margin: 6px 0;
        }
        .barra-label {
            width: 30px;
            color: #aaa;
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
            width: 70px;
            text-align: right;
            color: #ddd;
            font-size: 0.9em;
        }
        .sem-dados { text-align: center; color: #aaa; padding: 20px; }
    </style>
</head>
<body>
    <header>
        <h1>⛏ RELATÓRIO RESUMO ⛏</h1>
    </header>
    <nav>
        <a href="admin.jsp">Painel</a>
        <a href="relatorioUsuarios.jsp">Relatório de Usuários</a>
        <a href="relatorioResumo.jsp">Relatório Resumo</a>
        <a href="logoutAdmin.jsp">Sair</a>
    </nav>
    <div class="container">
        <h2>Resumo Geral</h2>

        <div class="resumo-total">
            <p style="color:#aaa; text-align:center;">Total de entrevistados</p>
            <div class="num"><%= total %></div>
        </div>

        <h2>Percentuais por Questão</h2>

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
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>