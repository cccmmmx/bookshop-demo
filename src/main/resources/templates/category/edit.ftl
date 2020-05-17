<!doctype html>
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

        .sel{
            height: 38px !important;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <#include '../commen/header.ftl'>

    <div class="layui-body" style="background: #f5f5f5;">
        <!-- 内容主体区域 -->
            <div class="panel panel-info" style="border-color:#f6f6f6">
                <div class="panel-heading">
                    <h3 class="panel-title">分类编辑</h3>
                </div>
                <div class="panel-body" >
                    <form class="form-horizontal" role="form" action="/category/save">
                        <div class="form-group">
                            <label for="company" class="col-sm-2 control-label"></label>
                            <div class="col-sm-4">
                                <input type="text" name="id" value="${category.id!""}" hidden>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="company" class="col-sm-2 control-label">书本类别</label>
                            <div class="col-sm-4">
                                <input type="text" id="text" name="text" value="${category.text!""}"
                                       autocomplete="off" placeholder="分类名称" class="layui-input" required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="company" class="col-sm-2 control-label">所属父类</label>
                            <div class="col-sm-4">
                  <#if "${category.parent!''}"="">
                      <select name="parent" class="form-control sel">
                          <option value="0">文学</option>
                          <option value="1">流行</option>
                          <option value="2">文化</option>
                          <option value="3">生活</option>
                          <option value="4">经管</option>
                          <option value="5">科技</option>
                      </select>
                  <#else>
                        <select name="parent" class="form-control sel">
                            <option value="0" <#if "0"="${category.parent}">selected</#if>>文学</option>
                            <option value="1" <#if "1"="${category.parent}">selected</#if>>流行</option>
                            <option value="2" <#if "2"="${category.parent}">selected</#if>>文化</option>
                            <option value="3" <#if "3"="${category.parent}">selected</#if>>生活</option>
                            <option value="4" <#if "4"="${category.parent}">selected</#if>>经管</option>
                            <option value="5" <#if "5"="${category.parent}">selected</#if>>科技</option>
                        </select>
                  </#if>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="layui-btn layui-btn-radius"><i class="fa fa-floppy-o" aria-hidden="true"></i> 保存</button>
                                <a href="/category/index">
                                    <button type="button" class="layui-btn layui-btn-normal layui-btn-radius">
                                        <i class="fa fa-hand-o-left" aria-hidden="true"></i> 取消</button>
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

</script>
</body>
</html>



