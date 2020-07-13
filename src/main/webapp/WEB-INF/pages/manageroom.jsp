<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
   
   
    <div class="layui-layout layui-layout-admin">
    

  

        <!-- 内容主体区域 -->
        <div style="padding: 17px;">>房间信息管理</div>
        <div style="padding: 10px; background-color: #F2F2F2;">
            <div class="layui-card">
                <div class="layui-card-body">
                    <!--cardBody-->
                    <form class="layui-form" action="">
                        <div class="layui-row">
                            <div class="layui-col-xs3">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">查询字段</label>
                                        <div class="layui-input-block">
                                            <select id="selects" name="deptsname" lay-filter="dept">
                                                <option value="0">房间ID</option>
                                                <option value="1">类型</option>
                                                <option value="2" selected="true">价格</option>
                                                <option value="3">库存</option>
                                                <option value="4">图片名</option>
                                                <option value="5">描述</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label"></label>
                                        <div class="layui-input-block">
                                            <input id="demoReload" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="要查找的内容" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs3">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <button class="layui-btn" data-type="reload" type="button">搜索</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <table class="layui-hide" id="test" lay-filter="demo"></table>
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>
                    <!--cardBody-->
                </div>
            </div>
        </div>
    <div class="layui-footer">
    </div>
</div>

  
  
  
  
  
  <!-- js -->
  <script src="${ctx}/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'${ctx}/room/getMapJson'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'roomId', width:100, title: '房间Id', sort: true}
                ,{field:'roomType', width:120, title: '类型'}
                ,{field:'roomPrice', width:120, title: '价格', sort: true}
                ,{field:'roomStock', width:120, title: '库存'}
                ,{field:'image', width:200, title: '图片名', sort: true}
                ,{field:'formu', width:320, title: '描述', sort: true}
                ,{field:'right',width:200, title: '操作',toolbar:"#barDemo"}
            ]]
            ,page: true
            ,height:298
            ,id:'testTable'
        });
    });
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    //监听工具条
    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.alert("查看ID : "+data.roomId+" 的行");
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "${ctx}/room/deleteJson",
                        type: "POST",
                        data:{"roomId":data.roomId},
                        dataType: "json",
                        success: function(data){
                            var json=JSON.parse(data);
                            console.log(json.result);
                            if(json=="1"){
                                obj.del();
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除成功", {icon: 6});
                                alert("删除成功");
                                $(".layui-laypage-btn").click()
                            }else{
                                layer.msg("删除失败", {icon: 5});
                                alert("删除失败");
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                //layer.alert('编辑行：<br>'+ JSON.stringify(data));
                layer.open({
                	
                    type: 2,
                    closeBtn: 2,
                    title:'修改房间信息',
                    area: ['400px', '420px'],
                    shade: 0.8,
                    id: (new Date()).valueOf(), //设定一个id，防止重复弹出 时间戳1280977330748
                    btnAlign: 'r',
                    moveType: 1, //拖拽模式，0或者1
                    content: '${ctx}/room/updateGo?roomId=' + data.roomId+"&roomType="+ encodeURI(encodeURI(data.roomType))
                    +"&roomPrice="+ data.roomPrice+"&image="+ encodeURI(encodeURI(data.image))+"&roomStock="+ data.roomStock
                    +"&formu="+ encodeURI(encodeURI(data.formu))
                });
            }
        });
        var $ = layui.$, active = {
                reload: function () {
                    var demoReload = $('#demoReload').val();//获取输入框的值
                    console.log(demoReload);
                    var  select = $('#selects').val();//获取输入框的值
                    console.log(selects);
                    // alert(demoReload+select);
                    //执行重载
                    table.reload('testTable', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: { value: demoReload,domain:select}//这里传参  向后台
                        , url: '${ctx}/room/findJson'//后台做模糊搜索接口路径
                        , method: 'post'
                    });
                }
            };
        //这个是用于创建点击事件的实例
        $('.layui-form-item .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    function a() {
        $(".layui-laypage-btn").click();
    }

</script>

  
</body>
</html>