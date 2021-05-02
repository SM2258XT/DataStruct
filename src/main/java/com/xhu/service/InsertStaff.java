package com.xhu.service;

import com.xhu.dao.StaffDao;
import com.xhu.domain.Staff;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/InsertStaff.do")
public class InsertStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDao dao = new StaffDao();
        Staff staff = new Staff();
        PrintWriter pw = response.getWriter();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String job = request.getParameter("job");
        String dept = request.getParameter("dept");
        String entryday = request.getParameter("entryday");
        String birthday = request.getParameter("birthday");
        if(!WEBUtils.notNullOrEmpty(id,name,sex,job,dept,entryday,birthday)){
            System.out.println(this.getClass().getName() + " ：参数错误");
            return;
        }

        staff.setId(Integer.parseInt(id));
        staff.setName(name);
        staff.setSex(sex);
        staff.setJob(job);
        staff.setDept(dept);
        staff.setEntryday(entryday);
        staff.setBirthday(birthday);
        if(dao.insert(staff))
            pw.write("true");
        else
            pw.write("false");
        dao.close();
    }
}
