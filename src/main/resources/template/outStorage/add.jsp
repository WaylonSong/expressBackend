<html>
<head>
    <title>outStorage-add</title>
    <!-- Author: Song -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/js/bootstrapCssWrapper-bundle.js"></script>
</head>
<body>
<div id="root">
</div>
<div id="example">
</div>
<script type="text/javascript">
    //Caution: AUTO_INCREMENT id should be set the type:{delete}
    var pageParas ={
        formInit :[
                    {name:"id", placeholder:"id"} ,
            {name:"id", alias:"id" ,type:"hidden" } ,
            {name:"number", alias:"入库单号"  } ,
            {name:"productName", alias:"货品名称"  } ,
            {name:"count", alias:"数量"  } ,
            {name:"description", alias:"描述"  } ,
            {name:"companyName", alias:"发货单位"  } ,
            {name:"mobile", alias:"手机"  } ,
            {name:"destination", alias:"目的地"  } ,
            {name:"transTime", alias:"配送时间"  } ,
            {name:"state", alias:"出库单状态"  } ,
            {name:"price", alias:"配送价格"  } ,
            {name:"storageCubCount", alias:"仓位需求数量"  } ,
            {name:"storageCubIds", alias:"已分配仓位ID"  },
            {name:"carNumbers", alias:"可用车辆",type:"checkGrp"  }                           ],
        formExtend :[
                    {name:"id",type:"hidden" }
        ],
        title : "添加outStorage",
        url : "/outStorage",
        redirectUrl : "/outStorage/add",
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
<script src="/js/commonV3.js"></script>
<script src="/js/editFormGenerator-bundle.js"></script>
</body>
</html>

