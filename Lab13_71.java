import java.util.Scanner;
public class Lab13_71{
    public static void main(String[] args) {
        Circular c = new Circular();
        Scanner sc = new Scanner(System.in);
        int n = 0,num = 0;;
        while(n!=5){
            System.err.println("Enter 1 for insert at first: ");
            System.err.println("Enter 2 for insert at last: ");
            System.err.println("Enter 3 for delete: ");
            System.err.println("Enter 4 for display: ");
            System.err.println("Enter 5 for End: ");
            n = sc.nextInt();
            switch(n){
                case 1:
                    System.err.println("Enter number:");
                    num = sc.nextInt();
                    c.inserAtFirst(num);
                    break;

                case 2:
                    System.err.println("Enter number:");
                    num = sc.nextInt();
                    c.inserAtLast(num);
                    break;

                case 3:
                    System.err.println("Enter positon(starts from 1):");
                    num = sc.nextInt();
                    c.delete(num);
                    break;

                case 4:
                    c.display();
                    break;
                case 5:
                break;
            }
        }
        sc.close();
        
    }
}
class Circular{
    class Node{
        int info;
        Node link;
        
        public Node(int data){
            this.info = data;
            this.link = null;
        }
    }
    Node first;
    Node last;
    public void inserAtFirst(int n){
        Node temp = new Node(n);
        if(first == null){
            first = temp;
            first.link = first;
            last = first;
        }
        else{
            temp.link = first;
            first = temp;
            last.link = first;
        }
    }
    public void inserAtLast(int n){
        Node save = new Node(n);
        if(first == null){
            first = save;
            first.link = first;
            last=first;
            return;
        }
        last.link = save;
        last = save;
        last.link = first;
        
    }
    public void delete(int n){
        Node temp = first;
        int num = 1;
        if(n==1){
            first = first.link;
            last.link = first;
        }
        else{
            Node pre = new Node(0);
            while(num != n){
                pre = temp;
                temp = temp.link;
                num++;
            }
            pre.link = temp.link;
        }
    }
    public void display(){
        Node save = first.link; 
        System.out.print("Circular LL:");
        System.out.print(first.info+"=>");
        while(save.link!=first.link){
            System.out.print(save.info+"=>");
            save = save.link;
        }
        System.out.println();
    }
}