package org.rodriguez.corp;

import java.sql.*;

public class Main {
    public static void main(String[] args)  {

        String url = "jdbc:postgresql://localhost:5432/app_db";
        String user = "app_user";
        String password = "app_password";

        String sql = "SELECT * FROM members";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

             System.out.println("Connected to PostgreSQL");

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                System.out.println(id + " | " + name);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

