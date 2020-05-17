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
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>网站基本配置信息</legend>
        </fieldset>
        <!-- 内容主体区域 -->

        <form class="form-horizontal" role="form" action="/parameter/save" enctype="multipart/form-data" method="post">
            <div class="row">
            <#--左边-->
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <input type="text" name="id" value="${parameter.id!""}" hidden>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">网站LOGO</label>
                        <div class="col-sm-4">
                            <image src="${parameter.weblogo!''}" width="60px" height="60px" class="flex-logo" id="imageId"/>
                            <div class="btton">
                                上传LOGO
                                <input type="file" id="fileId" name="upfile"
                                       autocomplete="off"  style="opacity: 0;" class="fa-plus-text" value="${parameter.weblogo!''}">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">网站名称</label>
                        <div class="col-sm-4">
                            <input type="text" id="webname" name="webname" value="${parameter.webname!""}"
                                   autocomplete="off" placeholder="网站名称" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">注册条款</label>
                        <div class="col-sm-8">
                                <textarea id="regtiaoyue" name="regtiaoyue"
                                          placeholder="注册条款" class="layui-textarea">${parameter.regtiaoyue!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">公告</label>
                        <div class="col-sm-8">
                                <textarea id="notice" name="notice"
                                          placeholder="公告" class="layui-textarea">${parameter.notice!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-4">
                            <input type="text" id="address" name="address" value="${parameter.address!""}"
                                   autocomplete="off" placeholder="地址" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">邮编</label>
                        <div class="col-sm-4">
                            <input type="text" id="postcode" name="postcode" value="${parameter.postcode!""}"
                                   autocomplete="off" placeholder="邮编" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-4">
                            <input type="text" id="tel" name="tel" value="${parameter.tel!""}"
                                   autocomplete="off" placeholder="电话号码" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">版权</label>
                        <div class="col-sm-4">
                            <input type="text" id="copyright" name="copyright" value="${parameter.copyright!""}"
                                   autocomplete="off" placeholder="版权" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">网站地址</label>
                        <div class="col-sm-4">
                            <input type="text" id="website" name="website" value="${parameter.website!""}"
                                   autocomplete="off" placeholder="网站地址" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">支付方式</label>
                        <div class="col-sm-4">
                            <input type="text" id="affordmethod" name="affordmethod" value="${parameter.affordmethod!""}"
                                   autocomplete="off" placeholder="支付方式" class="layui-input" >
                        </div>
                    </div>
                </div>
                <#--右边-->
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">购物流程</label>
                        <div class="col-sm-8">
                                <textarea id="shopstream" name="shopstream"
                                          placeholder="购物流程" class="layui-textarea">${parameter.shopstream!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">送货方式</label>
                        <div class="col-sm-4">
                            <input type="text" id="postmethod" name="postmethod" value="${parameter.postmethod!""}"
                                   autocomplete="off" placeholder="送货方式" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">运输说明</label>
                        <div class="col-sm-4">
                            <input type="text" id="postdescp" name="postdescp" value="${parameter.postdescp!""}"
                                   autocomplete="off" placeholder="运输说明" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">工作时间</label>
                        <div class="col-sm-4">
                            <input type="text" id="worktime" name="worktime" value="${parameter.worktime!""}"
                                   autocomplete="off" placeholder="工作时间" class="layui-input" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">售后服务</label>
                        <div class="col-sm-8">
                                <textarea id="service" name="service"
                                          placeholder="售后服务" class="layui-textarea">${parameter.service!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">法律</label>
                        <div class="col-sm-8">
                                <textarea id="law" name="law"
                                          placeholder="法律" class="layui-textarea">${parameter.law!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">常见问题</label>
                        <div class="col-sm-8">
                                <textarea id="commques" name="commques"
                                          placeholder="常见问题" class="layui-textarea">${parameter.commques!""}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">交易条款</label>
                        <div class="col-sm-8">
                                <textarea id="dealrule" name="dealrule"
                                          placeholder="交易条款" class="layui-textarea">${parameter.dealrule!""}</textarea>

                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="layui-btn layui-btn-radius"><i class="fa fa-floppy-o"
                                                                                aria-hidden="true"></i> 保存
                    </button>
                </div>
            </div>
        </form>
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