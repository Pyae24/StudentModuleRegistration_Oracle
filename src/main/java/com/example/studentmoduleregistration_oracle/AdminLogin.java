package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.naming.AuthenticationException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLogin", value = "/AdminLogin")
public class AdminLogin extends HttpServlet {
    @EJB
    SessionQueryBean sessionQueryBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminName = request.getParameter("adminName");
        String adminPassword = request.getParameter("adminPassword");
        try {
            sessionQueryBean.authenticate(adminName, adminPassword);
            List<StudentModuleModel> studentModules = sessionQueryBean.view();
            List<StudentModuleModel> sMModel = sessionQueryBean.passedStudent();
            request.setAttribute("studentModules", studentModules);
            request.setAttribute("sMModel", sMModel);
            request.getRequestDispatcher("adminModule.jsp").forward(request, response);
        }catch (AuthenticationException e)  {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}
