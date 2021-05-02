package com.xhu.domain;

public class Offer {
    private String job;
    private Integer total;
    private Integer needs;

    public Offer() {
    }

    public Offer(String job, Integer total, Integer needs) {
        this.job = job;
        this.total = total;
        this.needs = needs;
    }

    @Override
    public String toString() {
        return "Offer{" +
                "job='" + job + '\'' +
                ", total=" + total +
                ", needs=" + needs +
                '}';
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getNeeds() {
        return needs;
    }

    public void setNeeds(Integer needs) {
        this.needs = needs;
    }
}
