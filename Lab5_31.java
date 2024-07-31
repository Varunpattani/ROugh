import java.util.Scanner;
public class Lab5_31{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[][] a = new int[3][2];
	    int[][] b = new int[2][3];
	    int[][] c = new int[3][3];
	    int i=0,j=0;

	    System.out.println("Enter matrix 1");
	    for(i=0;i<3;i++){
	    	for(j=0;j<2;j++){
	    		a[i][j]=sc.nextInt();
	    	}
	    }

	    System.out.println("Enter matrix 2");
	    for(i=0;i<2;i++){
	    	for(j=0;j<3;j++){
	    		b[i][j]=sc.nextInt();
	    	}
	    }

	    for(i=0;i<3;i++){
	    	for(j=0;j<3;j++){
	    		for(int k=0;k<2;k++){
	    			c[i][j]+=a[i][k]*b[k][j];
	    		}
	    		
	    	}
	    }
	    System.out.println("Multiplication=");
	    for(i=0;i<3;i++){
	    	for(j=0;j<3;j++){
	    		System.out.print(c[i][j]+" ");
	    	}
	    	System.out.println("");
	    }
	}

}