package com.xhu.service;

import com.xhu.datastruct.MyTree23;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/InsertOffer.do")
public class InsertOffer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobNum = request.getParameter("jobNum");
        if(!WEBUtils.notNullOrEmpty(jobNum)){
            System.out.println("参数为空！");
            return;
        }

        ServletContext ctx = request.getServletContext();
        MyTree23 tree = (MyTree23) ctx.getAttribute("offerTree");
        if(tree == null){
            tree = new MyTree23();
        }
        tree.insert(Integer.parseInt(jobNum));
        ctx.setAttribute("offerTree",tree);
        request.getRequestDispatcher("/offer/insertOfferResult.jsp?succeed=true").forward(request,response);
    }
}
