/**
 * Created by WUCAN on 2015/5/30.
 */

require([
    "esri/map",
    "esri/graphicsUtils",
    "esri/layers/ArcGISDynamicMapServiceLayer",
    "esri/layers/FeatureLayer",
    "esri/arcgis/utils",
    "esri/geometry/Extent",
    "esri/tasks/query",
    "esri/tasks/QueryTask",
    "dojo/ready",
    "dojo/on",
    "dojo/io/script",
    "dojo/_base/connect",
    "dojo/_base/array",
    "dojo/dom",
    "dojo/parser",
    "dojo/domReady!"
], function(Map,
    graphicsUtils,
    ArcGISDynamicMapServiceLayer,
    FeatureLayer,
    arcgisUtils,
    Extent,
    Query,
    QueryTask,
    ready,
    on,
    dojoIOScript,
    connect,
    arrayUtil,
    dom,
    parser) {

    var urls = [];
    var mapUrlStore = Ext.data.StoreManager.get("systemManageMapStore"); //取得地图url store
    var jsonData = {};
    var yearNum = 0;
    var dataMulti = [, ];

    var fieldsArr = [];
    var columnsArr = [];
    var gridStore;
    var yFieldsOfChart = [];
 
    //初始化选择图层
    var KFQCombo = Ext.getCmp('thematicLCCT_KFQCombo');
    var submitButton = Ext.getCmp('thematicLCCT_SubmitButton');
    var kfqname=KFQCombo.getValue();
    //图层选择变化时
    if (KFQCombo) {
        KFQCombo.on('change', onKFQComboChange);
    }
    if (submitButton) {
        submitButton.on('click', onSubmitButtonClick);
    }

    function onSubmitButtonClick(button, e, eOpts) {

    }

    function onKFQComboChange(comboBox, newValue, oldValue, eOpts) {
    	kfqname=newValue;
        var kfqName = newValue;
        var startYear = Ext.getCmp('thematicLCCT_StartYearCombo').getValue();
        yearNum = startYear;
        var endYear = Ext.getCmp('thematicLCCT_EndYearCombo').getValue();
        if (!(kfqName || startYear || endYear)) {
            return;
        }

        urls = [];
        dataMulti = [];
        fieldsArr = [];//字段数组
        columnsArr = [];//列数组
        yFieldsOfChart = [];

        //fields & columns
        var field = {
            "name": "DLMC",
            "type": "string"
        };
        fieldsArr.push(field);
        var column = {
            "header": "地类名称",
            "dataIndex": "DLMC",
            width: 250
        };
        columnsArr.push(column);


        for (var year = startYear; year <= endYear; year++) {
            var key = kfqName + year;
            var index = mapUrlStore.find('mapKey', key);
            if (index < 0) {
                continue;
            }
            var record = mapUrlStore.getAt(index);
            urls.push([year, record.get("mapUrl")]);
        }

        for (var url in urls) {
            var queryTask = new QueryTask(urls[url][1]);
            var query = new Query();
            query.returnGeometry = false;
            query.outFields = ["DLMC", "DLMJ"];
            query.where = "1=1";
            queryTask.execute(query, showResult);
        }

    }

    function showResult(results) {
        var attrData = [];//属性数据数组
        var resultCount = results.features.length;
        for (var i = 0; i < resultCount; i++) {
            var featureAttributes = results.features[i].attributes;//
            var record = [];
            for (var attr in featureAttributes) {
                var av = featureAttributes[attr];//面积
                var v;
                if (isNumber(av)) {
                    //v = Math.ceil(av);
                    v=av.toFixed(3);//保留三位小数
                }else{
                    v = av;
                }
                record.push(v);
            }
            attrData.push(record);
        }

        var store = Ext.create('Ext.data.ArrayStore', {
            // store configs
            storeId: 'myStore' + yearNum,
            //data
            data: attrData,
            // reader configs
            fields: [
                { name: 'DLMC', type: 'auto' },
                //{name: 'DLSL', type: 'int'},
                { name: 'DLMJ', type: 'float' }
            ],
            autoLoad: true
        });

        var newYField = kfqname + yearNum;//'Y'
        yFieldsOfChart.push(newYField);

        //统计
        store.setGroupField('DLMC');//进行分组
        //var dlsl = store.sum("DLMC",true);
        var dlmj = store.sum("DLMJ", true);

        var dataTemp = [];
        if (dataMulti.length == 0) {
            for (var key in dlmj) {
                var rec = [];
                //System.out.println(key);
               // console.log(key);
                rec.push(key);
                rec.push(dlmj[key].toFixed(3));
                dataMulti.push(rec);//二维数组
                
            }
            //打印dataMulti
            console.log(dataMulti);
            //System.out.println(dataMulti);
        } else {
            for (var i = 0; i < dataMulti.length; i++) {
                var mj = dlmj[dataMulti[i][0]];
                if (mj) {
                    dataMulti[i].push(mj.toFixed(3));
                } else {
                    dataMulti[i].push(0);
                }
            }
        }

        //fields & columns
        var field = {
            "name": newYField,
            "type": "float"
        };
        fieldsArr.push(field);
        var column = {
            xtype: 'numbercolumn',
            format: '0.000',
            "header": yearNum + "年",
            "dataIndex": newYField,
            width: 150
        };
        columnsArr.push(column);


        gridStore = Ext.create('Ext.data.ArrayStore', {
            // store configs
            storeId: 'myStore' + yearNum,
            //data
            data: dataMulti,
            // reader configs
            fields: fieldsArr,
            autoLoad: true
        });

        //var storeGrid = Ext.data.StoreManager.get("thematic_LCCT_GridStore");
        //storeGrid.setData(jsonData);
        var grid = Ext.getCmp('thematic_LCCT_Grid');
        grid.reconfigure(gridStore, columnsArr);

        // echarts
        var chartStore = Ext.data.StoreManager.get('thematic_LCCT_ChartStore');
        chartStore.setData(gridStore.data.items);
        //打印store里面的数据
        console.log("内容："+gridStore.data.items);
        chartStore.reload();

        yearNum++;


    }

    function isNumber(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }

    //选择第一个

    var storeKFQ = Ext.data.StoreManager.lookup('thematic_LCCT_KFQStore');
    if (storeKFQ.getCount() > 0) {
        var model = storeKFQ.getAt(0);
        KFQCombo.select(model);
    }


});
