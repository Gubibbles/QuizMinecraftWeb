package util;

import java.sql.*;

public class ConectaBD {
    public static Connection conectar() throws ClassNotFoundException {
        Connection conexao = null;
        try {
            // Driver para MySQL 8+
            Class.forName("com.mysql.cj.jdbc.Driver");
            // URL do banco: jdbc:mysql://localhost:3306/quizminecraft
            conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/quizminecraft?useSSL=false&serverTimezone=UTC",
                "root", // Usuário padrão do XAMPP
                ""      // Senha padrão do XAMPP é vazia
            );
            return conexao;
        } catch (SQLException ex) {
            System.out.println("Erro na conexão: " + ex.getMessage());
        }
        return conexao;
    }
}
