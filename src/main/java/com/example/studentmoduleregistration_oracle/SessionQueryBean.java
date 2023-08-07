package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.naming.AuthenticationException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Stateless(name = "SessionQueryEJB")
public class SessionQueryBean {
  @EJB
  OracleClientProviderBean oracleClientProviderBean;
    public SessionQueryBean() {
    }
    //register student into the database
    public void addEnrollment(StudentModel studentModel) {
      try {
        String key[] ={"stu_id"};
        Connection connection = oracleClientProviderBean.getOracleClient();
        String sql = "INSERT INTO Student(stu_name, stu_addr, academic_year) values(?,?,?)";
        PreparedStatement pstmt = connection.prepareStatement(sql, key);
        pstmt.setString(1, studentModel.getStuName());
        pstmt.setString(2, studentModel.getStuAddr());
        pstmt.setString(3, studentModel.getAcadYear());
        pstmt.executeUpdate();
      }catch (Exception e)  {
        e.printStackTrace();
      }
    }

    //get last student
    public StudentModel getLastStudent() {
      StudentModel studentModel = null;
      Connection connection = oracleClientProviderBean.getOracleClient();

      try {
        String stuSql = "SELECT stu_id FROM student ORDER BY stu_id DESC FETCH FIRST 1 ROWS ONLY";
        PreparedStatement stuStmt = connection.prepareStatement(stuSql);

        ResultSet resultSet = stuStmt.executeQuery();
        if (resultSet.next()) {
          studentModel = new StudentModel();
          studentModel.setStuId(resultSet.getString("stu_id"));
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }

      return studentModel;
    }

    public void addModule(ModuleModel moduleModel, StudentModel studentModel)  {
      try {
        Connection connection = oracleClientProviderBean.getOracleClient();
        //Inserting foreign key into mark table

        String markSql = "INSERT INTO mark(stu_id, module_id) VALUES(?, ?)";
        PreparedStatement markStmt = connection.prepareStatement(markSql);
        markStmt.setString(1, studentModel.getStuId());
        markStmt.setString(2, moduleModel.getModuleId());
        markStmt.executeUpdate();
      }catch (Exception e)  {
        e.printStackTrace();
      }
    }

    //to disply student information when searched by name
  public List<StudentModuleModel> searchStudentModulesbyName(String studentName) {
      List<StudentModuleModel> studentModules = new ArrayList<>();
      try {
        Connection connection = oracleClientProviderBean.getOracleClient();

        String sql = "SELECT s.stu_name, s.stu_id, m.module_id, m.module_name, s.academic_year, mk.mark " +
                "FROM student s " +
                "JOIN mark mk ON s.stu_id = mk.stu_id " +
                "JOIN module m ON mk.module_id = m.module_id " +
                "WHERE s.stu_name LIKE ?";

        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, "%" + studentName + "%");
        ResultSet resultSet = pstmt.executeQuery();
        while (resultSet.next())  {
          StudentModuleModel studentModule = new StudentModuleModel();
          studentModule.setStuName(resultSet.getString("stu_name"));
          studentModule.setStuId(resultSet.getString("stu_id"));
          studentModule.setModuleId(resultSet.getString("module_id"));
          studentModule.setModuleName(resultSet.getString("module_name"));
          studentModule.setAcademicYear(resultSet.getInt("academic_year"));
          studentModule.setMark(resultSet.getInt("mark"));
          studentModules.add(studentModule);
        }
      }catch (Exception e)  {
        e.printStackTrace();
      }
      return studentModules;
  }

  //lecturer authentication
  public void authenticate(String username, String password) throws AuthenticationException{
      Connection connection = oracleClientProviderBean.getOracleClient();
      String sql = "SELECT * FROM lecturer WHERE lec_name = ? AND lec_password = ?";
      try {
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        ResultSet resultSet = pstmt.executeQuery();
        if (!resultSet.next())  {
          throw new AuthenticationException("Invalid Username or Password");
        }
      }catch (SQLException e) {
        e.printStackTrace();
        throw new AuthenticationException("Authentication Failed");
      }
  }

  //fetching students' information
  public List<StudentModuleModel> view() {
      List<StudentModuleModel> studentModules = new ArrayList<>();
    try {
      Connection connection = oracleClientProviderBean.getOracleClient();
      String sql = "SELECT s.stu_id, s.stu_name, s.stu_addr, s.academic_year, m.module_id, m.module_name, mk.mark " +
              "FROM student s " +
              "JOIN mark mk ON s.stu_id = mk.stu_id " +
              "JOIN module m ON mk.module_id = m.module_id " +
              "ORDER BY s.stu_id";
      PreparedStatement pstmt = connection.prepareStatement(sql);
      ResultSet resultSet = pstmt.executeQuery();

      while (resultSet.next())  {
        StudentModuleModel studentModule = new StudentModuleModel();
        studentModule.setStuId(resultSet.getString("stu_id"));
        studentModule.setStuName(resultSet.getString("stu_name"));
        studentModule.setStuAddr(resultSet.getString("stu_addr"));
        studentModule.setAcademicYear(resultSet.getInt("academic_year"));
        studentModule.setModuleId(resultSet.getString("module_id"));
        studentModule.setModuleName(resultSet.getString("module_name"));
        studentModule.setMark(resultSet.getInt("mark"));
        studentModules.add(studentModule);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return studentModules;
  }

  //inserting mark by id
  public void insertMark(String stu_id, int mark, String module_id) {
      try {
        Connection connection = oracleClientProviderBean.getOracleClient();
        String sql = "UPDATE mark SET mark = ? WHERE stu_id = ? AND module_id = ?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, mark);
        pstmt.setString(2, stu_id);
        pstmt.setString(3, module_id);
        pstmt.executeUpdate();
      }catch (SQLException e) {
        e.printStackTrace();
      }
  }
  //to display passed Students
  public List<StudentModuleModel> passedStudent() {
      List<StudentModuleModel> passedStudents = new ArrayList<>();
      try {
        Connection connection = oracleClientProviderBean.getOracleClient();
        String sql = "SELECT s.academic_year, COUNT(DISTINCT s.stu_id) AS passed_students " +
                "FROM student s " +
                "WHERE s.stu_id NOT IN ( " +
                "SELECT m.stu_id " +
                "FROM mark m " +
                "WHERE m.mark = 0 OR m.mark IS NULL OR m.mark < 40) " +
                "GROUP BY s.academic_year";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        ResultSet resultSet = pstmt.executeQuery();

        while (resultSet.next())  {
          StudentModuleModel studentModule = new StudentModuleModel();
          studentModule.setAcademicYear(resultSet.getInt("academic_year"));
          studentModule.setPassedStudentsCount(resultSet.getInt("passed_students"));
          passedStudents.add(studentModule);
        }
      }catch (SQLException e) {
        e.printStackTrace();
      }
      return passedStudents;
  }
}
