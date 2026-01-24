package org.rodriguez.corp;

import java.sql.Connection;


//TASK DAO en proceso
public class TaskDao {
    private final Connection conn ;

    public  TaskDao(Connection conn){
        this.conn = conn;
    }

}

// OOP
// Inheritance - Create a copy.
// Encapsulation - You're creating a context.
// Abstraction - You make information and behavior available
// Polymorphism  - You can change or manipulate a class behavior.