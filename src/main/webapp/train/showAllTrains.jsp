<%@ page import="com.xhu.datastruct.MyLinkedList" %>
<%@ page import="com.xhu.domain.Train" %>
<%@ page import="com.xhu.domain.Staff" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有培训计划</title>

    <style>
        body {
            background-image: url("/image/change_bac.jpg");
            font-size: 15px;

        }

        table {
            border-collapse: collapse;
            text-align: center;
            margin-top: 160px;
        }
        table, table tr td {
            border: 1px solid #ccc;
        }

        table tr td {
            padding: 5px 10px;
        }

        td {
            width: 80px;
        }
        tr:nth-child(1){

            height: 100px;
            background-color: #00FFFF;
        }
        tr:nth-child(2n+3) {
            background-color: #4db3a4;
            height: 50px
        }
        tr:nth-child(2n+2) {
            background-color: azure;
            height: 50px
        }
        .SAT_Title{
            font-size: 27px;
            color: #ff2200;
            text-shadow: 0 0 4px white,
            0 -5px 4px #ff3,
            2px -10px 6px #fd3,
            -2px -15px 11px #f80,
            2px -25px 18px #f20;
        }
    </style>
</head>
<body>

<div align="center">
    <%
        MyLinkedList<Train> trainList = (MyLinkedList) request.getServletContext().getAttribute("trainList");
        if (trainList == null) {
            out.println("<h1>当前没有任何培训计划！</h1>");
        } else {
            out.println("<table align=\"center\">");
            out.println("<tr>"+"<td colspan=\"5\">");
            out.println("<span id=\"SAT_Title\">"+"ShowAllTrains"+"</span>");
            out.println("</td>"+"</tr>");
            out.println("<tr>");

            out.println("<td>");
            out.println("培训体系");
            out.println("</td>");
            out.println("<td>");
            out.println("培训资源");
            out.println("</td>");
            out.println("<td>");
            out.println("培训需求");
            out.println("</td>");
            out.println("<td>");
            out.println("培训计划");
            out.println("</td>");
            out.println("<td>");
            out.println("姓名");
            out.println("</td>");

            out.println("</tr>");
            for (int i = 0; i < trainList.getSize(); i++) {
                out.println("<tr>");
                Train train = trainList.getByIndex(i);

                out.println("<td>");
                out.println(train.getTrainSys());
                out.println("</td>");
                out.println("<td>");
                StringBuilder stringBuilder = new StringBuilder();   //用于频繁字符串拼接
                MyLinkedList trainSrcList = train.getTrainSrc();     //获取存放所有资源的链表
                for (int j = 0; j < trainSrcList.getSize(); j++) {
                    stringBuilder.append(trainSrcList.getByIndex(j));//拼接字符串
                    stringBuilder.append("；");
                }
                out.println(stringBuilder.toString());               //输出人员列表
                out.println("</td>");
                out.println("<td>");
                out.println(train.getTrainReq());
                out.println("</td>");
                out.println("<td>");
                out.println(train.getTrainPlan());
                out.println("</td>");
                out.println("<td>");
                stringBuilder = new StringBuilder();
                MyLinkedList<Staff> trainStaffList = train.getTrainStaffs();   //与上面输出培训资源原理一样
                for (int j = 0; j < trainStaffList.getSize(); j++) {
                    stringBuilder.append(trainStaffList.getByIndex(i).getName());
                    stringBuilder.append("；");
                }
                out.println(stringBuilder.toString());
                out.println("</td>");

                out.println("</tr>");
            }
            out.println("</table>");
        }
    %>

</div>
</body>
</html>
