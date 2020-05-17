<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js">
    </script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">

    </script>
    <#--<link rel="stylesheet" href="style.css">-->

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/home/firstlogin">返回</a></li>

            </ul>
        </div>
    </div>
</nav>

<div class="div1">


<div class="container mag">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">登陆</h3> <div class="col-md-9">
            <form class="form-horizontal" role="form" action="/seller/doLogin" method="post">

            <div class="form-group"> <i class="fa fa-user fa-lg"></i>
                <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
            </div>

            <div class="form-group"> <i class="fa fa-lock fa-lg"></i>
                <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
            </div>
                <span id="info"></span>

            <div class="form-group ">
                <button type="submit" class="btn btn-success pull-right btn1" name="submit" id="login">登录</button>
            </div>
                <div class="form-group right-pill">
                    <a href="/customer/add">没有账户？去注册</a>
        </div>
            </form>
        </div>
    </div>
</div>

</div>
<div class="jumbotron text-center" style="margin-bottom:0">
    <p>欢迎登陆广商商城</p>
</div>

</body>
</html>

<style>
    /*body{*/
    /*!*background: url("../img/1.jpg") no-repeat;*!*/
    /*!*height:100%;*!*/
    /*!*width:100%;*!*/

    /*!*background-size:100%;}*!*/
    .form{
        background: rgba(255,255,255,0.2);width:400px;margin:120px auto;

    }
    .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
    input[type="text"],
    input[type="password"]{padding-left:26px;}
    .mag{

        margin-right: 5px;
        margin-top: 50px;

    }
    .div1{
        background: #666666;
        height: 50%;
        width: 100%;

    }
.btn1{
    width: 100%;
}


</style>
<script>
    //    1 获取对象
    var btnLogin = document.getElementById("login");
    var info = document.getElementById("info");
    var objUsername = document.getElementById("username");
    //    2 按钮单击事件
    btnLogin.onclick = function () {
        var valUsername = objUsername.value;
        var valPassword = document.getElementById("password").value;
        var xmlhttp = new XMLHttpRequest();
        //        2  监控请求状态变化
        xmlhttp.onreadystatechange = function () {
            //            请求成功返回
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
//                登录成功
                if (xmlhttp.responseText == "yes") {
//                  跳转到商场首页
                    window.location.href = "/";
                } else {
                    info.innerHTML = "错误的账号或密码";
                    info.style.color = "red";
                    objUsername.onfocus;
                }
            }
        }
        //        3 设置请求参数
        xmlhttp.open("GET", "/customer/loginif?username=" + valUsername + "&&password=" + valPassword, true);
        //        4 异步请求
        xmlhttp.send(null);
    }
</script>



<#--<script>-->
    <#--var objInfo = document.getElementById("info");-->
    <#--var bt = document.getElementById("login");-->
    <#--bt.onclick = function () {-->
        <#--var valUsername = document.getElementById("username").value;-->
        <#--var valPassword = document.getElementById("password").value;-->
<#--//        alert("u:" + valUsername + " p:" + valPassword);-->
<#--//        1 构造异步对象-->
        <#--var xmlhttp = new XMLHttpRequest();-->
<#--//        2  监控请求状态变化-->
        <#--xmlhttp.onreadystatechange = function () {-->
<#--//            请求成功返回-->
            <#--if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {-->
                <#--var s = xmlhttp.responseText;-->
                <#--switch (s) {-->
                    <#--case 'no':-->
                        <#--alert("账号或密码不正确");-->
                        <#--objInfo.innerHTML="账号或密码不正确";-->
                        <#--break;-->
                    <#--case '0':-->
                        <#--alert("未审核，请耐心等待或联系平台");-->
                        <#--break;-->
                    <#--case '1':-->
                        <#--alert("去商家的商品管理页面");-->
                        <#--break;-->
                    <#--case '2':-->
                        <#--alert("你的账户被锁定，请联系平台");-->
                        <#--break;-->
                    <#--case '3':-->
                        <#--alert("你的账户无效，请联系平台");-->
<#--//                        break;-->
                <#--}-->
            <#--}-->
        <#--}-->
<#--//        3 设置请求参数-->
        <#--xmlhttp.open("GET", "/seller/login?username=" + valUsername + "&password=" + valPassword, true);-->
<#--//        4 异步请求-->
        <#--xmlhttp.send();-->
    <#--}-->

<#--</script>-->

