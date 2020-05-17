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

        <!-- 内容主体区域 -->
        <div class="panel panel-info" style="border-color:#f6f6f6">
            <div class="panel-heading">
                <h3 class="panel-title">分类编辑</h3>
            </div>
            <div class="panel-body" >
                <div class="col-sm-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">大图浏览</div>
                        <div class="panel-body">
                            <image src="${goods.image!''}" width="240px" height="300px" class="flex-logo" id="imgbg"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10">
                    <form class="form-horizontal" role="form" action="/goods/save" enctype="multipart/form-data" method="post">

                        <div class="row">
                        <#--左边-->
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-6">
                                        <input type="text" name="id" value="${goods.id!""}" hidden>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">封面图</label>
                                    <div class="col-sm-4">
                                        <image src="${goods.image!''}" width="120px" height="160px" class="flex-logo" id="imageId"/>
                                        <div class="btton">
                                            上传封面图
                                            <input type="file" id="fileId" name="upfile"
                                                   autocomplete="off"  style="opacity: 0;" class="fa-plus-text" value="${goods.image!''}">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">名称</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="name" name="name" value="${goods.name!""}"
                                               autocomplete="off" placeholder="名称" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">原价</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="originalprice" name="originalprice" value="${goods.originalprice!""}"
                                               autocomplete="off" placeholder="原价" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">折扣</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="rate" name="rate" value="${goods.rate!""}"
                                               autocomplete="off" placeholder="折扣" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">折扣价</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="discountprice" name="discountprice" value="${goods.discountprice!""}"
                                               autocomplete="off" placeholder="折扣价" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">状态</label>
                                    <div class="col-sm-6">
                  <#if "${goods.state!''}"="">
                      <label class="col-sm-4">
                          <input type="radio" name="state" value="0"  checked>
                          普通
                      </label>
                      <label  class="col-sm-4">
                          <input type="radio" name="state" value="1" >
                          推荐
                      </label>
                      <label  class="col-sm-4">
                          <input type="radio" name="state" value="2" >
                          热卖
                      </label>
                  <#else>
                    <label  class="col-sm-4">
                        <input type="radio" name="state" value="0" title="普通"  <#if "0"="${goods.state}">checked</#if>>
                        普通
                    </label>
                  <label  class="col-sm-4">
                      <input type="radio" name="state" value="1" title="推荐" <#if "1"="${goods.state}">checked</#if>>
                      推荐
                  </label>
                  <label  class="col-sm-4">
                      <input type="radio" name="state" value="2" title="热卖" <#if "2"="${goods.state}">checked</#if>>
                      热卖
                  </label>
                  </#if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">审核状态</label>
                                    <div class="col-sm-6">
                  <#if "${goods.grade!''}"="">
                      <label class="col-sm-5">
                          <input type="radio" name="grade" value="0"  checked>
                          审核中
                      </label>
                      <label  class="col-sm-5">
                          <input type="radio" name="grade" value="1" >
                          不通过
                      </label>
                      <label  class="col-sm-5">
                          <input type="radio" name="grade" value="2" >
                          上架
                      </label>
                      <label  class="col-sm-5">
                          <input type="radio" name="grade" value="3" >
                          下架
                      </label>
                  <#else>
                    <label  class="col-sm-5">
                        <input type="radio" name="grade" value="0" title="审核中"  <#if "0"="${goods.grade}">checked</#if>>
                        审核中
                    </label>
                  <label  class="col-sm-5">
                      <input type="radio" name="grade" value="1" title="不通过" <#if "1"="${goods.grade}">checked</#if>>
                      不通过
                  </label>
                      <label  class="col-sm-5">
                          <input type="radio" name="grade" value="2" title="上架" <#if "2"="${goods.grade}">checked</#if>>
                          上架
                      </label>
                      <label  class="col-sm-5">
                          <input type="radio" name="grade" value="3" title="上架" <#if "3"="${goods.grade}">checked</#if>>
                          下架
                      </label>
                  </#if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">库存</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="stock" name="stock" value="${goods.stock!""}"
                                               autocomplete="off" placeholder="库存" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">标签</label>
                                    <div class="col-sm-6">
                                        <input type="text" maxlength="20" id="booklabel" name="booklabel" value="${goods.booklabel!""}"
                                               autocomplete="off" placeholder="标签" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">出版社</label>
                                    <div class="col-sm-6">
                                        <input type="text" maxlength="20" id="bookPress" name="bookPress" value="${goods.bookPress!""}"
                                               autocomplete="off" placeholder="出版社" class="layui-input" required>
                                    </div>
                                </div>
                            </div>
                        <#--右边-->
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">类别</label>
                                    <div class="col-sm-3">
                                <#if "${goods.category!''}"="">
                                    <select  id="selectpra" class="form-control sel" required>
                                        <option value="" selected disabled>请选择一级分类</option>
                                        <option value="0">文学</option>
                                        <option value="1">流行</option>
                                        <option value="2">文化</option>
                                        <option value="3">生活</option>
                                        <option value="4">经管</option>
                                        <option value="5">科技</option>
                                    </select>
                                <#else>
                                 <select id="selectpra"  class="form-control sel" required>
                                 <#--<option value="" selected disabled></option>-->
                                     <option value="0" <#if "0"="${goods.category.parent!''}">selected</#if>>文学</option>
                                     <option value="1" <#if "1"="${goods.category.parent!''}">selected</#if>>流行</option>
                                     <option value="2" <#if "2"="${goods.category.parent!''}">selected</#if>>文化</option>
                                     <option value="3" <#if "3"="${goods.category.parent!''}">selected</#if>>生活</option>
                                     <option value="4" <#if "4"="${goods.category.parent!''}">selected</#if>>经管</option>
                                     <option value="5" <#if "5"="${goods.category.parent!''}">selected</#if>>科技</option>
                                 </select>
                                </#if>

                                    </div>
                                    <div class="col-sm-3">
                                        <select id="cate" name="categoryDate" class="form-control sel" required>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">商家</label>
                                    <div class="col-sm-4">
                  <#if "${goods.seller!''}"="">
                      <select name="sellerDate" class="form-control sel">
                          <#list seller as s>
                              <option value="${s.id}">${s.realname}</option>
                          </#list>
                      </select>
                  <#else>
                        <select name="sellerDate" class="form-control sel">
                             <#list seller as s>
                              <option value="${s.id}" <#if "${s.id}"="${goods.seller.id}">selected</#if>>${s.realname}</option>
                             </#list>
                        </select>
                  </#if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">出版日期</label>
                                    <div class="col-sm-6">
                                        <input type="date" class="layui-input" id="bookPubDate"
                                               name="bookPubDates" placeholder="出版日期"
                                               value="${((goods.bookPubDate)?string('yyyy-MM-dd'))!""}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">版次</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="bookVersion" name="bookVersion" value="${goods.bookVersion!""}"
                                               autocomplete="off" placeholder="版次" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">作者</label>
                                    <div class="col-sm-6">
                                        <input type="text" maxlength="20" id="bookAuthor" name="bookAuthor" value="${goods.bookAuthor!""}"
                                               autocomplete="off" placeholder="作者" class="layui-input" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">图书译者</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="bookTanslor" name="bookTanslor" value="${goods.bookTanslor!""}"
                                               autocomplete="off" placeholder="图书译者" class="layui-input" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">图书ISBN</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="bookisbn" name="bookisbn" value="${goods.bookisbn!""}"
                                               autocomplete="off" placeholder="图书ISBN" class="layui-input" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company"  class="col-sm-2 control-label">页码</label>
                                    <div class="col-sm-6">
                                        <input type="text"  id="bookPages" name="bookPages" value="${goods.bookPages!""}"
                                               autocomplete="off" placeholder="页码" class="layui-input" >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">购买数量</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="bookDealmount" name="bookDealmount" value="${goods.bookDealmount!""}"
                                               autocomplete="off" placeholder="购买数量" class="layui-input" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">目录</label>
                                    <div class="col-sm-8">
                                  <textarea id="bookCatalog" rows="6" maxlength="399" name="bookCatalog"
                                            placeholder="目录" class="layui-textarea">${goods.bookCatalog!""}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">图书简介</label>
                                    <div class="col-sm-8">
                                <textarea id="bookOutline" maxlength="399" rows="6" name="bookOutline"
                                          placeholder="图书简介" class="layui-textarea">${goods.bookOutline!""}</textarea>

                                    </div>
                                </div>
                            </div>
                        </div>

                    <#--<div class="form-group">-->
                    <#--<label for="company" class="col-sm-2 control-label">浏览次数</label>-->
                    <#--<div class="col-sm-4">-->
                    <#--<input type="text" id="bookLookmount" name="bookLookmount" value="${goods.bookLookmount!""}"-->
                    <#--autocomplete="off" placeholder="浏览次数" class="layui-input" >-->
                    <#--</div>-->
                    <#--</div>-->


                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="submit" class="layui-btn layui-btn-radius">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i> 保存</button>
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
</div>





<script src="/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>

<!--Local Stuff-->
<script>
    $(function () {


            <#if "${goods.category!''}"!="">
                        getCte(${goods.category.parent});
                    var par=${goods.category.id}
                      $("#cate option").each(function(){
                          var txt = $(this).val();   //获取option值
                          alert(txt)
                          if(par==txt){
                              $(this).attr("selected", true);
                          }
                      })
            </#if>

        $('#selectpra').change(function() {
            var parents=""
            parents=$(this).val()
            getCte(parents)

        })

        function getCte(parents){
            $.ajax({
                type:"GET",
                url :"/goods/getCategoryText?parent="+parents,
                success : function(data) {
                    if(data!=""){
                        $("#cate").empty();
                        for (var i=0;i<data.length;i++){
                            $("#cate").append("<option value='" + data[i].id + "'>" + data[i].text + "</option>")
                        }

                    }
                },
                error:function (da) {

                }
            });
        }

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
    })

</script>
</body>
</html>

