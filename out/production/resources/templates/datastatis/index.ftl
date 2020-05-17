<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>书城管理系统</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <link rel="shortcut icon" href="/img/favicon.ico"/>
    <style type="text/css" rel="stylesheet">
        .layui-nav-item:hover>a{
            text-decoration: none !important;
        }
        .la-input{
            width: 18px;
            height: 18px;
        }
        .pagination{
            /*margin: 0 auto;*/
            margin-left: 20px;
        }
        .sel{
            width: 194px !important;
            height: 38px !important;
        }
        .layui-this{
            background: #00aced;
            color: #FFFFFF !important;
        }
        .booknav{
            display: inline-block;
            margin-right: 30px;
            overflow: hidden;/*超出部分隐藏*/
            white-space: nowrap;/*不换行*/
            text-overflow:ellipsis;/
        }
        .redcom{
            color: #12140d;
            cursor:pointer;
        }
        .redcom:hover{
            color: #844dff;
        }
        .titext{
            color: red;
            font-size: 30px;
            margin-left: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <#include '../commen/header.ftl'>
    <div class="layui-body" style="background: #f5f5f5;padding:10px 30px">
        <!-- 内容主体区域 -->
        <div class="layui-tab">
            <ul class="layui-tab-title" style="background: #fff">
                <li class="layui-this">浏览量</li>
                <li>购买量</li>
                <li>订单</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-row">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">浏览量排行榜</div>
                            <div class="layui-card-body">
                                <ul class="layui-timeline">
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">
                                                <span class="booknav" style="width: 50px">序号</span>
                                                <span class="booknav" style="width: 100px">浏览量</span>
                                                <span class="booknav " style="width: 160px">书名</span>
                                                <span class="booknav" style="width: 100px">上架日期</span>
                                                <span class="booknav changes">操作</span>
                                            </div>
                                        </div>
                                    </li>
                                <#list lookdata as c>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                              <div class="layui-timeline-content layui-text">
                                              <div class="layui-timeline-title">
                                             <span class="booknav" style="width: 50px">${c_index+1} </span>
                                              <span class="booknav" style="width: 100px">${c.bookLookmount!''}次</span>
                                            <span class="booknav" style="width: 160px">${c.name!''}</span>
                                                 <span class="booknav" style="width: 100px">${(c.indate)?string('yyyy-MM-dd')}</span>
                                                   <#if "0"="${c.state!''}"||"2"="${c.state!''}">
                                                 <span class="booknav redcom redcomhos" onclick="tograges('${c.id}','1')">
                                                    推荐推送
                                                </span>
                                                   <#else>
                                                <span class="booknav" style="color: red;font-weight: bold">已是推荐书籍</span>
                                                   </#if>
                                                <#--<#if "0"="${c.state!''}"||"1"="${c.state!''}">-->
                                                 <#--<span class="booknav redcom" onclick="tograges('${c.id}','2')">-->
                                                    <#--热卖推送-->
                                                <#--</span>-->
                                                <#--<#else>-->
                                                <#--<span class="booknav" style="color: red;font-weight: bold">正在热卖中</span>-->
                                                <#--</#if>-->
                                        </div>
                                     </div>
                                   </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                        <div class="layui-col-md6">
                            <div class="layui-card">
                                <div class="layui-card-header">浏览量排行榜</div>
                                <div class="layui-card-body">
                                    <div id="main" style="width: 740px;height:624px;font-size: 40px"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="layui-tab-item">
                    <div class="layui-row">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">销量排行榜</div>
                            <div class="layui-card-body">
                                <ul class="layui-timeline">
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">
                                                <span class="booknav" style="width: 50px">序号</span>
                                                <span class="booknav" style="width: 100px">销量</span>
                                                <span class="booknav" style="width: 160px">书名</span>
                                                <span class="booknav" style="width: 100px">上架日期</span>
                                                <span class="booknav tsons">操作</span>
                                            </div>
                                        </div>
                                    </li>
                                <#list mount as c>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                    <div class="layui-timeline-content layui-text">
                                        <div class="layui-timeline-title">
                                            <span class="booknav" style="width: 50px">${c_index+1} </span>
                                            <span class="booknav" style="width: 80px">${c.bookDealmount!''}</span>
                                            <span class="booknav" style="width: 160px">${c.name!''}</span>
                                            <span class="booknav" style="width: 100px">${(c.indate)?string('yyyy-MM-dd')}</span>
                                             <#if "0"="${c.state!''}"||"1"="${c.state!''}">
                                                 <span class="booknav redcom tson" onclick="tograges('${c.id}','2')">
                                                    热卖推送
                                                </span>
                                             <#else>
                                                <span class="booknav" style="color: red;font-weight: bold">正在热卖中</span>
                                             </#if>
                                                <#--<#if "0"="${c.state!''}"||"2"="${c.state!''}">-->
                                                 <#--<span class="booknav redcom" onclick="tograges('${c.id}','1')">-->
                                                    <#--推荐推送-->
                                                <#--</span>-->
                                                <#--<#else>-->
                                                <#--<span class="booknav" style="color: red;font-weight: bold">已是推荐书籍</span>-->
                                                <#--</#if>-->
                                        </div>
                                    </div>
                                </li>
                                </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">书籍销量排行榜</div>
                            <div class="layui-card-body">
                                <div id="mains" style="width: 740px;height:624px;font-size: 40px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <div class="layui-tab-item">
                    <div class="layui-row">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">每天订单量统计</div>
                            <div class="layui-card-body">
                                <div id="mount" style="width: 740px;height:624px;font-size: 40px"></div>
                                <div class="totalmount titext"></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">每天销售总金额统计</div>
                            <div class="layui-card-body">
                                <div id="price" style="width: 740px;height:624px;font-size: 40px"></div>
                                <div class="totalprice titext"></div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

            </div>
        </div>
        <#--<div id="main" style="width: 1600px;height:600px;font-size: 40px"></div>-->
    </div>
    <div class="layui-footer">
        欢迎登录图书商城管理系统
    </div>
</div>





<script src="/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.2.0-rc.2/echarts-en.common.js"></script>
<#--<script src="/layer/layer.js"-->
<!--Local Stuff-->
<script type="text/javascript">

    var  dataname=[]
    var datatext=[]
var bookmount=[]

    var ordermount=[]
    var ordertimes=[]

    var orderprice=[]
    var ordertimeprice=[]
    function tograges(goodsid,index) {
        $.ajax({
            type:"POST",
            url :"/goods/getRecomd",
            data:{"state":index,"id":goodsid},
            success : function(data) {
                if(data.result=="success"){
                    window.location.reload();
                }
            },
            error:function (da) {
                alert(da)
            }
        });
    }

    var myChart = echarts.init(document.getElementById('main'));
    $.ajax({
        type:"get",
        url :"/goods/getLookdata",
        success : function(data) {
            if(data.result=="success"){
                data.data.map(res=>{
                    dataname.push(res.name);
                    datatext.push(res.bookLookmount)
                });
                var option = {
                    title: {
                        text: '书籍浏览量前十'
                    },
                    tooltip: {},
                    legend: {
                        data:['浏览量']
                    },
                    xAxis: {
                        data:['第一','第二','第三','第四','第五','第六','第七','第八','第九','第十']
                    },
                    yAxis: {},
                    series: [{
                        name: '浏览量',
                        type: 'bar',
                        data: datatext
                    }]
                };
                myChart.setOption(option);
            }
        }

    });

    var myCharts = echarts.init(document.getElementById('mains'));
    $.ajax({
        type:"get",
        url :"/goods/getmount",
        success : function(data) {
            if(data.result=="success"){
                data.data.map(res=>{
                    bookmount.push(res.bookDealmount);
                });
                var options = {
                    title: {
                        text: '书籍销量前十'
                    },
                    tooltip: {},
                    legend: {
                        data:['销量']
                    },
                    xAxis: {
                        data:['第一','第二','第三','第四','第五','第六','第七','第八','第九','第十']
                    },
                    yAxis: {},
                    series: [{
                        name: '销量',
                        type: 'bar',
                        data: bookmount
                    }]
                };
                myCharts.setOption(options);
            }
        }

    });

    var myChartsmount = echarts.init(document.getElementById('mount'));
    var totalmount=0
    $.ajax({
        type:"get",
        url :"/goods/selectGoodsCount",
        success : function(data) {
            if(data.result=="success"){
                data.data.map(res=>{
                    totalmount+=res.goodsCount
                    let date=new Date(res.orderTime);
                    let mount=date.getMonth()+1
                    let days=date.getDate()
                    ordermount.push(res.goodsCount);
                    ordertimes.push(mount+'-'+days);
                });
                $(".totalmount").html("总订单量："+totalmount)
                var optionsmount = {
                    title: {
                        text: '近十天的每天订单量'
                    },
                    tooltip: {},
                    legend: {
                        data:['销量']
                    },
                    xAxis: {
                        data:ordertimes
                    },
                    yAxis: {},
                    series: [{
                        name: '销量',
                        type: 'line',
                        data: ordermount
                    }]
                };
                myChartsmount.setOption(optionsmount);
            }
        }
    });

    var myChartsprice = echarts.init(document.getElementById('price'));
    var totalprice=0
    $.ajax({
        type:"get",
        url :"/goods/selectGoodsPrice",
        success : function(data) {
            if(data.result=="success"){
                data.data.map(res=>{
                    totalprice+=res.total
                    let date=new Date(res.orderTime);
                    let mount=date.getMonth()+1
                    let days=date.getDate()
                    orderprice.push(res.total);
                    ordertimeprice.push(mount+'-'+days);
                });
                $(".totalprice").html("总交易金额："+totalprice.toFixed(2))
                var optionsprice = {
                    title: {
                        text: '近十天的每天交易金额'
                    },
                    tooltip: {},
                    legend: {
                        data:['金额']
                    },
                    xAxis: {
                        data:ordertimeprice
                    },
                    yAxis: {},
                    series: [{
                        name: '金额',
                        type: 'bar',
                        data: orderprice
                    }]
                };
                myChartsprice.setOption(optionsprice);
            }
        }
    });


    $(function () {
        layui.use([ 'element', 'layer'],function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            var layer = layui.layer //引入layer
            $(".redcomhos").mouseover(function() {
                layer.tips('点击可进行热卖推送。', '.changes', {
                    tips: [1, '#3595CC'],
                    time: 1500
                });
            });

            $(".tson").mouseover(function() {
                layer.tips('点击可进行推荐推送。', '.tsons', {
                    tips: [1, '#3595CC'],
                    time: 1500
                });
            });

        });
    })

</script>
</body>
</html>
