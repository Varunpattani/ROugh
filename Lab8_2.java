import java.util.Stack;

public class Lab8_2 {
    public static void main(String[] args) {
        String infix = "a+b*c-d/e*h";
       
        
        System.out.println("Infix: " + infix);
       
    
  
        StringBuilder reversedInfix = new StringBuilder();
        for (int i = infix.length() - 1; i >= 0; i--) {
            char ch = infix.charAt(i);
            if (ch == '(') {
                reversedInfix.append(')');
            } else if (ch == ')') {
                reversedInfix.append('(');
            } else {
                reversedInfix.append(ch);
            }
        }
        
        StringBuilder prefix = new StringBuilder();
        Stack<Character> stack = new Stack<>();
        
        for (int i = 0; i < reversedInfix.length(); i++) {
            char ch = reversedInfix.charAt(i);
            
            if (Character.isLetterOrDigit(ch)) {
                prefix.append(ch);
            } else if (ch == ')') {
                stack.push(ch);
            } else if (ch == '(') {
                while (!stack.isEmpty() && stack.peek() != ')') {
                    prefix.append(stack.pop());
                }
                stack.pop(); 
            } else { 
                while (!stack.isEmpty() && precedence(stack.peek()) > stackPrecedence(ch)) {
                    prefix.append(stack.pop());
                }
                stack.push(ch);
            }
        }
        
        while (!stack.isEmpty()) {
            prefix.append(stack.pop());
        }
        prefix.reverse();
        System.out.println("Prefix: "+prefix);
    }
    
    public static int precedence(char c) {
        switch (c) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            case '^':
                return 3; 
            case '(':
            case ')':
                return 0; 
            default:
                return 0; 
       }
    }
    
    public static int stackPrecedence(char c) {
        switch (c) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            case '^':
                return 3; 
            case '(':
            case ')':
                return 0; 
            default:
                return 0; 
        }
    }
}
