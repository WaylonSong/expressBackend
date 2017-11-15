<html>
<head>
    <title>financialItem-edit</title>
    <!-- Author: Song -->
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <div id="generalForm"/>
<script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    var url = "/financialItem/"+id;
    var pageParas ={
        formInit :[
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"number", alias:"订单编号"  } ,
                                        {name:"price", alias:"金额"  } ,
                                        {name:"type", alias:"收入类型"  }                      ],
        formExtend :[
        ],
        title : "修改financialItem",
        url : url,
        redirectUrl : "/financialItem/list",
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

