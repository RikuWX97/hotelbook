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
    <%String id =request.getParameter("id");%>
    <input type="hidden" name="id" value="<%=id%>" class="layui-input">

    <div class="layui-form-item">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-block">
            <input type="text" name="id" style="width:200px;" autocomplete="off" value="<%=id%>" class="layui-input">
        </div>
    </div>
    <%String name =request.getParameter("name");
    name = URLDecoder.decode(name,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" style="width:200px;" autocomplete="off" value="<%=name%>" class="layui-input">
        </div>
    </div>
    <%String password =request.getParameter("password");
    password = URLDecoder.decode(password,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" style="width:200px;" autocomplete="off" value="<%=password%>" class="layui-input">
        </div>
    </div>
    <%String sex =request.getParameter("sex");
    sex = URLDecoder.decode(sex,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="text" name="sex" style="width:200px;" autocomplete="off" value="<%=sex%>" class="layui-input">
        </div>
    </div>
    <%String phone =request.getParameter("phone");
    phone = URLDecoder.decode(phone,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-block">
            <input type="text" name="phone" style="width:200px;" autocomplete="off" value="<%=phone%>" class="layui-input">
        </div>
    </div>
    <%String email =request.getParameter("email");
    email = URLDecoder.decode(email,"UTF-8");%>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" style="width:200px;" autocomplete="off" value="<%=email%>" class="layui-input">
        </div>
    </div>
  
    <%String access =request.getParameter("access");%>
    <div class="layui-form-item">
        <label class="layui-form-label">权限</label>
        <div class="layui-input-block">
            <input type="text" name="access" style="width:200px;" autocomplete="off" value="<%=access%>" class="layui-input">
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
                url: "${ctx}/user/updatejson",
                type: "post",
                dataType: "json",
                data:{'id':data.field.id,'name':data.field.name,'password':data.field.password,
                	'sex':data.field.sex,'email':data.field.email,'phone':data.field.phone,'access':data.field.access},
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