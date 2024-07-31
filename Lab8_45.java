import java.util.Stack;
public class Lab8_45{
	public static void main(String[] args) {
		Stack <Character> stk = new Stack<>(); 
		
		String infix = "(a+b^c^d)*(e+f/d))";
		String postfix = "";
		int top = 0,num = 0;
		char ch = ' ',m = ' ';
		stk.push('(');

		for(int i=0;i<infix.length();i++){
			ch = infix.charAt(i);
			num = strin(ch);
			if(top==0){
				top = stac(ch);
			}
			else{
				if(num<=top){
					while(num<=top && top!=0){
						postfix+=stk.pop();
						m = stk.peek();
						top = stac(m);
					}
				}
				else{
					stk.push(ch);
				}
			}
		}
		System.out.println(postfix);
	}
	public static int strin(char ch){
		if(ch == '+' || ch == '-') return 1;
		else if(ch == '*' || ch == '/') return 3;
		else if(ch == '^') return 6;
		else if(ch == '(') return 9;
		else return 7;
	}
	public static int stac(char ch){
		if(ch == '+' || ch == '-') return 2;
		else if(ch == '*' || ch == '/') return 4;
		else if(ch == '^') return 5;
		else if(ch == '(') return 0;
		else return 8;
	}
}