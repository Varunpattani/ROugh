import java.util.Stack;

public class Lab8_4 {
    public static void main(String[] args) {
        String prefix = "+ * 2 + / 14 2 5 1";
        Stack<Integer> stack = new Stack<>();
        
        String[] tokens = prefix.split(" ");
        
       
        for (int i = tokens.length - 1; i >= 0; i--) {
            String token = tokens[i];
            if (isNumeric(token)) {
                stack.push(Integer.parseInt(token));
            } else {
                int op1 = stack.pop();
                int op2 = stack.pop();
                switch(token) {
                    case "+" :
                        stack.push(op1 + op2);
                        break;
                    case "-" :
                        stack.push(op1 - op2);
                        break;
                    case "*" :
                        stack.push(op1 * op2);
                        break;
                    case "/" :
                        stack.push(op1 / op2);
                        break;
                    case "^" :
                        stack.push((int) Math.pow(op1, op2));
                        break;
                }
            }
        }
        
        System.out.println(stack.peek());
    }
    
    public static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
