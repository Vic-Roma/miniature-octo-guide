package org.rodriguez.corp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {

        Member migue = new Member("Migue");
        Member vic = new Member("Victor");

        Task task1 = new Task("lavar platos", migue);
        Task task2 = new Task("Barrer patio",vic);

        vic.setActivity(task2);
        vic.setName("Victor Hugo");

        System.out.println(task1.print());
        System.out.println(task2.print());
        System.out.println(task1.print());

//        Task task3 = new Task("HOLA",migue);
//        Task task4 = new Task("Miguel",vic);

            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "app_user";
            String password = "app_password";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                System.out.println("Connected to PostgreSQL");

                conn.
            }




    }


}
