package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.naming.AuthenticationException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LecturerLogin", value = "/LecturerLogin")
public class LecturerLogin extends HttpServlet {
    @EJB
    SessionQueryBean sessionQueryBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lecName = request.getParameter("lecName");
        String lecPassword = request.getParameter("lecPassword");
        try {
            sessionQueryBean.authenticate(lecName, lecPassword);
            //Authentication successful
            String redirectPage;
            //Check authenticated user to redirect related page
            if (lecName.equals("mrszm"))    {
                redirectPage ="adsModule.jsp";
                List<StudentModuleModel> studentModules = sessionQueryBean.view();
                request.setAttribute("studentModules", studentModules);
                request.getRequestDispatcher(redirectPage).forward(request, response);
            }else if (lecName.equals("mrmmtm")) {
                redirectPage ="csmModule.jsp";
                List<StudentModuleModel> studentModules = sessionQueryBean.view();
                request.setAttribute("studentModules", studentModules);
                request.getRequestDispatcher(redirectPage).forward(request, response);
            }else if (lecName.equals("mrtta")) {
                redirectPage ="miscModule.jsp";
                List<StudentModuleModel> studentModules = sessionQueryBean.view();
                request.setAttribute("studentModules", studentModules);
                request.getRequestDispatcher(redirectPage).forward(request, response);
            }else if (lecName.equals("mscma")) {
                redirectPage ="scModule.jsp";
                List<StudentModuleModel> studentModules = sessionQueryBean.view();
                request.setAttribute("studentModules", studentModules);
                request.getRequestDispatcher(redirectPage).forward(request, response);
            }else {
                //Invalid lecturer
                throw new AuthenticationException("Invalid Lecturer");
            }
        }catch (AuthenticationException e)  {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("lecturerLogin.jsp").forward(request, response);
        }
    }
}
