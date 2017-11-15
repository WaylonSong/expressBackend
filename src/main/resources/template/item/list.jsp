<!-- Author: Song -->
<html>
<head>
    <title>item list</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/js/bootstrapCssWrapper-bundle.js"></script>
</head>
<body>
<div id="root">
</div>
<div id="example">
</div>
<script type="text/javascript">
    var form_title = "物品商品列表";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/item/list",
        addUrl:"/item/add",
        editUrl:"/item/edit",
        activePage :pageNo,
        columnFilter  : [
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"name", alias:"名称"  } ,
                                        {name:"description", alias:"描述"  } ,
                                        {name:"type", alias:"型号"  }                      ],
        searchBar: true,
        identifier : "id"
    };
</script>
<script src="/js/commonV3.js"></script>
<script src="/js/pageListGenerator-bundle.js"></script>
</body>
</html>
