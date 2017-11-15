<html>
<head>
    <title>car-edit</title>
    <!-- Author: Song -->
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="generalForm"/>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    var url = "/car/"+id;
    var pageParas ={
        formInit :[
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"number", alias:"车牌号"  } ,
                                        {name:"driver", alias:"司机"  } ,
                                        {name:"capacity", alias:"容积"  } ,
                                        {name:"description", alias:"描述"  } ,
                                        {name:"state", alias:"车辆状态",type:"select",options:["可用","运输在途"] }                      ],
        formExtend :[
        ],
        title : "车辆信息维护",
        url : url,
        redirectUrl : "/car/list",
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

