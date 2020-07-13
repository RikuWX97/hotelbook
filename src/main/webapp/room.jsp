<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isErrorPage="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description"
	content="La casa free real state fully responsive html5/css3 home page website template" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/responsive.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header_search.css">
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/main.js"></script>
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<title>酒店</title>
</head>
<body>

	<section class=""> 
	<div style="background-color: #23262E;">
	<header>
   <div class="wrapper">
    <a href=" ">
    
    
    
    
    </a>
    <a href="#" class="hamburger"></a>
    <nav>
    
     <ul class="nav navbar-nav navbar-right">
     <li><a href="${ctx}/room/list"><img src="${ctx}/assets/images/mashup-icon.svg" class="navbar-logo-img" alt="">酒店</a></li>
     				<% if(session.getAttribute("loginUser")!=null){ %>
                    <li><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i><a href="${ctx}\user\mine">${loginUser.name}</a></li>
                    <% }else{ %>
                       <a href="${ctx}\login.jsp">
                       <li >
                        	<i class="layui-icon layui-icon-username" style="font-size: 20px; color: #1E9FFF;"> 登录</i>
                       </li></a>
                    <% } %>
                    <li><a href="javascript:history.back(-1)">返回</a></li>
                    <li><a href="${ctx}/user/loginOut" onclick="return confirm('您确定退出登录吗？');">注销</a></li>
                </ul>
    </nav>
   </div>
  </header>
  </div>
  </section>
	<section class="listings"> 
	<ul class="layui-nav">
  <li class="layui-nav-item">
   <div class="header_search">
			 <%-- <a href="${ctx}/room/lists" class="login_btn">搜索</a> --%>
			 <form action="${ctx}/room/lists" method="post" class="login_btn">
			 <i class="layui-icon layui-icon-search" style="font-size: 30px; color: #1E9FFF;"></i>
			    
    <div class="layui-input-inline">
      <input type="text" name="roomType"   placeholder="搜索房间类型" class="layui-input">
    </div>
              <button  class="layui-btn  layui-btn-normal layui-btn-sm" type="submit">搜索</button>
     </form>
	</div>
</ul>
	
	<div class="wrapper">
		<ul class="properties_list">
			<c:forEach var="listOne" items="${list}">
				<li><a href="${ctx}\room\gobook?roomId=${listOne.roomId}&roomStock=${listOne.roomStock}"> 
				<c:if test="${listOne.image !=null }">
				
							<img id="images" alt="" src="/image/${listOne.image}"
								class="property_img">
						</c:if>
				</a> <span class="price">${listOne.roomPrice}</span>
					<div class="property_details">
						<h1>
							<a href="#">${listOne.roomType}</a>
						</h1>
						<h2>
							${listOne.formu}<br> <span class="property_size">数量:
								${listOne.roomStock}</span>
						</h2>
					</div></li>
			</c:forEach>
	</div>
	<div class="wrapper">
		<ul class="properties_list">
			<c:forEach var="listOne" items="${lists}">
				<li><a href="${ctx}\room\gobook?roomId=${listOne.roomId}"> 
				<c:if test="${listOne.image !=null }">
				
							<img id="images" alt="" src="/image/${listOne.image}"
								class="property_img">
						</c:if>
				</a> <span class="price">${listOne.roomPrice}</span>
					<div class="property_details">
						<h1>
							<a href="#">${listOne.roomType}</a>
						</h1>
						<h2>
							${listOne.formu}<br> <span class="property_size">数量:
								${listOne.roomStock}</span>
						</h2>
					</div></li>
			</c:forEach>
	</div>
	</section>
</body>
</html>