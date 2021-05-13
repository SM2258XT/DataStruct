<%@ page import="com.xhu.dao.StaffDao" %>
<%@ page import="com.xhu.datastruct.MyDoubleLoopLinkedList" %>
<%@ page import="com.xhu.domain.Staff" %>
<%@ page import="com.xhu.datastruct.MySeqList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工绩效</title>
    <style type="text/css">
        body{
            background-image: url("/image/change_bac.jpg");
            font-size: 15px;
        }

        table{
            border-collapse: collapse;
            text-align: center;
            margin-top: 160px;

        }
        td{
            padding: 20px;
        }
        table, table tr td {
            border: 1px solid #ccc;
        }
        tr:nth-child(2) {
            background-color: azure;
            height: 85px
        }

        tr:nth-child(2n+3) {
            background-color: #4db3a4;
            height: 50px
        }
        tr:nth-child(2n+2) {
            background-color: azure;
            height: 50px
        }
        #AM-title {
            height: 100px;
            background-color: #00FFFF;


        }

        #AM-title-text {
            font-size: 27px;
            color: #ff2200;
            text-shadow: 0 0 4px white,
            0 -5px 4px #ff3,
            2px -10px 6px #fd3,
            -2px -15px 11px #f80,
            2px -25px 18px #f20;

        }

        .tip{
            color:red;
        }
    </style>
</head>
<body>
<div align="center">
<table>
    <tr id="AM-title">
        <td colspan="10" id="AM-title-text">所有员工绩效表</td>
    </tr>
    <tr>
        <td>姓名</td>
        <td>编号</td>
        <td>部门</td>
        <td>近6个月出勤总天数</td>
        <td>平均出勤率</td>
        <td>总经理评分</td>
        <td>项目经理评分</td>
        <td>部门总监评分</td>
        <td>加权平均评分</td>
        <td>最终绩效</td>
    </tr>
    <%
        //三个评分各自的权重
        final double WEIGHT0 = 0.45;
        final double WEIGHT1 = 0.35;
        final double WEIGHT2 = 0.2;
        DecimalFormat df = new DecimalFormat("0.00");

        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList staffList = dao.selectAll(); //获取所有员工列表
        for (int i = 0; i < staffList.size(); i++) {        //遍历员工双向循环链表
            Staff staff = staffList.getStaffByIndex(i);
            out.println("<tr>");

            out.println("<td>");
            out.println(staff.getName());
            out.println("</td>");
            out.println("<td>");
            out.println(staff.getId());
            out.println("</td>");
            out.println("<td>");
            out.println(staff.getDept());
            out.println("</td>");


            MySeqList attendanceList = (MySeqList) session.getAttribute(staff.getId() + "@att");
            MySeqList assessmentList = (MySeqList) session.getAttribute(staff.getId() + "@ass");

            double avgAtt = 0, sumDay = 0;                              //平均出勤率，总出勤天数
            double avgAss = 0;                                          //加权平均评分
            if (attendanceList != null) {
                for (int j = 0; j < 6; j++) {                           //获取近6个月出勤总天数
                    sumDay += attendanceList.getDataByIndex(i);
                }
                avgAtt = sumDay / (6 * (30 - 8));                       //平均出勤率=6个月总天数/（6*（每个月天数-每个月例假天数））
            }

            out.println("<td>");
            out.println(sumDay);                                        //出勤总天数
            out.println("</td>");

            out.println("<td>");
            out.println(df.format(avgAtt));                             //平均出勤率，格式化为XX.XX
            out.println("</td>");

            if (assessmentList != null) {
                double grade0, grade1, grade2;                          //三个原始评分
                grade0 = assessmentList.getDataByIndex(0);
                grade1 = assessmentList.getDataByIndex(1);
                grade2 = assessmentList.getDataByIndex(2);
                out.println("<td>");
                out.println(grade0);            //总经理评分
                out.println("</td>");
                out.println("<td>");
                out.println(grade1);            //项目经理评分
                out.println("</td>");
                out.println("<td>");
                out.println(grade2);            //部门总监评分
                out.println("</td>");

                avgAss = grade0 / 5 * WEIGHT0 + grade1 / 5 * WEIGHT1 + grade2 / 5 * WEIGHT2;    //加权平均评分 = （原始评分/5*权重）求和
            }
            out.println("<td>");
            out.println(df.format(avgAss));            //加权平均评分，格式化为XX.XX
            out.println("</td>");

            double finalAchievement = 0;
            finalAchievement = 5000 * avgAtt + 4000 * avgAss;       //总绩效 = 5000 * 平均出勤率 + 4000 * 平均加权评分

            out.println("<td>");
            out.println(df.format(finalAchievement));            //最终绩效，格式化为XX.XX
            out.println("</td>");

            out.println("</tr>");
        }
    %>

</table>
    <div align="cenetr"><span class="tip">*</span><span>考核算法备注：平均出勤率 = 6个月总天数/(6*(每个月天数-每个月例假天数))；加权平均评分 = (原始评分/5*权重)求和；总绩效 = 基础工资 * 平均出勤率 + 奖金 * 平均加权评分</span></div>


</div>
</body>
</html>
