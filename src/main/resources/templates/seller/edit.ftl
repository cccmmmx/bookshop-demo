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

    <div class="layui-body" style="background: #f5f5f5">
        <#--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">-->
            <#--<legend>商家信息</legend>-->
        <#--</fieldset>-->
        <!-- 内容主体区域 -->
            <div class="panel panel-info" style="border-color:#f6f6f6">
                <div class="panel-heading">
                    <h3 class="panel-title">商家信息</h3>
                </div>
                <div class="panel-body" >
                    <div class="col-sm-6">
                        <form class="form-horizontal" role="form" action="/seller/save" enctype="multipart/form-data" method="post">
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <input type="text" name="id" value="${seller.id!""}" hidden>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">头像</label>
                                <div class="col-sm-4" >
                                    <image src="${seller.logo!''}" width="120px" height="120px" class="flex-logo img-circle" id="imageId" />
                                    <div class="btton">
                                        上传头像
                                        <input type="file" id="fileId" name="upfile"
                                               autocomplete="off"  style="opacity: 0;" class="fa-plus-text" value="${seller.logo!''}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">真实性名</label>
                                <div class="col-sm-6">
                                    <input type="text" id="realname" name="realname" value="${seller.realname!""}"
                                           autocomplete="off" placeholder="真实名" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">账号</label>
                                     <#if "${seller.username!''}"="">
                                        <div class="col-sm-6">
                                            <input type="text" id="username" name="username" value="${seller.username!""}"
                                                   autocomplete="off" placeholder="账号" class="layui-input" required>
                                        </div>
                                     <span id="info"></span>
                                     <#else>
                                        <div class="col-sm-6">
                                            <span class="control-label text-danger text-sp">${seller.username!""}</span>
                                            <input type="text" id="username" name="username" value="${seller.username!""}"
                                                   autocomplete="off" placeholder="账号" hidden required>
                                        </div>
                                     </#if>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">密码</label>
                                <#if "${seller.password!''}"="">
                                            <div class="col-sm-6">
                                                <input type="text" id="password" name="password" value="${seller.password!""}"
                                                       autocomplete="off" placeholder="密码" class="layui-input" required>
                                            </div>
                                         <span id="info"></span>
                                <#else>
                                            <div class="col-sm-6">
                                                <span class="control-label text-danger text-sp">${seller.password!""}</span>
                                                <input type="text" id="password" name="password" value="${seller.password!""}"
                                                       autocomplete="off" placeholder="密码" hidden required>
                                            </div>
                                </#if>
                                <#--<div class="col-sm-6">-->
                                    <#--<input type="text" id="password" name="password" value="${seller.password!""}"-->
                                           <#--autocomplete="off" placeholder="密码" -->
                                           <#--class="layui-input"  <#if "${seller.password!''}"!="">disabled</#if>  required>-->
                                <#--</div>-->
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">联系手机</label>
                                <div class="col-sm-6">
                                    <input type="text" id="phone" name="phone" value="${seller.phone!""}"
                                           autocomplete="off" placeholder="联系手机" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">地址</label>
                                <div class="col-sm-6">
                                    <input type="text" id="address" name="address" value="${seller.address!""}"
                                           autocomplete="off" placeholder="地址" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">邮编</label>
                                <div class="col-sm-6">
                                    <input type="text" id="postcode" name="postcode" value="${seller.postcode!""}"
                                           autocomplete="off" placeholder="邮编" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-6">
                                    <input type="text" id="email" name="email" value="${seller.email!""}"
                                           autocomplete="off" placeholder="电子邮箱" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                    <#if "${seller.regdate!''}"=="">
                                    <#else>
                                      <label for="company" class="col-sm-2 control-label">入驻日期</label>
                                <div class="col-sm-6">
                                         <input type="text" id="regdate" name="regDate" value="${(seller.regdate)?string('yyyy-MM-dd')}"
                                                autocomplete="off" placeholder="入驻日期" disabled class="layui-input" >
                                </div>
                                    </#if>

                            </div>

                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">商家网址</label>
                                <div class="col-sm-6">
                                    <input type="text" id="url" name="url" value="${seller.url!""}"
                                           autocomplete="off" placeholder="商家网址" class="layui-input" required>
                                </div>
                            </div>
                            <#--<div class="form-group">-->
                                <#--<label for="company" class="col-sm-2 control-label">级别</label>-->
                                <#--<div class="col-sm-6">-->
                  <#--<#if "${seller.state!''}"="">-->
                      <#--<select name="state" class="form-control sel">-->
                          <#--<option value="0">普通</option>-->
                          <#--<option value="1">蓝钻</option>-->
                          <#--<option value="2">绿钻</option>-->
                          <#--<option value="3">金钻</option>-->
                      <#--</select>-->
                  <#--<#else>-->
                        <#--<select name="state" class="form-control sel">-->
                            <#--<option value="0" <#if "0"="${seller.state}">selected</#if>>普通</option>-->
                            <#--<option value="1" <#if "1"="${seller.state}">selected</#if>>蓝钻</option>-->
                            <#--<option value="2" <#if "2"="${seller.state}">selected</#if>>绿钻</option>-->
                            <#--<option value="3" <#if "3"="${seller.state}">selected</#if>>金钻</option>-->
                        <#--</select>-->
                  <#--</#if>-->
                                <#--</div>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="company" class="col-sm-2 control-label">级别</label>-->
                                <#--<div class="col-sm-6">-->
                  <#--<#if "${seller.grade!''}"="">-->
                      <#--<select name="grade" class="form-control sel" >-->
                          <#--<option value="0">未激活</option>-->
                          <#--<option value="1">有效</option>-->
                          <#--<option value="2">锁定</option>-->
                          <#--<option value="3">无效</option>-->
                      <#--</select>-->
                  <#--<#else>-->
                        <#--<select name="grade" class="form-control sel" >-->
                            <#--<option value="0" <#if "0"="${seller.grade}">selected</#if>>未激活</option>-->
                            <#--<option value="1" <#if "1"="${seller.grade}">selected</#if>>有效</option>-->
                            <#--<option value="2" <#if "2"="${seller.grade}">selected</#if>>锁定</option>-->
                            <#--<option value="3" <#if "3"="${seller.grade}">selected</#if>>无效</option>-->
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
                                <image src="${seller.logo!''}" width="400px" height="400px" class="flex-logo" id="imgbg"/>
                            </div>
                        </div>
                        <#--<div style="padding-left: 100px;padding-top: 100px">-->
                            <#--<h3>大图浏览</h3>-->
                            <#--<image src="${base}/${seller.logo!''}" width="400px" height="400px" class="flex-logo" id="imgbg"/>-->
                        <#--</div>-->
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
                    objInfo.innerHTML = "用户名已被占用，请重新输入";
                    objInfo.style.color = "red";
                    objUsername.focus();
                } else {
                    objInfo.innerHTML = "用户名可用";
                    objInfo.style.color = "blue";
                }
            }
        }
        xmlhttp.open("GET", "/seller/isExist?valUsername=" + valUsername, true);//get //  post
        xmlhttp.send();
    }
</script>
</body>
</html>















<#--<div class="form-group">-->
<#--<label for="lastname" class="col-sm-4 control-label">商家入驻日期</label>-->
<#--<div class="col-sm-8">-->
<#--<input type="date" class="form-control" id="regdate"-->
<#--name="regdate" value="${seller.regdate!""}" required-->
<#--placeholder="请输入商家入驻日期">-->
<#--</div>-->
<#--</div>-->

<#--<div class="form-group">-->
<#--<label for="state" class="col-sm-4 control-label">状态</label>-->
<#--<div class="col-sm-8">-->
<#--<#if "${seller.state!''}"="">-->
<#--<select name="state" class="form-control">-->
<#--<option value="0">未激活</option>-->
<#--<option value="1">有效</option>-->
<#--<option value="2">锁定</option>-->
<#--<option value="3">无效</option>-->
<#--</select>-->
<#--<#else>-->
<#--<select name="state" class="form-control">-->
<#--<option value="0" <#if "0"="${seller.state}">selected</#if>>未激活</option>-->
<#--<option value="1" <#if "1"="${seller.state}">selected</#if>>有效</option>-->
<#--<option value="2" <#if "2"="${seller.state}">selected</#if>>锁定</option>-->
<#--<option value="3" <#if "3"="${seller.state}">selected</#if>>无效</option>-->
<#--</select>-->
<#--</#if>-->
<#--</div>-->
<#--</div>-->
<#--<div class="form-group">-->
<#--<label for="grade" class="col-sm-4 control-label">级别</label>-->
<#--<div class="col-sm-8">-->
<#--<#if "${seller.grade!''}"="">-->
<#--<select name="grade" class="form-control">-->
<#--<option value="0">普通</option>-->
<#--<option value="1">蓝钻</option>-->
<#--<option value="2">绿钻</option>-->
<#--<option value="3">金钻</option>-->
<#--</select>-->
<#--<#else>-->
<#--<select name="grade" class="form-control">-->
<#--<option value="0" <#if "0"="${seller.grade}">selected</#if>>普通</option>-->
<#--<option value="1" <#if "1"="${seller.grade}">selected</#if>>蓝钻</option>-->
<#--<option value="2" <#if "2"="${seller.grade}">selected</#if>>绿钻</option>-->
<#--<option value="3" <#if "3"="${seller.grade}">selected</#if>>金钻</option>-->
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
<#--objInfo.innerHTML = "用户名已被占用，请重新输入";-->
<#--objInfo.style.color = "red";-->
<#--objUsername.focus();-->
<#--} else {-->
<#--objInfo.innerHTML = "用户名可用";-->
<#--objInfo.style.color = "blue";-->
<#--}-->
<#--}-->
<#--}-->
<#--xmlhttp.open("GET", "/seller/isExist?username=" + valUsername, true);//get //  post-->
<#--xmlhttp.send();-->
<#--}-->
<#--</script>-->


<#--&lt;#&ndash;<script>&ndash;&gt;-->
<#--&lt;#&ndash;//    请注意js的写法，函数用属性代替&ndash;&gt;-->
<#--&lt;#&ndash;//    修改默认的html5默认的正则表达式验证提示&ndash;&gt;-->
<#--&lt;#&ndash;var objUsername = document.getElementById("username");&ndash;&gt;-->
<#--&lt;#&ndash;var objInfo = document.getElementById("info");&ndash;&gt;-->
<#--&lt;#&ndash;//    失去焦点事件，离开此输入框时触发&ndash;&gt;-->
<#--&lt;#&ndash;objUsername.onblur = function () {&ndash;&gt;-->
<#--&lt;#&ndash;//只能在用时取值&ndash;&gt;-->
<#--&lt;#&ndash;var valUsername = objUsername.value;&ndash;&gt;-->
<#--&lt;#&ndash;//        1 构造异步对象&ndash;&gt;-->
<#--&lt;#&ndash;var xmlhttp = new XMLHttpRequest();&ndash;&gt;-->
<#--&lt;#&ndash;//        2  监控请求状态变化&ndash;&gt;-->
<#--&lt;#&ndash;xmlhttp.onreadystatechange = function () {&ndash;&gt;-->
<#--&lt;#&ndash;//            请求成功返回&ndash;&gt;-->
<#--&lt;#&ndash;if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {&ndash;&gt;-->
<#--&lt;#&ndash;if (xmlhttp.responseText == "yes") {&ndash;&gt;-->
<#--&lt;#&ndash;objInfo.innerHTML = "用户名已被占用，请重新输入";&ndash;&gt;-->
<#--&lt;#&ndash;objInfo.style.color = "red";&ndash;&gt;-->
<#--&lt;#&ndash;objUsername.focus();&ndash;&gt;-->
<#--&lt;#&ndash;} else {&ndash;&gt;-->
<#--&lt;#&ndash;objInfo.innerHTML = "用户名可用";&ndash;&gt;-->
<#--&lt;#&ndash;objInfo.style.color = "blue";&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;xmlhttp.open("get", "/seller/isExist?username=" + valUsername, true);&ndash;&gt;-->
<#--&lt;#&ndash;//        4 异步请求&ndash;&gt;-->
<#--&lt;#&ndash;xmlhttp.send(null);&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;</script>&ndash;&gt;-->





