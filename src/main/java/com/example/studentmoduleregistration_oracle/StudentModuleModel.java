package com.example.studentmoduleregistration_oracle;

public class StudentModuleModel {
    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public int getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(int academicYear) {
        this.academicYear = academicYear;
    }

    public String getStuAddr() {
        return stuAddr;
    }

    public void setStuAddr(String stuAddr) {
        this.stuAddr = stuAddr;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public int getPassedStudentsCount() {
        return passedStudentsCount;
    }

    public void setPassedStudentsCount(int passedStudentsCount) {
        this.passedStudentsCount = passedStudentsCount;
    }

    String stuName;
    String stuId;
    String moduleId;
    String moduleName;
    int academicYear;
    String stuAddr;
    int mark;
    int passedStudentsCount;
}
