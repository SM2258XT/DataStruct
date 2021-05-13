package com.xhu.service.attendance;

import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MyLinkedList;
import com.xhu.datastruct.MySeqList;
import com.xhu.domain.Staff;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateAttendance.do")
public class UpdateAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String one = request.getParameter("one");
        String two = request.getParameter("two");
        String three = request.getParameter("three");
        String four = request.getParameter("four");
        String five = request.getParameter("five");
        String six = request.getParameter("six");

        PrintWriter pw = response.getWriter();          //获取输出对象
        if (!WEBUtils.notNullOrEmpty(id, one, two, three, four, five, six)) {
            System.out.println("/UpdateAttendance.do : 参数非法!");
            pw.write("false");
            return;
        }
        int staffId = Integer.parseInt(id);             //将参数转型为整数
        HttpSession session = request.getSession();     //获取session

        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList list = dao.selectAll();  //获取存放所有员工信息的双向链表
        if (list.exist(staffId)) {                             //如果存在该员工
            Staff staff = list.getStaffById(staffId);        //获取该员工
            MySeqList attendanceList = new MySeqList();            //使用顺序表，存储员工考勤数据

            attendanceList.insert(Integer.parseInt(one), 0);
            attendanceList.insert(Integer.parseInt(two), 1);
            attendanceList.insert(Integer.parseInt(three), 2);
            attendanceList.insert(Integer.parseInt(four), 3);
            attendanceList.insert(Integer.parseInt(five), 4);
            attendanceList.insert(Integer.parseInt(six), 5);

            session.setAttribute(staffId + "@att", attendanceList); //存储考勤表
            pw.write("true");
        } else
            pw.write("false");      //出错了，发送错误标志
        dao.close();
    }
}
