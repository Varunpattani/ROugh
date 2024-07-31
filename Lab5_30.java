import java.util.Scanner;

public class Lab5_30{
	public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);

	int[][] a = new int[2][2];
	int[][] b = new int[2][2];
	int[][] c = new int[2][2];
	int i=0,j=0;

	System.out.println("Enter matrix 1");
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			a[i][j]=sc.nextInt();
		}
	}

	System.out.println("Enter matrix 2");
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			b[i][j]=sc.nextInt();
		}
	}
	System.out.println("Addition=");
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			c[i][j]=a[i][j]+b[i][j];
			System.out.print(c[i][j]+" ");
		}
		System.out.println("");
	}
	}
}