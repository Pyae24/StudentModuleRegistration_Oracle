package com.example.studentmoduleregistration_oracle;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SelectedModule", value = "/SelectedModule")
public class SelectedModule extends HttpServlet {
    @EJB
    SessionQueryBean sessionQueryBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("name");
        String studentAddress = request.getParameter("address");
        String selectedYear = request.getParameter("year");
        String ads = request.getParameter("ads");
        String csm = request.getParameter("csm");
        String sc = request.getParameter("sc");
        String misc = request.getParameter("misc");
        boolean isAdsSelected =(ads != null);
        boolean isCsmSelected =(csm != null);
        boolean isScSelected =(sc != null);
        boolean isMiscSelected =(misc != null);

        StudentModel sModel = new StudentModel();
        sModel.setStuName(studentName);
        sModel.setStuAddr(studentAddress);
        if (selectedYear.equals("2021"))    {
            sModel.setAcadYear("2021");
        }else if (selectedYear.equals("2022"))  {
            sModel.setAcadYear("2022");
        }else if (selectedYear.equals("2023"))   {
            sModel.setAcadYear("2023");
        }
        sessionQueryBean.addEnrollment(sModel);
        sModel = sessionQueryBean.getLastStudent();

        ModuleModel mModel = new ModuleModel();
        if (isAdsSelected)  {
            mModel.setModuleId("CT_6013");
            sessionQueryBean.addModule(mModel, sModel);
        }
        if (isScSelected)   {
            mModel.setModuleId("CT_6042");
            sessionQueryBean.addModule(mModel, sModel);
        }
        if (isCsmSelected)   {
            mModel.setModuleId("CT_6033");
            sessionQueryBean.addModule(mModel, sModel);
        }
        if (isMiscSelected)   {
            mModel.setModuleId("CT_6036");
            sessionQueryBean.addModule(mModel, sModel);
        }

        request.setAttribute("message", "Success");
        request.getRequestDispatcher("individualResult.jsp").forward(request,response);
    }
}
