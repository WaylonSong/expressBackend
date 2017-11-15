<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">贵州物流云</a>
    </div>
    <div class="header-right">
        <a style="width:16px;height:16px;color: #fff;font-size: 20px;" href="/user/logout" class="btn glyphicon glyphicon-off" title="退出"></a>
    </div>
</nav>
<!-- /. NAV TOP  -->
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">

            <li>
                <div class="user-img-div">
                    <#if Session.user="企业客户">
                        <img src="/images/user.gif" class="img-thumbnail" />
                    <#else>
                        <img src="/images/user.png" class="img-thumbnail" />
                    </#if>
                    <div class="inner-text">
                        欢迎, ${Session.user!"用户"}
                        <br />
                        <!-- <small>Last Login : 2 Weeks Ago </small> -->
                    </div>
                </div>

            </li>

            <#if Session.user="企业客户">
            <li>
                <a href="#"><i class="fa fa-desktop "></i>订单管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/orderT/add"><i class="fa fa-toggle-on"></i>创建订单</a>
                    </li>
                    <li>
                        <a href="/orderT/list"><i class="fa fa-bell "></i>订单列表</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-desktop "></i>退货管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/orderReturn/add"><i class="fa fa-dashboard"></i>申请退货</a>
                    </li>
                    <li>
                        <a href="/orderReturn/list"><i class="fa fa-toggle-on"></i>退货列表</a>
                    </li>
                </ul>
            </li>
            </#if>

            <#if Session.user="园区管理">
                <li>
                    <a href="#"><i class="fa fa-desktop "></i>订单管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/statistics/dailyOrder"><i class="fa fa-dashboard"></i>订单统计</a>
                        </li>
                        <li>
                            <a href="/orderT/add"><i class="fa fa-toggle-on"></i>创建订单</a>
                        </li>
                        <li>
                            <a href="/orderT/list"><i class="fa fa-bell "></i>订单列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-yelp "></i>入库管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/inStorage/list"><i class="fa fa-flask"></i>入库单列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-anchor "></i>出库管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/outStorage/list"><i class="fa fa-code"></i>出库单列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-car "></i>车辆管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/car/add"><i class="fa fa-toggle-on"></i>车辆添加</a>
                        </li>
                        <li>
                            <a href="/car/list"><i class="fa fa-coffee"></i>车辆列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cube "></i>仓位管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/storageCube/add"><i class="fa fa-toggle-on"></i>仓位添加</a>
                        </li>
                        <li>
                            <a href="/storageCube/list"><i class="fa fa-coffee"></i>仓位列表</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-desktop "></i>退货管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/orderReturn/add"><i class="fa fa-dashboard"></i>申请退货</a>
                        </li>
                        <li>
                            <a href="/orderReturn/list"><i class="fa fa-toggle-on"></i>退货列表</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-bank "></i>财务管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/financialItem/list"><i class="fa fa-desktop"></i>财务数据</a>
                        </li>
                    </ul>
                </li>
            </#if>
        </ul>
    </div>
</nav>
<!-- /. NAV SIDE  -->
<script src="/js/jquery-2.2.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/custom.js"></script>