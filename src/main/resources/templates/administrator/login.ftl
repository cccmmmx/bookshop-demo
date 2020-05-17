<!DOCTYPE html>
<#--<html lang="en">-->
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <meta name="renderer" content="webkit" />
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
     <link href="/css/style.default.css" rel="stylesheet">
    <link rel="shortcut icon" href="/img/favicon.ico"/>
</head>
<body>

<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-sm-6">
                        <div class="content">
                           <img src="/img/s33553347.jpg" style="height: 100%;width: 100%">
                        </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-sm-6 bg-white" style="height: 794px">
                    <div class="form d-flex align-items-center">
                        <div class="content" style="margin-top: 160px">

                            <h3 style="font-size: 40px;text-align: center;font-family: KaiTi"">欢迎登录</h3>
                            <h3 style="font-size: 40px;text-align: center;margin-bottom: 80px;font-family: KaiTi">书城管理系统</h3>
                            <div   style="margin-left: 30px" >
                                <div class="form-group">
                                    <input id="username" type="text" name="userName" required  placeholder="用户名" class="input-material">
                                </div>
                                <div class="form-group" style="margin-bottom: 10px">
                                    <input id="password" type="password" name="passWord" required  placeholder="密码" class="input-material">
                                </div>
                            <div id="code" style="color: #ff5044"></div>
                                <div style="display: flex;margin-bottom: 30px">
                                    <input id="code_input" type="text" required  placeholder="请输入证码"
                                            style="margin-right: 10px;border-top: none;border-left: none;border-right: none;height: 50px">
                                    <div id="v_container" style="width: 200px;height: 50px;"></div>
                                </div>
                                <#--<div id="code" style="margin-bottom: 30px;color: #ff5044">验证码错误</div>-->
                                <button id="logins" type="button" class="btn btn-success"
                                        style="width: 200px;height: 50px;font-size: 26px">登录</button>
                                <#--<div style="margin-top: -50px;">-->
                                    <#--<div class="custom-control custom-checkbox " style="float: right;">-->
                                        <#--<input type="checkbox" style="width: 20px;height: 20px" id="check1" >-->
                                        <#--<label class="custom-control-label" for="check1">记住密码&nbsp;&nbsp;</label>-->
                                    <#--</div>-->
                                <#--</div>-->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="/js/gVerify.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<script src="/layer/layer.js"></script>
<script>
    // var code=$("#code")
    // layer.msg('hello');

    var verifyCode = new GVerify("v_container");
    $("#logins").click(function () {
        var username=$("#username").val();
        var password=$("#password").val();
        if(username==''){
            layer.msg('账号不能为空');
            $("#username").focus();
            return
        }
        if(password==''){
            layer.msg('密码不能为空');
            $("#password").focus();
            return
        }
        if($("#code_input").val()==''){
            layer.msg('验证码不能为空');
            $("#code_input").focus();
            return
        }
        let user={
            "username":username,
            "password":password
        }
        // alert(user)
        $("#password").on('input',function(){
            if(!($('#password').val()=='')){
                $("#code").empty()
            }
        })
        var res = verifyCode.validate($("#code_input").val());
        if (res) {
            $.ajax({
                type:"post",
                url :"/administrator/doLogin",
                dataType : 'json',
                data:user,
                success : function(data) {
                    $("#code").empty()
                    // alert(JSON.stringify(data))
                    if(data.message=="yes"){
                        layer.msg('登录成功');
                        location.href="/category/index"
                    }else if (data.message=="password"){
                        $("#code").append("密码错误，请重新输入")
                        $("#password").val("").focus();

                    }else if(data.message=="none"){
                        layer.alert("用户不存在")
                    }
                },
                error:function (da) {
                    alert(da)
                }
            });
        } else {
            layer.open({
                title: '提示'
                ,content: '验证码错误，请重新输入'
                ,area: ['400px','200px']
                ,btn: ['确定']
                ,yes: function(index, layero){
                    $("#code_input").val("").focus();
                    layer.close(index);
                }
            });

        }

    })

</script>
 </html>
