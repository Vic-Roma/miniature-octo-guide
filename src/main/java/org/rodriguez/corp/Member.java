package org.rodriguez.corp;

public class Member {

    private String name;
    private Task activity;
    //int familyID;
    //String activity;


    public Member(){
        this.name = "Persona";
    }

    public Member(String name){
        this.name = name;
    }

    public Member(String name, Task activity){
        this.name = name;
        this.activity = activity;
    }

    // MIGUEL: Bien, a esto se le llama GETTER
    public String getName(){
        return this.name;
    }

    public String getActivity(){
        return this.activity.getActivity();
    }

    // SETTER
    public void setName(String name){
        this.name = name;
    }

    public void setActivity(Task activity){
        this.activity = activity;
        getName();

    }
}


