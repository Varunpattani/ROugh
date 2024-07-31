import java.util.Scanner;
public class linked{
	public static void main(String[] args) {
		Singly s = new Singly();
		
		s.insert();
		s.insert();
		s.insert();
		s.insert();
		s.insert();
		s.insert();
		s.insert();


		s.display();
	}
}
class MyNode{
	 int info;
	 MyNode link;
	 
	 public MyNode(int n){
	 	this.info=n;
	 	this.link=null;
	 }
}
class Singly{
	Scanner sc = new Scanner(System.in);
	MyNode head;
	public void insert(){
		MyNode next;
		System.out.println("Enter number:");
		int n=sc.nextInt();
		
		if(head==null){
			head = new MyNode(n);
			head.link=null;
		}
		else{
			next = new MyNode(n);
			next.link = head;
			head = next;

		}
	}
	public void display(){
		MyNode temp = head;
		while(temp!=null){
			System.out.print(temp.info+"->");
			temp = temp.link;
		}
	}
}
