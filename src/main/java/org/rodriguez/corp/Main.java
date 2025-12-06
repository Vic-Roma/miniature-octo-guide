package org.rodriguez.corp;

public class Main {
    public static void main(String[] args) {

        Member migue = new Member("Migue");
        Member vic = new Member("Victor");


        Task task1 = new Task("lavar platos", migue);
        Task task2 = new Task("Barrer patio");

        vic.setActivity(task2);
        task2.setMember(vic);
        vic.setName("Victor Hugo");

        System.out.println(task1.print());
        System.out.println(task2.print());



    }
}
