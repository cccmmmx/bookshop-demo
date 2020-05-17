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
            <div style="padding:15px;" class="layui-col-xs5">
                <button id="deltetbtn" class="layui-btn layui-btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> 删除</button>
                <a href="/goods/add">
                    <button class="layui-btn layui-btn-warm"><i class="fa fa-plus" aria-hidden="true"></i> 添加</button>
                </a>
            </div>
            <div style="padding: 15px;" class="layui-col-xs7">
                <form  class="form-inline" role="form" action="/goods/index">
                    <div class="layui-inline">
                        <input type="text" class="layui-input" name="name" id="name"  placeholder="图书名称">
                    </div>
                    <div class="layui-inline">
                        <select name="grade" class="form-control sel">
                            <option value="">全部</option>
                            <option value="0" >未审核</option>
                            <option value="1">审核不通过</option>
                            <option value="2">已上架</option>
                            <option value="3">下架</option>
                        </select>
                    </div>
                <div class="layui-inline">
                <select name="state" class="form-control sel">
                    <option value="">全部</option>
                <option value="0" >普通</option>
                <option value="1">推荐</option>
                <option value="2">热卖</option>
                </select>
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
                <th>书名</th>
                <th>分类</th>
                <th>商家</th>
                <th>封面图</th>
                <th>上架日期</th>
                <th>原价</th>
                <th>折扣</th>
                <th>库存</th>
                <#--<th>标签</th>-->
                <th>作者</th>
                <th>购买数量</th>
                <th>推送状态</th>
                <th>上架状态</th>
                <th>操作</th>
                <th>修改</th>
            </tr>
            </thead>
            <tbody>
                        <#list goodes as c>
                        <tr>
                            <td><input class="la-input" type="checkbox" value="${c.id!''}" name="checkitem" lay-skin="primary" ></td>
                            <td>${c.name!''}</td>
                            <td>${c.category.text!''}</td>
                            <td>${c.seller.realname!''}</td>
                            <td><img src="${c.image!''}" alt="" style="height: 50px;width: 30px"></td>
                            <td>${(c.indate)?string('yyyy-MM-dd')}</td>
                            <td>${c.originalprice!''}</td>
                            <td>${c.rate?string('#.##')}</td>
                            <td>${c.stock!''}</td>
                            <#--<td>${c.booklabel!''}</td>-->
                            <td>${c.bookAuthor!''}</td>
                            <td>${c.bookDealmount!''}</td>
                            <td>
                             <#if "0"="${c.state!''}">
                                 <i class="fa fa-rocket" aria-hidden="true" style="color: #00aced"></i>  普通
                             </#if>
                             <#if "1"="${c.state!''}">
                             <i class="fa fa-paper-plane" aria-hidden="true" style="color: #eae612"></i>  推荐
                            </#if>
                             <#if "2"="${c.state!''}">
                               <i class="fa fa-free-code-camp" aria-hidden="true" style="color: red"></i>  热卖
                             </#if>
                            </td>
                            <td>
                             <#if "0"="${c.grade!''}">
                                 <i class="fa fa-dot-circle-o" aria-hidden="true"></i>  未审核
                             </#if>
                             <#if "1"="${c.grade!''}">
                              <i class="fa fa-exclamation-triangle" aria-hidden="true" style="color: red"></i>  审核不通过
                             </#if>
                                 <#if "2"="${c.grade!''}">
                                <i class="fa fa-check-square-o" aria-hidden="true" style="color: #00FF00"></i> 已上架
                                 </#if>
                                 <#if "3"="${c.grade!''}">
                                <i class="fa fa-window-close" aria-hidden="true" style="color: #cccccc"></i> 下架
                                 </#if>
                            </td>
                            <td>
                                 <#if "0"="${c.grade!''}">
                                     <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="tograges('${c.id}','1')"> 不通过</button>
                                     <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="tograges('${c.id}','2')"> 上架</button>
                                 </#if>
                                  <#if "2"="${c.grade!''}">
                                     <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="tograges('${c.id}','3')"> 下架</button>
                                  </#if>
                                  <#if "1"="${c.grade!''}">
                                     <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="tograges('${c.id}','2')"> 重新上架</button>
                                  </#if>
                                <#if "3"="${c.grade!''}">
                                     <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="tograges('${c.id}','2')"> 上架</button>
                                </#if>
                            </td>
                            <td>
                                <a href="/goods/update/${c.id!''}" title="编辑">
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
                <li><a href="/goods/index?page=${pageinfo.prePage}">上一页</a></li>
            </#if>
            <#list pageinfo.navigatepageNums as p>
                <li class="<#if "${p}"="${pageinfo.pageNum}">active</#if>"><a href="/goods/index?page=${p}">${p}</a></li>
            </#list>
            <#if pageinfo.hasNextPage>
                <li><a href="/goods/index?page=${pageinfo.nextPage}">下一页</a></li>
            </#if>
            </ul>
        </div>
        <div style="margin-left: 20px" class="layui-col-xs7">
            <div class="alert alert-info" role="alert">图书信息管理可以对上架的图书信息进行审核、推送热门等操作</div>
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
    function tograges(goodsid,index) {
        $.ajax({
            type:"POST",
            url :"/goods/changeGrade",
            data:{"grade":index,"id":goodsid},
            success : function(data) {
                if(data.result=="success"){
                    window.location.reload();
                }
            },
            error:function (da) {
                alert(da)
            }
        });
    }

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
                    layer.alert('请选择对应的书本');
                    // alert("请选择书本信息")
                }else {
                    layer.open({
                        title: '提示'
                        ,content: '您确定要删除？'
                        ,area: ['400px','200px']
                        ,btn:  ['取消','确定']
                        ,yes: function(index, layero){
                            layer.close(index);
                        },btn2: function(index, layero){
                            $.ajax({
                                type:"POST",
                                url :"/goods/deletemore",
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
                                            ,content: '删除失败，该图书商品不能删除，请联系商家'
                                            ,area: ['400px','200px']
                                            ,btn: ['确定']
                                            ,yes: function(index, layero){
                                                layer.close(index);
                                            }
                                        });
                                        // alert("删除失败，该图书商品不能删除，请联系商家")
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
