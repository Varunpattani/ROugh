import java.util.Scanner;
class Employee_Detail{
	int Employee_ID;
	String Name;
	String Destination;
	int Salary;
	
	public Employee_Detail(){
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter Employee ID:");
		this.Employee_ID=sc.nextInt();

		System.out.println("Enter Employee Name:");
		this.Name=sc.next();

		System.out.println("Enter Employee Salary:");
		this.Salary=sc.nextInt();

		System.out.println("Enter Employee Destination:");
		this.Destination=sc.next();

		System.out.println("Enter Employee Salary:");
		this.Salary=sc.nextInt();
	}
	public void print(){
		System.out.println(this.Employee_ID);
		System.out.println(this.Name);
		System.out.println(this.Destination);
		System.out.println(this.Salary);

	}
}

public class Lab5_34{
	public static void main(String[] args) {
		Employee_Detail E = new Employee_Detail();
		E.print();
	}
}