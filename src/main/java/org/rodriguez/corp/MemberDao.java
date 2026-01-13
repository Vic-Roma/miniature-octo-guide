package org.rodriguez.corp;

import com.sun.source.tree.ReturnTree;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
    private final Connection conn;

    //Constructor
    public MemberDao(Connection conn){
    this.conn = conn;
    }

    public void pruebaConexion()   {
        System.out.println("Connected to PostgreSQL");

    }

    //Insert
    public void createMember(String name){

        String sql = "INSERT INTO members (name) VALUES (?)";

        try(PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,name);
            pstmt.executeUpdate();

        }  catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //READ
    //Retorna un el miembro asignado al id
    public Member getMemberByID(int id){
        Member member = new Member();
        String sql = "SELECT * FROM members WHERE id = ?";
        int i=0;
        List<Member> members = new ArrayList<>();

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member.setId( rs.getInt("id") );
                member.setName( rs.getString("name") );
                member.setActivity( rs.getString("task"));

            }
        }  catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }

    public List<Member> getMembers(){

        String selectSql = "SELECT * FROM members ORDER BY id";
        List<Member> members = new ArrayList<>();


        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(selectSql)) {

            //loop para imprimir datos de tabla
            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getInt("id"));
                member.setName(rs.getString("name"));
                member.setActivity(rs.getString("task"));

                members.add(member);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return members;
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
























