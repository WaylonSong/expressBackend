<html>
<head>
    <title>创建订单</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <div id="generalForm"/>
    <script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var pageParas ={
        formInit :[
                    {name:"id", placeholder:"id"} ,
            {name:"companyName", placeholder:"companyName"} ,
            {name:"productName", placeholder:"productName"} ,
                    {name:"count", placeholder:"count"} ,
                    {name:"description", placeholder:"description"} ,
                    {name:"mobile", placeholder:"mobile"} ,
                    {name:"destination", type:"select", options:["北京","上海","天津","广东","贵州","云南","四川"]} ,
                    {name:"transTime", value:moment().format('YYYY-MM-DD hh:mm:ss')} ,
                    {name:"price", placeholder:"price",type:"number"} ,
                    {name:"storageCubCount", placeholder:"number",type:"number"}                             ],
        formExtend :[
                    {name:"id", alias:"id" ,type:"hidden" } ,
                            {name:"productName", alias:"货物名称" ,validator:{notNull:true  } } ,
                            {name:"count", alias:"货物数量"  } ,
                            {name:"description", alias:"描述"  } ,
                            {name:"companyName", alias:"发货企业名称",validator:{notNull:true  } } ,
                            {name:"mobile", alias:"手机号码" ,validator:{dataType:"mobile",notNull:true  } } ,
                            {name:"destination", alias:"目的地"  } ,
                            {name:"transTime", alias:"运送时间"  } ,
                            {name:"price", alias:"价格",validator:{notNull:true  } },
                            {name:"storageCubCount", alias:"仓储数量",validator:{notNull:true} }                  ],
        title : "添加订单",
        url : "/orderT",
        redirectUrl : "/orderT/list",
        method : "post"
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
