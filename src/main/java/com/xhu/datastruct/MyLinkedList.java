package com.xhu.datastruct;

import com.xhu.domain.Staff;

public class MyLinkedList implements MyList {
    private Node startNode;
    private Node currentNode;
    private int size;

    private class Node {
        /*
            该类相当于c++中的链表Node结构体，
            存放了：链表开始节点，以及当前节点指向的雇员。
         */
        public Node next;
        public Staff staff;

        public Node() {
        }
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean push(Staff staff) {
        if (startNode == null) {
            Node node = new Node();
            node.staff = staff;
            startNode = node;
        } else {
            currentNode.next = startNode;
            currentNode = currentNode.next;
            if (currentNode.next == null)
                return false;
            else {
                Node newNode = new Node();
                newNode.staff = staff;
                newNode.next = startNode;
                startNode = newNode;
            }
        }
        size++;
        return true;
    }

    @Override
    public boolean remove(int id) {
        Node tagNode = getNodeById(id);
        if (tagNode == null)
            return false;
        else if (size <= 1) {
            startNode = null;
            size = 0;
            return true;
        }
        tagNode.next = tagNode;
        size--;
        return false;
    }

    @Override
    public boolean exist(int id) {
        return getNodeById(id) != null;
    }

    @Override
    public boolean isEmpty() {
        return startNode == null;
    }

    @Override
    public Staff getStaffById(int id) {
        if (isEmpty())
            return null;
        else
            return getNodeById(id).staff;
    }

    @Override
    public Staff getStaffByIndex(int i) {
        if (startNode == null || i < 0 || i > size)
            return null;
        currentNode = startNode;
        for (i = 0; i < size; i++)
            currentNode = currentNode.next;
        return currentNode.staff;
    }

    @Override
    public Staff getStaffByName(String name) {
        return null;
    }


    private Node getNodeById(final int id) {
        if (isEmpty())
            return null;
        currentNode = startNode;
        do {
            if (currentNode.staff.getId() == id) {
                return currentNode;
            } else
                currentNode = currentNode.next;
        } while (currentNode != null && currentNode != startNode);
        return null;
    }
}
