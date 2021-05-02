<%@ page import="com.xhu.utils.WEBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误！</title>
</head>
<body>
<div align="center">
    <h1>出错啦！</h1><br>
    <%
        String info = request.getParameter("info");
        if (WEBUtils.notNullOrEmpty(info)){
            out.println("<h2>" + info + "</h2>");
        }
    %>
    <br>
    <h4><a href="Menu.html">返回主页</a></h4>
</div>
</body>
</html>
