package org.rodriguez.corp;

import java.sql.*;

public class MemberDao {
    private final Connection conn;

    //Constructor
    public MemberDao(Connection conn){
    this.conn = conn;
    }

    public void pruebaConexion()   {
        System.out.println("Connected to PostgreSQL");

    }

    //READ
    public void getMemberByID(int id){
        String sql = "SELECT * FROM members WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idMember = rs.getInt("id");
                String name = rs.getString("name");
                String task = rs.getString("task");

                System.out.println(idMember + " - " + name + " - " + task );
            }
        }  catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getMembers(){

        String selectSql = "SELECT * FROM members ORDER BY id";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(selectSql)) {

            //loop para imprimir datos de tabla
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String task = rs.getString("task");
                System.out.println(id + " | " + name + " | " + task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Update
    //Actualiza informacion de un miembro por id
    public void updateByID(int id,String name, String task){

        String updateByIdSql = "UPDATE members " +
                   "SET name = ?, task = ? " +
                   "WHERE id = ?";

       try(PreparedStatement pstmt = conn.prepareStatement(updateByIdSql)){

           pstmt.setString(1,name);
           pstmt.setString(2,task);
           pstmt.setInt(3,id);
           pstmt.executeUpdate();

           System.out.println("Information Modificated");

       } catch (SQLException e) {
           e.printStackTrace();
       }
    }

    public void updateTaskByID(int id, String task){

        String sql = "UPDATE members " +
                "SET task = ? " +
                "WHERE id = ?";

        try( PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(2,id);
            pstmt.setString(1,task);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //DELETE
    //borra un registro por id
    public void deleteById(int id){

        String sql = "DELETE FROM members WHERE id = ?";

        try(PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1,id);
            pstmt.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }



}
























