<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除员工</title>
</head>
<%--<style type="text/css">--%>
<%--    table {--%>
<%--        border-collapse: collapse;--%>
<%--    }--%>

<%--    table, table tr th{--%>
<%--        border: 1px solid #ccc;--%>
<%--    }--%>

<%--    table tr th{--%>
<%--        padding: 5px 10px;--%>
<%--    }--%>

<%--    th{--%>
<%--        width: 80px;--%>
<%--    }--%>

<%--    .formatTimeTd {--%>
<%--        width: 250px;--%>
<%--    }--%>

<%--</style>--%>

<style type="text/css">
body{
background-image: url("/image/111.jpg");
}

table{
border-collapse:collapse;
table-layout:fixed;
border-radius:5px;
overflow:hidden;
margin: 10px auto;
border:1px solid #0331f8;
background-color: #5a99fc;
color: #ffffef;
}
table td,th {
 padding: 5px 10px;
width: 33%;
text-align: center;
border:1px solid #70aefb ;
vertical-align:middle;
 font-size: 15px;
width: 80px;
}

table thead th{
    background: #5a99fc;
}

table tr:nth-child(odd){
    background: #8dbeff;
}

table tr:nth-child(even){
    background: #3368b6;
}

.formatTimeTd {
    width: 250px;
}

select{
    background:transparent;
    width:100px;
    height:30px;
    overflow: hidden;
}

#delParam{
    font-size:medium;
    height:30px;
    border-radius:5px;
    border:1px solid #c8cccf;
    color:#6a6f77;
}

.btn{
    width:100px;
    height:30px;
    background-image: linear-gradient(#03dbf8, #4589ef);
    font-size: medium;
    color:#ffffef;
}
</style>

<script type="text/javascript">
    const xmlHttpQuery = new XMLHttpRequest();
    const xmlHttpDelete = new XMLHttpRequest();
    let selected = false;

    function queryStaff() {
        console.log("=====开始查询=====");
        xmlHttpQuery.onreadystatechange = function () {
            if (xmlHttpQuery.readyState === 4 && xmlHttpQuery.status === 200) {
                const resText = xmlHttpQuery.responseText;
                console.log(resText);
                if (resText === "false") {
                    alert("不存在该员工！");
                    return;
                }
                selected = true;
                const array = JSON.parse(resText);  //得到的是json数组,里面放的是多个Staff的json对象
                addTableTr(document.getElementById("displayTable"), array);
            }
        }

        const type = document.getElementsByName("delType")[0].selected ? "id" : "name";
        const param = document.getElementById("delParam").value;

        console.log("查询URL:  " + "http://localhost/QueryStaff.do?type=" + type + "&param=" + param);
        xmlHttpQuery.open("get", "http://localhost/QueryStaff.do?type=" + type + "&param=" + param, true);
        xmlHttpQuery.send();
    }

    function deleteStaff() {
        if (selected === false) {
            alert("请先选择员工后再删除！");
            return;
        }
        console.log("=====开始查询=====");
        xmlHttpDelete.onreadystatechange = function () {
            if (xmlHttpDelete.readyState === 4 && xmlHttpDelete.status === 200) {
                const resText = xmlHttpDelete.responseText;
                console.log(resText);
                const msg = resText === "true" ? "删除成功！" : "删除失败！";
                if (confirm(msg + "\n是否跳转到主页面？"))
                    window.location.replace("Menu.html");
            }
        }

        const type = document.getElementsByName("delType")[0].selected ? "id" : "name";
        const param = document.getElementById("delParam").value;

        console.log("删除URL: http://localhost/DeleteStaff.do?type=" + type + "&param=" + param);
        xmlHttpDelete.open("get", "http://localhost/DeleteStaff.do?type=" + type + "&param=" + param, true);
        xmlHttpDelete.send();
    }

    function addTableTr(tableEle, array) {
        for (let i = 0; i < array.length; i++) {
            const obj = JSON.parse(array[i]);           //将数组的第i个元素转化为单个obj
            const tr = document.createElement("tr");

            for (let key in obj) {    //为Staff的每个属性添加到单独的<td>中
                const td = document.createElement("td");
                td.innerText = obj[key];
                console.log(key + " " + obj[key]);
                tr.appendChild(td);
            }
            tableEle.appendChild(tr);
        }
    }

    function getUrlVars() {
        var vars = [],
            hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }

    window.onload = function () {
        const params = getUrlVars();
        var isExist = false;
        console.log("params.length = " + params.length);
        if (params.length === 2) {
            var type = params["type"],
                param = params["param"];
            let index = type === "id" ? 0 : 1;
            document.getElementsByName("delType")[index].selected = true;
            document.getElementById("delParam").value = param;
            queryStaff();
        } else if (params.length === 1) {
            var type = params["type"];
            let index = type === "id" ? 0 : 1;
            document.getElementsByName("delType")[index].selected = true;
        }
    }
</script>
<body>

<div align="center">
    <select>
        <option name="delType" value="id">按编号删除</option>
        <option name="delType" value="name">按姓名删除</option>
    </select>
    <input id="delParam" placeholder="请根据您的选择输入信息">
    &nbsp;&nbsp;&nbsp;
    <button class="btn" onclick="queryStaff()">查找该员工</button>
    <table id="displayTable">
        <thead>
        <tr>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>工作</th>
            <th>部门</th>
            <th class="formatTimeTd">入职时间</th>
            <th class="formatTimeTd">生日</th>
        </tr>
        </thead>
    </table>
    <h2 align="center"><a href="javascript:;" onclick="deleteStaff()">确认删除</a></h2>
</div>
</body>
</html>
