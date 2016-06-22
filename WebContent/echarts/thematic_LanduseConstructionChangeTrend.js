var storeId = "thematic_LCCT_ChartStore";
var echartDivId = "thematic_LanduseConstructionChangeTrend_echart";
var title = "土地利用结构变化趋势";

var store = Ext.data.StoreManager.get(storeId);
var echartsData;

//判断store是否为空
if (!store) {
    retrun;
}

//获得图表类型
function getLegendName(dataArr) {
    var legendNames = [];
    for (var i in dataArr) {
        legendNames.push(dataArr[i].DLMC);
    }
    return legendNames;
}

// 获取柱状图数据种类
function getLegendType(dataArr) {
    if (dataArr && dataArr[0]) {
        return Object.keys(dataArr[0]); //取二级属性的名称
    }
}

// 获取数组列的数值
function arrayColumn(arr, n) {

    return arr.map(x => x[n]);
}

function getColumnValue(dataArr, index) {
    var colValues = [];
    if (dataArr && Object.keys(dataArr[0]).length > index + 1) {
        var keyNames = Object.keys(dataArr[0]); //取二级属性的名称

        for (var i in dataArr) {
            var colName = keyNames[index];
            var value = dataArr[i][colName];
            colValues.push(value);
        }
    }
    return colValues;
}

//当store的数据重新加载时
store.on('load', function(store, records, successful, operation, eOpts) {
    // echartsData = store.data.items;
    var jsonData = Ext.pluck(store.data.items, 'data'); //从store获取数据
    var echartsData = Object.keys(jsonData).map(function(k) {
        return jsonData[k]
    });
    var echartsLegend = getLegendName(echartsData); //横坐标
    var echartsLegendType = getLegendType(echartsData); // 横坐标数据类型
    var column1 = getColumnValue(echartsData, 1); //第一列的数据
    var column2 = getColumnValue(echartsData, 2); //第一列的数据


    console.log("echartData:", echartsData);
    console.log("column1:", column1);
    console.log("column2:", column2);

    if (!column1 || !column2) {
        return;
    }

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById(echartDivId));

    // myChart.showLoading();  //显示加载图标

    // 指定图表的配置项和数据
    option = {
        title: {
            text: title
        },
        tooltip: {
            trigger: 'axis'            
        },
        legend: {
            data: echartsLegendType
        },
        toolbox: {
            show: true,
            feature: {
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        xAxis: [{
            type: 'category',
            data: echartsLegend
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: echartsLegendType[1],
            type: 'bar',
            data: column1
        }, {
            name: echartsLegendType[2],
            type: 'bar',
            data: column2
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
});
