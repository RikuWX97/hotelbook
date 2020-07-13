<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css"  media="all">
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">鸿发国际酒店</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">预定房间</a></li>
            <li class="layui-nav-item"><a href="">客房分类</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它</a>
                <dl class="layui-nav-child">
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                    <dd><a href="">联系客服</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">已有账号？</li>
            <li class="layui-nav-item"><a href="${ctx}/login.jsp">登录</a></li>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">--%>
<%--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
<%--                    用户--%>
<%--                </a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">基本资料</a></dd>--%>
<%--                    <dd><a href="">我的订单</a></dd>--%>
<%--                    <dd><a href="">联系客服</a></dd>--%>
<%--                    <dd><a href="">安全设置</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item"><a href="">注销</a></li>--%>
        </ul>
    </div>

    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md-offset1 layui-col-md10">

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>注册新用户</legend>
                </fieldset>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend style="color: red;">${requestScope.msgError}</legend>
                </fieldset>

                <form name="register" class="layui-form" action="${ctx}/user/reg" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" lay-verify="required|name" lay-reqtext="用户名不能为空！" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span style="color: red;">${requestScope.msgNameUsed}</span>
                            <span style="color: red;">${requestScope.errors.name}</span>
                            请填写2~20位的用户名
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="password" lay-verify="required|pass" lay-reqtext="密码不能为空！" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span style="color: red;">${requestScope.errors.password}</span>
                            请填写6到12位密码
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="cfmPassword" lay-verify="required|cfmpass" lay-reqtext="请再次输入密码！" placeholder="请再次输入密码" autocomplete="off" class="layui-input" >
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span style="color: red;">${requestScope.msgPasswordError}</span>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">验证手机</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="phone" lay-verify="required|phone" lay-reqtext="手机号码不能为空！" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.errors.phone}</span>
                                请填写11位手机号码
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">验证码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="number" lay-verify="required|number" lay-reqtext="验证码不能为空！" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                请填入数字验证
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">验证邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" name="email" lay-verify="required|email" lay-reqtext="邮箱地址不能为空！" placeholder="请填入邮箱" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.errors.email}</span>
                                请填写您的邮箱地址
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">出生日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="date" id="date" <%--lay-verify="date"--%> placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                可选填
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男" checked="">
                            <input type="radio" name="sex" value="女" title="女">
                            <input type="radio" name="sex" value="保密" title="保密" <%--title="禁用" disabled=""--%>>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">
                                立即注册
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary" onclick="return confirm('您确定要重置吗？');">
                                重置
                            </button>
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
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //自定义验证规则
        form.verify({
            name: [
                /^[\S]{2,20}$/
                ,'用户名必须2到20位，且不能出现空格!'
            ]
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格!'
            ]
            ,cfmpass: function (value) {
                if(value !== register.password.value){
                    return '两次输入密码不一致！';
                }
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return true;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            form.val('example', {
                "username": "贤心" // "name": "value"
                ,"password": "123456"
                ,"interest": 1
                ,"like[write]": true //复选框选中状态
                ,"close": true //开关状态
                ,"sex": "女"
                ,"desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });

</script>

</body>
</html>
