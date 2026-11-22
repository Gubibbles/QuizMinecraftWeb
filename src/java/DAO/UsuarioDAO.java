package DAO;

import java.sql.*;
import util.ConectaBD;
import model.UsuarioBean;

public class UsuarioDAO {

    // Verifica se o nome já está cadastrado
    public boolean nomeExiste(String nome) {
        Connection conexao = null;
        PreparedStatement sql = null;
        ResultSet rs = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement("SELECT id FROM usuarios WHERE nome = ?");
            sql.setString(1, nome);
            rs = sql.executeQuery();
            return rs.next(); // True se encontrou
        } catch (Exception e) {
            System.out.println("Erro ao verificar nome: " + e.getMessage());
            return false;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }

    // Insere um novo usuário e retorna o ID gerado (ou -1 em caso de erro)
    public int inserirUsuario(String nome) {
        Connection conexao = null;
        PreparedStatement sql = null;
        ResultSet rs = null;
        try {
            conexao = ConectaBD.conectar();
            sql = conexao.prepareStatement(
                "INSERT INTO usuarios (nome) VALUES (?)",
                Statement.RETURN_GENERATED_KEYS
            );
            sql.setString(1, nome);
            sql.executeUpdate();
            rs = sql.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return -1;
        } catch (Exception e) {
            System.out.println("Erro ao inserir usuário: " + e.getMessage());
            return -1;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (sql != null) sql.close(); } catch (Exception e) {}
            try { if (conexao != null) conexao.close(); } catch (Exception e) {}
        }
    }
}
