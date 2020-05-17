<#assign base=request.contextPath/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>广商商城</title>
    <#--<link rel="stylesheet" href="../css/index.css">-->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li>
                    <#if Session.customer?exists>
                         欢迎您：<span style="color: #f3fc4c;margin-right: 10px">${Session.customer.realname}</span>
                     <li>|</li>
            <a style="color: #ffffff;margin-left: 10px" href="/customer/logout"><span>退出</span></a>
                    <#else>
                    <a href="/customer/loginUI">登陆</a></li>

                <li>|</li>
                <li><a href="/customer/add">免费注册</a></li>
                    </#if>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">


<#if Session.customer?exists>
<#else>
<div class="gouwuche fr"><a href="/customer/loginUI">购物车</a></div>
</#if>
            <div class="fr">
                <ul>
                    <li><a href="#">网页导栏</a></li>
                    <li>|</li>
                    <li><a href="#">联系客服</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>


<!-- 最外面的div，用来控制整体页面内容居中 -->
<div id="container">
    <div class="cls"></div>
    <!-- 导航 -->
    <#--<a href=""><div class="ad_top fl"></div></a>-->
    <nav class="nav1">
        <a href="#">淘抢购</a>
        <a href="#">电器城</a>
        <a href="#">司法拍卖</a>
        <a href="#">中国质造</a>
        <a href="#">特色中国</a>
        <a href="#">阿里旅行</a>
        <a href="#">智能生活</a>
    </nav>
    <div class="cls"></div>
    <!-- 中间主体内容 -->
    <div id="main">
        <!-- 左侧菜单，边框，左浮 -->
        <!-- 左侧菜单，边框，左浮 -->
        <div id="lside" class="box fl">
            <!-- 左侧菜单标题 -->
            <div class="subtitle">
                最新上架
            </div>
            <!-- 左侧菜单内容链接 -->

            <ul>
                <li><a href="#">美食/生鲜/零食</a></li>
                <li><a href="#">箱包</a></li>
                <li><a href="#">床上用品</a></li>
            </ul>

        </div>
        <!-- 左侧内容，边框，左浮 -->
        <div id="rside" class="box fl ">
            <!-- 商品div -->
        <#list goodses as goods>
            <div class="sp box">
                <div hidden>
                    <input type="text" value="${goods.id}" name="goodsID">
                </div>
                <!-- 上部商品图片div -->
                <div class="pic">
                <#--<img src="/img/${goods.image}" alt="">-->
                    <img src="${base}/${goods.image}" alt="" class="img12" >
                </div>
                <!-- 下部商品概况div -->
                <div class="content">
                    <!-- 第一行：商品价格，包邮，购买人数 -->
                    <div class="row row1">
                        <!-- 价格 -->
                        <div class="fl">
                            <strong class="rmb">￥</strong>
                            <strong>${goods.discountprice}</strong>
                            <img src="${base}/baoyou.png" alt="">
                        </div>
                        <!-- 购买人数 -->
                        <div class="count fr">
                            <span>销量:</span>
                            <span>227</span>
                        </div>
                    </div>
                    <!-- 第二行：商品简介 -->
                    <div class="row row2 des">
                        <a href="">
                            ${goods.name}
                        </a>
                    </div>
                    <!-- 第三行：商家信息（商家名称，商家定位） -->
                    <div class="row row3">
                        <!-- 商家名称 -->
                        <div class="shopname fl">
                            <a href="#">进哥零食</a>
                        </div>
                        <!-- 商家定位 -->
                        <div class="shopLocation fr">
                            重庆
                        </div>
                    </div>
                    <div class="cls"></div>
                    <!-- 第四行：包装规格，运费险，金牌卖家-->
                    <div class="row row4">
                        <!-- 包装规格-->
                        <div class="size fl">
                            9.9/700g
                        </div>
                        <!-- 运费险-->
                        <div class="yfx fl">
                            <img src="${base}/yunfeixian.png" alt="">
                        </div>

                        <div class="golden fl">
                            <img src="${base}/goldenSeller.png" alt="">
                        </div>
                        <div class="fr">
                            <img src="${base}/addcart.png" style="cursor:pointer" alt="加入购物车" name="addToCart"
                                 value="${goods.id}"/>
                        </div>
                    </div>
                </div>
            </div>
        </#list>
        </div>
    </div>
    <!-- 清除浮动 -->
    <div class="cls"></div>
    <!-- 底部版权 -->
    <footer>
        联系我们 | @Copyright 广商商城　2018-2019
    </footer>
</div>
${base}
</body>
</html>




<script>
    $("img[name='addToCart']").onclick(function (e) {
//        debugger;
        var id = e.currentTarget.attributes.value.value;
        // var id = this.attributes.value.value;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               // document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
               // alert(id);
            }
        }
        xmlhttp.open("get", "/order/addToCart?id=" + id, true);
        xmlhttp.send(null);
    });
</script>



<style>
    body {
        font-size: 16px;
    }

    header{width: 100%;height: 60px;background: #333}
    header .top{width: 1226px;height: 40px;line-height: 40px;}
    header .top .left ul li{float: left;font-size: 14px;color: #ccc;}
    header .top .left ul li a{display:block;padding:0 8px;font-size: 14px;font-family: Times New Roman;color: #b0b0b0;}
    header .top .left ul li a:hover{color:#fff;}
    header .top .right ul li{float: left;font-size: 12px;color: #ccc;}
    header .top .right ul li a{display:block;padding:0 8px;font-size: 18px;font-family: Times New Roman;color: #b0b0b0;}
    header .top .right ul li a:hover{color:#fff;}
    header .top .right .gouwuche a{color:#fff;}
    header .top .right .gouwuche{margin:0 20px;background: #424242;width: 120px;text-align: center;font-size: 14px;cursor:pointer;background: #ff6700;color: #fff;}

    header .top .right .gouwuche:hover{color:#000;background: #666;}

    .center{margin: 0 auto;}

    .clear{clear:both;}

    header .top .right .gouwuche:hover{color:#000;background: #666;}

    /*列表项去掉前面的点*/
    li {
        list-style-type: none;
    }

    /*链接去掉下划线*/
    a {
        text-decoration: none;
    }

    /*整个容器宽度1000px，外间距上下0，左右自动，以保证页面整体内容居中*/
    #container {
        width: 1000px;
        margin: 0 auto;
    }

    /*顶部登录注册我的淘宝*/
    .site-nav {
        margin: 0 auto;
        width: 1200px;
        height: 50px;
        line-height: 35px;
        background: #666666;
    }
.nav1{
    margin-left: 200px;
}
.nav1 a{
    color: #333333;
}




    /*.site-nav ul li {*/
        /*margin: 0 10px;*/

    /*}*/

    /*.site-nav ul li a {*/

    /*}*/

    /*顶部左侧图片*/
    header img {
        margin-left: 20px;
    }

    /*导航外部间距上下15px，左右0，内部上下左右间距5px*/
    nav {
        margin: 15px 0;
        padding: 5px;
    }

    /*导航每个选项的内间距*/
    nav a {
        padding: 5px;
    }

    /*导航选择鼠标经过时的效果，文字白色，背景橘黄*/
    nav a:hover {
        color: white;
        background: orange;
    }

    /*左侧菜单div:宽度20%，高度400px*/
    #lside {

        width: 20%;
        height: 400px;
    }

        /*  左侧菜单链接效果：块状，内部上下间距5px，左右0
        外部间距上0右10下0左-15 */
    #lside a {

        color: #343434;
        display: block;
        padding: 5px 0;
        /*margin: 0 10px 0 -10px;*/
    }

    /*左侧菜单链接鼠标经过时的效果：背景黄色，白色字样*/
    #lside a:hover {
        background: #4a91ff;
        color: white;
    }



    /*右侧内容div：宽度75%，无高度，自动按内容撑开*/
    #rside {
        width: 75%;
    }

    /*左浮动*/
    .fl {
        float: left;
    }

    /*右浮动*/
    .fr {
        float: right;
    }

    /*清除浮动*/
    .cls {
        clear: both;
    }

    /*边框效果：边框1px，实线，浅灰，外间距10px*/
    .box {
        border: 1px solid #ededed;
        margin: 10px;

    }

    .box1{
        box-shadow: 1px 1px 5px #343434;
    }

    /*标题效果：文本居中，背景橙黄，白色文字，字体'微软雅黑'*/
    .subtitle {
        padding: 2px 0;
        text-align: center;
        background: #000;
        color: white;
        height: 30px;
        font-family: '微软雅黑';
    }

    /*‘请登录’文本效果：橙黄文字*/
    /*.login {*/
        /*color: orange;*/
    /*}*/

    /*!*鼠标经过时的效果*!*/
    /*.register:hover {*/
        /*color: orange;*/
    /*}*/

    /*.shoppingcart:hover {*/
        /*color: orange;*/
    /*}*/

    /*底部版权效果：高度，行高，这二个参数值一样，保证文本垂直居中
    文本横向居中，背景浅灰*/
    footer {
        height: 30px;
        line-height: 30px;
        text-align: center;
        background: #F1F1F1;
    }

    /*******以下是商品div的效果设置**********/

    /*商品div效果：*/
    .sp {
        width: 220px;
        height: 360px;
        margin-right: 17px;
        margin-top: 2px;
        float: left;
    }

    /*商品描述中的文字颜色效果，隐藏溢出的文字*/
    .des a {
        color: #3c3c3c;
        overflow: hidden;
    }

    /*商品描述中的链接在鼠标经过时的效果*/
    .des a:hover {
        color: #f60;
        text-decoration: underline;
    }

    /*商品div鼠标经过时效果：边框变红色*/
    .sp:hover {
        border: 1px solid #f40;
    }

    /*图片效果*/
    .pic {
        width: 220px;
        height: 220px;
        overflow: hidden;
    }
.img12{
    width: 220px;
    height: 220px;
}
    /*购买人数*/
    .count {
        color: gray;
        font-size: 12px;
    }

    /*整体行*/
    .row {
        padding: 0 10px;
    }

    /*第一行*/
    .row1 {
        margin-top: 8px;
        color: #F40;
        font-family: verdana, arial;
        height: 30px;
        line-height: 30px;
    }

    /*包邮文字效果*/
    .row1 img {
        height: 17px;
        width: 25px;
    }

    /*第二行*/
    .row2 {
        font-size: 12px;
        margin-top: 5px;
        height: 20px;
        /*color:#F40;*/
    }

    /*第三行*/
    .row3 {
        font-size: 12px;
        margin-top: 5px;
        height: 30px;
        line-height: 30px;
    }

    /*第四行*/
    .row4 {
        font-size: 12px;
        margin-top: 5px;
    }

    /*运费险 金牌卖家图标效果*/
    .yfx .golden {
        height: 30px;
        line-height: 30px;
        margin-right: 5px;
    }

    /*商家名称*/
    .shopname {
        overflow: hidden;
        font-size: 12px;
        color: gray;
        text-decoration: underline;
    }

    /*商家名称在鼠标经过时的效果*/
    .shopname a {
        color: gray;
    }

    /*商家定位*/
    .shopLocation {
        overflow: hidden;
        color: gray;
        font-size: 12px;
    }

    /* 包装规格*/
    .size {
        float: left;
        border: 1px solid #ffd580;
        line-height: 22px;
        background:#83c44e;
        padding: 0 3px;
        font-size: 12px;
        margin-right: 5px;
    }

    /*人民币符号￥，设置为负数，为了拉近后面的数字*/
    .rmb {
        margin-right: -7px;
    }

</style>