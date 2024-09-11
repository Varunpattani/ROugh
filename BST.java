public class BST {
    class Node{
        int data;
        Node lptr = null;
        Node rptr = null;

        public Node(int data) {
            this.data = data;
            this.lptr = lptr;
            this.rptr = rptr;
        }
    }

    Node root = null;

        public Node insertNode(Node root,int data) {
            if(root == null){
                root = new Node(data);
                return root;
            }
            if(root.data > data){
                root.lptr = insertNode(root.lptr, data);
            }
            else if(root.data < data){
                root.rptr = insertNode(root.rptr, data);
            }
            return root;
        }

        public void preOrder(Node root){
            if(root == null) return;
            System.out.print(root.data+" ");
            preOrder(root.lptr);
            preOrder(root.rptr);
        }

        public void inOrder(Node root) {
            if(root==null) return;
            inOrder(root.lptr);
            System.out.print(root.data+" ");
            inOrder(root.rptr);
        }

        public void postOrder(Node root) {
            if(root==null) return;
            postOrder(root.lptr);
            postOrder(root.rptr);
            System.out.print(root.data+" ");
        }

        public int Secrch(int num,Node root) {
            if(root == null) {
                System.out.println("Not Found");
                return -1;
            }

            if(root.data == num){
                System.out.println("Found");
                return num;
            } 
            else if(root.data > num) {
                Secrch(num, root.lptr);
                return 0;
            }
            else {
                Secrch(num, root.rptr);
                return 0;
            }
        }

        public int findmax(Node root) {
            if(root.rptr != null) {
                root = root.rptr;
                if(root.lptr == null) {
                    return root.data;
                }
                else {
                    while(root.lptr != null) {
                        
                    }
                }
            }
            return 0;
        }

        public void delete(int num, Node root) {
            int ans = Secrch(num,root);
            if(ans == num){
                if(root.lptr == null && root.rptr == null) {
                    root = null;
                    return;
                }
                else if(root.lptr != null && root.rptr == null) {
                    root = root.lptr;
                    return;
                } 
                else if(root.rptr != null && root.lptr == null) {
                    root = root.rptr;
                    return;
                }
                else{
                    findmax(root);
                } 
            }
            else{
                System.out.println("Element does not exeist");
            }
        }

    public static void main(String[] args) {
        BST B1 = new BST();
        int []arr = {1,8,65,45,5};
        for(int i=0;i<arr.length;i++) {
           B1.root = B1.insertNode(B1.root,arr[i]);
        }

        B1.preOrder(B1.root);
        // B1.inOrder(B1.root);
        // B1.postOrder(B1.root);
        System.out.println();
        B1.Secrch(8,B1.root);

        B1.delete(8,B1.root);
        B1.preOrder(B1.root);
    }
}