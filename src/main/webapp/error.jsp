<%@ page import="com.xhu.utils.WEBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误！</title>
    <style type="text/css">
        body{
            background-color: black;
         text-align: center;
        }
      h1{
          font-size: 100px;
          color: #CC00CC;
          margin-top: 100px;
      }
      h2{
          font-size: 70px;
          color: #CC00CC;
          margin-top: 10px;
      }
        p{
            color:gray;
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

    <h1>出错啦！</h1><br>
    <h2>
    <%
        String info = request.getParameter("info");
        if (WEBUtils.notNullOrEmpty(info)){
            out.println(info);
        }
    %></h2>
    <br>
   <h2> <a href="Menu.jsp">返回主页</a></h2><p><span id="auto-back">10</span>秒后自动返回主页！</p>
    <%
        response.setHeader("Refresh","10;URL=Menu.jsp");
    %>
</div>
</body>
</html>
