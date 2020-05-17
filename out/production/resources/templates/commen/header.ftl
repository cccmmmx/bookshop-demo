<!doctype html>
<#assign base=request.contextPath/>
<head>
    <meta charset="utf-8">
    <#--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <#--<meta name="renderer" content="webkit">-->
    <#--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>书城管理系统</title>
    <#--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">-->
    <#--<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->
    <#--<link rel="stylesheet" href="/layui/css/layui.css"  media="all">-->
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
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 20px;font-weight: bold;"><img src="http://120.25.232.119/image/book.png" style="width: 40px;height: 40px"> 书城管理系统</div>
        <ul class="layui-nav layui-layout-left">
            <#--<li class="layui-nav-item">-->
                <#--<a href="">控制台</a>-->
            <#--</li>-->
            <#--<li class="layui-nav-item">-->
                <#--<a href="">商品管理</a>-->
            <#--</li>-->
            <#--<li class="layui-nav-item">-->
                <#--<a href="">用户</a>-->
            <#--</li>-->

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item " >
                   <#if Session.user?exists>
                       <a href="javascript:;">
                           <img src="${Session.user.img!''}" alt="" class="layui-nav-img" style="width: 50px;height: 50px">
                            ${Session.user.realname}
                       </a>
                   </#if>
            </li>
            <li class="layui-nav-item" style="background: #ed370a">
                <a href="/administrator/logout">注销 <i class="fa fa-sign-out" aria-hidden="true"></i></a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item  category">
                    <a href="/category/index"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> 分类管理</a>
                </li>
                <li class="layui-nav-item seller">
                    <a href="/seller/index"><i class="fa fa-users" aria-hidden="true"></i> 商家管理</a>
                </li>
                <li class="layui-nav-item customer">
                    <a href="/customer/index"><i class="fa fa-subway" aria-hidden="true"></i> 会员管理</a>
                </li>
                <li class="layui-nav-item goods">
                    <a href="/goods/index"><i class="fa fa-book" aria-hidden="true"></i> 书本信息</a>
                </li>
                <li class="layui-nav-item order">
                    <a href="/order/index"><i class="fa fa-cubes" aria-hidden="true"></i> 订单信息管理</a>
                </li>
                <li class="layui-nav-item orderitem">
                    <a href="/orderitem/index"><i class="fa fa-first-order" aria-hidden="true"></i>  订单项管理</a>
                </li>
                <li class="layui-nav-item cart">
                    <a href="/cart/index"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>  购物车管理</a>
                </li>
                <li class="layui-nav-item collection">
                    <a href="/collection/index"><i class="fa fa-gratipay" aria-hidden="true"></i>  收藏夹管理</a>
                </li>
                <li class="layui-nav-item dataindex">
                    <a href="/goods/dataindex"><i class="fa fa-asterisk" aria-hidden="true"></i>  数据统计</a>
                </li>
                <li class="layui-nav-item administrator">
                    <a href="/administrator/index"><i class="fa fa-superpowers" aria-hidden="true"></i>  超级管理员</a>
                </li>
                <li class="layui-nav-item parameter">
                    <a href="/parameter/index"><i class="fa fa-database" aria-hidden="true"></i>  数据字典</a>
                </li>

            </ul>
        </div>
    </div>



</div>





<script src="/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<!--Local Stuff-->
<script>
    $(function () {

             <#--<#if Session.user?exists>-->
             <#--<#else>-->
             <#--location.href="/administrator/login"-->
             <#--</#if>-->
        layui.use([ 'element', 'layer'], function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            var layer=layui.layer
            //监听导航点击
             <#if Session.user?exists>
             <#else>
               layer.open({
                   title: '提示'
                   ,content: '身份验证失败，请重新登录'
                   ,area: ['400px','200px']
                   ,btn: ['确定']
                   ,yes: function(index, layero){
                       location.href="/administrator/login"
                       layer.close(index);
                   }
               });

             </#if>
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());

            });

        });
// alert(window.location.pathname)
        var pathtext=window.location.pathname
            if(pathtext=="/category/index"||pathtext=="/category/add"){
                $(".category").addClass("layui-nav-itemed");
            }else if(pathtext=="/seller/index"||pathtext=="/seller/add"){
                $(".seller").addClass("layui-nav-itemed");
            }else if(pathtext=="/customer/index"||pathtext=="/customer/add"){
                $(".customer").addClass("layui-nav-itemed");
            }else if(pathtext=="/goods/index"||pathtext=="/goods/add"){
                $(".goods").addClass("layui-nav-itemed");
            }else if(pathtext=="/order/index"||pathtext=="/order/add"){
                $(".order").addClass("layui-nav-itemed");
            }else if(pathtext=="/orderitem/index"||pathtext=="/orderitem/add"){
                $(".orderitem").addClass("layui-nav-itemed");
            }else if(pathtext=="/administrator/index"){
                $(".administrator").addClass("layui-nav-itemed");
            }else if(pathtext=="/parameter/index"){
                $(".parameter").addClass("layui-nav-itemed");
            }else if(pathtext=="/cart/index"){
                $(".cart").addClass("layui-nav-itemed");
            }else if(pathtext=="/collection/index"){
                $(".collection").addClass("layui-nav-itemed");
            }else if(pathtext=="/goods/dataindex"){
                $(".dataindex").addClass("layui-nav-itemed");
            }
        $(".layui-nav-itemed").css("background", "#009688")
        })
</script>
</body>
</html>
