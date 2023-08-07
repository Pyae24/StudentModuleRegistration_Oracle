package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ScModule", value = "/ScModule")
public class ScModule extends HttpServlet {
    @EJB
    SessionQueryBean sessionQueryBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("studentId");
        int mark = Integer.parseInt(request.getParameter("studentMark"));
        sessionQueryBean.insertMark(id, mark, "CT_6042");
        request.getRequestDispatcher("individualResult.jsp").forward(request, response);
    }
}
