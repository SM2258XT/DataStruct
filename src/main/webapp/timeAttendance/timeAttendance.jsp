<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤表</title>
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
        #timeA-title {
            height: 100px;
            background-color: #00FFFF;


        }

        #timeA-title-text {
            font-size: 27px;
            color: #ff2200;
            text-shadow: 0 0 4px white,
            0 -5px 4px #ff3,
            2px -10px 6px #fd3,
            -2px -15px 11px #f80,
            2px -25px 18px #f20;

        }

    </style>
    <script type="text/javascript">
        const xmlHttpSelect = new XMLHttpRequest();
        const xmlHttpUpdate = new XMLHttpRequest();
        var staffId;

        function selectStaff() {
            xmlHttpSelect.onreadystatechange = function () {
                if (xmlHttpSelect.readyState === 4 && xmlHttpSelect.status === 200) {
                    const resText = xmlHttpSelect.responseText;
                    console.log(resText);
                    if (resText === "false") {
                        alert("不存在编号为" + document.getElementById("selectId").value + "的员工");
                        return;
                    }
                    const staffObj = JSON.parse(resText);
                    document.getElementById("id").innerText = staffObj.id;
                    document.getElementById("name").innerText = staffObj.name;
                    document.getElementById("one").value = staffObj.one;
                    document.getElementById("two").value = staffObj.two;
                    document.getElementById("three").value = staffObj.three;
                    document.getElementById("four").value = staffObj.four;
                    document.getElementById("five").value = staffObj.five;
                    document.getElementById("six").value = staffObj.six;
                    staffId = staffObj.id;
                }
            }

            const params = "selectId=" + document.getElementById("selectId").value;
            xmlHttpSelect.open("get", "http://localhost/Attendance.do?" + params, true);
            xmlHttpSelect.send();
        }

        function updateAttendance() {
            xmlHttpSelect.onreadystatechange = function () {
                if (xmlHttpSelect.readyState === 4 && xmlHttpSelect.status === 200) {
                    const resText = xmlHttpSelect.responseText;
                    console.log(resText);
                    alert(resText === "false" ? "修改失败!" : "修改成功!");
                }
            }

            var params = "";
            params = params + "id=" + staffId;
            params = params + "&one=" + document.getElementById("one").value;
            params = params + "&two=" + document.getElementById("two").value;
            params = params + "&three=" + document.getElementById("three").value;
            params = params + "&four=" + document.getElementById("four").value;
            params = params + "&five=" + document.getElementById("five").value;
            params = params + "&six=" + document.getElementById("six").value;
            console.log("http://localhost/UpdateAttendance.do?" + params);
            xmlHttpSelect.open("get", "http://localhost/UpdateAttendance.do?" + params, true);
            xmlHttpSelect.send();
        }

    </script>
</head>
<body>
<div align="center">
    <!--
        表格的结构不会改变
    -->
    <table border="1">
        <tr id="timeA-title">
            <td colspan="8" id="timeA-title-text">
                     员工考勤表
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2"><input id="selectId" type="number" placeholder="输入编号"></td>
            <td colspan="2">
                <button onclick="selectStaff()">查询该员工</button>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>

            <td colspan="2">编号</td>
            <td colspan="2">姓名</td>

            <td></td>
        </tr>
        <tr>
            <td></td>

            <td id="id" colspan="2"></td>
            <td id="name" colspan="2"></td>

            <td></td>
        </tr>
        <tr>
            <td>一月</td>
            <td>二月</td>
            <td>三月</td>
            <td>四月</td>
            <td>五月</td>
            <td>六月</td>
        </tr>

            <!--
                ajax查询数据后，会直接修改下面的节点value或者innerHTML，不会新增tr td
            -->

        <tr>
            <td><input id="one" type="number" max="30" min="0"></td>
            <td><input id="two" type="number" max="30" min="0"></td>
            <td><input id="three" type="number" max="30" min="0"></td>
            <td><input id="four" type="number" max="30" min="0"></td>
            <td><input id="five" type="number" max="30" min="0"></td>
            <td><input id="six" type="number" max="30" min="0"></td>
        </tr>
        <tr>
            <td colspan="8">
                <button onclick="updateAttendance()">保存修改</button>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
