<html>
<head>
    <title>orderT-edit</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="orderForm"></div>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    var url = "/orderT/"+id;
    var pageParas ={
        formInit :[
            {name:"id", alias:"id" ,type:"hidden" } ,
            {name:"companyName", alias:"企业名称"  } ,
            {name:"number", alias:"订单编号"  } ,
            {name:"productName", alias:"货物名称"  } ,
            {name:"count", alias:"货物数量"  } ,
            {name:"description", alias:"描述"  } ,
            {name:"mobile", alias:"手机号码"  } ,
            {name:"destination", alias:"目的地"  } ,
            {name:"transTime", alias:"运送时间"  } ,
            {name:"price", alias:"价格"  } ,
            {name:"state", alias:"订单状态"  } ,
            {name:"storageCubCount", alias:"仓储数量"  }                  ],
        formExtend :[
        ],
        title : "订单处理",
        url : url,
        redirectUrl : "/orderT/list",
            <#if Session.user="企业客户">userMode:true,</#if>
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

