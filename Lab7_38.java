import java.util.Scanner;
public class Lab7_38{
	public static void main(String[] args) {
		MyStack s = new MyStack();
		Scanner sc = new Scanner(System.in);
		boolean flag = true;
		int n=0;
		
		while(flag){
			
			System.out.println("Press 1 for push,2 for pop, 3 for change, 4 for peep, 5 for display, 6 for end:");
			n=sc.nextInt();

			switch(n){
				case 1:
				       s.push();
				       break;
			    case 2:
				       s.pop();
				       break;
			    case 3:
				       s.change();
				       break;
			    case 4:
				       s.peep();
				       break;
			    case 5:
				       s.display();
				       break;
			    case 6:
				       flag=false;
				       break;
			}

		}
	}
}

class MyStack{
	int[] st = new int[10];
	int l=10;
	int top=-1;
	Scanner sc = new Scanner(System.in);	
	public void push(){
		System.out.println("Enter input:");
		int n=sc.nextInt();

		if(top>=l){
			System.out.println("Stack Overflow");
		}
		else{
			top++;
			st[top]=n;
		}
	}

	public void pop(){
		if(top<0){
			System.out.println("Stack Underflow");
		}
		else{
			top--;
			System.out.println(st[top+1]);
			st[top+1]=0;
		}
	}
	public void peep(){
		System.out.println("Enter ith:");
		int i=sc.nextInt();

		if(top-i+1<=0){
			System.out.println("Stack Underflow");
		}
		else{
			System.out.println(st[top-i+1]);
		}
	}
	public void change(){
		System.out.println("Enter index:");
		int i=sc.nextInt();
		System.out.println("Enter input:");
		int n=sc.nextInt();

		if((top-i+1)<0){
			System.out.println("Stack Underflow");
		}
		else{
			
			st[top-i+1]=n;
		}
	}
	public void display(){
		System.out.println("Stack:");
		for(int i=0;i<l;i++){
			System.out.println(st[i]);
		}
	}

}