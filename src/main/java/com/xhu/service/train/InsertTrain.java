package com.xhu.service.train;

import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MyLinkedList;
import com.xhu.domain.Staff;
import com.xhu.domain.Train;
import com.xhu.utils.WEBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/InsertTrain.do")
public class InsertTrain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取所有参数
        String trainSys = request.getParameter("trainSys");
        String[] trainSrc = request.getParameterValues("trainSrc");
        String trainReq = request.getParameter("trainReq");
        String trainPlan = request.getParameter("trainPlan");
        String trainStaffs = request.getParameter("trainStaffs");

        //检测参数是否非法
        if (!WEBUtils.notNullOrEmpty(trainSys, trainReq, trainPlan, trainStaffs) || trainSrc.length <= 0) {
            System.out.println("InsertTrain.do : 参数非法！");
            return;
        }

        StaffDao dao = new StaffDao();  //打开数据库dao接口
        MyDoubleLoopLinkedList linkedList = dao.selectAll();    //获取存放所有员工信息的双向循环链表
        Train train = new Train();      //新增一条培训记录
        MyLinkedList<String> srcList = new MyLinkedList<String>();  //用来保存所有培训资源
        for (String s : trainSrc)
            srcList.addLast(s);         //将培训资源逐个放入链表中

        MyLinkedList<Staff> trainStaffList = new MyLinkedList<>();    //使用链表存放参与培训的员工
        MyLinkedList<String> errorStaffs = new MyLinkedList<>();      //保存指定培训计划失败的员工
        String[] staffs = trainStaffs.trim().split(",");        //将收到的字符串去掉结尾空格并拆分
        for (String s : staffs) {
            System.out.println(s);          //在服务器端输出一下员工名
            Staff staff = linkedList.getStaffByName(s); //在链表中查找该员工
            if (staff != null) {                //如果有该员工
                trainStaffList.addLast(staff);  //存进链表中
            } else
                errorStaffs.addLast(s);               //存入添加失败人员名单
        }

        train.setTrainSys(trainSys);            //设置培训体系
        train.setTrainSrc(srcList);             //设置培训资源链表
        train.setTrainReq(trainReq);            //设置培训需求
        train.setTrainPlan(trainPlan);          //设置培训计划
        train.setTrainStaffs(trainStaffList);   //设置培训人员链表
        MyLinkedList trainList = (MyLinkedList) request.getServletContext().getAttribute("trainList");  //从全局对象中获取培训列表
        if(trainList == null)
            trainList = new MyLinkedList<Train>();  //如果之前没有任何培训记录，则新增一个链表来存储
        trainList.addLast(train);               //将该培训计划添加到链表中
        request.getServletContext().setAttribute("trainList",trainList);    //将存放培训计划的链表放回全局对象中

        request.setAttribute("errorStaffs", errorStaffs);    //把错误人员名单添加到request域中
        request.getRequestDispatcher("/train/insertTrainResult.jsp").forward(request, response); //跳转到结果页面
        dao.close();                            //关闭数据库dao接口
    }
}
