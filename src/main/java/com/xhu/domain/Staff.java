package com.xhu.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xhu.datastruct.MySeqList;

public class Staff {
    private Integer id;
    private String name;
    private String sex;
    private String job;
    private String dept;
    private String entryday;
    private String birthday;
    @JsonIgnore
    private MySeqList grades;

    @Override
    public String toString() {
        return "Staff{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", job='" + job + '\'' +
                ", dept='" + dept + '\'' +
                ", entryday='" + entryday + '\'' +
                ", birthday='" + birthday + '\'' +
                '}';
    }

    public Staff() {
    }

    public Staff(Integer id, String name, String sex, String job, String dept, String entryday, String birthday) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.job = job;
        this.dept = dept;
        this.entryday = entryday;
        this.birthday = birthday;
    }

    public MySeqList getGrades() {
        return grades;
    }

    public void setGrades(MySeqList grades) {
        this.grades = grades;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getEntryday() {
        return entryday;
    }

    public void setEntryday(String entryday) {
        this.entryday = entryday;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

}
