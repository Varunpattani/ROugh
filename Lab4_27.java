import java.util.Scanner;
public class Lab4_27{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Enter String");
        String str = sc.nextLine();
        char ch=' ';
        String ans= "";
        for (int i=0;i<str.length() ;i++ ) {
            ch=str.charAt(i);
            if(ch==' '){
                ans+=" ";
            }
            else{
                if(Character.isUpperCase(ch)){
                    ans+=Character.toLowerCase(ch);
                }
                else{
                    ans+=Character.toUpperCase(ch);
                }
            }
        }
        System.out.println(ans);
    }
}