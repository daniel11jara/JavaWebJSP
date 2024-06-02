/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.*;
import com.mysql.jdbc.Driver;

/**
 *
 * @author PC
 */
public class Conexao {

    public Connection conectar() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/javaweb?useTimezone=true&serverTimezone=UTC&user=root&password=admin");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
