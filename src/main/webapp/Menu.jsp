<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单栏</title>
    <style>
        @keyframes masked-animation {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: -100% 0;
            }
        }

        * {
            margin: 0;
            padding: 0;
            font-family: "微软雅黑", Helvetica, Arial, sans-serif;
        }

        ul, li {
            list-style: none;
            z-index: 1;

        }

        .top {

            position: fixed;
            background-color: white;
            top: 0;
            height: 80px;
            width: 100%;
            padding: 0 10%;
            box-sizing: border-box;
            z-index: 999;
        }

        .main-nav {
            display: flex;
            line-height: 80px;
            justify-content: space-around;
        }

        #title {
            font-family: 新細明體-ExtB;
            background-image: -webkit-linear-gradient(left, blue, #66ffff 10%, #cc00ff 20%, #CC00CC 30%, #CCCCFF 40%, #00FFFF 50%, #CCCCFF 60%, #CC00CC 70%, #CC00FF 80%, #66FFFF 90%, blue 100%);
            -webkit-text-fill-color: transparent; /* 将字体设置成透明色 */
            -webkit-background-clip: text; /* 裁剪背景图，使文字作为裁剪区域向外裁剪 */
            -webkit-background-size: 200% 100%;
            -webkit-animation: masked-animation 4s linear infinite;
            font-size: 38px;

        }

        .two-nav {
            background: white;
            position: relative;
            display: none;
        }

        .three-nav {
            background: white;
            position: absolute;
            top: 0;
            right: -116px;
            display: none;
        }

        .item-nav, .two-item, .three-item {
            width: 126px;
            text-align: center;
            color: black;
        }

        .item-nav > a, .two-item > a, .three-item > a {
            text-decoration: none;
            color: black;

        }

        .none {
            display: none;
        }

        .item-nav:hover > .two-nav {
            display: block;
        }

        .two-item:hover > .three-nav {
            display: block;
        }

        .item-nav:hover, .two-item:hover, .three-item:hover {
            background-color: deepskyblue;
        }


        img {

        }

        div h2 {
            z-index: -3;
            position: absolute;
            left: 350px;
            top: 100px;

            font-family: "华文行楷";
            font-size: 50px;
            width: 500px;
            height: 100px;
            opacity: 0.9;
        }

        div p {
            z-index: -3;
            position: absolute;
            left: 350px;
            top: 250px;

            font-family: "华文行楷";
            font-size: 30px;
            width: 500px;
            height: 100px;
            opacity: 0.9;
        }

        #explain {
            text-align: center;

            width: 100%;
            height: 300px;

        }

        .text1 {
            font-size: 20px;
        }

        #show1-a {
            height: 600px;
            width: 100%;
            position: relative;
            margin-top: 80px;
        }

        #show1-b {
            top: 130px;
            left: 200px;
            position: absolute;
            color: white;
            font-size: 40px;
            height: 470px;
            width: 400px;
            overflow: auto;
        }

        #show1-a img {
            top: 150px;
            left: 690px;
            position: absolute;
            transform: matrix(1, 0, 0, 1, -45.45, -120.886);
        }

        hr {
            width: 70px;
            height: 10px;
            background-color: white;
        }

        #footer {
            text-align: center;
        }

        a:hover {
            color: red;
        }

        #canvas1 {
            position: fixed;
            /*鼠标多层响应事件*/
            pointer-events: none;
            width: 100%;
            height: 100%;
            overflow: auto;
            z-index: 999;

        }
    </style>


</head>
<body>
<div class="top">
    <ul class="main-nav">

        <div href="fre" id="title">HR人事管理系统</div><!--点击title对页面进行刷新-->

        <li class="item-nav">
            <a href="javascript:;">员工管理&nbsp;&nbsp;∨</a>
            <ul class="two-nav none">
                <li class="two-item">
                    <a href="javascript:;">添加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a>
                    <ul class="three-nav none">
                        <li class="three-item">
                            <a href="insert.jsp">增加新员工</a>
                        </li>
                    </ul>
                </li>
                <li class="two-item">
                    <a href="javascript:;">人员修改&nbsp;&nbsp;&nbsp;&nbsp;></a>
                    <ul class="three-nav none">
                        <li class="three-item">
                            <a href="update.jsp?type=id">按编号修改</a>
                        </li>
                        <li class="three-item">
                            <a href="update.jsp?type=name">按姓名修改</a>
                        </li>
                    </ul>
                </li>
                <li class="two-item">
                    <a href="javascript:;">员工删除&nbsp;&nbsp;&nbsp;&nbsp;></a>
                    <ul class="three-nav none">
                        <li class="three-item">
                            <a href="delete.jsp?type=id">按编号删除</a>
                        </li>
                        <li class="three-item">
                            <a href="delete.jsp?type=name">按姓名删除</a>
                        </li>
                    </ul>
                </li>
                <li class="two-item">
                    <a href="javascript:;">查询员工&nbsp;&nbsp;&nbsp;&nbsp;></a>
                    <ul class="three-nav none">
                        <li class="three-item">
                            <a href="query.jsp?type=id">指定编号</a>
                        </li>
                        <li class="three-item">
                            <a href="query.jsp?type=name">指定姓名</a>
                        </li>
                        <li class="three-item">
                            <a href="showAll.jsp">显示所有</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>

        <li class="item-nav">
            <a href="javascript:;">绩效管理&nbsp;&nbsp;∨</a>
            <ul class="two-nav none">
                <li class="two-item">
                    <a href="/assessment/assessment.jsp">绩效评分</a>
                </li>
                <li class="two-item">
                    <a href="/achievement/achievement.jsp">一键生成绩效表</a>
                </li>
            </ul>
        </li>

        <li class="item-nav">
            <a href="javascript:;">考勤管理&nbsp;&nbsp;∨</a>
            <ul class="two-nav none">
                <li class="two-item">
                    <a href="/timeAttendance/timeAttendance.jsp">考勤表</a>
                </li>
            </ul>
        </li>


        <li class="item-nav">
            <a href="javascript:;">培训管理&nbsp;&nbsp;∨</a>
            <ul class="two-nav none">
                <li class="two-item">
                    <a href="train/insertTrain.jsp">发布培训</a>
                </li>
                <li class="two-item">
                    <a href="train/showAllTrains.jsp">所有培训计划</a>
                </li>
            </ul>


        <li class="item-nav">
            <a href="javascript:;">招聘管理&nbsp;&nbsp;∨</a>
            <ul class="two-nav none">
                <li class="two-item">
                    <a href="javascript:;">招聘岗位&nbsp;&nbsp;&nbsp;&nbsp;></a>
                    <ul class="three-nav none">
                        <li class="three-item">
                            <a href="offer/insertOffer.jsp">发布招聘岗位</a>
                        </li>
                        <li class="three-item">
                            <a href="offer/showAllOffer.jsp">显示所有岗位</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>

<div id="show1-a" style="background-image: url(image/2.jpg);">
    <div id="show1-b">HR人事管理系统： 提高工作效能，助力企业科学决策！
        <br><br>
        <hr>
    </div>
    <img src="image/3.png">
</div>

<div id="footer">

    <h1>By Group</h1>
    <a href="tel:110">Tel</a>
    <a href="sms:110">Sms</a>
</div>


</body>
</html>
