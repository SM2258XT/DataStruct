package com.xhu.service.staff;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MyList;
import com.xhu.domain.Staff;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/QueryAllStaff.do")
public class QueryAllStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String jsonObj = null, jsonList = null;

        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList list = dao.selectAll();
        ArrayList<String> arrayList = new ArrayList<String>();
        try {
            for (int i = 0; i < list.size(); i++) {
                Staff s = list.getStaffByIndex(i);
                jsonObj = mapper.writeValueAsString(s);
                arrayList.add(jsonObj);
            }
            jsonList = mapper.writeValueAsString(arrayList);
            //System.out.println(jsonList);
        } catch (JsonProcessingException e) {
            System.out.println("转换失败！");
            return;
        }

        dao.close();
        response.getWriter().write(jsonList);
    }
}
