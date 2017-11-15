<html>
<head>
    <title>首页</title>
    <!-- Author: Song -->
    <#include "common/header.jsp"/>
</head>
<body>
    <div id="wrapper">
        <#include "common/side.jsp"/>
        <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-head-line">欢迎光临</h1>
                            <h1 class="page-subhead-line">贵州省物流公共信息服务平台</h1>

                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="main-box mb-red">
                                <a href="/orderT/list">
                                    <i class="fa fa-bolt fa-5x"></i>
                                    <h5>订单管理</h5>
                                </a>
                            </div>
                        </div>
                        <#if Session.user="园区管理">
                            <div class="col-md-4">
                                <div class="main-box mb-dull">
                                    <a href="/inStorage/list">
                                        <i class="fa fa-plug fa-5x"></i>
                                        <h5>库存管理</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="main-box mb-pink">
                                    <a href="/financialItem/list">
                                        <i class="fa fa-dollar fa-5x"></i>
                                        <h5>财务管理</h5>
                                    </a>
                                </div>
                            </div>
                        </#if>
                        <#if Session.user="企业客户">
                            <div class="col-md-4">
                                <div class="main-box mb-pink">
                                    <a href="/orderReturn/list">
                                        <i class="fa fa-dollar fa-5x"></i>
                                        <h5>退货管理</h5>
                                    </a>
                                </div>
                            </div>
                        </#if>

                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div id="carousel-example" class="carousel slide" data-ride="carousel" style="border: 5px solid #000;">

                                <div class="carousel-inner">
                                    <div class="item active">

                                        <img src="/images/slideshow/1.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="/images/slideshow/2.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="/images/slideshow/3.jpg" alt="" />

                                    </div>
                                </div>
                                <!--INDICATORS-->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example" data-slide-to="1"></li>
                                    <li data-target="#carousel-example" data-slide-to="2"></li>
                                </ol>
                                <!--PREVIUS-NEXT BUTTONS-->
                                <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    最近留言
                                </div>
                                <div class="panel-body" style="padding: 0px;">
                                    <div class="chat-widget-main">


                                        <div class="chat-widget-left">
                                            对这次配送非常满意，速度很快，态度赞.
                                        </div>
                                        <div class="chat-widget-name-left">
                                            <h4>宋**</h4>
                                        </div>
                                        <div class="chat-widget-right">
                                            期待下一次合作.
                                        </div>
                                        <div class="chat-widget-name-right">
                                            <h4>刘**</h4>
                                        </div>
                                        <div class="chat-widget-left">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        </div>
                                        <div class="chat-widget-name-left">
                                            <h4>Meng **</h4>
                                        </div>
                                        <div class="chat-widget-left">
                                            非常好的体验,送货及时.
                                        </div>
                                        <div class="chat-widget-name-left">
                                            <h4>黄 **</h4>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        <#include "common/footer.jsp"/>
    </div>
</body>
</html>
