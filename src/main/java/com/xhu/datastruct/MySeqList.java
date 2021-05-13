package com.xhu.datastruct;

public class MySeqList {
    int usedSize;//顺序表实际长度
    int[] elem;//数组

    public MySeqList() {
        this(10);
    }

    public MySeqList(int size) {
        elem = new int[size];
        usedSize = 0;
    }

    public void displayList() {
        for (int i = 0; i < usedSize; i++)
            System.out.println("i = " + i + "  ;  data = " + elem[i]);
    }

    public boolean insert(int val, int pos) {
        if (isFull() || pos < 0 || pos > this.usedSize) {
            return false;
        }
        for (int i = this.usedSize - 1; i >= pos; i--) {//从后向前来依次挪动
            elem[i + 1] = elem[i];
        }
        elem[pos] = val;
        this.usedSize++;
        return true;
    }

    public boolean isEmpty() {
        if (this.usedSize == 0) {
            return true;
        }
        return false;
    }

    public int getDataByIndex(int index) {
        if (index < 0)
            return -1;
        else
            return elem[index];
    }

    public int search(int key) {
        //存在顺序表为空
        if (isEmpty()) {
            return -1;
        }
        int pos = -1;
        for (int i = 0; i < this.usedSize; i++) {
            if (elem[i] == key) {
                pos = i;
            }
        }
        return pos;
    }

    public void delete(int val) {
        int pos = search(val);
        if (pos == -1) {
            System.out.println("无指定元素");
        } else {
            for (int i = pos; i < this.usedSize - 1; i++) {
                elem[i] = elem[i + 1];
            }
            this.usedSize--;
        }
    }

    public boolean isFull() {
        if (usedSize == elem.length) {
            return true;
        } else {
            return false;
        }
    }
}