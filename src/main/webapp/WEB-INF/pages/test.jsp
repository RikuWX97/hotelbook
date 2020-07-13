<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<%@ include file="../../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test</title>
</head>
<body>
<div>
    <table>
        <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>密码</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
    <script src="${ctx}/js/jquery-3.4.1.min.js"></script>
<script>
    //jquery代码都必须写在ready方法中
    $(document).ready(function () {
        $.get("${ctx}/user/getListJson",function(data,status){
            console.log(data);
            console.log("数据: " + data + "\n状态: " + status);
            $.each(data, function (index, item) {
                console.log(index);
                console.log(item);
                var table = $("table");
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                td1.innerText = item.id;
                tr.append(td1);
                var td2 = document.createElement("td");
                td2.innerText = item.name;
                tr.append(td2);
                var td3 = document.createElement("td");
                td3.innerText = item.password;
                tr.append(td3);
                table.append(tr);
            })
        });
    });

</script>

</body>
</html>
