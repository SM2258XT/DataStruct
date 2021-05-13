<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>指定培训计划</title>
    <style type="text/css">
        body{
            background-image: url("/image/change_bac.jpg");

            font-size:12px;
            font-weight:bold;

        }
        #IT_Title{
            color:red;
            text-shadow: 0.2em 0.5em 0.1em #600,
            -0.3em 0.1em 0.1em #060,
            0.4em -0.3em 0.1em #006;

            font-size: 20px;
        }
        .wrapper{
            width:650px;
            margin: 20px auto;
            padding-top:5px;
            letter-spacing: 0.2em;
        }
        .info-item{
            margin: 2px;
            background-color:#ccc;
            z-index: 99;

        }
        .item-name {
            width: 100px;
            border-right:1.5px solid #FFF;
            display: inline-block;
            text-align: right;
            vertical-align: middle;
            line-height:55px;
        }
        #self{
            line-height: 94px;
        }

        textarea{
            vertical-align:middle;
        }
        #but{
            padding: 15px;
            text-align:center;

        }

        #but1{
            background-color:#0CF;
            line-height: 30px;

        }
        .tips{
            color:red;
        }
    </style>
    <script src="JS.js"></script>
</head>
<body>

<div class="wrapper">

    <form  action="/InsertTrain.do" method="post">
        <fieldset>

            <legend style="text-align:center" id="IT_Title">培训计划</legend>
            <div class="info-item">
                <span class="item-name">培训体系:</span><select name="trainSys">
                <option name="trainSys" value="团队沟通与协作能力培训体系">团队沟通与协作能力培训体系</option>
                <option name="trainSys" value="个人集体意识培训体系">个人集体意识培训体系</option>
                <option name="trainSys" value="个人知识技能培训体系">个人知识技能培训体系</option>
                <option name="trainSys" value="专业知识培训体系">专业知识培训体系</option>
                <option name="trainSys" value="综合能力培训体系">综合能力培训体系</option>
                <option name="trainSys" value="个人创新能力培训体系">个人创新能力培训体系</option>
            </select></div>
            <div class="info-item">
                <span class="item-name">培训资源:</span>
                <input name="trainSrc" type="checkbox" value="培训经费">培训经费
                <input name="trainSrc" type="checkbox" value="培训讲师">培训讲师
                <input name="trainSrc" type="checkbox" value="培训场地">培训场地
                <input name="trainSrc" type="checkbox" value="培训手册">培训手册
                <input name="trainSrc" type="checkbox" value="培训员工报告书">培训员工报告书</div>
            <div class="info-item">
                <span class="item-name">培训需求:</span>
                <input name="trainReq" placeholder="请具体拟定培训需求">
            </div>
            <div class="info-item">
                <span class="item-name">培训计划:</span>
                <input name="trainPlan" placeholder="请具体拟定培训计划">
            </div>
            <div class="info-item">
                <span class="item-name" id="self">培训人员姓名:</span>
                <textarea name="trainStaffs"  rows="5" cols="40" >

                </textarea><span class="tips">*以英文符号分隔姓名</span>
            </div >
            <div class="info-item" id="but">  <input type="submit" value="提交" id="but1"></div>

        </fieldset>
    </form>
</div>
</body>
</html>
