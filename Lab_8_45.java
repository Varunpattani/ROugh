import java.util.Scanner;

public class Lab_8_45 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter infix: ");
        String infix = sc.nextLine();
        infix += ")";
        Stack st = new Stack(infix.length());
        st.push('(');
        StringBuilder polish = new StringBuilder();
        int i = 0;
        int rank = 0;

        while (i < infix.length() && st.TOP != -1) {
            char next = infix.charAt(i);
            i++;

            if (next == ' ') {
                continue;
            }

            if (next >= 'a' && next <= 'z') {
                polish.append(next);
                rank++;
            } else if (next == '(') {
                st.push(next);
            } else if (next == ')') {
                while (st.TOP != -1 && st.peep(1) != '(') {
                    char temp = st.pop();
                    polish.append(temp);
                    rank += rank(temp);
                }
                st.pop(); // pop the '('
            } else {
                while (st.TOP != -1 && stackPrecedence(st.peep(1)) >= infixPrecedence(next)) {
                    char temp = st.pop();
                    polish.append(temp);
                    rank += rank(temp);
                }
                st.push(next);
                rank--;
            }
        }

        while (st.TOP != -1 && st.peep(1) != '(') {
            char temp = st.pop();
            polish.append(temp);
            rank += rank(temp);
        }

            System.out.println(polish.toString());
    }

    public static int infixPrecedence(char c) {
        switch (c) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 3;
            case '^':
                return 6;
            case '(':
                return 9;
            case ')':
                return 0;
            default:
                return 7;
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
                return 5;
            case '(':
                return 0;
            default:
                return 8;
        }
    }

    public static int rank(char c) {
        String operators = "+-/*^";
        if (operators.indexOf(c) != -1) {
            return -1;
        } else if (c >= 'a' && c <= 'z') {
            return 1;
        }
        return 0;
    }
}

class Stack {
    char[] S;
    int TOP = -1;
    int N;

    public Stack(int size) {
        N = size;
        S = new char[N];
    }

    public void push(char X) {
        if (TOP >= N - 1) {
            System.out.println("Stack Overflow");
        } else {
            TOP++;
            S[TOP] = X;
        }
    }

    public char pop() {
        if (TOP == -1) {
            System.out.println("Stack Underflow");
            return ' ';
        } else {
            return S[TOP--];
        }
    }

    public char peep(int index) {
        if (TOP - index + 1 < 0) {
            System.out.println("Stack Underflow");
            return ' ';
        } else {
            return S[TOP - index + 1];
        }
    }
}
