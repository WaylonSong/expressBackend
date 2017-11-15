<!-- Author: Song -->
<html>
<head>
    <title>car list</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"/>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    var form_title = "车辆管理";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/car/list",
        addUrl:"/car/add",
        editUrl:"/car/edit",
        activePage :pageNo,
        columnFilter  : [
            {name:"number", alias:"车牌号"  } ,
            {name:"driver", alias:"司机"  } ,
            {name:"capacity", alias:"容积"  } ,
            {name:"description", alias:"描述"  } ,
            {name:"state", alias:"车辆状态"}                       ],
        searchBar: false,
        identifier : "id"
    };
</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
