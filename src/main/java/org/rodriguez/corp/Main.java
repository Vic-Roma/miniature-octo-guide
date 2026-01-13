package org.rodriguez.corp;

import javax.annotation.processing.SupportedSourceVersion;
import javax.swing.*;
import java.awt.print.Printable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        //Datos de conexion a la base de datos
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "app_user";
        String password = "app_password";

        try( Connection conn = DriverManager.getConnection(url, user, password)){

            MemberDao memberDao = new MemberDao(conn);

////            Metodos creados en MembersDao:

////            createMember(String name)
////            getMemberByID(int id)
////            getMembers()
////            updateByID(int id,String name, String task)
////            updateTaskByID(int id, String task)
////            deleteById(int id)

//            Extrae un miembro obteniendolo de la base de datos a traves del DAO
//            y lo imprime en consola
            memberDao.pruebaConexion();
            Member member1 = memberDao.getMemberByID(1);

            System.out.println(
                    member1.getId() + " | " +
                    member1.getName() + " | "  +
                    member1.getTask()
            );
            System.out.println();

//            Extrae todos los miembros obteniendolso de la base de datos a traves del DAO
//            y los imprimes en consola
            List<Member> members = memberDao.getMembers();
            for(Member m:members){
                System.out.println(m.getId()+ " | " + m.getName() + " | " + m.getTask());
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

