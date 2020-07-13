<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理界面</title>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet" >
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<script src="${ctx}/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">酒店预订系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img" >
                    ${loginUser.name}
                </a>
            </li>
            <li class="layui-nav-item"><a href="${ctx}/user/loginOut" onclick="return confirm('您确定退出登录吗？');">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
  
  </li>
  <li class="layui-nav-item layui-nav-itemed">
    <a href="javascript:;">用户</a>
    <dl class="layui-nav-child">
      <dd class="main_left"><a  data-src="${ctx}\manage\manageuser"  target="_top" >用户管理</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">订单管理</a>
    <dl class="layui-nav-child">
       <dd class="main_left"><a  data-src="${ctx}\manage\managebook"  target="_top" >订单</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
   <a href="javascript:;">房间管理</a>
    <dl class="layui-nav-child">
       <dd class="main_left"><a  data-src="${ctx}\manage\manageroom"  target="_top" >房间</a></dd>
    </dl>
  </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="main_right">
    <iframe frameborder="0" scrolling="yes" style="width: 100%" src="" id="aa">
    </iframe>
</div>
    </div>
    <div class="layui-footer">
    </div>
</div>








  

  
<script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>

<script >
$(function(){	
 		//获取src值
        $(".main_left a").on("click",function(){
            var address =$(this).attr("data-src");
            $("iframe").attr("src",address);
        });
		//一下代码是根据窗口高度在设置iframe的高度
        var frame = $("#aa");
	
        var frameheight = $(window).height();
        console.log(frameheight);
        frame.css("height",frameheight);


    });
</script>
</body>
</html>