<html>
<head>
    <title>退货处理</title>
    <!-- Author: Song -->
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include  "../common/side.jsp"/>
    <#include  "../common/main.jsp"/>
    <div id="orderReturnForm"/>
<script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    var url = "/orderReturn/"+id;
    var pageParas ={
        formInit :[
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"number", alias:"订单编号"  } ,
                                        {name:"state", alias:"处理状态"  }                      ],
        formExtend :[
        ],
            <#if Session.user="企业客户">userMode:true,</#if>
        title : "退货处理",
        url : url,
        redirectUrl : "/orderReturn/list",
        method : "put"
        /*
       example:
       {name:"id", alias:"价格(元)", type:"delete", defaultValue:"1234"},
       {name:"price", alias:"价格(元)", type:"password",validator:{dataType:"number",notNull:true}},
       {name:"mobile", alias:"手机", validator:{dataType:"mobile",notNull:true}},
       {name:"state", alias:"状态", type:"select", options:["上架","下架"]},
       {name:"email", alias:"邮箱",validator:{dataType:"email", minLength:"5", maxLength:"10", notNull:true}},
       * */
    }

</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>

