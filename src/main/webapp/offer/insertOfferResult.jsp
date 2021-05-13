<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入结果</title>
<style>
    body{
        background-color: black;
        text-align: center;
    }
    h1{
        font-size: 100px;
        color: #CC00CC;
        margin-top: 100px;
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
    p{
        color:gray;
    }
</style>
    <script type="text/javascript">

        var time=11;
        function count(){
            window.setTimeout('count()',1000);
            time=time-1;
            document.getElementById("auto-back").innerHTML=time;
        }

    </script>
</head>
<body onload="count()">
<div align="center">
    <h1>
        <%
            String succeed = request.getParameter("succeed");
            if (succeed != null && succeed.equals("true")) {
                out.println("发布成功！");
            } else
                out.println("发布失败！");
        %>
    </h1>

    <h3><a href="/Menu.jsp">返回主菜单</a></h3>
    <p><span id="auto-back">10</span>秒后自动返回主页！</p>
    <%
        response.setHeader("Refresh","10;URL=/Menu.html");
    %>
</div>
</body>
</html>
