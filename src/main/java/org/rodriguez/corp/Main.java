package org.rodriguez.corp;

import java.sql.*;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        //Datos de conexion a la base de datos
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "app_user";
        String password = "app_password";

        Scanner scanner = new Scanner(System.in);

        try( Connection conn = DriverManager.getConnection(url, user, password)){

            MemberDao memberDao = new MemberDao(conn);
            int numberInput;
            String textInput;

            int selectInput;

           do{
                System.out.println("Selecciona Opcion" + "\n" +
                        "1) Agregar Resistro" + "\n" +
                        "2) Leer todos los registros" + "\n" +
                        "3) Modificar Registro por id" + "\n" +
                        "4) Borrar Registro por id" + "\n" +
                        "5) Salir"
                );

                selectInput = scanner.nextInt();
                scanner.nextLine();

                switch (selectInput) {
                    case 1:

                        //Insertar miembro
                        System.out.println("Escribe nombre");
                        textInput = scanner.nextLine();
                        memberDao.createMember(textInput);
                        System.out.println("Miembro agregado");

                        break;
                    case 2:

                        //Leer Registros
                        List<Member> members = memberDao.getMembers();
                        for(Member m:members){
                            System.out.println(m.getId()+ " | " + m.getName() + " | " + m.getTask());
                        }

                        break;
                    case 3:

                        //Modifica Registro
                        System.out.println("Escribe id");
                        numberInput = scanner.nextInt();
                        scanner.nextLine();
                        System.out.println("modificar nombre");
                        textInput = scanner.nextLine();
                        memberDao.updateByID(numberInput,textInput,null);
                        System.out.println("regristro modificado");

                        break;
                    case 4:

                        //Borra Registro por id
                        System.out.println("Escribe id");
                        numberInput = scanner.nextInt();
                        scanner.nextLine();
                        memberDao.deleteById(numberInput);
                        System.out.println("Registro Borrado");

                        break;
                    case 5:
                        break;

                }

               System.out.println();
            }while(selectInput<5);

            System.out.println("Programa Terminado");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}



