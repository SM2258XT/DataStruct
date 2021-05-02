package com.xhu.datastruct;

import com.xhu.domain.Staff;

public class MyDoubleLinkedList implements MyList{
    private static class DoubleNode{
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
        return 0;
    }

    @Override
    public boolean push(Staff staff) {
        return false;
    }

    @Override
    public boolean remove(int id) {
        return false;
    }

    @Override
    public boolean exist(int id) {
        return false;
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public Staff getStaffById(int id) {
        return null;
    }

    @Override
    public Staff getStaffByIndex(int index) {
        return null;
    }

    @Override
    public Staff getStaffByName(String name) {
        return null;
    }


}
