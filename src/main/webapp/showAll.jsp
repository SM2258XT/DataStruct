<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有员工信息</title>
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
        .formatTimeTd {
            width: 250px;
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
        #showAll-title {
            height: 100px;
            background-color: #00FFFF;
        }
        #showAll-title-text {
            font-size: 27px;
            color: #ff2200;
            text-shadow: 0 0 4px white,
            0 -5px 4px #ff3,
            2px -10px 6px #fd3,
            -2px -15px 11px #f80,
            2px -25px 18px #f20;

        }
        .btn {
            width: 100px;
            color: darkseagreen;
            padding: 10px;
            font-size: medium;
        }
    </style>
    <script type="text/javascript">
        const xmlHttp = new XMLHttpRequest();
        function queryAllStaff() {
            console.log("=====开始查询=====");
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                    const resText = xmlHttp.responseText;
                    console.log(resText);
                    const array = JSON.parse(resText);  //得到的是json数组,里面放的是多个Staff的json对象
                    addTableTr(document.getElementById("displayTable"), array);
                }
            }
            xmlHttp.open("get", "http://localhost/QueryAllStaff.do", true);
            xmlHttp.send();
        }
        function addTableTr(tableEle, array) {
            for (let i = 0; i < array.length; i++) {
                const obj = JSON.parse(array[i]);           //将数组的第i个元素转化为单个obj
                const tr = document.createElement("tr");
                tr.className = "row";
                for (let key in obj) {    //为Staff的每个属性添加到单独的<td>中
                    const td = document.createElement("td");
                    td.innerText = obj[key];
                    console.log(key + " " + obj[key]);
                    tr.appendChild(td);
                }
                const td_change = document.createElement("td");
                const td_delete = document.createElement("td");
                const td_status = document.createElement("td");
                td_change.innerHTML = "<a href='update.jsp?type=id&param=" + obj['id'] + "'>修改</a>";
                td_delete.innerHTML = "<a href='delete.jsp?type=id&param=" + obj['id'] + "'>删除</a>";
                td_status.innerHTML = "<a href='/'></a>";
                tr.appendChild(td_change);
                tr.appendChild(td_delete);
                tr.appendChild(td_status);
                tableEle.appendChild(tr);
            }
        }
        window.onload = function () {
            queryAllStaff();
        }
    </script>
</head>
<body>
<table id="displayTable" align="center">
    <tr id="showAll-title">
        <td colspan="10" id="showAll-title-text">所有员工信息</td>
    </tr>
    <tr>
        <td colspan="10">
            <button onclick="queryAllStaff()" class="btn">查询</button>
        </td>
    </tr>
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>工作</td>
        <td>部门</td>
        <td class="formatTimeTd">入职时间</td>
        <td class="formatTimeTd">生日</td>
        <td>修改选项</td>
        <td>删除选项</td>
        <td>状态</td>
    </tr>
</table>
</body>
</html>
