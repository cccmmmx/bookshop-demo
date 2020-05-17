<html>
<head>
    <title>商城 会员登录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">

            <h3>商城
                <small>会员登录</small>
            </h3>

            <hr>
            <div class="form-group">
                <label for="username" class="col-sm-4 control-label">会员帐号</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control"
                           name="username"
                           placeholder="请输入会员账号"
                           id="username" required="true"/>
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">密码</label>
                <div class="col-sm-8">
                    <input type="password" name="password"
                           placeholder="请输入密码"
                           class="form-control" id="password" required="true"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-0 col-sm-12">
                    <button id="btnLogin" class="btn btn-success btn-block">登录</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-0 col-sm-12">
                    <button id="getMessage" class="btn btn-success btn-block">测试</button>
                </div>
            </div>
            <#--<form class="form-horizontal" role="form" action="/customer/logins" method="post">-->
            <#--<div class="form-horizontal">-->

                <#--<div class="form-group">-->
                    <#--<label for="username" class="col-sm-4 control-label">会员帐号</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="text" class="form-control"-->
                               <#--name="username"-->
                               <#--placeholder="请输入会员账号"-->
                               <#--id="username" required="true"/>-->
                    <#--</div>-->
                <#--</div>-->

                <#--<div class="form-group">-->
                    <#--<label for="password" class="col-sm-4 control-label">密码</label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<input type="password" name="password"-->
                               <#--placeholder="请输入密码"-->
                               <#--class="form-control" id="password" required="true"/>-->
                    <#--</div>-->
                <#--</div>-->

                <#--<div class="form-group">-->
                    <#--<label class="col-sm-4 control-label"></label>-->
                    <#--<div class="col-sm-8">-->
                        <#--<span id="info"></span>-->
                    <#--</div>-->
                <#--</div>-->


                <#--<div class="form-group">-->
                    <#--<div class="col-sm-offset-0 col-sm-12">-->
                        <#--<button id="btnLogin" class="btn btn-success btn-block">登录</button>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->
            <#--</form>-->
        </div>

        <div class="col-md-4 column">
        </div>
    </div>
</div>
</body>
</html>

<script>
    //    1 获取对象
    var btnLogin = document.getElementById("btnLogin");
    var getMessage=document.getElementById("getMessage")
    var info = document.getElementById("info");
    var objUsername = document.getElementById("username");
    getMessage.onclick=function () {
        var xmlhttps = new XMLHttpRequest();
        //        2  监控请求状态变化
        xmlhttps.onreadystatechange = function () {
            //            请求成功返回
            if (xmlhttps.readyState == 4 && xmlhttps.status == 200) {
//                登录成功
                console.log(typeof xmlhttp.responseText)
//                 if (xmlhttp.responseText == "yes") {
// //                  跳转到商场首页
//                     window.location.href = "/";
//                 } else {
//                     info.innerHTML = "错误的账号或密码";
//                     info.style.color = "red";
//                     objUsername.onfocus;
//                 }
            }
        }
        //        3 设置请求参数
        xmlhttps.open("GET", "/customer/getMessage", true);
        xmlhttps.setRequestHeader("token"," ")
        //        4 异步请求
        xmlhttps.send(null);
    }
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
                console.log(typeof xmlhttp.responseText)
//                 if (xmlhttp.responseText == "yes") {
// //                  跳转到商场首页
//                     window.location.href = "/";
//                 } else {
//                     info.innerHTML = "错误的账号或密码";
//                     info.style.color = "red";
//                     objUsername.onfocus;
//                 }
            }
        }
        //        3 设置请求参数
        xmlhttp.open("GET", "/customer/logins?username=" + valUsername + "&&password=" + valPassword, true);
        //        4 异步请求
        xmlhttp.send(null);
    }
</script>
