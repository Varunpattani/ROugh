import java.util.Stack;

public class Lab8_3 {
    public static void main(String[] args) {
        String infix = "5,4,6,+,*,4,9,3,/,+,*";
        Stack<Integer> stack = new Stack<>();
        
        String[] tokens = infix.split(",");
        
        for (String token : tokens) {
            if (isNumeric(token)) {
                stack.push(Integer.parseInt(token));
            } else {
                int op2 = stack.pop();
                int op1 = stack.pop();
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
