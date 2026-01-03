package org.rodriguez.corp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<Member> members = new ArrayList<>();
        members.add(new Member("Juan Pérez"));
        members.add(new Member("Ana López"));
        members.add(new Member("Carlos Ruiz"));

        String url = "jdbc:postgresql://localhost:5432/app_db";
        String user = "app_user";
        String password = "app_password";

        String createTableSql =
                "CREATE TABLE IF NOT EXISTS members (" +
                        "  id SERIAL PRIMARY KEY," +
                        "  name VARCHAR(40) NOT NULL," +
                        "  task VARCHAR(255)" +
                        ")";

        String insertSql = "INSERT INTO members (name) VALUES (?)";

        String selectSql = "SELECT id, name, task FROM members ORDER BY id";
        String dropTableSql = "DROP TABLE IF EXISTS members";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {

            System.out.println("Connected to PostgreSQL");

            //Create table members
            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(createTableSql);
                System.out.println("Table members created");
            }

            //Insert Members
            try (PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
                for (Member m : members) {
                    pstmt.setString(1, m.getName());
                    pstmt.executeUpdate();
                }
                System.out.println("Members inserted");
            }

            //Read and print Table
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(selectSql)) {

                System.out.println("Current members:");
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String task = rs.getString("task");
                    System.out.println(id + " | " + name + " | " + task);
                }
            }

            //Erase table
            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(dropTableSql);
                System.out.println("Table members dropped");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // If you want rollback, you need a separate try/catch or hold conn outside try-with-resources.
            // See note below.
        }
    }
}