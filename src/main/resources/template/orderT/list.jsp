<!-- Author: Song -->
<html>
<head>
    <title>orderT list</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"/>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    var form_title = "订单管理";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/orderT/list",
        addUrl:"/orderT/add",
        editUrl:"/orderT/edit",
        activePage :pageNo,
        columnFilter  : [
//                            {name:"id", alias:"id" ,type:"hidden" } ,
                            {name:"number", alias:"订单编号"  } ,
                            {name:"productName", alias:"货物名称"  } ,
                            {name:"count", alias:"货物数量"  } ,
//                            {name:"description", alias:"描述"  } ,
                            {name:"companyName", alias:"企业名称"  } ,
                            {name:"mobile", alias:"手机号码"  } ,
                            {name:"destination", alias:"目的地"  } ,
//                            {name:"transTime", alias:"运送时间"  } ,
                            {name:"price", alias:"价格"  } ,
                            {name:"state", alias:"订单状态"  } ,
                            {name:"storageCubCount", alias:"仓储数量"  }                  ],
        searchBar: false,
        identifier : "id"
    };
</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
