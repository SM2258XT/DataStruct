package com.xhu.datastruct;

class Node<Anytype> {
    public Anytype data;
    public Node<Anytype> next;
    public Node(Anytype data, Node<Anytype> next) {
        this.data = data;
        this.next = next;
    }
}
public class MyLoopLinkedList<AnyType> {
    public Node<AnyType> first;
    public Node<AnyType> head;
    int thesize;
    public boolean initlist() {
        thesize = 0;
        first = new Node<>(null, null);
        head = new Node<>(null, first);
        first.next = head;
        return true;
    }
    public boolean isEmpty() {
        return thesize == 0;
    }
    public Node<AnyType> getNode(int i) {
        Node<AnyType> renode = head;
        for (int j = -2; j < i; j++) {
            renode = renode.next;
        }
        return renode;
    }
    public void add(AnyType a) {
        Node<AnyType> renode = new Node<>(a, null);
        getNode(thesize - 1).next = renode;
        renode.next = first.next;
        thesize++;
    }
    public AnyType remove(int i) {
        if (i == thesize - 1) {
            AnyType a = getNode(thesize - 1).data;
            getNode(thesize - 2).next = first.next;
            return a;
        }
        Node<AnyType> prev = getNode(i - 1);
        AnyType a = prev.next.data;
        prev.next = prev.next.next;
        thesize--;
        return a;
    }
    public void remove2(Node<AnyType> n) { }
    public void insert(int i, AnyType a) {
        Node<AnyType> prev = getNode(i - 1);
        Node<AnyType> renode = new Node<>(a, prev.next);
        prev.next = renode;
        thesize++;
    }
    public AnyType get(int i) {
        return getNode(i).data;
    }
    public void set(int i, AnyType a) {
        getNode(i).data = a;
    }
    public int length() {
        return thesize;
    }
    public void clear() {
        initlist();
    }
    public void print() {
        for (int i = 0; i < thesize; i++) {
            System.out.println(getNode(i).data);
        }
    }
}