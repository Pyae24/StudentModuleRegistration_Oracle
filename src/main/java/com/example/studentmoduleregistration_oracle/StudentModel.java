package com.example.studentmoduleregistration_oracle;

public class StudentModel {
    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuAddr() {
        return stuAddr;
    }

    public void setStuAddr(String stuAddr) {
        this.stuAddr = stuAddr;
    }

    public String getAcadYear() {
        return acadYear;
    }

    public void setAcadYear(String acadYear) {
        this.acadYear = acadYear;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    String stuId;
    String stuName;
    String stuAddr;
    String acadYear;
}
