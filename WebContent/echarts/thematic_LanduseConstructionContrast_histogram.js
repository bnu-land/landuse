var storeId = "thematic_LCC_PieStore";
var echartDivId = "thematic_LanduseConstructionContrast_echart";//陈修改7.12
var title = "土地利用结构统计";

var store = Ext.data.StoreManager.get(storeId);
var echartsData;

//判断store是否为空
if (!store) {
    retrun;
}

function getLegendName(dataArr) {
    var legendNames = [];
    for (var i in dataArr) {
        legendNames.push(dataArr[i].name);
    }
    return legendNames;
}

//当store的数据重新加载时
store.on('load', function(store, records, successful, operation, eOpts) {
    // echartsData = store.data.items;
    var echartsData = Ext.pluck(store.data.items, 'data'); //从store获取数据
    var echartsLegend = getLegendName(echartsData);

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById(echartDivId));

    // myChart.showLoading();  //显示加载图标

    // 指定图表的配置项和数据
    option = {
        title: {
            text: title,
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: echartsLegend
        }, 
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
                 {
                     type : 'category',
                     data : ['周一','周二','周三','周四','周五','周六','周日']
                 }
             ],
             yAxis : [
                      {
                          type : 'value'
                      }
                  ],
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        series: [{
            name: '访问来源',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: echartsData
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
});
