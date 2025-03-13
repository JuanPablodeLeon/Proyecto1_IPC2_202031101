package DAO;


import funcions.LoginBean;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author juanpa
 */
public class LoginDao {

    // Cambiar el método a estático
    public static boolean validate(LoginBean loginBean) throws ClassNotFoundException, SQLException {
        boolean status = false;

        // Cargar el controlador de MariaDB
        Class.forName("org.mariadb.jdbc.Driver");

        // Establecer la conexión a la base de datos
        try (Connection connection = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/proyecto1IPC2", "root", "hiraimomo")) {

            // Consulta SQL para validar el usuario y la contraseña
            String sql = "SELECT * FROM usuario WHERE nombreUsuario = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, loginBean.getUsername());
                preparedStatement.setString(2, loginBean.getPassword());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                status = rs.next(); // Si hay un resultado, el usuario es válido
            }
        } catch (SQLException e) {
            // Manejo de excepciones SQL
            printSQLException(e);
        }
        return status;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}