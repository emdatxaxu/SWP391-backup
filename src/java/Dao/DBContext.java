/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * object to access database
 * @author Admin
 */
public class DBContext {
    public Connection connection;

    public DBContext() {
        try {
            String user = "root",
                    password = "Nhom1swp",
                    url = "jdbc:mysql://localhost:3306/swp391";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            if(connection==null){
                System.out.println("Loi");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
