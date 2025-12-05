package org.rodriguez.corp;

import java.util.Date;

public class Task {

    Date date;
    String activity;
    String member;


    public Task(String activity, String member){
        this.date = new Date();
        this.member = member;
        this.activity = activity;
    }


    public String print(){
        // Que es ese \n?
        //para hacer un salto de linea :0 o todo en una sola linea?
        //
        return "Actividy: " + activity + " " +
                "\n"+ "Date: " + date  +
                "\n" + "Person in charge: " + member +
                "\n";
    }


}
