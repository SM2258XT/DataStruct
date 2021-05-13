<%@ page import="com.xhu.dao.StaffDao" %>
<%@ page import="com.xhu.datastruct.MyDoubleLoopLinkedList" %>
<%@ page import="com.xhu.domain.Staff" %>
<%@ page import="com.xhu.datastruct.MySeqList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考核表</title>
    <style type="text/css">
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
        .ASM_Title{
            font-size: 27px;
            color: #ff2200;
            text-shadow: 0 0 4px white,
            0 -5px 4px #ff3,
            2px -10px 6px #fd3,
            -2px -15px 11px #f80,
            2px -25px 18px #f20;
        }

        a:hover{
            color:red;
        }
    </style>
    <script type="text/javascript">
        const xmlHttpUpdate = new XMLHttpRequest();

        function updateStaff(ele) {
            xmlHttpUpdate.onreadystatechange = function () {
                if (xmlHttpUpdate.readyState === 4 && xmlHttpUpdate.status === 200) {
                    const staffId = ele.id;
                    const resText = xmlHttpUpdate.responseText;
                    console.log(resText);
                    document.getElementById(staffId + "-tr").innerText = (resText === "false" ? "修改失败！" : "修改成功！");
                }
            }

            const grade0 = document.getElementById(ele.id + "-0").value;
            const grade1 = document.getElementById(ele.id + "-1").value;
            const grade2 = document.getElementById(ele.id + "-2").value;

            var params = "";
            params = params + "id=" + ele.id;
            params = params + "&grade0=" + grade0;
            params = params + "&grade1=" + grade1;
            params = params + "&grade2=" + grade2;

            console.log("http://localhost/UpdateAssessment?" + params);
            xmlHttpUpdate.open("get", "http://localhost/UpdateAssessment?" + params, true);
            xmlHttpUpdate.send();
        }
    </script>
</head>
<body>
<div align="center">
<table>
    <tr >
        <td colspan="8" class="ASM_Title">
            员工考核表
        </td>
    </tr>
    <tr>
        <td>姓名</td>
        <td>编号</td>
        <td>工作</td>
        <td>部门</td>
        <td>总经理评分</td>
        <td>项目经理评分</td>
        <td>部门总监评分</td>
        <td>操作</td>
    </tr>

    <%
        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList staffList = dao.selectAll();     //获取所有员工双向循环链表
        for (int i = 0; i < staffList.size(); i++) {            //遍历所有员工
            Staff staff = staffList.getStaffByIndex(i);
            MySeqList gradeList = (MySeqList) session.getAttribute(staff.getId() + "@ass"); //获取员工考核表

            //动态生成员工表格
            out.println("<tr>");

            out.println("<td>");
            out.println(staff.getName());
            out.println("</td>");

            out.println("<td>");
            out.println(staff.getId());
            out.println("</td>");

            out.println("<td>");
            out.println(staff.getJob());
            out.println("</td>");

            out.println("<td>");
            out.println(staff.getDept());
            out.println("</td>");

            out.println("<td>");
            out.println("<input id='" + staff.getId() + "-0' type='number' value='" + (gradeList == null ? 0 : gradeList.getDataByIndex(0)) + "'>");
            out.println("</td>");

            out.println("<td>");
            out.println("<input id='" + staff.getId() + "-1' type='number' value='" + (gradeList == null ? 0 : gradeList.getDataByIndex(1)) + "'>");
            out.println("</td>");

            out.println("<td>");
            out.println("<input id='" + staff.getId() + "-2' type='number' value='" + (gradeList == null ? 0 : gradeList.getDataByIndex(2)) + "'>");
            out.println("</td>");

            out.println("<td id='" + staff.getId() + "-tr'>");
            out.println("<a id='" + staff.getId() + "' href='javascript:;' onclick='updateStaff(this)'>保存评分</a>");
            out.println("</td>");

            out.println("</tr>");
        }
        dao.close();
    %>
</table>
</div>
</body>
</html>
