<html>
<head>
    <title>storageLog-edit</title>
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
    var id = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    var url = "/storageLog/"+id;
    var pageParas ={
        formInit :[
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"itemId", alias:"itemId"  } ,
                                        {name:"count", alias:"count"  } ,
                                        {name:"exp", alias:"exp"  } ,
                                        {name:"locationId", alias:"locationId"  } ,
                                        {name:"storageStaffName", alias:"storageStaffName"  } ,
                                        {name:"qualityStaffName", alias:"qualityStaffName"  } ,
                                        {name:"qualityPaper", alias:"qualityPaper"  }                      ],
        formExtend :[
        ],
        title : "修改storageLog",
        url : url,
        redirectUrl : "/storageLog/list",
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
<script src="/js/commonV3.js"></script>
<script src="/js/editFormGenerator-bundle.js"></script>
</body>
</html>

