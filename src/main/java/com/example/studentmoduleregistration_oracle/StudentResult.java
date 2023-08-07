package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentResult", value = "/StudentResult")
public class StudentResult extends HttpServlet {
    @EJB
    SessionQueryBean sessionQueryBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        List<StudentModuleModel> studentModules = sessionQueryBean.searchStudentModulesbyName(studentName);
        request.setAttribute("studentModules", studentModules);
        request.getRequestDispatcher("/studentResult.jsp").forward(request, response);
    }
}
