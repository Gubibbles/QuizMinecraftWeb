<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");

    if (nome == null || nome.trim().isEmpty()) {
        request.setAttribute("erro", "Por favor, digite um nome.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    nome = nome.trim();

    UsuarioDAO dao = new UsuarioDAO();

    if (dao.nomeExiste(nome)) {
        // Nome já existe: mostra erro e volta para o login
        request.setAttribute("erro", "O nome \"" + nome + "\" já está em uso. Escolha outro nome.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Nome novo: insere no banco
    int idGerado = dao.inserirUsuario(nome);

    if (idGerado == -1) {
        request.setAttribute("erro", "Erro ao cadastrar. Tente novamente.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Guarda na sessão para usar no quiz
    session.setAttribute("usuarioId", idGerado);
    session.setAttribute("usuarioNome", nome);

    // Redireciona para o quiz
    response.sendRedirect("quiz.jsp");
%>