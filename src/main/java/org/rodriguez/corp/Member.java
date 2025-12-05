package org.rodriguez.corp;

public class Member {

    String name;
    //int familyID;
    //String activity;

    public Member(String name){
        this.name   = name;
    }

    // MIGUEL: Bien, a esto se le llama GETTER
    public String getName(){
        return name;
    }
}
