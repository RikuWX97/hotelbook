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
    <%String bookId =request.getParameter("bookId");%>
    <input type="hidden" name="bookId" value="<%=bookId%>" class="layui-input">

    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input type="text" name="bookId" style="width:200px;" autocomplete="off" value="<%=bookId%>" class="layui-input">
        </div>
    </div>
    <%String userId =request.getParameter("userId");%>
    <div class="layui-form-item">
        <label class="layui-form-label">用户Id</label>
        <div class="layui-input-block">
            <input type="text" name="userId" style="width:200px;" autocomplete="off" value="<%=userId%>" class="layui-input">
        </div>
    </div>
    <%String roomId =request.getParameter("roomId");%>
    <div class="layui-form-item">
        <label class="layui-form-label">房间Id</label>
        <div class="layui-input-block">
            <input type="text" name="roomId" style="width:200px;" autocomplete="off" value="<%=roomId%>" class="layui-input">
        </div>
    </div>
    <%String bookPhone =request.getParameter("bookPhone");%>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="bookPhone" style="width:200px;" autocomplete="off" value="<%=bookPhone%>" class="layui-input">
        </div>
    </div>
    <%String email =request.getParameter("email");%>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" style="width:200px;" autocomplete="off" value="<%=email%>" class="layui-input">
        </div>
    </div>
   <%--  <%String bookDate =request.getParameter("bookDate");%>
    <div class="layui-form-item">
        <label class="layui-form-label">下单时间</label>
        <div class="layui-input-block">
            <input type="datetime" name="bookDate" style="width:200px;" autocomplete="off" value="<%=bookDate%>" class="layui-input">
        </div>
    </div> --%>
    <%String arriveDate =request.getParameter("arriveDate");%>
    <div class="layui-form-item">
        <label class="layui-form-label">预计到达</label>
        <div class="layui-input-block">
            <input type="date" name="arriveDate" style="width:200px;" autocomplete="off" value="<%=arriveDate%>" class="layui-input">
        </div>
    </div>
    <%String bookPrice =request.getParameter("bookPrice");%>
    <div class="layui-form-item">
        <label class="layui-form-label">订单金额</label>
        <div class="layui-input-block">
            <input type="text" name="bookPrice" style="width:200px;" autocomplete="off" value="<%=bookPrice%>" class="layui-input">
        </div>
    </div>
    <%String bookState =request.getParameter("bookState");%>
    <div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-block">
            <input type="text" name="bookState" style="width:200px;" autocomplete="off" value="<%=bookState%>" class="layui-input">
        </div>
    </div>
    <%String bookName =request.getParameter("bookName");
    bookName = URLDecoder.decode(bookName,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="bookName" style="width:200px;" autocomplete="off" value="<%=bookName%>" class="layui-input">
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
                url: "${ctx}/book/update",
                type: "post",
                dataType: "json",
                data:{'bookId':data.field.bookId,'userId':data.field.userId,'roomId':data.field.roomId,
                	'bookPhone':data.field.bookPhone,'email':data.field.email,'bookPrice':data.field.bookPrice,'bookState':data.field.bookState,
                        'bookName':data.field.bookName,'arriveDate':data.field.arriveDate},
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