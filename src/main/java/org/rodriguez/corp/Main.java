package org.rodriguez.corp;

import java.sql.*;

public class Main {
    public static void main(String[] args) {

        //Datos de conexion a la base de datos
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "app_user";
        String password = "app_password";


        try( Connection conn = DriverManager.getConnection(url, user, password)){

            MemberDao member = new MemberDao(conn);
            member.pruebaConexion();
            member.getMemberByID(2);

            System.out.println();
            member.getMembers();
            System.out.println();


            //modificar todos los datos de miembro por id
//            member.updateByID(1,"Meche","Cocinar");
//            member.getMemberByID(1);
//            System.out.println();
//            member.getMembers();

            //Modificar task por id
            member.updateTaskByID(1,"Cocinar");
            member.getMembers();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

