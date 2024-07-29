public class Lab12_65{
    public static void main(String[] args) {
        Singly s = new Singly();
        s.insertAtLast(1);
        s.insertAtLast(4);
        s.insertAtLast(1);
        s.insertAtLast(2);
        s.sort();
        s.display();
    }
}
class Singly{
    class Node{
        int info;
        Node link;
        public Node(int n){
            this.info = n;
            this.link = null;
        }
    }
    Node first = null;
    Node last = null;
    public void insertAtLast(int n){
        Node temp = new Node(n);
        if(first == null){
            first = temp;
            last = temp;
            return;
        }
        last.link = temp;
        last = temp;
    }
    public void display(){
        Node save = first;
        System.out.print("Linked list = ");
        while(save!=null){
            System.out.print(save.info+" => ");
            save = save.link;
        }
    }
    public void sort(){
        Node current = first;
        
        int temp = 0;
        while(current!=null){
            Node next = current.link;
           while(next!=null){ 
              if(current.info > next.info){
                temp = current.info;
                current.info = next.info;
                next.info = temp;
              }
             next = next.link;
           }
            current = current.link;
        } 

    }
}