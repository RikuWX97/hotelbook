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
        <div style="padding: 17px;">>订单信息管理</div>
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
                                                <option value="0">订单号</option>
                                                <option value="1">用户ID</option>
                                                <option value="2" selected="true">房间ID</option>
                                                <option value="3">电话</option>
                                                <option value="4">邮箱</option>
                                                <option value="5">姓名</option>
                                                <option value="6">订单金额</option>
                                                <option value="7">订单状态</option>
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
            ,url:'${ctx}/book/getMapJson'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'bookId', width:100, title: '订单号', sort: true}
                ,{field:'userId', width:120, title: '用户ID'}
                ,{field:'roomId', width:120, title: '房间ID', sort: true}
                ,{field:'bookPhone', width:120, title: '电话'}
                ,{field:'email', width:120, title: '邮箱', sort: true}
                ,{field:'bookName', width:120, title: '姓名', sort: true}
                ,{field:'bookDate', width:160, title: '下单时间', sort: true}
                ,{field:'arriveDate', width:120, title: '预订到达', sort: true}
                ,{field:'bookPrice', width:120, title: '订单金额', sort: true}
                ,{field:'bookState', width:120, title: '订单状态', sort: true}
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
                layer.alert("查看ID : "+data.bookId+" 的行");
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "${ctx}/book/deleteJson",
                        type: "POST",
                        data:{"bookId":data.bookId},
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
                    title:'修改订单信息',
                    area: ['400px', '420px'],
                    shade: 0.8,
                    id: (new Date()).valueOf(), //设定一个id，防止重复弹出 时间戳1280977330748
                    btnAlign: 'r',
                    moveType: 1, //拖拽模式，0或者1
                    content: '${ctx}/book/updateGo?bookId=' + data.bookId+"&userId="+ data.userId+"&roomId="+ data.roomId
                    +"&bookPhone="+ data.bookPhone+"&email="+ data.email+"&arriveDate="+ data.arriveDate
                    +"&bookPrice="+ data.bookPrice+"&bookState="+ data.bookState
                    +"&bookName="+ encodeURI(encodeURI(data.bookName))
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
                        , url: '${ctx}/book/findJson'//后台做模糊搜索接口路径
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