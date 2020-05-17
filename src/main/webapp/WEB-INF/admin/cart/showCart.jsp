
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/4
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <title>购物车</title>
</head>
<body>


<table  style="margin-top: 20px" class="table table-bordered table-striped">
    <thead class="btn-success">
    <tr>
        <th>分类编号</th>
        <th>分类名称</th>
        <th>父类</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    </thead>

    <tbody>

    <c:forEach items="${sessionScope.tOrder.orderItems}" var="u">
        <tr>
            <th>
                <input type="checkbox" style="height: 20px;width: 20px"/>
            </th>
            <td>
                <%--<image src="<%=imgPath%>${u.image}" width="50px" height="50px"/>--%>
                    ${u.goodsname}
            </td>
            <td>${u.price}</td>
            <td>
                <span class="glyphicon glyphicon-minus" id="minus"></span>
                <input value=" ${u.number}" maxlength="4" style="width: 30px">
                <span class="glyphicon glyphicon-plus" id="plus"></span>
            </td>
            <td>￥${u.number*u.price}</td>
            <td>
                <a href="/goods/delete/${u.id}" title="删除">
                    <span class="glyphicon glyphicon-trash"></span>
                </a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>



<div class="text-right">
    <button class="btn btn-primary">
        <i class="fa fa-dollar"></i> 去付款</button>
</div>
<div class="well m-t">
    <strong>注意：</strong> 请在30日内完成付款，否则订单会自动取消。
</div>


</body>
</html>
