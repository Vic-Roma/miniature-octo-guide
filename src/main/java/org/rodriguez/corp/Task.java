package org.rodriguez.corp;

import java.util.Date;

public class Task {

    private int taskId;
    //private Date date;
    private String activity;
    private Member member;

    public Task(String activity, Member member) {
        //this.date = new Date();
        this.member = member;
        this.activity = activity;
    }

    public String print() {
        return "Activity: " + activity + " " +
                "\n" + "Person in charge: " + member.getName() +
                "\n";
    }
    public void setTaskId(int taskId){
        this.taskId = taskId;
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

    public int getTaskId(){
        return this.taskId;
    }


}
