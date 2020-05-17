<!doctype html>
<#assign base=request.contextPath/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>书城管理系统</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <link rel="shortcut icon" href="/img/favicon.ico"/>
    <style type="text/css" rel="stylesheet">
        .layui-nav-item:hover>a{
            text-decoration: none !important;
        }
        .la-input{
            width: 18px;
            height: 18px;
        }
        .pagination{
            /*margin: 0 auto;*/
            margin-left: 20px;
        }
        .sel{
            width: 194px !important;
            height: 38px !important;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
  <#include '../commen/header.ftl'>
    <div class="layui-body" style="background: #f5f5f5;">
        <!-- 内容主体区域 -->
            <div style="padding:15px;" class="layui-col-xs7">
                <div class="alert alert-danger" role="alert">超级管理员拥有大部分权限，但不可删除管理员</div>
            </div>

        <#--<div style="padding:4px 15px;color: #666666;font-size: 16px" class="layui-col-xs7">-->
            <#--总共查询到<span style="color: #ea2814;font-weight: bold">（${pageinfo.size!''}）</span>数据-->
        <#--</div>-->

        <table class="layui-table" lay-skin="line">
            <thead>
            <tr>
                <th><input class="la-input" id="selectAll" type="checkbox" name="all" lay-skin="primary"  ></th>
                <th>姓名</th>
                <th>账号</th>
                <th>地址</th>
                <th>邮编</th>
                <th>电子邮箱</th>
                <th>联系方式</th>
                <th>头像</th>

                <#--<th>入驻日期</th>-->

                <th>修改</th>
            <#--<th>删除</th>-->
            </tr>
            </thead>
            <tbody>
                        <#list admins as admin>
                        <tr>
                            <td><input class="la-input" type="checkbox" value="${admin.id!''}" name="checkitem" lay-skin="primary" ></td>

                            <td>${admin.realname!''}</td>
                            <td>${admin.username!''}</td>
                            <td>${admin.address!''}</td>
                            <td>${admin.postcode!''}</td>
                            <td>${admin.email!''}</td>
                            <td>${admin.phone!''}</td>
                            <td><img src="${admin.img!''}" alt="" style="height: 40px;width:40px"></td>
                            <#--<td>${(admin.regdate)?string('yyyy-MM-dd')}</td>-->
                            <td>
                                <a href="/administrator/update/${admin.id!''}" title="编辑">
                                    <button type="button" class="layui-btn"><i class="fa fa-pencil" aria-hidden="true"></i> 修改</button>
                                </a>
                            </td>
                        </tr>
                        </#list>
            </tbody>
        </table>
        <#--<div class="layui-col-xs12">-->
            <#--<ul class="pagination">-->
            <#--<#if pageinfo.hasPreviousPage>-->
                <#--<li><a href="/seller/index?page=${pageinfo.prePage}">上一页</a></li>-->
            <#--</#if>-->
            <#--<#list pageinfo.navigatepageNums as p>-->
                <#--<li class="<#if "${p}"="${pageinfo.pageNum}">active</#if>"><a href="/seller/index?page=${p}">${p}</a></li>-->
            <#--</#list>-->
            <#--<#if pageinfo.hasNextPage>-->
                <#--<li><a href="/seller/index?page=${pageinfo.nextPage}">下一页</a></li>-->
            <#--</#if>-->
            <#--</ul>-->
        <#--</div>-->
    </div>
    <div class="layui-footer">
        欢迎登录图书商城管理系统
    </div>
</div>




<script src="/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<!--Local Stuff-->
<script>
    $(function () {
        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
            });


        });
        //全选框点击判断
        $("#selectAll").click(function() {
            $(":checkbox[name='checkitem']").prop("checked", this.checked); // this指代的你当前选择的这个元素的JS对象
        });
        //子选框全部选中判断
        $(":checkbox[name='checkitem']").click(function () {
            var choicelength=$(":checkbox[name='checkitem']").length;
            var choiceselect=$(":checkbox[name='checkitem']:checked").length;
            if(choicelength==choiceselect){
                $("#selectAll").prop("checked",true);
            }else {
                $("#selectAll").prop("checked",false);
            }
        })

        $("#deltetbtn").click(function () {
            var checkedvalue= [];
            $(":checkbox[name='checkitem']:checked").each(function() {
                checkedvalue.push($(this).val());

            });
            if(checkedvalue.length == 0){
                alert("请选择商家")
            }else {
                $.ajax({
                    type:"POST",
                    url :"/seller/deletemore",
                    dataType:"json",
                    contentType:"application/json",
                    data:JSON.stringify({"checkArray":checkedvalue}),
                    success : function(data) {
                        if (data==true){
                            window.location.reload();
                        }else {
                            alert("删除失败，该商家正在销售相对应的商品，不能删除，请联系商家")
                        }
                    },
                    error:function (da) {
                        alert(da)
                    }
                });
            }

        })

    })

</script>
</body>
</html>
