import java.util.Scanner;
import java.util.Stack;

public class Lab7_40{
	public static void main(String[] args) {
		
		Stack <Character> stk = new Stack<>();
		Scanner sc = new Scanner(System.in);

		System.out.println("Enter String:");
		String str = sc.next();

		for(int i=0; i<str.length(); i++){
			stk.push(str.charAt(i));
		}

		char ch = ' ';
		int ca = 0,cb = 0;
		
		for(int i=0; i<str.length(); i++){
			ch=stk.pop();
			if(ch=='a') ca++;
			else cb++;
		}
		System.out.println("Count of a="+ca+" Count of b="+cb);

	}
}