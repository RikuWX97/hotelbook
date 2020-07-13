<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.net.URLDecoder" %>
        <% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet" >
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<script src="${ctx}/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<br><br>
<form class="layui-form" action="" method="">
    <%String roomId =request.getParameter("roomId");%>
    <input type="hidden" name="bookId" value="<%=roomId%>" class="layui-input">

    <div class="layui-form-item">
        <label class="layui-form-label">房间ID</label>
        <div class="layui-input-block">
            <input type="text" name="roomId" style="width:200px;" autocomplete="off" value="<%=roomId%>" class="layui-input">
        </div>
    </div>
    <%String roomType =request.getParameter("roomType");
    roomType = URLDecoder.decode(roomType,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="text" name="roomType" style="width:200px;" autocomplete="off" value="<%=roomType%>" class="layui-input">
        </div>
    </div>
    <%String roomPrice =request.getParameter("roomPrice");%>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="text" name="roomPrice" style="width:200px;" autocomplete="off" value="<%=roomPrice%>" class="layui-input">
        </div>
    </div>
    <%String roomStock =request.getParameter("roomStock");%>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text" name="roomStock" style="width:200px;" autocomplete="off" value="<%=roomStock%>" class="layui-input">
        </div>
    </div>
    <%String image =request.getParameter("image");
    image = URLDecoder.decode(image,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">图片名</label>
        <div class="layui-input-block">
            <input type="text" name="image" style="width:200px;" autocomplete="off" value="<%=image%>" class="layui-input">
        </div>
    </div>
   <%--  <%String bookDate =request.getParameter("bookDate");%>
    <div class="layui-form-item">
        <label class="layui-form-label">下单时间</label>
        <div class="layui-input-block">
            <input type="datetime" name="bookDate" style="width:200px;" autocomplete="off" value="<%=bookDate%>" class="layui-input">
        </div>
    </div> --%>
    <%String formu =request.getParameter("formu");
    formu = URLDecoder.decode(formu,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" name="formu" style="width:200px;" autocomplete="off" value="<%=formu%>" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1" type="button">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use(['form'], function () {
        var form = layui.form;
        form.on('submit(demo1)', function (data) {
            $.ajax({
                url: "${ctx}/room/update",
                type: "post",
                dataType: "json",
                data:{'roomId':data.field.roomId,'roomType':data.field.roomType,'roomPrice':data.field.roomPrice,
                	'roomStock':data.field.roomStock,'image':data.field.image,'formu':data.field.formu},
                success: function (res) {
                    var json=JSON.parse(res);
                    if (json==true) {
                        layer.msg("编辑成功！",{icon: 6});
                        parent.a();
                    } else {
                        layer.msg("编辑失败！",{icon: 5});//失败的表情
                    }
                }
            });
        });
        return false;
    });
</script>
</body>

</html>