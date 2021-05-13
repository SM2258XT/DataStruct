<%@ page import="com.xhu.datastruct.MyLinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加培训计划结果</title>
</head>
<body>
<%
    MyLinkedList<String> errorStaffs = (MyLinkedList) request.getAttribute("errorStaffs");
    if (!errorStaffs.isEmpty()) {
        out.println("<h1>以下人员不存在，加入培训计划失败！其他人员加入成功。</h1>");
        for (int i = 0; i < errorStaffs.getSize(); i++) {
            out.println("<h4>" + errorStaffs.getByIndex(i) + "</h4>");
        }
    }else{
        out.println("<h1>添加培训计划成功！</h1>");
    }
%>
</body>
</html>
