<html>
<head>
    <title>入库单编辑</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <div id="inStorageForm"></div>
    <script type="text/javascript">
        //Caution: AUTO_INCREMENT id should be set the type:{delete}
        var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
        var url = "/inStorage/"+id;
        var pageParas ={
            formInit :[
                {name:"id", alias:"id" ,type:"hidden" } ,
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
                {name:"storageCubIds", alias:"已分配仓位ID"  }                      ],
            formExtend :[
            ],
            title : "修改inStorage",
            url : url,
            redirectUrl : "/inStorage/list",
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

