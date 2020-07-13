<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
	pageContext.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width,initial-scale=1" name="viewport">
<meta content="description" name="description">
<meta name="google" content="notranslate" />
<meta content="Mashup templates have been developped by Orson.io team"
	name="author">

<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">
<link rel="apple-touch-icon" sizes="180x180"
	href="${ctx}/assets/apple-icon-180x180.png">
<title>预定界面</title>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">
<link href="${ctx}/css/main.550dcf66.css" rel="stylesheet">
<link href="${ctx}/css/book.css" rel="stylesheet">
</head>

<body class="body-color">
	<header> <nav class="navbar navbar-default active">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="" title=""> <img
				src="${ctx}/assets/images/mashup-icon.svg" class="navbar-logo-img"
				alt=""> 宾 馆
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${ctx}/user/loginOut" onclick="return confirm('您确定退出登录吗？');">注销</a><br></li>

				<li><a href="javascript:history.back(-1)">返回</a></li>
				
				<li><a href="${ctx}\user\mine"><i class="layui-icon layui-icon-user"
					style="font-size: 30px; color: #1E9FFF;"></i></a></li>

			</ul>
		</div>
	</div>
	</nav> </header>

	<!-- Add your site or app content here -->
	<div
		class="hero-full-container background-image-container white-text-container">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h1>欢迎${loginUser.name}登录订房系统</h1>
					<p>希望您在这里度过美好时光</p>
					<br>  <a href="${ctx}\room\list" class="btn btn-default btn-lg" title="">welcome</a>
				</div>
			</div>
		</div>
	</div>

	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md9">
				<h3 class="h3-size">预定信息</h3>
				<div class="layui-card">
					<div class="layui-card-header">
						<a href="javascript:history.back(-1)"><i
							class="layui-icon layui-icon-left"
							style="font-size: 30px; color: #1E9FFF;"></i></a>
					</div>
					<div class="layui-card-body" class="layui-bg-blue">

						<form class="layui-form" action="confirm" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">房型信息</label>
								<div class="layui-input-block">${room.roomType}</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">房费情况</label>
								<div class="layui-input-block">${room.roomPrice}</div>
							</div>

						</form>


					</div>
				</div>
				<h3 class="h3-size">入住信息</h3>
				<div class="layui-card">
					<div class="layui-card-header">
						<i class="layui-icon layui-icon-add-circle"
							style="font-size: 30px; color: #1E9FFF;"></i>
					</div>
					<div class="layui-card-body">
						<form class="layui-form" action="${ctx}\book\confirm" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">住客</label>
								<div class="layui-input-inline">
									<input type="text" name="bookName"
										value="${loginUser.name}"
										onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
										onBlur="if(!value){value=defaultValue; this.style.color='#999'}"
										style="color: #999" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<i class="layui-icon layui-icon-tips"
										style="font-size: 17px; color: #1E9FFF;"></i> 所填姓名需与入住时所持证件一致
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">手机号 </label>
								<div class="layui-input-inline">
									<input type="text" name="bookPhone" required
										lay-verify="required" placeholder="请输入手机号" autocomplete="off"
										class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<i class="layui-icon layui-icon-tips"
										style="font-size: 17px; color: #1E9FFF;"></i> 预定成功后会向您发送短信通知
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">Email</label>
								<div class="layui-input-inline">
									<input type="email" name="email" required lay-verify="required"
										placeholder="接收确认邮件，获得出行资讯" autocomplete="off"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预计到店<br>(当地时间)
								</label>
								<div class="layui-input-block">
									<input class="date-input" type="date" name="arriveDate">
								</div>
							</div>

							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
									<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card1">
					<div class="layui-card">

						<div class="layui-card-header">${room.roomType}</div>
						<div class="layui-card-body">
							<c:if test="${room.image !=null }">
				
							<img id="images" width="220px" height="110px"  alt="" src="/image/${room.image}"
								class="property_img">
						</c:if>
						<br>
						<br>
						描述：${room.formu}
						</div>
					</div>
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
		document.addEventListener("DOMContentLoaded", function(event) {
			navbarFixedTopAnimation();
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function(event) {
			navActivePage();
			scrollRevelation('.reveal');
		});
	</script>

	<script type="text/javascript" src="${ctx}/js/main.0cf8b554.js"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
	</script>
	
	<!-- 选项卡 -->
	<script>
	layui.use('element', function(){
		  var element = layui.element;
		  
		  //一些事件监听
		  element.on('tab(demo)', function(data){
		    console.log(data);
		  });
		});
	
	</script>
	<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '新选项'+ (Math.random()*1000|0) //用于演示
        ,content: '内容'+ (Math.random()*1000|0)
        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
      })
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  
  $('.site-demo-active').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
  
  //Hash地址的定位
  var layid = location.hash.replace(/^#test=/, '');
  element.tabChange('test', layid);
  
  element.on('tab(test)', function(elem){
    location.hash = 'test='+ $(this).attr('lay-id');
  });
  
});
</script>
	
</body>

</html>