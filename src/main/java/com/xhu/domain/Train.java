package com.xhu.domain;

import com.xhu.datastruct.MyLinkedList;

public class Train {
    private String trainSys;
    private MyLinkedList trainSrc;
    private String trainReq;
    private String trainPlan;
    private MyLinkedList trainStaffs;

    @Override
    public String toString() {
        return "Train{" +
                "trainSys='" + trainSys + '\'' +
                ", trainSrc='" + trainSrc + '\'' +
                ", trainReq='" + trainReq + '\'' +
                ", trainPlan='" + trainPlan + '\'' +
                ", trainStaffs=" + trainStaffs +
                '}';
    }

    public Train() {
    }

    public Train(String trainSys, MyLinkedList trainSrc, String trainReq, String trainPlan, MyLinkedList trainStaffs) {
        this.trainSys = trainSys;
        this.trainSrc = trainSrc;
        this.trainReq = trainReq;
        this.trainPlan = trainPlan;
        this.trainStaffs = trainStaffs;
    }

    public String getTrainSys() {
        return trainSys;
    }

    public void setTrainSys(String trainSys) {
        this.trainSys = trainSys;
    }

    public MyLinkedList getTrainSrc() {
        return trainSrc;
    }

    public void setTrainSrc(MyLinkedList trainSrc) {
        this.trainSrc = trainSrc;
    }

    public String getTrainReq() {
        return trainReq;
    }

    public void setTrainReq(String trainReq) {
        this.trainReq = trainReq;
    }

    public String getTrainPlan() {
        return trainPlan;
    }

    public void setTrainPlan(String trainPlan) {
        this.trainPlan = trainPlan;
    }

    public MyLinkedList getTrainStaffs() {
        return trainStaffs;
    }

    public void setTrainStaffs(MyLinkedList trainStaffs) {
        this.trainStaffs = trainStaffs;
    }
}
