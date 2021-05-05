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

<body>

<div align="center">
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
        <tr id="change-update"><td colspan="7"> <h2 align="center"><a href="javascript:;">更新信息</a></h2></td></tr>
    </table>





</div>
</body>
</html>
