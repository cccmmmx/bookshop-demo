<!doctype html>
<#assign base=request.contextPath/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>书城管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="shortcut icon" href="/img/favicon.ico"/>
    <style type="text/css" rel="stylesheet">
        .layui-nav-item:hover > a {
            text-decoration: none !important;
        }
        .sel {
            height: 38px !important;
        }
        .text-sp{
            display: inline-block;
            height: 30px !important;
            line-height:30px !important ;
        }
        .flex-logo{
            margin-bottom: 10px;
        }
        .btton{
            position: relative;
            width: 100px;
            height: 40px;
            border: 1px solid #eeeeee;
            border-radius: 6px;
            color: #666;
            text-align: center;
            line-height: 40px;
        }
        .fa-plus-text{
            position: absolute;
            top: 0px;
            left: 0px;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
   <#include '../commen/header.ftl'>
    <div class="layui-body" style="background: #f5f5f5;">
        <div class="panel panel-info" style="border-color:#f6f6f6">
            <div class="panel-heading">
                <h3 class="panel-title">订单项信息</h3>
            </div>
            <div class="panel-body" >
                <form class="form-horizontal" role="form" action="/orderitem/save" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">订单号</label>
                        <div class="col-sm-4" style="padding-top: 8px">
                            <span style="margin-top: 10px">${orderitems.id!""}</span>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" id="id" name="id" value="${orderitems.id!""}"
                                   autocomplete="off" placeholder="订单号"  hidden>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">封面图</label>
                        <div class="col-sm-4">
                            <image src="${orderitems.image!''}" width="120px" height="160px" class="flex-logo" id="imageId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">书名</label>
                        <div class="col-sm-4">
                            <input type="text" id="name" name="name" value="${orderitems.name!""}"
                                   autocomplete="off" placeholder="书名" disabled class="layui-input" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-4">
                            <input type="text" id="price" name="price" value="${orderitems.price!""}"
                                   autocomplete="off" placeholder="价格" disabled class="layui-input" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-4">
                            <input type="text" id="count" name="count" value="${orderitems.count!""}"
                                   autocomplete="off" placeholder="数量" class="layui-input" disabled  >
                        </div>
                    </div>

                <div class="form-group">
                <label for="company" class="col-sm-2 control-label">状态</label>
                <div class="col-sm-4">
                <select name="status" class="form-control sel">
                <option value="0" <#if "0"="${orderitems.status}">selected</#if>>未付款</option>
                <option value="1" <#if "1"="${orderitems.status}">selected</#if>>未发货</option>
                <option value="2" <#if "2"="${orderitems.status}">selected</#if>>已发货</option>
                </select>
                </div>
                </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="layui-btn layui-btn-radius"><i class="fa fa-floppy-o"
                                                                                        aria-hidden="true"></i> 保存
                            </button>
                            <a href="javascript:history.go(-1)">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-radius">
                                    <i class="fa fa-hand-o-left" aria-hidden="true"></i> 取消
                                </button>
                            </a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>





<script src="/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<!--Local Stuff-->
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });


    });

    var oUpfile = document.getElementById('fileId');
    oUpfile.onchange = function () {
        var file = oUpfile.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var image = document.getElementById('imageId');
            image.src = e.target.result;
        };
        reader.readAsDataURL(file);
    };

    var objUsername = document.getElementById("username");
    var objInfo = document.getElementById("info");
    //    对象的失去焦点事件(用函数编写)
    objUsername.onblur = function () {
        //        写执行代码objUsername
        //        alert(objUsername.value);
        var valUsername = objUsername.value;
        //        1 构造异步对象
        var xmlhttp = new XMLHttpRequest();
        //        2  监控请求状态变化
        xmlhttp.onreadystatechange = function () {
            //            请求成功返回
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText == "yes") {
                    //                    在页面适当位置给出醒目提醒
                    objInfo.innerHTML = "用户名已被占用，请重新输入";
                    objInfo.style.color = "red";
                    objUsername.focus();
                } else {
                    objInfo.innerHTML = "用户名可用";
                    objInfo.style.color = "blue";
                }
            }
        }
        xmlhttp.open("GET", "/seller/isExist?username=" + valUsername, true);//get //  post
        xmlhttp.send();
    }
</script>
</body>
</html>