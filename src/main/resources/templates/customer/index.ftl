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
            margin-left: 20px;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
   <#include '../commen/header.ftl'>
    <div class="layui-body" style="background: #f5f5f5;">
        <#--<img src="http://120.25.232.119/image/s2393243.jpg">-->
        <!-- 内容主体区域 -->
        <div class="layui-row">
            <div style="padding:15px;" class="layui-col-xs7">
                <button id="deltetbtn" class="layui-btn layui-btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> 删除</button>
                <a href="/customer/add">
                    <button class="layui-btn layui-btn-warm"><i class="fa fa-plus" aria-hidden="true"></i> 添加</button>
                </a>
            </div>

            <div style="padding: 15px;" class="layui-col-xs5">
                <form  class="form-inline" role="form" action="/customer/index">
                    <div class="layui-inline">
                        <input type="text" class="layui-input" name="realname" id="realname"  placeholder="真实姓名">
                    </div>
                    <div class="layui-inline">
                        <input type="text" class="layui-input" name="phone" id="phone"  placeholder="手机号码">
                    </div>

                    <button type="submit" class="layui-btn" data-type="reload"><i class="fa fa-search" aria-hidden="true"></i> 搜索</button>
                </form>
            </div>
        </div>
        <div style="padding:4px 15px;color: #666666;font-size: 16px" class="layui-col-xs7">
            总共查询到<span style="color: #ea2814;font-weight: bold">（${pageinfo.size!''}）</span>数据
        </div>

        <table class="layui-table" lay-skin="line">
            <thead>
            <tr>
                <th><input class="la-input" id="selectAll" type="checkbox" name="all" lay-skin="primary"  ></th>
                <th>真实名</th>
                <th>头像</th>
                <th>账号</th>
                <th>地址</th>
                <th>性别</th>
                <th>注册日期</th>
                <th>电子邮箱</th>
                <th>手机号码</th>
                <th>修改</th>
            </tr>
            </thead>
            <tbody>
                        <#list customer as c>
                        <tr>
                            <td><input class="la-input" type="checkbox" value="${c.id!''}" name="checkitem" lay-skin="primary" ></td>
                            <td>${c.realname!''}</td>
                            <td><img src="${c.image!''}" alt="" style="height: 30px;width: 30px"></td>
                            <td>${c.username!''}</td>
                            <td>${c.address!''}</td>
                            <td>
                                <#if "1"="${c.gender}">
                                    <i class="fa fa-mars" aria-hidden="true" style="color: #00aced"></i>  <span>男</span>
                                <#else>
                                   <i class="fa fa-venus" aria-hidden="true" style="color: red"></i> <span>女</span>
                                </#if>
                            </td>
                            <td>${((c.regDate)?string('yyyy-MM-dd'))!''}</td>
                            <td>${c.email!''}</td>
                            <td>${c.phone!''}</td>


                            <td>
                                <a href="/customer/update/${c.id!''}" title="编辑">
                                    <button type="button" class="layui-btn"><i class="fa fa-pencil" aria-hidden="true"></i> 修改</button>
                                </a>
                            </td>
                        </tr>
                        </#list>
            </tbody>
        </table>

        <div class="layui-col-xs12">
            <ul class="pagination">
            <#if pageinfo.hasPreviousPage>
                <li><a href="/customer/index?page=${pageinfo.prePage}">上一页</a></li>
            </#if>
            <#list pageinfo.navigatepageNums as p>
                <li class="<#if "${p}"="${pageinfo.pageNum}">active</#if>"><a href="/customer/index?page=${p}">${p}</a></li>
            </#list>
            <#if pageinfo.hasNextPage>
                <li><a href="/customer/index?page=${pageinfo.nextPage}">下一页</a></li>
            </#if>
            </ul>
        </div>
        <div style="margin-left: 20px" class="layui-col-xs7">
            <div class="alert alert-info" role="alert">管理员可对会员进行增删查改操作</div>
        </div>
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
        layui.use([ 'element', 'layer'], function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            var layer = layui.layer //引入layer

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
                    layer.alert('请选择要删除的普通用户');
                }else {
                    layer.open({
                        title: '提示'
                        ,content: '您确定要删除？'
                        ,area: ['400px','200px']
                        ,btn: ['取消','确定']
                        ,yes: function(index, layero){
                            layer.close(index);
                        },btn2: function(index, layero){
                            layer.close(index);
                            $.ajax({
                                type:"POST",
                                url :"/customer/deletemore",
                                dataType:"json",
                                contentType:"application/json",
                                data:JSON.stringify({"checkArray":checkedvalue}),
                                success : function(data) {
                                    if (data==true){
                                        layer.msg("删除成功")
                                        setTimeout(window.location.reload(),2000)
                                        // window.location.reload();
                                    }else {
                                        layer.open({
                                            title: '提示'
                                            ,content: '删除失败，请联系管理员'
                                            ,area: ['400px','200px']
                                            ,btn: ['确定']
                                            ,yes: function(index, layero){
                                                // $("#code_input").val("").focus();
                                                layer.close(index);
                                            }
                                        });
                                        // alert("删除失败，该商家正在销售相对应的商品，不能删除，请联系商家")
                                    }
                                },
                                error:function (da) {
                                    alert(da)
                                }
                            });
                        }
                    });

                }

            })

        });
        //全选框点击判断

    })

</script>
</body>
</html>
