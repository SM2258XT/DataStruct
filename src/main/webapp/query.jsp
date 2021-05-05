<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询员工</title>
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
<script type="text/javascript">
    const xmlHttpQuery = new XMLHttpRequest();
    const xmlHttpDelete = new XMLHttpRequest();

    function queryStaff() {
        console.log("=====开始查询=====");
        xmlHttpQuery.onreadystatechange = function () {
            if (xmlHttpQuery.readyState === 4 && xmlHttpQuery.status === 200) {
                const resText = xmlHttpQuery.responseText;
                console.log(resText);
                if(resText === "false"){
                    alert("不存在该员工！");
                    return;
                }
                const array = JSON.parse(resText);  //得到的是json数组,里面放的是多个Staff的json对象
                addTableTr(document.getElementById("displayTable"), array);
            }
        }

        const type = document.getElementsByName("delType")[0].selected ? "id" : "name";
        const param = document.getElementById("delParam").value;

        xmlHttpQuery.open("get", "http://localhost/QueryStaff.do?type=" + type + "&param=" + param, true);
        xmlHttpQuery.send();
    }

    function addTableTr(tableEle, array) {
        for (let i = 0; i < array.length; i++) {
            const obj = JSON.parse(array[i]);           //将数组的第i个元素转化为单个obj
            const tr = document.createElement("tr");

            for (let key in obj) {    //为Staff的每个属性添加到单独的<td>中
                const td = document.createElement("td");
                td.innerText = obj[key];
                tr.appendChild(td);
            }
            const td_change = document.createElement("td");
            const td_delete = document.createElement("td");
            const td_status = document.createElement("td");
            td_change.innerHTML = "<a href="+obj['id']+"change.jsp?type=id&param=>修改</a>";
            td_delete.innerHTML = "<a href=delete.jsp?type=id&param="+obj['id']+">删除</a>";
            td_status.innerHTML = "<a href='/'></a>";
            tr.appendChild(td_change);
            tr.appendChild(td_delete);
            tr.appendChild(td_status);
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
    <div align="center">
        <select>
            <option name="delType" value="id">按编号查询</option>
            <option name="delType" value="name">按姓名查询</option>
        </select>
        <input id="delParam" placeholder="请根据您的选择输入信息">
    </div>
    <table id="displayTable">
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
    <br>
    <h2 align="center"><a href="javascript:;" onclick="queryStaff()">查询</a></h2>
</div>
</body>
</html>
