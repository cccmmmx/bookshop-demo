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
                    <h3 class="panel-title">管理员信息</h3>
                </div>
                <div class="panel-body" >

                    <div class="col-sm-6">
                        <form class="form-horizontal" role="form" action="/administrator/save" enctype="multipart/form-data" method="post">
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label"></label>
                                <div class="col-sm-4">
                                    <input type="text" name="id" value="${admins.id!""}" hidden>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">头像</label>
                                <div class="col-sm-4">
                                    <image src="${admins.img!''}" width="120px" height="120px" class="flex-logo img-circle" id="imageId"/>
                                    <div class="btton">
                                        上传头像
                                        <input type="file" id="fileId" name="upfile"
                                               autocomplete="off"  style="opacity: 0;" class="fa-plus-text" value="${admins.img!''}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-4">
                                    <input type="text" id="realname" name="realname" value="${admins.realname!""}"
                                           autocomplete="off" placeholder="真实名" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-4">
                                    <span class="control-label text-danger text-sp">${admins.username!""}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-4">
                                    <input type="text" id="password" name="password" value="${admins.password!""}"
                                           autocomplete="off" placeholder="密码" class="layui-input"  <#if "${admins.password!''}"!="">disabled</#if>  required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">联系手机</label>
                                <div class="col-sm-4">
                                    <input type="text" id="phone" name="phone" value="${admins.phone!""}"
                                           autocomplete="off" placeholder="联系手机" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">地址</label>
                                <div class="col-sm-4">
                                    <input type="text" id="address" name="address" value="${admins.address!""}"
                                           autocomplete="off" placeholder="地址" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-4">
                                    <input type="text" id="email" name="email" value="${admins.email!""}"
                                           autocomplete="off" placeholder="电子邮箱" class="layui-input" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="company" class="col-sm-2 control-label">邮政编码</label>
                                <div class="col-sm-4">
                                    <input type="text" id="postcode" name="postcode" value="${admins.postcode!""}"
                                           autocomplete="off" placeholder="邮政编码" class="layui-input" required>
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
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">大图浏览</div>
                            <div class="panel-body">
                                <image src="${admins.img!''}" width="400px" height="400px" class="flex-logo" id="imgbg"/>
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

</script>
</body>
</html>
