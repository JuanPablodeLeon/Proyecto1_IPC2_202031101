/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conectionDB;

/**
 *
 * @author juanpa
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mariadb://localhost:3306/proyecto1IPC2";
    private static final String USER = "juanpa"; // Reemplaza con tu usuario de MariaDB
    private static final String PASSWORD = "hiraimomo"; // Reemplaza con tu contraseña de MariaDB

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
