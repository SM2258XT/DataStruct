package com.xhu.service.attendance;

import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MySeqList;
import com.xhu.domain.Staff;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/Attendance.do")
public class GetAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inputId = request.getParameter("selectId");
        PrintWriter pw = response.getWriter();          //获取输出对象
        if (!WEBUtils.notNullOrEmpty(inputId)) {          //检测输入是否非法
            System.out.println("/Attendance.do : 参数非法!");
            pw.write("false");
            return;
        }
        int id = Integer.parseInt(inputId);             //将参数转型为整数
        HttpSession session = request.getSession();     //获取session

        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList list = dao.selectAll();  //获取存放所有员工信息的双向链表
        if (list.exist(id)) {                             //如果存在该员工
            Staff staff = list.getStaffById(id);              //得到该员工对象
            MySeqList attendanceList = (MySeqList) session.getAttribute(inputId + "@att");     //从session中获取该员工的考勤表

            //拼接出json格式字符串
            StringBuilder jsonObj = new StringBuilder();    //创建字符串缓冲区,用来拼接json字符串
            jsonObj.append("{");
            jsonObj.append("\"id\":").append(inputId);
            jsonObj.append(",\"name\":\"").append(staff.getName()).append("\"");
            jsonObj.append(",\"one\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(0));
            jsonObj.append(",\"two\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(1));
            jsonObj.append(",\"three\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(2));
            jsonObj.append(",\"four\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(3));
            jsonObj.append(",\"five\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(4));
            jsonObj.append(",\"six\":").append(attendanceList == null ? 0 : attendanceList.getDataByIndex(5));
            jsonObj.append("}");

            pw.write(jsonObj.toString());
        } else
            pw.write("false");      //出错了，发送错误标志
        dao.close();
    }
}
