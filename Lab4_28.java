import java.util.Scanner;
public class Lab4_28{
	static int add;
	public static void sum(int[] a){
		
		for(int i=0;i<a.length;i++){
			add+=a[i];
		}
		System.out.println("Sum="+add);
		
	}
	public static void avg(int[] a){
		 
		double av = add/a.length;
		
		System.out.println("Avg="+av);
		
	}
	public static void min(int[] a){
		int m = a[0];
		for(int i=0;i<a.length;i++){
			if(m>=a[i]){
				m=a[i];
			}
		}
		System.out.println("Min="+m);
		
	}
	public static void max(int[] a){
		int mx = a[0];
		for(int i=0;i<a.length;i++){
			if(mx<=a[i]){
				mx=a[i];
			}
		}
		System.out.println("Max="+mx);
		
	}
	
	
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter range:");
		int n = sc.nextInt();

		int[] arr = new int[n];

		System.out.println("Enter elements");
		for (int i=0;i<n;i++) {
			arr[i]=sc.nextInt();
		}
		int num=0;
		while(num!=5){
			System.out.println("For Sum Enter 1:");
			System.out.println("For Min Enter 2:");
			System.out.println("For Max Enter 3:");
			System.out.println("For Avg Enter 4:");
			System.out.println("For End Enter 5:");
			num = sc.nextInt();
			switch(num){
			case 1:
				sum(arr);
				break;
			case 2:
				min(arr);
				break;
			case 3:
				max(arr);
				break;
			case 4:
				avg(arr);
				break;
			case 5:
				break;
			}

		}
	}
}