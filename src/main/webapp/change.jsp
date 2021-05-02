<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改员工信息</title>
</head>
<style type="text/css">
    table {
        border-collapse: collapse;
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

    .formatTimeTd {
        width: 250px;
    }

</style>

<body>

<div align="center">
    <table id="displayTable">
        <tr>
            <td>编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>工作</td>
            <td>部门</td>
            <td class="formatTimeTd">入职时间</td>
            <td class="formatTimeTd">生日</td>
        </tr>
        <tr>
            <td><input id="id" type="number"></td>
            <td><input id="name" type="text"></td>
            <td>
                <select id="sex">
                    <option name="sex" value="男" selected>男</option>
                    <option name="sex" value="女">女</option>
                </select>
            </td>
            <td><input id="job" type="text"></td>
            <td><input id="dept" type="text"></td>
            <td class="formatTimeTd"><input id="entryday" type="text"></td>
            <td class="formatTimeTd"><input id="birthday" type="text"></td>
        </tr>
    </table>
    <h2 align="center"><a href="javascript:;">呃......</a></h2>
</div>
</body>
</html>
