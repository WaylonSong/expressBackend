<html>
<head>
    <title>user-add</title>
    <#include "../common/header.jsp"/>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <#include "../common/main.jsp"/>
    <div id="generalForm"/>
    <script type="text/javascript">
        //Caution: AUTO_INCREMENT id should be set the type:{delete}
        var pageParas ={
            formInit :[
                {name:"id", placeholder:"id"} ,
                {name:"name", placeholder:"name"} ,
                {name:"pwd", placeholder:"pwd"} ,
                {name:"role", placeholder:"role"}                             ],
            formExtend :[
                {name:"id", alias:"id" ,type:"hidden" } ,
                {name:"name", alias:"name"  } ,
                {name:"pwd", alias:"pwd"  } ,
                {name:"role", alias:"role"  }                  ],
            title : "添加user",
            url : "/user",
            redirectUrl : "/user/add",
            method : "post"
            /*
             example:
             {name:"id", alias:"价格(元)", type:"delete", defaultValue:"1234"},
             {name:"price", alias:"价格(元)", type:"password",validator:{dataType:"number",notNull:true}},
             {name:"mobile", alias:"手机", validator:{dataType:"mobile",notNull:true}},
             {name:"state", alias:"状态", type:"select", options:["上架","下架"]},
             {name:"email", alias:"邮箱",validator:{dataType:"email", minLength:"5", maxLength:"10", notNull:true}},
             * */
        }

    </script>
    <#include "../common/footer.jsp"/>
</div>
</body>
</html>
