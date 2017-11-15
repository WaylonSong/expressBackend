<html>
<head>
    <title>outStorage-edit</title>
    <#include "../common/header.jsp"/>
    <script src="/js/echarts-all.js"></script>
    <script src="/js/jquery-2.2.1.min.js"></script>
    <style type="text/css">
        .container,#main{
            width: 100%;
            margin: 0 auto;
        }
        #main{
            min-height: 500px;
            overflow: hidden;
        }
        #main1-1{
            width: 800px;
            height:700px;
            margin:0 auto;
        }
        #main1-2{
            width: 800px;
            height:400px;
            margin: 50px auto;
        }
        /*.statistics{*/
        /*width:580px;*/
        /*height:400px;*/
        /*float:left;*/
        /*margin:20px 2px;*/
        /*border: 1px solid #ddd;*/
        /*}*/

    </style>
</head>
<body>
<div id="wrapper">
    <#include "../common/side.jsp"/>
    <div id="page-wrapper">
        <div id="page-inner">
            <div id="main1-1"></div>
            <div id="main1-2" class="statistics" ></div>
        </div>
    </div>
<script>
    stat_order_location_distribution(document.getElementById('main1-1'));
    stat_order_status_distribution_bar(document.getElementById('main1-2'));


    function stat_order_location_distribution(dom){
        $.get("/statistics/api/locationDistribution").done(function (data) {
            var option = {
                title : {
                    text: '订单发送地统计',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item'
                },
                legend: {
                    orient: 'vertical',
                    x:'left',
                    data:['订单量']
                },
                dataRange: {
                    min: 0,
                    max: 2500,
                    x: 'left',
                    y: 'bottom',
                    text:['高','低'],           // 文本，默认为数值文本
                    calculable : true
                },
                toolbox: {
                    show: true,
                    orient : 'vertical',
                    x: 'right',
                    y: 'center',
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                roamController: {
                    show: true,
                    x: 'right',
                    mapTypeControl: {
                        'china': true
                    }
                },
                series : [
                    {
                        name: '订单数量',
                        type: 'map',
                        mapType: 'china',
                        roam: false,
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                    },
                ]
            };
            var array = [];
            for(var i = 0; i < data.length; i++){
                array.push({name:data[i][1],value:data[i][0]})
            }
            option.series[0].data = array;
            console.log(array);
            var myCharts = echarts.init(dom, "macarons");
            myCharts.setOption(option);
        })
    }

    function stat_order_status_distribution_bar(dom){
        $.get("/statistics/api/dailyOrder").done(function (data) {
            var option = {
                title : {
                    text: '近一周订单数量统计',
                },
                tooltip : {
                    trigger: 'axis'
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} 个'
                        }
                    }
                ],
                series : [
                    {
                        name:'单数',
                        type:'bar',
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        },
                    },
                ]
            };
            option.xAxis[0].data = data.map(function(i){
                return i[1]
            });
            option.series[0].data = data.map(function(i){
                return i[0]
            });
            var myCharts = echarts.init(dom, "macarons");
            myCharts.setOption(option);
        });
    }

</script>
</div>
<#include "../common/footer.jsp"/>
</div>
</body>
</html>
