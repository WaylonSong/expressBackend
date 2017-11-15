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
        var form_title = "user列表";
        var pageNo = window.location.hash;
        if(pageNo){
            pageNo = pageNo.substring(1);
        }
        var pageParas = {
            url:"/user/list",
            addUrl:"/user/add",
            editUrl:"/user/edit",
            activePage :pageNo,
            columnFilter  : [
                {name:"id", alias:"id" ,type:"hidden" } ,
                {name:"name", alias:"name"  } ,
                {name:"pwd", alias:"pwd"  } ,
                {name:"role", alias:"role"  }                      ],
            searchBar: false,
            identifier : "id"
        };
    </script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
