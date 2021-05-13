<%@ page import="com.xhu.datastruct.MyTree23" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xhu.domain.Offer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有岗位</title>

    <style>
        body{
            background-image: url("/image/change_bac.jpg");
            text-align: center;
            font-size:30px;
        }
        div{
            background-color:lightgray;
            width:50%;
            margin:0 auto;
            height:100%;
        }
        h1{
           margin-top:160px;
            color:whitesmoke;
        }
        p:nth-child(2n+1){

            color: #ff2200;
        }
        p:nth-child(2n+2){

            color: palegreen;
        }
        h4{
            margin-top:130px;
        }
        span{
            color: #ffff33;
        }
        a{
            color:white;
            border:2px slategray solid;
            border-radius: 2em;
            text-decoration: none;
            padding: 10px;


        }
        a:hover{
            color:red;

        }
    </style>
</head>


<body>
<div >
    <span>顺序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布岗位</span>
    <%
        MyTree23 tree23 = (MyTree23) application.getAttribute("offerTree");
        if (tree23 == null)
            out.println("<h1>暂无已发布的岗位信息！</h1>");
        else {
            List list = tree23.getAllData();
            int i = 1;
            for (Object jobNum : list) {
                out.println("<p>" + i + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Offer.getNameByIndex((Integer) jobNum) + "</p>");
                i++;
            }
        }
    %>
    <h4><a href="/Menu.jsp">单击返回菜单</a></h4>
</div>
</body>
</html>
