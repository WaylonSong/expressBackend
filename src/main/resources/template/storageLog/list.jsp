<!-- Author: Song -->
<html>
<head>
    <title>storageLog list</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/js/bootstrapCssWrapper-bundle.js"></script>
</head>
<body>
<div id="root">
</div>
<div id="example">
</div>
<script type="text/javascript">
    var form_title = "storageLog列表";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/storageLog/list",
        addUrl:"/storageLog/add",
        editUrl:"/storageLog/edit",
        activePage :pageNo,
        columnFilter  : [
                                        {name:"itemId", alias:"itemId"  } ,
                                        {name:"count", alias:"count"  } ,
                                        {name:"exp", alias:"exp"  } ,
                                        {name:"locationId", alias:"locationId"  } ,
                                        {name:"storageStaffName", alias:"storageStaffName"  } ,
                                        {name:"qualityStaffName", alias:"qualityStaffName"  } ,
                                        {name:"qualityPaper", alias:"qualityPaper"  }                      ],
//        searchBar: true,
        identifier : "id"
    };
</script>
<script src="/js/commonV3.js"></script>
<script src="/js/pageListGenerator-bundle.js"></script>
</body>
</html>
