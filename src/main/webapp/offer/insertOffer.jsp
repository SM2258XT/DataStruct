<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入岗位</title>
</head>
<body>
<div align="center">
    <form action="/InsertOffer.do">
        <table>
            <tr>
                <td>
                    <select name="jobNum">
                        <option name="jobNum" value="0">软件开发</option>
                        <option name="jobNum" value="1">前端工程师</option>
                        <option name="jobNum" value="2">软件测试工程师</option>
                        <option name="jobNum" value="3">运营维护</option>
                        <option name="jobNum" value="4">软件架构师</option>
                        <option name="jobNum" value="5">信息安全工程师</option>
                        <option name="jobNum" value="6">数据库工程师</option>
                        <option name="jobNum" value="7">系统工程师</option>
                        <option name="jobNum" value="8">系统分析员</option>
                        <option name="jobNum" value="9">云计算工程技术人员</option>
                    </select>
                </td>
                <td>
                    <input type="submit" value="发布该岗位">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
