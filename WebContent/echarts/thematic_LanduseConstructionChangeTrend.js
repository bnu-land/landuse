var storeId = "thematic_LCCT_ChartStore";
var echartDivId = "thematic_LanduseConstructionChangeTrend_echart";
var title = "土地利用结构变化趋势";

var store = Ext.data.StoreManager.get(storeId);
var echartsData;

// 判断store是否为空
if (!store) {
    retrun;
}

// 获得图表类型
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
        return Object.keys(dataArr[0]); // 取二级属性的名称
    }
}

// 获取数组列的数值
function arrayColumn(arr, n) {

    return arr.map(x[n]);
}

function getColumnValue(dataArr, index) {
    var colValues = [];
    if (dataArr && Object.keys(dataArr[0]).length > index + 1) {
        var keyNames = Object.keys(dataArr[0]); // 取二级属性的名称

        for (var i in dataArr) {
            var colName = keyNames[index];
            var value = dataArr[i][colName];
            colValues.push(value);
        }
    }
    return colValues;
}
function getRowValue(dataArr,index) {
	var rowValues = [];
	console.log("dataArr长度"+dataArr.length);
	if(dataArr.length-1<index)
		return rowValues;
    
    var len=Object.keys(dataArr[0]).length;
    if (dataArr && len >  1) {
        var keyNames = Object.keys(dataArr[0]); // 取二级属性的名称
     keyNames.shift();
     keyNames.pop();
     for(var i in keyNames)
    	 {
    	 var rowName = keyNames[i];
    	// console.log("rowName:"+rowName);
    	 var value = dataArr[index][rowName];
    	 rowValues.push(value);
    	 }
        
        /*for (var i in dataArr) {
            var rowName = keyNames[index];
            var value = dataArr[i][rowName];
            rowValues.push(value);
        }*/
    }
    return rowValues;
}
// 当store的数据重新加载时
store.on('load', function(store, records, successful, operation, eOpts) {
    // echartsData = store.data.items;
    var jsonData = Ext.pluck(store.data.items, 'data'); // 从store获取数据
    var echartsData = Object.keys(jsonData).map(function(k) {
        return jsonData[k];
    });

    var echartsLegend = getLegendName(echartsData); // 横坐标
    
    var echartsLegendType = getLegendType(echartsData); // 横坐标标注
    echartsLegendType.shift();//删除数组第一项，																			
    echartsLegendType.pop();//删除数组最后一项
    console.log("我在这里"+echartsLegendType);
    //console.log("长度"+echartsData.getLenth());
    
   var row1 = getRowValue(echartsData, 0); // 第一列的数据
   var row2 = getRowValue(echartsData, 1); 
   var row3 = getRowValue(echartsData, 2); 
   var row4 = getRowValue(echartsData, 3); 
   var row5 = getRowValue(echartsData, 4); 
   var row6 = getRowValue(echartsData, 5); 
   var row7 = getRowValue(echartsData, 6); 
   var row8 = getRowValue(echartsData, 7); 
   var row9 = getRowValue(echartsData, 8); 
   var row10 = getRowValue(echartsData, 9); 
   var row11 = getRowValue(echartsData, 10); 
   
   // console.log("echartData:", echartsData);
    console.log("row11:", row11);
    //console.log("column2:", column2);

   /* if (!column1 || !column2) {
        return;
    }*/

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById(echartDivId));

     //myChart.showLoading(); //显示加载图标

    // 指定图表的配置项和数据
    option = {
        title: {
        	x: 'center',
            text: title
        },
        tooltip: {
            trigger: 'axis',
           
        },
        legend: {
        	orient: 'vertical',
            x: 'left',
            data: echartsLegend
        },
        grid: {
            left: '20%',
            right: '4%',
            bottom: '3%',
            containLabel: true
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
            data: echartsLegendType//[echartsLegendType[1],echartsLegendType[2]]
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [
                 
             {
            name: echartsLegend[0],
            type: 'bar',
            data: row1
        },
        {
            name: echartsLegend[1],
            type: 'bar',
            data: row2
        }, {
            name: echartsLegend[2],
            type: 'bar',
            data: row3
        }, {
            name: echartsLegend[3],
            type: 'bar',
            data: row4
        }, {
            name: echartsLegend[4],
            type: 'bar',
            data: row5
        }, {
            name: echartsLegend[5],
            type: 'bar',
            data: row6
        }, {
            name: echartsLegend[6],
            type: 'bar',
            data:row7
        }, {
            name: echartsLegend[7],
            type: 'bar',
            data: row8
        }, {
            name: echartsLegend[8],
            type: 'bar',
            data:row9
        }, {
            name: echartsLegend[9],
            type: 'bar',
            data: row10
        }, {
            name: echartsLegend[10],
            type: 'bar',
            data: row11
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
});
