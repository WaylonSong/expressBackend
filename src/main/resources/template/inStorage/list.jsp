<html>
<head>
    <title>入库管理</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <div id="list"></div>
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <script type="text/javascript">
        var form_title = "入库管理";
        var pageNo = window.location.hash;
        if(pageNo){
            pageNo = pageNo.substring(1);
        }
        var pageParas = {
            url:"/inStorage/list",
            addUrl:"/inStorage/add",
            editUrl:"/inStorage/edit",
            activePage :pageNo,
            columnFilter  : [
                {name:"number", alias:"入库单号"  } ,
                {name:"productName", alias:"货品名称"  } ,
                {name:"count", alias:"数量"  } ,
                {name:"description", alias:"描述"  } ,
                {name:"companyName", alias:"发货单位"  } ,
                {name:"mobile", alias:"手机"  } ,
                {name:"destination", alias:"目的地"  } ,
                {name:"transTime", alias:"配送时间"  } ,
                {name:"state", alias:"状态"  } ,
                {name:"price", alias:"配送价格"  } ,
                {name:"storageCubCount", alias:"仓位需求"  } ,
                {name:"storageCubIds", alias:"仓位"  }                       ],
            searchBar: false,
            identifier : "id"
        };
    </script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
