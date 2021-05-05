<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改员工信息</title>
</head>
<style type="text/css">
    *{
        font-size: 15px;
    }
    body{
        background-image: url("image/change_bac.jpg");
        z-index: -3;
    }
    table {
        border-collapse: collapse;
        margin-top: 160px;
    }

    table, table tr td {
        border: 1px solid #ccc;
    }
    tr{
        text-align: center;
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
    #change-title{
        height:100px;
        background-color: #00FFFF;
    }
    #change-title-text{
        font-size: 27px;
        color: #ff2200;
        text-shadow: 0 0 4px white,
        0 -5px 4px #ff3,
        2px -10px 6px #fd3,
        -2px -15px 11px #f80,
        2px -25px 18px #f20;

    }
    #change-top{
        background-color: #4db3a4;
        height:50px
    }
    #change-text{
        background-color: azure;
        height:50px
    }
    #change-update{
        height:100px;
        background-color: azure;
    }
    a{
        color:darkseagreen;
        border:2px slategray solid;
        border-radius: 2em;
        text-decoration: none;
        padding: 10px;
    }
    a:hover{
        color:red;
    }
</style>
<script type="text/javascript">
    const xmlHttpUpdate = new XMLHttpRequest();
    const xmlHttpQuery = new XMLHttpRequest();

    function updateStaff() {
        console.log("=====开始插入=====");
        xmlHttpUpdate.onreadystatechange = function () {
            if (xmlHttpUpdate.readyState === 4 && xmlHttpUpdate.status === 200) {
                const resText = xmlHttpUpdate.responseText;
                console.log(resText);
                const msg = resText === "true" ? "修改成功！" : "修改失败！";
                if (confirm(msg + "\n是否跳转到主页面？"))
                    window.location.replace("Menu.html");
            }
        }

        let params = "";
        params += "id=" + document.getElementById("id").value + "&";
        params += "name=" + document.getElementById("name").value + "&";
        params += "sex=" + (document.getElementById("sex").options[0].selected ? "男" : "女") + "&";
        params += "job=" + document.getElementById("job").value + "&";
        params += "dept=" + document.getElementById("dept").value + "&";
        params += "entryday=" + document.getElementById("entryday").value + "&";
        params += "birthday=" + document.getElementById("birthday").value;

        console.log("查询URL:  \n" + "http://localhost/UpdateStaff.do?" + params);
        xmlHttpUpdate.open("get", "http://localhost/UpdateStaff.do?" + params, true);
        xmlHttpUpdate.send();
    }

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
                addTableInput(document.getElementById("displayTable"), array);
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

        console.log("删除URL: http://localhost/UpdateStaff.do?type=" + type + "&param=" + param);
        xmlHttpDelete.open("get", "http://localhost/UpdateStaff.do?type=" + type + "&param=" + param, true);
        xmlHttpDelete.send();
    }

    function addTableInput(tableEle, array) {
        const obj = JSON.parse(array[0]);
        document.getElementById("id").value = obj.id;
        document.getElementById("name").value = obj.name;
        document.getElementById("sex").options[obj.sex === "男" ? 0 : 1].selected = true;
        document.getElementById("job").value = obj.job;
        document.getElementById("dept").value = obj.dept;
        document.getElementById("entryday").value = obj.entryday;
        document.getElementById("birthday").value = obj.birthday;
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
        let type;
        const params = getUrlVars();
        console.log("params.length = " + params.length);
        if (params.length === 2) {
            type = params["type"];
            let param = params["param"];
            let index = type === "id" ? 0 : 1;
            document.getElementsByName("delType")[index].selected = true;
            document.getElementById("delParam").value = param;
            queryStaff();
        } else if (params.length === 1) {
            type = params["type"];
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
    <button onclick="queryStaff()">查找该员工</button>
    <table id="displayTable" >
        <tr id="change-title">
            <td colspan="7" id="change-title-text">Updata</td>
        </tr>
        <tr id="change-top">
            <td>编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>工作</td>
            <td>部门</td>
            <td class="formatTimeTd">入职时间</td>
            <td class="formatTimeTd">生日</td>
        </tr>
        <tr id="change-text">
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
        <tr id="change-update"><td colspan="7"> <h2 align="center"><a href="javascript:;" onclick="updateStaff()">更新信息</a></h2></td></tr>
    </table>
</div>
</body>
</html>
