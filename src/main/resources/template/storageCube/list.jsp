<html>
<head>
    <title>outStorage-edit</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <div id="list"/>
<script type="text/javascript">
    var form_title = "仓位管理";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/storageCube/list",
        addUrl:"/storageCube/add",
        editUrl:"/storageCube/edit",
        activePage :pageNo,
        columnFilter  : [
                            {name:"id", alias:"仓位编号" ,type:"hidden" } ,
                                        {name:"occupy", alias:"占用情况"  }                      ],
        searchBar: false,
        identifier : "id"
    };
</script>
<#include "../common/footer.jsp"/>
</div>
</body>
</html>

