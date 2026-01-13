package org.rodriguez.corp;

import java.sql.Connection;


//TASK DAO en proceso
public class TaskDao {
    private final Connection conn ;

    public  TaskDao(Connection conn){
        this.conn = conn;
    }

}
