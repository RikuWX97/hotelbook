<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <meta content="description" name="description">
    <meta name="google" content="notranslate"/>
    <meta content="Mashup templates have been developped by Orson.io team" name="author">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
    <link rel="apple-touch-icon" sizes="180x180" href="${ctx}/assets/apple-icon-180x180.png">
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/css/user.css" rel="stylesheet">
    <title>用户信息</title>

    <link href="${ctx}/css/main.550dcf66.css" rel="stylesheet">
    <script src="${ctx}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/js/main.0cf8b554.js"></script>
    <script src="${ctx}/js/jquery-3.4.1.min.js"></script>
</head>

<body>
<header>
    <nav class="navbar navbar-default active" style="background-color: #3c82ff">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${ctx}\room\list" title="">
                    <img src="${ctx}/assets/images/mashup-icon.svg" class="navbar-logo-img" alt="">
                    鸿发国际酒店
                </a>
            </div>

            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a>${loginUser.name}</a></li>
                    <li><a href="javascript:history.back(-1)">返回</a></li>
                    <li><a href="${ctx}/user/loginOut" onclick="return confirm('您确定退出登录吗？');">注销</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Add your site or app content here -->
<div class="hero-full-container background-image-container white-text-container">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1>我的信息</h1>
                <br>
                <a  href="${ctx}\room\list" class="btn btn-default btn-lg" title="">前往预定</a>
            </div>
        </div>
    </div>
</div>

<div class="section-container">

    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="layui-this">个人信息</li>
            <li>修改密码</li>
         <!--    <li>找回密码</li> -->
            <li>我的订单</li>

        </ul>
        <div class="layui-tab-content" style="height: 100px;">

            <!-- 下面为个人信息 -》三少 -->
            <div class="layui-tab-item layui-show">
                <div class="layui-col-md-offset1 layui-col-md10" style="margin-top: 10px;margin-bottom: 50px;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>${loginUser.name}的信息</legend>
                    </fieldset>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend style="color: red;">${requestScope.msg}</legend>
                    </fieldset>
                    <form name="updateUser" class="layui-form" action="${ctx}/user/update" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" lay-verify="required|name" lay-reqtext="用户名不能为空！"
                                       placeholder="请输入用户名" autocomplete="off" class="layui-input"
                                       value="${loginUser.name}"/>
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.msgNameUsed}</span>
                                <span style="color: red;">${requestScope.errors.name}</span>
                                限制填写2~20位的用户名
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">我的手机</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="phone" lay-verify="required|phone" lay-reqtext="手机号码不能为空！"
                                           placeholder="请输入11位手机号码" autocomplete="off" class="layui-input"
                                           value="${loginUser.phone}"/>
                                </div>
                                <div class="layui-form-mid layui-word-aux">
                                    <span style="color: red;">${requestScope.errors.phone}</span>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">我的邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="email" lay-verify="required|email" lay-reqtext="邮箱地址不能为空！"
                                           placeholder="请填入您的邮箱" autocomplete="off" class="layui-input"
                                           value="${loginUser.email}"/>
                                </div>
                                <div class="layui-form-mid layui-word-aux">
                                    <span style="color: red;">${requestScope.errors.email}</span>
                                </div>
                            </div>
                        </div>

                        <br>
                        <div class="layui-form-item" pane="">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" title="男" checked="">
                                <input type="radio" name="sex" value="女" title="女">
                                <input type="radio" name="sex" value="保密" title="保密">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="update">
                                    修改
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary"
                                        onclick="return confirm('您确定要重置吗？');">
                                    重置
                                </button>
                            </div>
                        </div>
                    </form>

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>
                </div>
            </div>

            <div class="layui-tab-item">
                <div class="layui-col-md-offset1 layui-col-md10" style="margin-top: 10px;margin-bottom: 50px;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>修改密码</legend>
                    </fieldset>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend style="color: red;">${requestScope.msg}</legend>
                    </fieldset>
                    <form name="updateUser" class="layui-form" action="${ctx}/user/update" method="post">

                        <div class="layui-form-item">
                            <label class="layui-form-label">原密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="oldPassword" lay-verify="required|pass" lay-reqtext="密码不能为空！"
                                       placeholder="请输入6到12位密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.errors.password}</span>
                                请输入原密码进行验证
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password"  id="password" name="password" lay-verify="required|pass" lay-reqtext="密码不能为空！"
                                       placeholder="请输入6到12位密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.errors.password}</span>
                                请输入您的新密码
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="cfmPassword" lay-verify="required|cfmpass|pass"
                                       lay-reqtext="请再次输入密码！" placeholder="请再次输入密码" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                请再次输入您的新密码
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="update" onclick="return confirm('您确定要修改吗？');">
                                    修改
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary"
                                        onclick="return confirm('您确定要重置吗？');">
                                    重置
                                </button>
                            </div>
                        </div>
                    </form>

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>
                </div>

            </div>
           <%--  <div class="layui-tab-item">
                <div class="layui-col-md-offset1 layui-col-md10" style="margin-top: 10px;margin-bottom: 50px;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>找回密码（需要重新登录）</legend>
                    </fieldset>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend style="color: red;">${requestScope.msg}</legend>
                    </fieldset>
                    <form name="updateUser" class="layui-form" action="${ctx}/user/update" method="post">

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">验证手机</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="checkPhone" lay-verify="required|phone" lay-reqtext="手机号码不能为空！"
                                           placeholder="请输入11位手机号码" autocomplete="off" class="layui-input"/>
                                </div>
                                <div class="layui-form-mid layui-word-aux">
                                    <span style="color: red;">${requestScope.errors.phone}</span>
                                    请输入您的11位手机号验证
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="password2" name="password" lay-verify="required|pass" lay-reqtext="密码不能为空！"
                                       placeholder="请输入6到12位密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <span style="color: red;">${requestScope.errors.password}</span>
                                请输入您的新密码
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="cfmPassword" lay-verify="required|cfmpass2|pass"
                                       lay-reqtext="请再次输入密码！" placeholder="请再次输入密码" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                请再次输入您的新密码
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="update" onclick="return confirm('您确定要更新密码吗？更新后需要重新登录！');">
                                    确定
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary"
                                        onclick="return confirm('您确定要重置吗？');">
                                    重置
                                </button>
                            </div>
                        </div>
                    </form>

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>
                </div>

            </div> --%>

            <div class="layui-tab-item">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

                    <ul class="layui-tab-title">
                        <li class="layui-this">已审核</li>
                        <li>审核中</li>
                        <li>已过期</li>
                        <li>全部</li>
                    </ul>

                    <div class="layui-tab-content" style="height: 100px;">

                        <!-- 我的订单-》已审核 -->
                        <div class="layui-tab-item layui-show">
                            <table class="layui-table" lay-skin="line" lay-size="sm">

                                <tr>
                                    <td>订单号</td>
                                    <td>用户编号</td>
                                    <td>房间编号</td>
                                    <td>预定手机号码</td>
                                    <td>邮箱</td>
                                    <td>下单时间</td>
                                    <td>预计到达时间</td>
                                    <td>预定价格</td>
                                    <td>住客姓名</td>
                                    <td>审核状态</td>
                                </tr>

                                <c:forEach items="${confirm}" var="confirm">
                                    <tr>
                                        <td>${confirm.bookId}</td>
                                        <td>${confirm.userId}</td>
                                        <td>${confirm.roomId}</td>
                                        <td>${confirm.bookPhone}</td>
                                        <td>${confirm.email}</td>
                                            <%-- <td>${confirm.bookDate}</td> --%>
                                        <td><fmt:formatDate value="${confirm.bookDate}"
                                                            pattern="yyyy年MM月dd日 hh时mm分ss秒"/></td>
                                        <td><fmt:formatDate value="${confirm.arriveDate}" pattern="yyyy年MM月dd日"/></td>
                                        <td>${confirm.bookPrice}</td>
                                        <td>${confirm.bookName}</td>
                                        <td>
                                            <c:if test="${confirm.bookState=='1'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-warm layui-btn-radius">
                                                    审核中
                                                </button>
                                            </c:if>
                                            <c:if test="${confirm.bookState=='2'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-radius">已通过</button>
                                            </c:if>
                                            <c:if test="${confirm.bookState=='0'}">
                                                <button class="layui-btn-sm layui-btn-radius">已过期</button>
                                            </c:if>
                                            <c:if test="${confirm.bookState==null}">
                                                <button class="layui-btn layui-btn-sm layui-btn-danger layui-btn-radius">
                                                    错误
                                                </button>
                                            </c:if>
                                        </td>


                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                        <!-- 我的订单-》审核中 -->
                        <div class="layui-tab-item">
                            <table class="layui-table" lay-skin="line" lay-size="sm">

                                <tr>
                                    <td>订单号</td>
                                    <td>用户编号</td>
                                    <td>房间编号</td>
                                    <td>预定手机号码</td>
                                    <td>邮箱</td>
                                    <td>下单时间</td>
                                    <td>预计到达时间</td>
                                    <td>预定价格</td>
                                    <td>住客姓名</td>
                                    <td>审核状态</td>
                                    <td>修改</td>
                                </tr>

                                <c:forEach items="${checking}" var="checking">
                                    <tr>
                                        <td>${checking.bookId}</td>
                                        <td>${checking.userId}</td>
                                        <td>${checking.roomId}</td>
                                        <td>${checking.bookPhone}</td>
                                        <td>${checking.email}</td>
                                        <td><fmt:formatDate value="${checking.bookDate}"
                                                            pattern="yyyy年MM月dd日 hh时mm分ss秒"/></td>
                                        <td><fmt:formatDate value="${checking.arriveDate}" pattern="yyyy年MM月dd日"/></td>
                                        <td>${checking.bookPrice}</td>
                                        <td>${checking.bookName}</td>
                                        <td>
                                            <c:if test="${checking.bookState=='1'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-warm layui-btn-radius">
                                                    审核中
                                                </button>
                                            </c:if>
                                            <c:if test="${checking.bookState=='2'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-radius">已通过</button>
                                            </c:if>
                                            <c:if test="${checking.bookState=='0'}">
                                                <button class="layui-btn-sm layui-btn-radius">已过期</button>
                                            </c:if>
                                            <c:if test="${checking.bookState==null}">
                                                <button class="layui-btn layui-btn-sm layui-btn-danger layui-btn-radius">
                                                    错误
                                                </button>
                                            </c:if>
                                            
                                        </td>
                                        <td>
                                            <a href="${ctx}\book\checkOut?bookId=${checking.bookId}"
                                               onclick="return confirm('您确定要退房吗？');">
                                                <i class="layui-icon layui-icon-edit"
                                                   style="font-size: 30px; color: #1E9FFF;"></i> </a>
                                        </td>


                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                        <!-- 我的订单-》已过期 -->
                        <div class="layui-tab-item">
                            <table class="layui-table" lay-skin="line" lay-size="sm">

                                <tr>
                                    <td>订单号</td>
                                    <td>用户编号</td>
                                    <td>房间编号</td>
                                    <td>预定手机号码</td>
                                    <td>邮箱</td>
                                    <td>下单时间</td>
                                    <td>预计到达时间</td>
                                    <td>预定价格</td>
                                    <td>住客姓名</td>
                                    <td>审核状态</td>
                                    <td>删除</td>
                                </tr>

                                <c:forEach items="${outDate}" var="outDate">
                                    <tr>
                                        <td>${outDate.bookId}</td>
                                        <td>${outDate.userId}</td>
                                        <td>${outDate.roomId}</td>
                                        <td>${outDate.bookPhone}</td>
                                        <td>${outDate.email}</td>
                                        <td><fmt:formatDate value="${outDate.bookDate}"
                                                            pattern="yyyy年MM月dd日 hh时mm分ss秒"/></td>
                                        <td><fmt:formatDate value="${outDate.arriveDate}" pattern="yyyy年MM月dd日"/></td>
                                        <td>${outDate.bookPrice}</td>
                                        <td>${outDate.bookName}</td>
                                        <td>
                                            <c:if test="${outDate.bookState=='1'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-warm layui-btn-radius">
                                                    审核中
                                                </button>
                                            </c:if>
                                            <c:if test="${outDate.bookState=='2'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-radius">已通过</button>
                                            </c:if>
                                            <c:if test="${outDate.bookState=='0'}">
                                                <button class="layui-btn-sm layui-btn-radius">已过期</button>
                                            </c:if>
                                            <c:if test="${outDate.bookState==null}">
                                                <button class="layui-btn layui-btn-sm layui-btn-danger layui-btn-radius">
                                                    错误
                                                </button>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="${ctx}\book\delete?bookId=${outDate.bookId}"
                                               onclick="return confirm('您确定要删除该条记录吗？');">
                                                <i class="layui-icon layui-icon-delete"
                                                   style="font-size: 30px; color: #1E9FFF;"></i> </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                        <!-- 我的订单-》全部 -->
                        <div class="layui-tab-item">
                            <table class="layui-table" lay-skin="line" lay-size="sm">

                                <tr>
                                    <td>订单号</td>
                                    <td>用户编号</td>
                                    <td>房间编号</td>
                                    <td>预定手机号码</td>
                                    <td>邮箱</td>
                                    <td>下单时间</td>
                                    <td>预计到达时间</td>
                                    <td>预定价格</td>
                                    <td>住客姓名</td>
                                    <td>审核状态</td>
                                </tr>

                                <c:forEach items="${allBook}" var="allBook">
                                    <tr>
                                        <td>${allBook.bookId}</td>
                                        <td>${allBook.userId}</td>
                                        <td>${allBook.roomId}</td>
                                        <td>${allBook.bookPhone}</td>
                                        <td>${allBook.email}</td>
                                        <td><fmt:formatDate value="${allBook.bookDate}"
                                                            pattern="yyyy年MM月dd日 hh时mm分ss秒"/></td>
                                        <td><fmt:formatDate value="${allBook.arriveDate}" pattern="yyyy年MM月dd日"/></td>
                                        <td>${allBook.bookPrice}</td>
                                        <td>${allBook.bookName}</td>
                                        <td>
                                            <c:if test="${allBook.bookState=='1'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-warm layui-btn-radius">
                                                    审核中
                                                </button>
                                            </c:if>
                                            <c:if test="${allBook.bookState=='2'}">
                                                <button class="layui-btn layui-btn-sm layui-btn-radius">已通过</button>
                                            </c:if>
                                            <c:if test="${allBook.bookState=='0'}">
                                                <button class="layui-btn-sm layui-btn-radius">已过期</button>
                                            </c:if>
                                            <c:if test="${allBook.bookState==null}">
                                                <button class="layui-btn layui-btn-sm layui-btn-danger layui-btn-radius">
                                                    错误
                                                </button>
                                            </c:if>
                                        </td>


                                    </tr>
                                </c:forEach>

                            </table>
                        </div>


                    </div>
                </div>

            </div>
            <div class="layui-tab-item">
                <table id="json" class="layui-table" lay-skin="line" lay-size="sm">

                    <tr>
                        <td>订单号</td>
                        <td>用户编号</td>
                        <td>房间编号</td>
                        <td>预定手机号码</td>
                        <td>邮箱</td>
                        <td>下单时间</td>
                        <td>预计到达时间</td>
                        <td>预定价格</td>
                        <td>住客姓名</td>
                        <td>审核状态</td>
                    </tr>


                </table>
            </div>
            <div class="layui-tab-item">内容4</div>
            <div class="layui-tab-item">内容5</div>
        </div>
    </div>


</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<footer class="footer-container white-text-container">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3>感谢您的使用！</h3>
            </div>
        </div>
    </div>
</footer>


<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        navbarFixedTopAnimation();
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        navActivePage();
        scrollRevelation('.reveal');
    });
</script>


<!-- 选项卡 -->
<script>

    layui.use('element', function () {
        var element = layui.element;

        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });
</script>

<!-- json数据访问 -->
<script>
    //jquery代码都必须写在ready方法中
    $(document).ready(function () {
        $.get("${ctx}/book/getListJson", function (data, status) {
            console.log(data);
            console.log("数据: " + data + "\n状态: " + status);

            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage
                    , layer = layui.layer;
                laypage.render({
                    elem: 'json'
                    , count: 50 //数据总数
                    , limit: 5
                    , jump: function (obj) {
                        $.each(data, function (index, item) {
                            console.log(index);
                            console.log(item);
                            var table = $("#json");
                            var tr = document.createElement("tr");
                            var td1 = document.createElement("td");
                            td1.innerText = item.bookId;
                            tr.append(td1);
                            var td2 = document.createElement("td");
                            td2.innerText = item.userId;
                            tr.append(td2);
                            var td3 = document.createElement("td");
                            td3.innerText = item.roomId;
                            tr.append(td3);
                            var td4 = document.createElement("td");
                            td4.innerText = item.bookPhone;
                            tr.append(td4);
                            var td5 = document.createElement("td");
                            td5.innerText = item.email;
                            tr.append(td5);
                            var td6 = document.createElement("td");
                            td6.innerText = item.bookDate;
                            tr.append(td6);
                            var td7 = document.createElement("td");
                            td7.innerText = item.arriveDate;
                            tr.append(td7);
                            var td8 = document.createElement("td");
                            td8.innerText = item.bookPrice;
                            tr.append(td8);
                            var td9 = document.createElement("td");
                            td9.innerText = item.bookName;
                            tr.append(td9);
                            var td10 = document.createElement("td");
                            td10.innerText = item.bookState;
                            tr.append(td10);
                            table.append(tr);
                        })
                    }
                });
            });
        });
    });

</script>

<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

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
                , '用户名必须2到20位，且不能出现空格!'
            ]
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格!'
            ]
            , cfmpass: function (value) {
                var password = document.getElementById("password");
                if (value !== password.value){
                    return '两次输入密码不一致！';
                }
            }
            , cfmpass2: function (value) {
                var password2 = document.getElementById("password2");
                if (value !== password2.value){
                    return '两次输入密码不一致！';
                }
            }
        });

        //监听提交
        form.on('submit(update)', function (data) {
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return true;
        });
    });
</script>

</body>

</html>