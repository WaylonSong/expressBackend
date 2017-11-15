<!-- Author: Song -->
<html>
<head>
    <title>outStorage list</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"></div>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
<script type="text/javascript">
    var form_title = "出库管理";
    var pageNo = window.location.hash;
    if(pageNo){
        pageNo = pageNo.substring(1);
    }
    var pageParas = {
        url:"/outStorage/list",
        addUrl:"/outStorage/add",
        editUrl:"/outStorage/edit",
        activePage :pageNo,
        columnFilter  : [
            {name:"number", alias:"入库单号"  } ,
            {name:"productName", alias:"货品名称"  } ,
            {name:"count", alias:"数量"  } ,
            {name:"companyName", alias:"发货单位"  } ,
            {name:"mobile", alias:"手机"  } ,
            {name:"destination", alias:"目的地"  } ,
            {name:"transTime", alias:"配送时间"  } ,
            {name:"state", alias:"出库单状态"  } ,
            {name:"price", alias:"配送价格"  } ,
            {name:"storageCubIds", alias:"出库仓位"  },
            {name:"carNumbers", alias:"载运车辆"  }                      ],
        searchBar: false,
        identifier : "id"
    };
</script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>

