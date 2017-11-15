<!-- Author: Song -->
<html>
<head>
    <title>退货管理</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"/>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    var form_title = "退货管理";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/orderReturn/list",
        addUrl:"/orderReturn/add",
        editUrl:"/orderReturn/edit",
        activePage :pageNo,
        columnFilter  : [
                            {name:"id", alias:"id" ,type:"hidden" } ,
                                        {name:"number", alias:"订单编号"  } ,
                                        {name:"state", alias:"处理状态"  }                      ],
        searchBar: false,
        identifier : "id"
    };
</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
