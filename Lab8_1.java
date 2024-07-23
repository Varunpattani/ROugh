import java.util.Stack;

public class Lab8_1{
    public static void main(String[] args) {
        String infix = "(a+b^c^d)*(e+f/d)";
        System.out.println("Infix: " + infix);
        
        StringBuilder postfix = new StringBuilder();
        Stack<Character> stack = new Stack<>();
        
        stack.push('('); 
        
        for (int i = 0; i < infix.length(); i++) {
            char ch = infix.charAt(i);
            
            if (Character.isLetterOrDigit(ch)) {
                postfix.append(ch);
            } else if (ch == '(') {
                stack.push(ch);
            } else if (ch == ')') {
                while (stack.peek() != '(') {
                    postfix.append(stack.pop()); 
                }
                stack.pop(); 
            } else { 
                while (!stack.isEmpty() && precedence(stack.peek()) >= stackPrecedence(ch)) {
                    postfix.append(stack.pop()); 
                }
                stack.push(ch); 
            }
        }
        
        while (!stack.isEmpty() && stack.peek() != '(') {
            postfix.append(stack.pop()); // Pop remaining operators
        }
        
        System.out.println("Postfix: " + postfix);
    }
    
    public static int precedence(char c) {
        switch (c) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 3;
            case '^':
                return 5;
            default:
                return 0; 
        }
    }
    
    public static int stackPrecedence(char c) {
        switch (c) {
            case '+':
            case '-':
                return 2;
            case '*':
            case '/':
                return 4;
            case '^':
                return 6; 
            default:
                return 0; 
        }
    }
}
