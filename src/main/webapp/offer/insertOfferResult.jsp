<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入结果</title>
</head>
<body>
<div align="center">
    <%
        String succeed = request.getParameter("succeed");
        if (succeed != null && succeed.equals("true")) {
            out.println("<h1>发布成功！</h1>");
        } else
            out.println("<h1>发布失败！</h1>");
    %>
    <h3><a href="Menu.html">返回主菜单</a></h3>
</div>
</body>
</html>
