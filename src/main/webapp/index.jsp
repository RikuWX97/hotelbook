<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">
	
  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  <link rel="apple-touch-icon" sizes="180x180" href="${ctx}/assets/apple-icon-180x180.png">
  <link href="${ctx}/layui/css/layui.css" rel="stylesheet" >
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
  <title>欢迎光临！</title>

<link href="${ctx}/css/main.550dcf66.css" rel="stylesheet"></head>

<body>
<header>
    <nav class="navbar navbar-default active" >
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
                    <% if(session.getAttribute("loginUser")!=null){ %>
                    <li><a href="${ctx}\user\mine"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i>${loginUser.name}</a></li>
                    <% }else{ %>
                       <li ><a href="${ctx}\login.jsp">
                       
                        	<i class="layui-icon layui-icon-username" style="font-size: 20px; color: #FFFFFF;">登录</i>
                      </a> </li>
                    <% } %>
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
          <h1>欢迎您${loginUser.name}，登录订房系统</h1>
          <p>希望您在这里度过美好时光</p>
          <br>
          <p>下方点击   <i class="layui-icon layui-icon-down" style="font-size: 20px; color: #FFFFFF;"></i>  </p>
      
          <a href="${ctx}\room\list" class="btn btn-default btn-lg" title="">welcome</a>
        </div>
      </div>
    </div>
  </div>

 

<footer class="footer-container white-text-container">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <h3>宾馆</h3>
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

<script type="text/javascript" src="${ctx}/js/main.0cf8b554.js"></script>

</body>

</html>