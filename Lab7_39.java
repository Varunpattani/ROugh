import java.util.Scanner;
public class Lab7_39 {
    public static void main(String[] args) {
        Mystack st = new Mystack();
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter String:");
        String str = sc.next();
        int i=0;char ch=' ';

        while(str.charAt(i)!='c'){
            ch=str.charAt(i);
            st.push(ch);
            i++;
        } 
        i++;
        boolean flag = true;char c= ' ';
        while (i!=str.length()){
            c=st.pop();
            if(c!=str.charAt(i)){
                flag=false;
                break;
            }
            else{
                i++;
                continue;
            }

        }
        if(!flag){
            System.out.println("incorrect");
        }
        else{
            System.out.println("correct");
        }
    }
}
class Mystack{
    char[] st = new char[10];
    int top=-1;

    public void push(char ch){
        if(top>=10){
            System.out.println("Stack overflow");
        }
        else{
            top++;
            st[top] = ch;
        }
    }
    public char pop(){
        char ch;
        if(top<0){
            System.out.println("Stack underflow");
            return 0;
        }
        else{
            top--;
            ch=st[top+1];
            st[top+1]=' ';
            return ch; 
        }
    }
}
