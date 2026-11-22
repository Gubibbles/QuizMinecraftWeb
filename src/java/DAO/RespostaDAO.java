package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConectaBD;
import model.RespostaBean;

public class RespostaDAO {

    // Insere as respostas do quiz para um usuário
    public boolean inserirRespostas(RespostaBean r) {
        Connection conexao = null;
        PreparedStatement sql = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement(
                "INSERT INTO respostas (usuario_id, r1, r2, r3, r4, r5, r6, r7, r8) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );
            sql.setInt(1, r.getUsuarioId());
            sql.setInt(2, r.getR1());
            sql.setInt(3, r.getR2());
            sql.setInt(4, r.getR3());
            sql.setInt(5, r.getR4());
            sql.setInt(6, r.getR5());
            sql.setInt(7, r.getR6());
            sql.setInt(8, r.getR7());
            sql.setInt(9, r.getR8());
            sql.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro ao inserir respostas: " + e.getMessage());
            return false;
        } finally {
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }

    // Lista todos os usuários com suas respostas (relatório 1)
    public List<RespostaBean> listarTodos() {
        List<RespostaBean> lista = new ArrayList<>();
        Connection conexao = null;
        PreparedStatement sql = null;
        ResultSet rs = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement(
                "SELECT u.nome, r.* FROM usuarios u " +
                "INNER JOIN respostas r ON u.id = r.usuario_id ORDER BY u.nome"
            );
            rs = sql.executeQuery();
            while (rs.next()) {
                RespostaBean rb = new RespostaBean();
                rb.setId(rs.getInt("id"));
                rb.setUsuarioId(rs.getInt("usuario_id"));
                rb.setNomeUsuario(rs.getString("nome"));
                rb.setR1(rs.getInt("r1"));
                rb.setR2(rs.getInt("r2"));
                rb.setR3(rs.getInt("r3"));
                rb.setR4(rs.getInt("r4"));
                rb.setR5(rs.getInt("r5"));
                rb.setR6(rs.getInt("r6"));
                rb.setR7(rs.getInt("r7"));
                rb.setR8(rs.getInt("r8"));
                lista.add(rb);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
        return lista;
    }

    // Conta quantos usuários responderam (relatório 2)
    public int contarEntrevistados() {
        Connection conexao = null;
        PreparedStatement sql = null;
        ResultSet rs = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement("SELECT COUNT(*) FROM respostas");
            rs = sql.executeQuery();
            if (rs.next()) return rs.getInt(1);
            return 0;
        } catch (Exception e) {
            System.out.println("Erro ao contar: " + e.getMessage());
            return 0;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }

    // Conta quantas vezes uma alternativa foi escolhida para uma questão específica
    public int contarResposta(int questao, int alternativa) {
        Connection conexao = null;
        PreparedStatement sql = null;
        ResultSet rs = null;
        try {
            conexao = ConectaBD.conectar();
            // Monta o nome da coluna dinamicamente
            String coluna = "r" + questao;
            sql = conexao.prepareStatement(
                "SELECT COUNT(*) FROM respostas WHERE " + coluna + " = ?"
            );
            sql.setInt(1, alternativa);
            rs = sql.executeQuery();
            if (rs.next()) return rs.getInt(1);
            return 0;
        } catch (Exception e) {
            System.out.println("Erro ao contar resposta: " + e.getMessage());
            return 0;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }

    // Exclui as respostas de um usuário pelo ID
    public boolean excluirPorUsuario(int usuarioId) {
        Connection conexao = null;
        PreparedStatement sql = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement("DELETE FROM respostas WHERE usuario_id = ?");
            sql.setInt(1, usuarioId);
            sql.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro ao excluir: " + e.getMessage());
            return false;
        } finally {
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }

    // Exclui um usuário pelo ID
    public boolean excluirUsuario(int usuarioId) {
        excluirPorUsuario(usuarioId);
        Connection conexao = null;
        PreparedStatement sql = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement("DELETE FROM usuarios WHERE id = ?");
            sql.setInt(1, usuarioId);
            sql.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro ao excluir usuário: " + e.getMessage());
            return false;
        } finally {
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }
}