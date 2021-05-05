package com.xhu.datastruct;

public class MyQueue<T> {

    private Node<T> front;  // 队头

    private Node<T> rear;   // 队尾

    private int size;       // 元素个数

    public MyQueue() {
        rear = front = null;
    }

    public void push(T data) {
        Node<T> node = new Node<T>(data);
        if (isEmpty()) {
            front = rear = node;
        } else {
            rear.setNext(node);
            rear = node;
        }

        size++;
    }

    public T pop() {
        if (isEmpty()) {
            throw new RuntimeException("队列为空");
        }

        Node<T> delete = front;
        front = delete.getNext();
        delete.setNext(null);
        size--;

        if (size == 0) {
            // 删除掉最后一个元素时，front值已经为null，但rear还是指向该节点，需要将rear置为null
            // 最后一个结点front和rear两个引用都没指向它，帮助GC处理该节点对象
            rear = front;
        }

        return (T) delete.getData();
    }

    public boolean isEmpty() {
        return (front == null && rear == null) ? true : false;
    }

    public int size() {
        return this.size;
    }

    /*====== Inner Node Class ======*/

    public static class Node<T> {
        // 存储的数据
        private T data;
        // 下一个节点的引用
        private Node<T> next;

        public Node(T data) {
            this.data = data;
        }

        public T getData() {
            return data;
        }

        public void setData(T data) {
            this.data = data;
        }

        public Node<T> getNext() {
            return next;
        }

        public void setNext(Node<T> next) {
            this.next = next;
        }
    }
}
