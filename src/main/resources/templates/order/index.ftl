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
        <div class="layui-row">
            <div style="padding:15px;" class="layui-col-xs7">
                <button id="deltetbtn" class="layui-btn layui-btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> 删除</button>
                <#--<a href="/orders/add">-->
                    <#--<button class="layui-btn layui-btn-warm"><i class="fa fa-plus" aria-hidden="true"></i> 添加</button>-->
                <#--</a>-->
            </div>
            <div style="padding: 15px;" class="layui-col-xs5">
                <form  class="form-inline" role="form" action="/order/index">
                    <div class="layui-inline">
                        <input type="text" class="layui-input" name="realname" id="realname"  placeholder="姓名">
                    </div>
                    <div class="layui-inline">
                        <input type="text" class="layui-input" name="address" id="address"  placeholder="地址">
                    </div>
                <#--<div class="layui-inline">-->
                <#--<select name="state" class="form-control sel">-->
                <#--<option value="1">未支付</option>-->
                <#--<option value="2">未派送</option>-->
                <#--<option value="3">已派送</option>-->
                <#--</select>-->
                <#--&lt;#&ndash;<input type="text" class="layui-input" name="parent" id="parent" placeholder="所属父类">&ndash;&gt;-->
                <#--</div>-->
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
                <th>总订单ID</th>
                <th>购买客户</th>
                <th>下单时间</th>
                <th>数量</th>
                <th>手机号码</th>
                <th>配送信息</th>
                <#--<th>邮编</th>-->
                <th>总金额</th>
                <th>地址</th>

                <th>修改</th>
                <th>查看</th>
            </tr>
            </thead>
            <tbody>
                        <#list order as c>
                        <tr>
                            <td><input class="la-input" type="checkbox" value="${c.id!''}" name="checkitem" lay-skin="primary" ></td>
                            <td>${c.id!''}</td>
                            <td>${c.realname!''}</td>
                            <td>${c.orderTime!''}</td>
                            <td>${c.goodsCount!''}</td>
                            <td>${c.phone!''}</td>
                            <td>${c.remark!''}</td>
                            <#--<td>${c.postcode!''}</td>-->
                            <td>${c.total!''}</td>
                            <td>${c.address!''}</td>

                            <td>
                                <a href="/order/update/${c.id!''}" title="编辑">
                                    <button type="button" class="layui-btn"><i class="fa fa-pencil" aria-hidden="true"></i> 修改</button>
                                </a>
                            </td>
                            <td>
                                <a href="/order/detail/${c.id!''}" title="查看">
                                    <button type="button" class="layui-btn"><i class="fa fa-eye" aria-hidden="true"></i> 查看子订单</button>
                                </a>
                            </td>
                        </tr>
                        </#list>
            </tbody>
        </table>
        <div class="layui-col-xs12">
            <ul class="pagination">
            <#if pageinfo.hasPreviousPage>
                <li><a href="/order/index?page=${pageinfo.prePage}">上一页</a></li>
            </#if>
            <#list pageinfo.navigatepageNums as p>
                <li class="<#if "${p}"="${pageinfo.pageNum}">active</#if>"><a href="/order/index?page=${p}">${p}</a></li>
            </#list>
            <#if pageinfo.hasNextPage>
                <li><a href="/order/index?page=${pageinfo.nextPage}">下一页</a></li>
            </#if>
            </ul>
        </div>
        <div style="margin-left: 20px" class="layui-col-xs7">
            <div class="alert alert-info" role="alert">管理员订单进行操作</div>
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
                    layer.alert('请选择对应的订单');
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
                                url :"/order/deletemore",
                                dataType:"json",
                                contentType:"application/json",
                                data:JSON.stringify({"checkArray":checkedvalue}),
                                success : function(data) {
                                    if (data==true){
                                        layer.msg("删除成功")
                                        setTimeout(window.location.reload(),1000)
                                    }else {
                                        layer.open({
                                            title: '提示'
                                            ,content: '删除失败，订单下有多条订单项，不能删除'
                                            ,area: ['400px','200px']
                                            ,btn: ['确定']
                                            ,yes: function(index, layero){
                                                layer.close(index);
                                            }
                                        });
                                    }
                                },
                                error:function (da) {
                                    alert(da)
                                }
                            });
                        }

                    })
                        }
                    });

        });
        //全选框点击判断


    })

</script>
</body>
</html>
