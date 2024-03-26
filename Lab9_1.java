 public class Lab9_1{
    public static void main(String[] args) {
        MyThread1 t1=new MyThread1();
        Thread t=new Thread(t1);
        t.start();
        MyThread2 t2=new MyThread2();
        Thread t3=new Thread(t2);
        t3.start();
     
    }
}
class MyThread1 implements Runnable{
    public void run(){
        for(int i=0;i<10;i++){
            System.out.println("Good Morning");
            try {
                    Thread.sleep(1000);
            } catch (Exception e) {
                e.printStackTrace();// TODO: handle exception
            }
        }
    }
}
class MyThread2 implements Runnable{
    public void run(){
        for(int i=0;i<10;i++){
            System.out.println("Good Afternoon");
            try {
                Thread.sleep(3000);
            } catch (Exception e) {
                e.printStackTrace();// TODO: handle exception
            }
        }
    }
}