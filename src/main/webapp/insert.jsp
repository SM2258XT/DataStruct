<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入员工</title>
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
    const xmlHttpInsert = new XMLHttpRequest();

    function insertStaff() {
        console.log("=====开始插入=====");
        xmlHttpInsert.onreadystatechange = function () {
            if (xmlHttpInsert.readyState === 4 && xmlHttpInsert.status === 200) {
                const resText = xmlHttpInsert.responseText;
                console.log(resText);
                const msg = resText === "true" ? "插入成功！" : "插入失败！";
                if (confirm(msg + "\n是否跳转到主页面？"))
                    window.location.replace("Menu.html");
            }
        }

        let params = "";
        params += "id="+document.getElementById("id").value + "&";
        params += "name="+document.getElementById("name").value + "&";
        params += "sex="+ (document.getElementById("sex").options[0].selected?"男":"女")+ "&";
        params += "job="+document.getElementById("job").value + "&";
        params += "dept="+document.getElementById("dept").value + "&";
        params += "entryday="+document.getElementById("entryday").value + "&";
        params += "birthday="+document.getElementById("birthday").value;

        console.log("查询URL:  \n" + "http://localhost/InsertStaff.do?" + params);
        xmlHttpInsert.open("get", "http://localhost/InsertStaff.do?" + params, true);
        xmlHttpInsert.send();
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

        if (params.length === 2) {
            var type = params["type"],
                param = params["param"];
            let index = type === "id" ? 0 : 1;
            document.getElementsByName("delType")[index].selected = true;
            document.getElementById("delParam").value = param;
            insertStaff();
        }
    }
</script>
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
    <h2 align="center"><a href="javascript:;" onclick="insertStaff()">确认插入</a></h2>
</div>
</body>
</html>
