package com.xhu.datastruct;

public class MyStack<T> {
    private Node<T> top = null;

    public MyStack() {
        this.top = null;
    }

    public boolean isEmpty() {
        if (top != null) {
            return false;
        }
        return true;
    }

    public boolean push(T value) {
        Node<T> node = new Node<T>(value);
        node.setNext(top);
        top = node;
        return true;
    }

    public T pop() {
        if (top == null) {
            return null;
        }
        T tmp = top.data;
        top = top.getNext();
        return tmp;
    }

    public T peek() {
        if (isEmpty()) {
            return null;
        }
        return top.data;
    }

    static class Node<T> {
        private T data;
        private Node<T> next;

        public Node(T data) {
            this.data = data;
        }

        public Node<T> getNext() {
            return this.next;
        }

        public void setNext(Node<T> n) {
            this.next = n;
        }

        public T getData() {
            return this.data;
        }

        public void setData(T d) {
            this.data = d;
        }
    }
}