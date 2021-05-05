<%@ page import="com.xhu.datastruct.MyTree23" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xhu.domain.Offer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有岗位</title>
</head>
<body>
<div align="center">
    <%
        MyTree23 tree23 = (MyTree23) application.getAttribute("offerTree");
        if (tree23 == null)
            out.println("<h1>暂无已发布的岗位信息！</h1>");
        else {
            List list = tree23.getAllData();
            int i = 1;
            for (Object jobNum : list) {
                out.println("<p>" + i + " " + Offer.getNameByIndex((Integer) jobNum) + "</p>");
                i++;
            }
        }
    %>
    <h4><a href="/Menu.html">单击返回菜单</a></h4>
</div>
</body>
</html>
