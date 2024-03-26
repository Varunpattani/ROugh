public class Lab9_2{
    public static void main(String[] args){
        MyThread1 t1=new MyThread1();
        Thread t3=new Thread(t1);//t1.run();
        t3.start();
        MyThread2 t2=new MyThread2();
        Thread t4=new Thread(t2);//t1.run();
        t4.start();
    }
}

class MyThread1 implements Runnable{
    public void run(){
        for(int i=0;i<=10;i++){
            if(i%2==0){System.out.println(i);}
           try {
            Thread.sleep(1000);
           } catch (Exception e) {
               e.printStackTrace();
           } 
        }
    }
}
class MyThread2 implements Runnable {
    public void run(){
        for(int i=1;i<10;i++){
            if(i%2!=0){System.out.println(i);}
           try {
            Thread.sleep(1000);
           } catch (Exception e) {
               e.printStackTrace();
           } 
        }
    }
}