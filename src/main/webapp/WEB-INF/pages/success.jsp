<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>预定成功！</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet" media="all">
    <link href="${ctx}/css/success.css" rel="stylesheet">
</head>
<body class="layui-layout-body">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md-offset4 layui-col-md4" style="margin-top: 30px;margin-bottom: 50px;">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;"></fieldset>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                </fieldset>

                <form class="layui-form" action="${ctx}\room\list">
                    <h1 class="layui-input-block">预约成功！请耐心等待审核！</h1>
                    <div class="layui-form-item">您当前预定信息的是:</div>
                    <br>
                    <br>
                    <div class="layui-form-item">房间:${roomInformation.roomType}</div>
                    <div class="layui-form-item">订单总价:${bookInformation.bookPrice}</div>
                    <div class="layui-form-item">住客姓名:${bookInformation.bookName}</div>
                    <div class="layui-form-item">住客电话:${bookInformation.bookPhone}</div>
                    <label class="layui-form-label" style="text-align: left;padding: 4px 5px;"></label>
                    <label class="layui-form-label" style="text-align: left;padding: 4px 5px;"></label>
                    <label class="layui-form-label" style="text-align: left;padding: 4px 5px;"></label>

                    <div class="layui-form-item">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">返 回</button>
                    </div>
                </form>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"></fieldset>
            </div>
        </div>
    </div>
</body>
</html>