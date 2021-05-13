package com.xhu.service.assessment;

import com.xhu.datastruct.MySeqList;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateAssessment")
public class UpdateAssessment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String grade0 = request.getParameter("grade0");
        String grade1 = request.getParameter("grade1");
        String grade2 = request.getParameter("grade2");

        PrintWriter pw = response.getWriter();              //获取输出流对象
        if(!WEBUtils.notNullOrEmpty(id,grade0,grade1,grade2)){
            System.out.println("/UpdateAssessment : 参数错误！");
            pw.write("false");
            return;
        }

        HttpSession session = request.getSession();
        MySeqList gradeList = new MySeqList();                //使用顺序表来存储员工考核表数据
        gradeList.insert(Integer.parseInt(grade0),0);     //存储员工考核数据
        gradeList.insert(Integer.parseInt(grade1),1);     //存储员工考核数据
        gradeList.insert(Integer.parseInt(grade2),2);     //存储员工考核数据
        session.setAttribute(id+"@ass",gradeList);       //将考核顺序表进行存储
        pw.print("true");
    }
}
