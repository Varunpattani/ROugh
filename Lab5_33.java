import java.util.Scanner;
public class Lab5_33{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Enter two numbers:");
        int a=sc.nextInt();
        int b=sc.nextInt();
        System.out.println("Values before: a="+a+" b="+b);
        swap(a,b);
    }
    public static void swap(int x,int y){
        int temp=x;
        x=y;
        y=temp;
        System.out.println("Values after: a="+x+" b="+y);
    }
}