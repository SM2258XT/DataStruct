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

    public static String getNameByIndex(int id){
        String name;
        if(0 == id)
            name = "软件开发";
        else if(1 == id)
            name = "前端工程师";
        else if(2 == id)
            name = "软件测试工程师";
        else if(3 == id)
            name = "运营维护";
        else if(4 == id)
            name = "软件架构师";
        else if(5 == id)
            name = "信息安全工程师";
        else if(6 == id)
            name = "数据库工程师";
        else if(7 == id)
            name = "系统工程师";
        else if(8 == id)
            name = "系统分析员";
        else if(9 == id)
            name = "云计算工程技术人员";
        else
            name = "未知";
        return name;
    }
}
