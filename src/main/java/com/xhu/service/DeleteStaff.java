package com.xhu.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyList;
import com.xhu.domain.Staff;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/DeleteStaff.do")
public class DeleteStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
            URL访问格式：
                http:/**./DeleteStaff.do?type=id&param=135135
        */
        String type = request.getParameter("type");     //type指明是按学号还是按姓名查找
        String param = request.getParameter("param");   //根据type确定参数是学号还是姓名
        //System.out.println("type=" + type + "   param=" + param);
        if (!WEBUtils.notNullOrEmpty(type, param)) {
            System.out.println("参数非法！");
            return;
        }

        PrintWriter pw = response.getWriter();
        StaffDao dao = new StaffDao();
        Staff staff = null;
        MyList list = dao.selectAll();
        boolean finished = false;
        if ("id".equals(type)) {
            final int id = Integer.parseInt(param);
            if (list.exist(id))
                finished = dao.delete(id);
            else {
                System.out.println("不存在 id 为 " + id + " 的学生");
                return;
            }
        } else if ("name".equals(type)) {
            staff = list.getStaffByName(param);
            if (staff == null) {       //如果找不到该学生
                System.out.println("不存在 name 为 " + param + " 的学生");
                return;
            } else
                finished = dao.delete(staff.getId());
        }

        String msg = finished ? "true" : "false";
        pw.write(msg);
        dao.close();
    }
}
