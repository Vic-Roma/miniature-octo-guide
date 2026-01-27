package org.rodriguez.corp;

import java.util.List;

public class Member {

    private int id;
    private String name;
    private String task;

    public Member(){
        this("persona",null);
    }

    public Member(String name){
        this(name,null);
    }

    public Member(String name, String task){
        this.name = name;
        this.task = task;
    }

    // MIGUEL: Bien, a esto se le llama GETTER
    public int getId(){
        return this.id;
    }

    public String getName(){
        return this.name;
    }

    public String getTask(){
        return this.task;
    }


    // SETTER
    public void setName(String name){
        this.name = name;
    }

    public void setActivity(String task){
        this.task = task;

    }

    public void setId(int id){
        this.id = id;
    }


}


