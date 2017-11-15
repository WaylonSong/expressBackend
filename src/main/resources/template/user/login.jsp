
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录</title>

    <meta charset="UTF-8" />
    <!--支持手机布局-->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=0.33333333, maximum-scale=0.33333333, minimum-scale=0.33333333" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        var sy = sy || {};
        sy.contextPath = '';
        sy.basePath = 'http://www.gzswl.gov.cn:80';
        sy.version = '20131115';
        sy.pixel_0 = '/style/images/pixel_0.gif';//0像素的背景，一般用于占位
    </script>
    <script src="/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/gzsIndex.css" />
    <script src='/js/jquery-2.1.1.min.js' type='text/javascript' charset='utf-8'></script>
    <script src="/js/bootstrap.js"></script>
    <!--如果浏览器版本小于等于IE8读取此处-->
    <!--[if lte IE 8]>
    <!--让媒体支持H5新标签-->
    <script src="/js/html5shiv.min.js"></script>
    <!--让浏览器支持媒体查询-->
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <!-- 模态框 -->
    <script>
        $(function() {
            if( !parent.Modal ){
                window.Modal = function() {
                    var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
                    var alr = $("#ycf-alert");
                    var ahtml = alr.html();

                    var _alert = function(options) {
                        alr.html(ahtml); // 复原
                        alr.find('.ok').removeClass('btn-success').addClass(
                                'btn-primary');
                        alr.find('.cancel').hide();
                        _dialog(options);

                        return {
                            on : function(callback) {
                                if (callback) {
                                    alr.find('.ok').click(function() {
                                        callback(true)
                                    });
                                }
                            }
                        };
                    };

                    var _confirm = function(options) {
                        alr.html(ahtml); // 复原
                        //	      alr.find('.ok').removeClass('btn-primary').addClass('btn-success');
                        alr.find('.cancel').show();
                        _dialog(options);

                        return {
                            on : function(callback) {
                                if (callback) {
                                    alr.find('.ok').click(function() {
                                        callback(true)
                                    });
                                    alr.find('.cancel').click(function() {
                                        callback(false)
                                    });
                                }
                            }
                        };
                    };

                    var _dialog = function(options) {
                        var ops = {
                            msg : "提示内容",
                            title : "操作提示",
                            btnok : "确定",
                            btncl : "取消"
                        };

                        $.extend(ops, options);

                        var html = alr.html().replace(reg, function(node, key) {
                            return {
                                Title : ops.title,
                                Message : ops.msg,
                                BtnOk : ops.btnok,
                                BtnCancel : ops.btncl
                            }[key];
                        });

                        alr.html(html);
                        alr.modal({
                            width : 500,
                            backdrop : 'static',
                            keyboard:false
                        });
                    }

                    return {
                        alert : _alert,
                        confirm : _confirm
                    }

                }();
            }else{
                window.Modal = parent.Modal;
            }
        });
    </script> <!-- 苏凯飞加的，请勿改动或删除 -->
    <div id="ycf-alert" class="modal fade bs-example-modal-lg1"
         tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">
                        <i class="fa fa-exclamation-circle"></i> [Title]
                    </h5>
                </div>
                <div class="modal-body small">
                    <h3>[Message]</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary ok"
                            data-dismiss="modal" style="background-color: #169bd5;">[BtnOk]</button>
                    <button type="button" class="btn btn-default cancel"
                            data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-lg1" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
        <div class="modal-dialog" style=" width:90%;">
            <div class="modal-content" style="padding:15px; ">
                <h1 id="pTitle" style="text-align:center"></h1>
                <hr>
                <div id="pContent">

                </div>
            </div>
        </div>
    </div> <link rel="stylesheet" href="/css/gzsIndex.css" />
    <script type="text/javascript"
            src="/js/login/bootstrapValidator_dl.js"></script>
    <script type="text/javascript" src="/js/gzsmenhu.js"></script>
    <script type="text/javascript">
        $(function() {
            // 回车键事件
            // 绑定键盘按下事件
            $(document).keypress(function(e) {
                // 回车键事件
                if(e.which == 13) {
                    $("button[type='submit']").click();
                    e.preventDefault();
                }
            });
            var f = $('#myForm').bootstrapValidator({
                message : 'This value is not valid',
                feedbackIcons : {
                    valid : 'glyphicon glyphicon-ok',
                    invalid : 'glyphicon glyphicon-remove',
                    validating : 'glyphicon glyphicon-refresh',
                },
                fields : {}
            }).on('success.form.bv', function(e) {
                e.preventDefault();
                $("#wyl_load_cover").css("display", "block");
                var code = $("#code").val();
                var uname = $("#uname").val();
                var upwd = $("#upwd").val();
                $.ajax({
                    url : '/enter',
                    data : {
                        code : code,
                        pwd : upwd,
                        uname : uname,
                        SAFSD : $("#SAFSD").attr("name"),
                        url:''
                    },
                    type : 'post',
                    success : function(result) {
                        if (result.success) {
                            location.href = result.msg;
                        } else {
                            Modal.alert({
                                msg : (result.msg)
                            });
                            changeImg();
                            $("#wyl_load_cover").css("display", "none");
                            $("button[type='submit']").removeAttr("disabled");
                            return false;
                        }
                    }
                })
            });
        });

        function changeImg(){
            $("#VC").attr("src","/verifycode/service?"+Math.random());
        }
    </script>
    <style>
        .has-success .form-control {
            border-color: #88d6f8;
        }
        .form-control {
            display: inline-block;
            height: 33px;
            padding: 0px 4px;
            border-radius: 0px;
        }
    </style>
</head>
<body id="wyl_load_back">
<div class="wyl_load_header">
    <div class="wyl_load_header_main">
        <a href="/index"><img src="/images/finally_logo.png" alt="" width="74px" /></a> <span style="margin-left: 0px;">贵州省物流公共信息服务平台</span>
       <!-- <p>
            <a href="/company/User" style="color: #fff;">没有账号？立即注册</a>
        </p>-->
    </div>
</div>
<div class="wyl_load_mid">
    <div id="wyl_load_cover"
         style="text-align: center; line-height: 350px; display: none;">
        <div
                style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; background: #fff; opacity: 0.8; z-index: 5;"></div>
        <img class="wyl_load_img" src="/images/loading_03.png" alt=""
             style="position: absolute; top: 50%; left: 50%; z-index: 10; margin: -40px 0 0 -40px;" />
    </div>
    <form action="/user/login" method="post" id='myForm'>
        <div class="wyl_load_mid_div form-group" style="margin-top: 40px;">
            <span class="wyl_load_mid_span">用户名</span> <input type="text"
                                                              class="form-control" required name="name"  id="uname"
                                                              error-bv-message="账号不能为空" />
            <div class="wyl_denglu_main_span" style="top: -100px;display:none;"></div>
        </div>
        <div class="wyl_load_mid_div form-group" style="margin-top: 25px;">
            <span class="wyl_load_mid_span">密码</span> <input type="password"
                                                             class="form-control" required name="password" id="upwd"
                                                             error-bv-message="密码不能为空" />
            <div class="wyl_denglu_main_span" style="top: -167px;display:none;"></div>
            <a class="wyl_load_mid_forget" style="margin-top: 10px;"> <img
                    src="/images/load_07.png" alt="" />
            </a>
            <div class="wyl_load_mid_fg" style="right: 141px;top: 8px;">
                <div>
                    <img src="/images/load_04.png" alt="" style="width: 240px;"/><span style="width: 240px;text-align: center;font-size: 12px;">如果忘记密码,请尽快联系管理员!</span>
                </div>
            </div>
        </div>
        <button type="submit"
                style="width: 100%; height: 40px; border: none; background: #1fa7eb; border-radius: 5px; color: #fff; margin-top: 18px;">登录</button>
        <div style="font-size:12px;color:red;margin: 20px">${Request.errorMsg!""}</div>
    </form>
</div>
<script>
    $(function() {
        $(".wyl_load_mid_forget").hover(function() {
            $(".wyl_load_mid_fg").css("display", "block");
        }, function() {
            $(".wyl_load_mid_fg").css("display", "none");
        });
        $("label").click(function(){
            if($(this).find("img").attr("name")=='true'){
                $(this).find("img")[0].src = "/images/loading_15.png";
                $(this).find("img").attr("name","false")
            }else{
                $(this).find("img")[0].src = "/images/load_15.png";
                $(this).find("img").attr("name","true")
            }
        })
    })
    times();
    var deg = 0;
    function times() {
        setInterval(function() {
            deg++;
            $(".wyl_load_img").css({
                "transform" : "rotate(" + deg + "deg)",
                "-ms-transform" : "rotate(" + deg + "deg)",
                "-moz-transform" : "rotate(" + deg + "deg)",
                "-webkit-transform" : "rotate(" + deg + "deg)",
                "-o-transform" : "rotate(" + deg + "deg)"
            });
        }, 0);
    }
</script>
</body>
</html>