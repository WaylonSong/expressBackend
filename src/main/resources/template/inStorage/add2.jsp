<html>
<head>
    <title>inStorage-add</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var pageParas ={
        formInit :[
                    {name:"id", placeholder:"id"} ,
            {name:"number", alias:"入库单号"  } ,
            {name:"productName", alias:"货品名称"  } ,
            {name:"count", alias:"数量"  } ,
            {name:"description", alias:"描述"  } ,
            {name:"companyName", alias:"发货单位"  } ,
            {name:"mobile", alias:"手机"  } ,
            {name:"destination", alias:"目的地"  } ,
            {name:"transTime", alias:"预计配送时间"  } ,
            {name:"state", alias:"出库单状态"  } ,
            {name:"price", alias:"配送价格"  } ,
            {name:"storageCubCount", alias:"仓位需求数量"  } ,
            {name:"storageCubIds", alias:"已分配仓位ID"  }                             ],
        formExtend :[
                    {name:"id", alias:"id" ,type:"hidden" } ,
                            {name:"number", alias:"number"  } ,
                            {name:"productName", alias:"productName"  } ,
                            {name:"count", alias:"count"  } ,
                            {name:"description", alias:"description"  } ,
                            {name:"companyName", alias:"companyName"  } ,
                            {name:"mobile", alias:"mobile"  } ,
                            {name:"destination", alias:"destination"  } ,
                            {name:"transTime", alias:"transTime"  } ,
                            {name:"state", alias:"state"  } ,
                            {name:"price", alias:"price"  } ,
                            {name:"storageCubCount", alias:"storageCubCount"  } ,
                            {name:"storageCubIds", alias:"storageCubIds"  }                  ],
        title : "添加inStorage",
        url : "/inStorage",
        redirectUrl : "/inStorage/add",
        method : "post"
    }
    </script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>

