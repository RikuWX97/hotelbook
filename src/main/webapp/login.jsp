<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<%@ page import="java.net.URLDecoder" %>
<% pageContext.setAttribute("ctx", request.getContextPath());
//    Cookie[] cookies = request.getCookies();
//    for(Cookie c:cookies){
//        if("userName".equals(c.getName())){
//            String userName = c.getValue();
//            pageContext.setAttribute("loginUserName",URLDecoder.decode(userName,"utf-8"));
//        }
//    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet" media="all">
    <link href="${ctx}/css/common.css" rel="stylesheet">
    <link href="${ctx}/css/login.css" rel="stylesheet">
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <a href="${ctx}\index.jsp"><img src="${ctx}/assets/images/mashup-icon.svg" class="navbar-logo-img" alt=""><div class="layui-logo">鸿发国际酒店</div></a>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${ctx}\room\list">预定房间</a></li>
           <!--  <li class="layui-nav-item"><a href="">客房分类</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它</a>
                <dl class="layui-nav-child">
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                    <dd><a href="">联系客服</a></dd>
                </dl>
            </li> -->
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                    <i class="layui-icon layui-icon-friends" style="font-size: 25px;"></i>
                    请登录
            </li>
        </ul>
    </div>

    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md-offset4 layui-col-md4" style="margin-top: 30px;margin-bottom: 50px;">

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;"></fieldset>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                    <legend style="color: red;">${requestScope.msgError}</legend>
                    <legend style="color: red;">${requestScope.msg}</legend>
                </fieldset>

                <form name="login" class="layui-form" action="${ctx}/user/login" method="post">
                    <h1 class="layui-input-block">欢 迎 登 录</h1>
                    <label class="layui-form-label" style="text-align: left;padding: 4px 5px;">用户名:</label>
                    <div class="layui-form-item">
                        <input type="text" class="layui-input" name="name" lay-verify="required" lay-reqtext="用户名不能为空！" placeholder="请输入用户名" <%--value="${loginUserName}"--%> value="${cookie.userName.value}"/>
                    </div>
                    <label class="layui-form-label" style="text-align: left;padding: 4px 5px;">密 码:</label>
                    <div class="layui-form-item">
                        <input type="password" class="layui-input" name="password" lay-verify="required|pass" lay-reqtext="密码不能为空！" placeholder="请输入密码" value="${cookie.userPassword.value}"/>
                    </div>

                    <div class="layui-form-item" pane="">
                        <div class="layui-input-block" style="margin-left: 0;">
                                <input type="checkbox" name="isMemory" id="isMemory" lay-skin="primary" title="记住我" ${cookie.memoryCheck.value}/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="formDemo">登录</button>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <div class="layui-btn-group">
                                <a href="${ctx}/reg.jsp" class="layui-btn layui-btn-normal">注册</a>
                                <button type="reset" class="layui-btn layui-btn-primary" onclick="return confirm('您确定要重置吗？');">重置</button>
                            </div>
                        </div>
                    </div>
                </form>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>

            </div>
        </div>
    </div>

</div>


<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>

<script>
    //样式
    layui.use(['form'], function(){
        var form = layui.form;

        //自定义验证规则
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格!'
            ]
        });

        //监听提交
        form.on('submit(formDemo)', function(){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return true;
        });
    });

</script>

</body>
</html>
