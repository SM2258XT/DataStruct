package com.xhu.datastruct;
public class MyDoubleLinkedList<T> {
    private ChainNode<T> headNode;
    private ChainNode<T> lastNode;
    private int size;
    public MyDoubleLinkedList() {
        this.headNode = new ChainNode<T>(null);
        this.lastNode = headNode;
    }
    public void addNode(T data) {
        ChainNode<T> node = new ChainNode<T>(data);
        if(lastNode != null){
            lastNode.nextChainNode = node;
            node.preChainNode = node;
            node.setDataNo(size);
            lastNode = node;
            size++;
        }
    }
    public void deleteNode(int dataNo) throws Exception {
        if(getSize() == 0){
            throw new Exception("chain is empty");
        }
        for (ChainNode<T> node = headNode.nextChainNode;node != null;node = node.nextChainNode) {
            if(node.getDataNo() == dataNo){
                node.preChainNode.nextChainNode = node.nextChainNode;
                if(node.nextChainNode != null){
                    node.nextChainNode.preChainNode = node.preChainNode;
                }
                node.nextChainNode = null;
                node.preChainNode = null;
                size--;
                for (ChainNode<T> chainNode = node.nextChainNode;chainNode != null;chainNode = chainNode.nextChainNode) {
                    chainNode.setDataNo(chainNode.getDataNo()-1);
                }
                return;
            }
        }
        throw new Exception("the corresponding data that can not be found");
    }
    public T get(int dataNo) throws Exception {
        if(getSize() == 0){
            throw new Exception("chain is empty");
        }
        for (ChainNode<T> node = headNode.nextChainNode;node != null;node = node.nextChainNode) {
            if(node.getDataNo() == dataNo){
                return node.getData();
            }
        }
        throw new Exception("the corresponding data that can not be found");
    }
    public void set(int dataNo,T data) throws Exception {
        if(getSize() == 0){
            throw new Exception("chain is empty");
        }
        for (ChainNode<T> node = headNode.nextChainNode;node != null;node = node.nextChainNode) {
            if(node.getDataNo() == dataNo){
                node.setData(data);
                return;
            }
        }
        throw new Exception("the data that is to be modified can not be found");
    }
    public boolean isContains(T data) throws Exception {
        if(getSize() == 0){
            throw new Exception("chain is empty");
        }
        for (ChainNode<T> chainNode = headNode.nextChainNode;chainNode != null;chainNode = chainNode.nextChainNode) {
            if(chainNode.getData() == data){
                return true;
            }
        }
        return false;
    }
    public int getSize() {
        return size;
    }
    private static class ChainNode<T> {
        private T data;
        //对象编号
        private int dataNo;

        public ChainNode<T> nextChainNode;
        public ChainNode<T> preChainNode;
        public ChainNode(T data, ChainNode<T> nextChainNode,
                         ChainNode<T> preChainNode) {
            this.data = data;
            this.nextChainNode = nextChainNode;
            this.preChainNode = preChainNode;
        }
        public ChainNode(T data) {
            this.data = data;
        }
        public int getDataNo() {
            return dataNo;
        }
        public void setDataNo(int dataNo) {
            this.dataNo = dataNo;
        }
        public void setData(T data) {
            this.data = data;
        }
        public T getData() {
            return data;
        }
    }
}

