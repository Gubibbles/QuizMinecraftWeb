<%@page import="java.util.List"%>
<%@page import="DAO.RespostaDAO"%>
<%@page import="model.RespostaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean adminLogado = (Boolean) session.getAttribute("adminLogado");
    if (adminLogado == null || !adminLogado) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    RespostaDAO dao = new RespostaDAO();
    List<RespostaBean> lista = dao.listarTodos();
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Usuários - Admin</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>
        .tabela-wrap { overflow-x: auto; }
        table { font-size: 0.9em; min-width: 900px; }
        .btn-acao {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.85em;
            font-weight: bold;
            margin: 2px;
        }
        .btn-editar { background-color: #2a5a8b; color: #fff; }
        .btn-editar:hover { background-color: #3a7ac0; }
        .btn-excluir { background-color: #8b2a2a; color: #fff; }
        .btn-excluir:hover { background-color: #c03a3a; }
        .vazio { text-align: center; padding: 30px; color: #aaa; }
    </style>
</head>
<body>
    <header>
        <h1>⛏ RELATÓRIO DE USUÁRIOS ⛏</h1>
    </header>
    <nav>
        <a href="admin.jsp">Painel</a>
        <a href="relatorioUsuarios.jsp">Relatório de Usuários</a>
        <a href="relatorioResumo.jsp">Relatório Resumo</a>
        <a href="logoutAdmin.jsp">Sair</a>
    </nav>
    <div class="container">
        <h2>Usuários e Respostas</h2>
        <p>Total de registros: <strong style="color:#7ec850;"><%= lista.size() %></strong></p>

        <div class="tabela-wrap">
        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Q1</th><th>Q2</th><th>Q3</th><th>Q4</th>
                    <th>Q5</th><th>Q6</th><th>Q7</th><th>Q8</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (lista.isEmpty()) {
                %>
                    <tr><td colspan="10" class="vazio">Nenhum usuário respondeu o quiz ainda.</td></tr>
                <%
                    } else {
                        for (RespostaBean rb : lista) {
                %>
                    <tr>
                        <td><strong><%= rb.getNomeUsuario() %></strong></td>
                        <td><%= rb.getR1() %></td>
                        <td><%= rb.getR2() %></td>
                        <td><%= rb.getR3() %></td>
                        <td><%= rb.getR4() %></td>
                        <td><%= rb.getR5() %></td>
                        <td><%= rb.getR6() %></td>
                        <td><%= rb.getR7() %></td>
                        <td><%= rb.getR8() %></td>
                        <td>
                            <a href="editarResposta.jsp?id=<%= rb.getId() %>" class="btn-acao btn-editar">Editar</a>
                            <a href="excluirResposta.jsp?id=<%= rb.getId() %>&usuarioId=<%= rb.getUsuarioId() %>"
                               class="btn-acao btn-excluir"
                               onclick="return confirm('Tem certeza que deseja excluir este usuário e suas respostas?');">Excluir</a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        </div>
    </div>
    <footer>
        Projeto acadêmico — JavaWeb + MySQL | Tema: Minecraft
    </footer>
</body>
</html>