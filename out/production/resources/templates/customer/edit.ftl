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
    <div class="layui-body">
        <#--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">-->
            <#--<legend>会员信息</legend>-->
        <#--</fieldset>-->
        <!-- 内容主体区域 -->
            <div class="layui-body" style="background: #f5f5f5;">
                <!-- 内容主体区域 -->
                <div class="panel panel-info" style="border-color:#f6f6f6">
                    <div class="panel-heading">
                        <h3 class="panel-title">会员信息</h3>
                    </div>
                    <div class="panel-body" >

                        <div class="col-sm-6">
                            <form class="form-horizontal" role="form" action="/customer/save" enctype="multipart/form-data" method="post">
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-4">
                                        <input type="text" name="id" value="${customer.id!""}" hidden>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">头像</label>
                                    <div class="col-sm-4">
                                        <image src="${customer.image!''}" width="120px" height="120px" class="flex-logo img-circle" id="imageId"/>
                                        <div class="btton">
                                            上传头像
                                            <input type="file" id="fileId" name="upfile"
                                                   autocomplete="off"  style="opacity: 0;" class="fa-plus-text" value="${customer.image!''}">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">真实性名</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="realname" name="realname" value="${customer.realname!""}"
                                               autocomplete="off" placeholder="真实名" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">账号</label>
                                         <#if "${customer.username!''}"="">
                                            <div class="col-sm-4">
                                                <input type="text" id="username" name="username" value="${customer.username!""}"
                                                       autocomplete="off" placeholder="账号" class="layui-input" required>
                                            </div>
                                         <span id="info"></span>
                                         <#else>
                                            <div class="col-sm-4">
                                                <span class="control-label text-danger text-sp">${customer.username!""}</span>
                                                <input type="text" id="username" name="username" value="${customer.username!""}"
                                                       autocomplete="off" placeholder="账号" hidden required>
                                            </div>
                                         </#if>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">密码</label>
                                     <#if "${customer.password!''}"="">
                                            <div class="col-sm-4">
                                                <input type="text" id="password" name="password" value="${customer.password!""}"
                                                       autocomplete="off" placeholder="账号" class="layui-input" required>
                                            </div>
                                         <span id="info"></span>
                                     <#else>
                                            <div class="col-sm-4">
                                                <span class="control-label text-danger text-sp">${customer.password!""}</span>
                                                <input type="text" id="password" name="password" value="${customer.password!""}"
                                                       autocomplete="off" placeholder="账号" hidden required>
                                            </div>
                                     </#if>
                                    <#--<div class="col-sm-4">-->
                                        <#--<input type="text" id="password" name="password" value="${customer.password!""}"-->
                                               <#--autocomplete="off" placeholder="密码" -->
                                               <#--class="layui-input"  <#if "${customer.password!''}"!="">disabled</#if>  required>-->
                                    <#--</div>-->
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">联系手机</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="phone" name="phone" value="${customer.phone!""}"
                                               autocomplete="off" placeholder="联系手机" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">地址</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="address" name="address" value="${customer.address!""}"
                                               autocomplete="off" placeholder="地址" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">电子邮箱</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="email" name="email" value="${customer.email!""}"
                                               autocomplete="off" placeholder="电子邮箱" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">身份证</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="idcard" name="idcard" value="${customer.idcard!""}"
                                               autocomplete="off"   pattern="^([0-9]){7,18}(x|X)?$"
                                               maxlength="18" placeholder="身份证" class="layui-input">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">入驻日期</label>
                                    <div class="col-sm-4">
                    <#if "${customer.regDate!''}"=="">
                        <input type="date" id="regDate" name="regDate"
                               autocomplete="off" placeholder="入驻日期" class="layui-input" >
                    <#else>
                         <input type="text" id="regDate" name="regDate" value="${(customer.regDate)?string('yyyy-MM-dd')}"
                                autocomplete="off" placeholder="入驻日期" disabled class="layui-input" >
                    </#if>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-4">
                <#if "${customer.gender!''}"="">
                    <select name="gender" class="form-control sel">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                <#else>
                <select name="gender" class="form-control sel">
                    <option value="1"<#if "1"="${customer.gender}">selected</#if>>男</option>
                    <option value="0"<#if "0"="${customer.gender}">selected</#if>>女</option>
                </select>
                </#if>
                                    </div>
                                </div>


                                <#--<div class="form-group">-->
                                    <#--<label for="company" class="col-sm-2 control-label">级别</label>-->
                                    <#--<div class="col-sm-4">-->
                  <#--<#if "${customer.state!''}"="">-->
                      <#--<select name="state" class="form-control sel" hidden>-->
                          <#--<option value="0">普通</option>-->
                          <#--<option value="1">蓝钻</option>-->
                          <#--<option value="2">绿钻</option>-->
                          <#--<option value="3">金钻</option>-->
                      <#--</select>-->
                  <#--<#else>-->
                        <#--<select name="state" class="form-control sel" hidden>-->
                            <#--<option value="0" <#if "0"="${customer.grade}">selected</#if>>普通</option>-->
                            <#--<option value="1" <#if "1"="${customer.grade}">selected</#if>>蓝钻</option>-->
                            <#--<option value="2" <#if "2"="${customer.grade}">selected</#if>>绿钻</option>-->
                            <#--<option value="3" <#if "3"="${customer.grade}">selected</#if>>金钻</option>-->
                        <#--</select>-->
                  <#--</#if>-->
                                    <#--</div>-->
                                <#--</div>-->
                                <#--<div class="form-group">-->
                                    <#--<label for="company" class="col-sm-2 control-label">级别</label>-->
                                    <#--<div class="col-sm-4">-->
                  <#--<#if "${customer.grade!''}"="">-->
                      <#--<select name="grade" class="form-control sel" hidden>-->
                          <#--<option value="0">未激活</option>-->
                          <#--<option value="1">有效</option>-->
                          <#--<option value="2">锁定</option>-->
                          <#--<option value="3">无效</option>-->
                      <#--</select>-->
                  <#--<#else>-->
                        <#--<select name="grade" class="form-control sel" >-->
                            <#--<option value="0" <#if "0"="${customer.state}">selected</#if>>未激活</option>-->
                            <#--<option value="1" <#if "1"="${customer.state}">selected</#if>>有效</option>-->
                            <#--<option value="2" <#if "2"="${customer.state}">selected</#if>>锁定</option>-->
                            <#--<option value="3" <#if "3"="${customer.state}">selected</#if>>无效</option>-->
                        <#--</select>-->
                  <#--</#if>-->
                                    <#--</div>-->
                                <#--</div>-->
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
                        <div class="col-sm-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">大图浏览</div>
                                <div class="panel-body">
                                    <image src="${customer.image!''}" width="400px" height="400px" class="flex-logo" id="imgbg"/>
                                </div>
                            </div>
                            <#--<div style="padding-left: 100px;padding-top: 100px">-->
                                <#--<div class="alert alert-info" role="alert">大图浏览</div>-->
                                <#--&lt;#&ndash;<h3></h3>&ndash;&gt;-->
                                <#--<image src="${base}/${customer.image!''}" width="400px" height="400px" class="flex-logo" id="imgbg"/>-->
                            <#--</div>-->
                        </div>
                    </div>

                </div>


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
            var imgbg=document.getElementById('imgbg')
            image.src = e.target.result;
            imgbg.src=e.target.result
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
                    objInfo.innerHTML = "账号已被注册，请重新输入";
                    objInfo.style.color = "red";
                    objUsername.focus();
                } else {
                    objInfo.innerHTML = "账号可用";
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

<#--<#assign base=request.contextPath/>-->
<#--<!doctype html>-->
<#--<html lang="en">-->
<#--<head>-->
    <#--<meta charset="UTF-8">-->
    <#--<meta name="viewport"-->
          <#--content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
    <#--<meta http-equiv="X-UA-Compatible" content="ie=edge">-->
    <#--<title>分类修改</title>-->
    <#--<!-- 新 Bootstrap 核心 CSS 文件 &ndash;&gt;-->
    <#--<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->
<#--</head>-->
<#--<body>-->

<#--<div class="container">-->
    <#--<div class="row clearfix">-->
        <#--<div class="col-md-4 column">-->
        <#--</div>-->
        <#--<div class="col-md-4 column">-->
            <#--<h3>客户-->
                <#--<small>客户信息</small>-->
            <#--</h3>-->
            <#--<hr>-->
            <#--<form class="form-horizontal" role="form" action="/customer/save"-->
                  <#--enctype="multipart/form-data" method="post">-->
                <#--<div class="form-group">-->
                    <#--<label for="firstname" class="col-sm-4 control-label">真实姓名</label>-->
                    <#--<div class="col-sm-8">-->
                    <#--&lt;#&ndash;隐藏id&ndash;&gt;-->
                        <#--<input type="text" name="id" value="${customer.id!""}" hidden>-->
                        <#--<input type="text" class="form-control" id="realname"-->
                               <#--placeholder="请输入分类名称" name="realname" value="${customer.realname!""}"-->
                               <#--required>-->
                    <#--</div>-->
                <#--</div>-->
                <#---->
                <#--<div class="form-group">-->
                    <#--<label for="username" class="col-sm-4 control-label">会员帐号</label>-->
                <#--<#if "${customer.username!''}"="">-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" class="form-control" id="username"-->
                               <#--name="username" value="${customer.username!''}" required-->
                               <#--placeholder="请输入账号">-->
                        <#--<span id="info"></span>-->
                    <#--</div>-->
                <#--<#else>-->
                    <#--<div class="col-sm-8">-->
                        <#--<span class="control-label text-danger">${customer.username!""}</span>-->
                    <#--</div>-->
                <#--</#if>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<label for="lastname" class="col-sm-4 control-label">加密密码</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" class="form-control" id="password"-->
                               <#--name="password" value="${customer.password!""}" required-->
                               <#--placeholder="请输入加密密码">-->
                    <#--</div>-->
                <#--</div>-->

                <#--<div class="form-group">-->
                    <#--<label for="lastname" class="col-sm-4 control-label">常住住址</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" class="form-control" id="address"-->
                               <#--name="address" value="${customer.address!""}" required-->
                               <#--placeholder="请输入你的常住地址">-->
                    <#--</div>-->
                <#--</div>-->

                <#--<div class="form-group">-->
                    <#--<label for="gender" class="col-sm-4 control-label">性别</label>-->
                    <#--<div class="col-sm-8">-->
                    <#--<#if "${customer.gender!''}"="">-->
                        <#--<select name="gender" class="form-control">-->
                            <#--<option value="1">男</option>-->
                            <#--<option value="0">女</option>-->
                        <#--</select>-->
                    <#--<#else>-->
                        <#--<select name="gender" class="form-control">-->
                            <#--<option value="1"<#if "1"="${customer.gender}">selected</#if>>男</option>-->
                            <#--<option value="0"<#if "0"="${customer.gender}">selected</#if>>女</option>-->
                        <#--</select>-->
                    <#--</#if>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<label for="lastname" class="col-sm-4 control-label">注册日期</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="date" class="form-control" id="regDate"-->
                               <#--name="regDate" value="${customer.regDate!""}" required-->
                               <#--placeholder="请输入注册日期">-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<label for="lastname" class="col-sm-4 control-label">电子邮箱</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="email" class="form-control" id="email"-->
                               <#--name="email" value="${customer.email!""}" required-->
                               <#--placeholder="请输入电子邮箱">-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<label for="phone" class="col-sm-4 control-label">联系手机</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" name="phone" placeholder="请输入11位手机号码"-->
                               <#--maxlength="11" value="${customer.phone!""}"-->
                               <#--pattern="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$"-->
                               <#--class="form-control" required/>-->
                    <#--</div>-->
                <#--</div>-->

             <#---->
                <#--<div class="form-group">-->
                    <#--<label for="lastname" class="col-sm-4 control-label">头像图片</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<image src="${base}/${customer.image!''}" widyh="50px" height="50px" id="imageId"/>-->
                        <#--<input type="file" name="upfile" id="fileId"/>-->
                    <#--</div>-->
                <#--</div>-->

             <#---->
                <#--<div class="form-group">-->
                    <#--<label for="idcard" class="col-sm-4 control-label">身份证</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" name="idcard" class="form-control"-->
                               <#--pattern="^([0-9]){7,18}(x|X)?$"-->
                               <#--maxlength="18" value="${customer.idcard!""}"-->
                               <#--placeholder="请输入身份证件号码"-->
                               <#--id="idcard" required/>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<label for="state" class="col-sm-4 control-label">状态</label>-->
                    <#--<div class="col-sm-8">-->
                    <#--<#if "${customer.state!''}"="">-->
                        <#--<select name="state" class="form-control">-->
                            <#--<option value="0">未激活</option>-->
                            <#--<option value="1">有效</option>-->
                            <#--<option value="2">锁定</option>-->
                            <#--<option value="3">无效</option>-->
                        <#--</select>-->
                    <#--<#else>-->
                        <#--<select name="state" class="form-control">-->
                            <#--<option value="0" <#if "0"="${customer.state}">selected</#if>>未激活</option>-->
                            <#--<option value="1" <#if "1"="${customer.state}">selected</#if>>有效</option>-->
                            <#--<option value="2" <#if "2"="${customer.state}">selected</#if>>锁定</option>-->
                            <#--<option value="3" <#if "3"="${customer.state}">selected</#if>>无效</option>-->
                        <#--</select>-->
                    <#--</#if>-->
                    <#--</div>-->
                <#--</div>-->
                <#---->
                <#--<div class="form-group">-->
                    <#--<label for="grade" class="col-sm-4 control-label">级别</label>-->
                    <#--<div class="col-sm-8">-->
                    <#--<#if "${customer.grade!''}"="">-->
                        <#--<select name="grade" class="form-control">-->
                            <#--<option value="0">普通</option>-->
                            <#--<option value="1">蓝钻</option>-->
                            <#--<option value="2">绿钻</option>-->
                            <#--<option value="3">金钻</option>-->
                        <#--</select>-->
                    <#--<#else>-->
                        <#--<select name="grade" class="form-control">-->
                            <#--<option value="0" <#if "0"="${customer.grade}">selected</#if>>普通</option>-->
                            <#--<option value="1" <#if "1"="${customer.grade}">selected</#if>>蓝钻</option>-->
                            <#--<option value="2" <#if "2"="${customer.grade}">selected</#if>>绿钻</option>-->
                            <#--<option value="3" <#if "3"="${customer.grade}">selected</#if>>金钻</option>-->
                        <#--</select>-->
                    <#--</#if>-->
                    <#--</div>-->
                <#--</div>-->

                <#--<div class="form-group">-->
                    <#--<div class="col-sm-offset-0 col-sm-12">-->
                        <#--<button type="submit" class="btn btn-success btn-block">保存</button>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</form>-->
        <#--</div>-->
        <#--<div class="col-md-4 column">-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->
<#--<div class="jumbotron text-center" style="margin-bottom:0">-->
    <#--<p>这是我的底线</p>-->
<#--</div>-->
<#--</body>-->
<#--</html>-->

<#--<script>-->
    <#--var oUpfile = document.getElementById('fileId');-->
    <#--oUpfile.onchange=function(){-->
        <#--var file=oUpfile.files[0];-->
        <#--var reader=new FileReader();-->
        <#--reader.onload=function (e) {-->
            <#--var image=document.getElementById('imageId');-->
            <#--image.src=e.target.result;-->
        <#--};-->
        <#--reader.readAsDataURL(file);-->
    <#--};-->
<#--</script>-->


<#--<script>-->
    <#--//    1 标识对象 id="username"-->
    <#--//    2 通过编码找到该对象-->
    <#--var objUsername = document.getElementById("username");-->
    <#--var objInfo = document.getElementById("info");-->
    <#--//    对象的失去焦点事件(用函数编写)-->
    <#--objUsername.onblur = function () {-->
<#--//        写执行代码objUsername-->
<#--//        alert(objUsername.value);-->
        <#--var valUsername = objUsername.value;-->
<#--//        1 构造异步对象-->
        <#--var xmlhttp = new XMLHttpRequest();-->
<#--//        2  监控请求状态变化-->
        <#--xmlhttp.onreadystatechange = function () {-->
<#--//            请求成功返回-->
            <#--if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {-->
                <#--if (xmlhttp.responseText == "yes") {-->
<#--//                    在页面适当位置给出醒目提醒-->
                    <#--objInfo.innerHTML = "账号不可用";-->
                    <#--objInfo.style.color = "red";-->
                    <#--objUsername.focus();-->
                <#--} else {-->
                    <#--objInfo.innerHTML = "账号可用";-->
                    <#--objInfo.style.color = "blue";-->
                <#--}-->
            <#--}-->
        <#--}-->
        <#--xmlhttp.open("GET", "/customer/isExist?username=" + valUsername, true);//get //  post-->
        <#--xmlhttp.send();-->
    <#--}-->
<#--</script>-->