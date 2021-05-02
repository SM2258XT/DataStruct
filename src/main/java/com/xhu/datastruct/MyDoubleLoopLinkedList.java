package com.xhu.datastruct;

import com.sun.istack.internal.NotNull;
import com.xhu.domain.Staff;

public class MyDoubleLoopLinkedList implements MyList {
    private DoubleNode startNode;
    private int size;

    public MyDoubleLoopLinkedList() {
        this.size = 0;
    }

    private static class DoubleNode {
        /*
            该类相当于c++中的双向链表Node结构体，
            存放了：双向链表开始、结尾的节点，以及当前节点指向的雇员。
         */
        public DoubleNode next;
        public DoubleNode before;
        public Staff staff;

        public DoubleNode() {
        }
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    @NotNull
    public boolean push(final Staff staff) {
        if (isEmpty()) {
            DoubleNode node = new DoubleNode();
            node.staff = staff;
            node.before = node;
            node.next = node;
            startNode = node;
        } else {
            DoubleNode lastNode = getLastNode();
            if (lastNode == null)
                return false;
            else {
                DoubleNode newNode = new DoubleNode();
                newNode.staff = staff;
                startNode.before = newNode;
                newNode.next = startNode;
                lastNode.next = newNode;
                newNode.before = lastNode;
            }
        }
        size++;
        return true;
    }

    @Override
    public boolean remove(final int id) {
        DoubleNode tagNode = getNodeById(id);
        if (tagNode == null)
            return false;
        else if (size <= 1) {
            startNode = null;
            size = 0;
            return true;
        }
        tagNode.before.next = tagNode.next;
        tagNode.next.before = tagNode.before;
        size--;
        return true;
    }

    @Override
    public boolean exist(final int id) {
        return getNodeById(id) != null;
    }

    @Override
    public Staff getStaffById(final int id) {
        return getNodeById(id).staff;
    }

    @Override
    public Staff getStaffByIndex(final int index) {
        if (isEmpty() || index < 0 || index > size)
            return null;
        DoubleNode node = startNode;
        for (int i = 0; i < index; i++)
            node = node.next;
        return node.staff;
    }

    @Override
    public Staff getStaffByName(final String name) {
        return getNodeByName(name).staff;
    }

    @Override
    public boolean isEmpty() {
        return startNode == null;
    }

    /*============= Private Methods ==============*/
    @NotNull
    private DoubleNode getNodeByName(final String name) {
        if (isEmpty())
            return null;
        DoubleNode currentNode = startNode;
        do {
            if (name.equals(currentNode.staff.getName())) {
                return currentNode;
            } else
                currentNode = currentNode.next;
        } while (currentNode != null && currentNode != startNode);
        return null;
    }

    private DoubleNode getNodeById(final int id) {
        if (isEmpty())
            return null;
        DoubleNode currentNode = startNode;
        do {
            if (currentNode.staff.getId() == id) {
                return currentNode;
            } else
                currentNode = currentNode.next;
        } while (currentNode != null && currentNode != startNode);
        return null;
    }

    private DoubleNode getLastNode() {
        if (isEmpty())
            return null;
        else {
            DoubleNode currentNode = startNode;
            while (currentNode.next != startNode)
                currentNode = currentNode.next;
            return currentNode;
        }
    }
}
