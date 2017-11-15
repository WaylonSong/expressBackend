<!-- Author: Song -->
<html>
<head>
    <title>financialItem list</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"/>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    var form_title = "financialItem列表";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/financialItem/list",
        addUrl:"/financialItem/add",
        editUrl:"/financialItem/edit",
        activePage :pageNo,
        columnFilter  : [
            {name:"number", alias:"订单编号"  } ,
            {name:"price", alias:"金额"  } ,
            {name:"type", alias:"收入类型"  }                       ],
        searchBar: false,
        identifier : "id"
    };
</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
