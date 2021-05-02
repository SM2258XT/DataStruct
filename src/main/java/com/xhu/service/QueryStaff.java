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

@WebServlet("/QueryStaff.do")
public class QueryStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");     //type指明是按学号还是按姓名查找
        String param = request.getParameter("param");   //根据type确定参数是学号还是姓名
        if (!WEBUtils.notNullOrEmpty(type, param)) {
            System.out.println("参数非法！");
            return;
        }

        PrintWriter pw = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        StaffDao dao = new StaffDao();
        Staff staff = null;
        boolean exist = true;

        MyList list = dao.selectAll();
        if ("id".equals(type)) {
            final int id = Integer.parseInt(param);
            if (list.exist(id))
                staff = list.getStaffById(id);
            else {
                System.out.println("不存在 id 为 " + id + " 的学生");
                exist = false;
            }
        } else if ("name".equals(type)) {
            staff = list.getStaffByName(param); //此处的param为name姓名
            if (staff == null) {
                System.out.println("不存在 name 为 " + param + " 的学生");
                exist = false;
            }
        }

        if (!exist){
            pw.write("false");
            return;
        }

        String jsonObj = mapper.writeValueAsString(staff);
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add(jsonObj);
        String jsonList = mapper.writeValueAsString(arrayList);
        pw.write(jsonList);
        dao.close();
    }
}
