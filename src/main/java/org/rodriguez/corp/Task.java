package org.rodriguez.corp;

import java.util.Date;

public class Task {
    Date date;
    String activity;
    Member member;

//    public Task(){
//        this.activity = "actividad no asignada";
//        this.date = new Date();
//
//
//    }
//
//    public Task(String activity){
//        this.activity = activity;
//        this.date = new Date();
//    }

    public Task(String activity, Member member) {
        this.date = new Date();
        this.member = member;
        this.activity = activity;
    }

    public String print() {
        return "Activity: " + activity + " " +
                "\n" + "Date: " + date +
                "\n" + "Person in charge: " + member.getName() +
                "\n";
    }

    public void setActivity(String activity){
        this.activity = activity;
    }

    public void setMember  (Member member){
        this.member = member;
    }

    public String getActivity(){
        return this.activity;
    }

    public String getMember(){
        return this.member.getName();
    }

}
