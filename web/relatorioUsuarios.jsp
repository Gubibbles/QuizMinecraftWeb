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
        .relatorio-container {
            max-width: 1100px;
            width: 95%;
            margin: 0 auto;
        }
        .tabela-wrap {
            overflow-x: auto;
            background-color: rgba(139, 139, 139, 0.95);
            border: 4px solid;
            border-color: #a0a0a0 #565656 #565656 #a0a0a0;
            padding: 20px;
            box-shadow: 8px 8px 0 rgba(0,0,0,0.5);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #2a2a2a;
            min-width: 900px;
        }
        th {
            background-color: #3d5a2a;
            color: #fff;
            padding: 10px;
            border: 2px solid #8b6b3d;
            font-family: 'VT323', monospace;
            font-size: 1.3em;
        }
        td {
            padding: 8px;
            border: 1px solid #444;
            text-align: center;
            color: #e0e0e0;
        }
        tr:nth-child(even) {
            background-color: #242424;
        }
        tr:hover {
            background-color: #333;
        }
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
        .total-info {
            color: #ddd;
            font-size: 1.2em;
            margin-bottom: 15px;
            text-align: center;
        }
        .total-info strong { color: #7ec850; }
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
        <div class="relatorio-container">
            <h2 style="font-family: 'VT323', monospace; font-size: 3em; color: #fff; text-shadow: 4px 4px 0 #1a1a1a; margin-bottom: 20px; text-align: center;">Relatório de Usuários</h2>
            <p class="total-info">Total de registros: <strong><%= lista.size() %></strong></p>

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
                                    <a href="#" class="btn-acao btn-excluir"
                                       onclick="abrirModalExclusao(<%= rb.getId() %>, <%= rb.getUsuarioId() %>, '<%= rb.getNomeUsuario() %>'); return false;">
                                       Excluir
                                    </a>
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
    </div>

    <!-- Modal de confirmação de exclusão -->
    <div id="modalExclusao" class="modal-overlay">
        <div class="modal-caixa">
            <h2>Confirmar Exclusão</h2>
            <p>Tem certeza que deseja excluir o usuário <strong id="nomeExclusao"></strong> e todas as suas respostas?</p>
            <p style="color: #8b1a1a; font-weight: bold;">Esta ação não pode ser desfeita.</p>
            <div class="modal-botoes">
                <button class="btn-mc" onclick="fecharModal()">Cancelar</button>
                <a href="#" id="linkExclusao" class="btn-mc btn-sair">Excluir</a>
            </div>
        </div>
    </div>

    <script>
        function abrirModalExclusao(id, usuarioId, nome) {
            document.getElementById('nomeExclusao').textContent = nome;
            document.getElementById('linkExclusao').href = 'excluirResposta.jsp?id=' + id + '&usuarioId=' + usuarioId;
            document.getElementById('modalExclusao').classList.add('ativo');
        }
        function fecharModal() {
            document.getElementById('modalExclusao').classList.remove('ativo');
        }
    </script>

</body>
</html>