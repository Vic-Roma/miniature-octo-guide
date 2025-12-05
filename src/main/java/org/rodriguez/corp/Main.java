package org.rodriguez.corp;

public class Main {
    public static void main(String[] args) {

        Member meche = new Member("Meche");
        Member lalo = new Member("Lalo");
        Member migue = new Member("Migue");




        Task task1 = new Task("limpiar mesa", meche.getName());
        Task task2 = new Task("barrer cocina", lalo.getName());
        Task task3 = new Task("lavar platos", migue.getName());
        Family family1 = new Family();



        System.out.println(task1.print());
        System.out.println(task2.print());
        System.out.println(task3.print());


    }
}
