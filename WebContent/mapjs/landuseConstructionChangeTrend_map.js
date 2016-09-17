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
        fieldsArr = [];
        columnsArr = [];
        yFieldsOfChart = [];

        //fields & columns
        var field = {
            "name": "DLMC",
            "type": "string"
        };
        fieldsArr.push(field);
        var field1 = {
            "name": "DLDM",
            "type": "string"
        };
        fieldsArr.push(field1);
        var column = {
            "header": "地类名称",
            "dataIndex": "DLMC",
            width: 250
        };
        columnsArr.push(column);
       var column1 = {
            "header": "地类代码",
            "dataIndex": "DLDM",
            width: 150
        };
       columnsArr.push(column1);
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
            query.outFields = ["MBBSM","YSDM", 
            "KFQDM","KFQMC", 
            "KFQLX","TBBH", 
            "DLMC","DLDM", 
            "DLMJ","QS", 
            "GYSJ","GYLX",
             "GYDM","TDZPG", 
             /*"SYNX","TDSYZ", 
             "PZYT","PZDM", 
             "GHYT","GHDM", 
             "GHJZMJ","GHJDMJ",
              "GHRJL","GHJZMD", 
              "BZ","RDYJ",
               "DLMC1","DLDM1", 
               "DLMJ1","DLMC2", 
               "DLDM2","DLMJ2",
                "JDZMJ","GXLB", 
                "GXDM","GXYDMJ",
                 "GXZSBL","GXSR",
                  "JZMJ", 
                  "JZJDMJ","GDZCTZE",
                   "ZSR", 
                   "QT"*/];
            query.where = "1=1";//"ESSSZE", 
            queryTask.execute(query, showResult);
        }
    }

    function showResult(results) {
        var attrData = [];
        var resultCount = results.features.length;
        for (var i = 0; i < resultCount; i++) {
            var featureAttributes = results.features[i].attributes;
            var record = [];
            for (var attr in featureAttributes) {
                var av = featureAttributes[attr];
                var v;
                if (isNumber(av)) {
                    v = Math.ceil(av);
                }else{
                    v = av;
                }
                record.push(v);
            }
            attrData.push(record);//将属性表内的数据放到数组中
        }

        var store = Ext.create('Ext.data.ArrayStore', {
            // store configs
            storeId: 'myStore' + yearNum,
            //data
            data: attrData,
            // reader configs
            fields: [
            
                {name: 'DLMC', type: 'auto' },
                {name:'DLDM',type:'auto'},
                //{name: 'DLSL', type: 'int'},
                { name: 'DLMJ', type: 'float' }
            ],
            autoLoad: true
        });
        console.log(store.getCount()+"数组长度："+attrData.length);
        console.log(attrData[0]);
        console.log("Value："+attrData[0][2]);
        
        for(var i=0 ;i<attrData.length;i++){
            var j=0;
        var form=new Ext.form.Panel({
            //renderTo: Ext.getBody(),
             // title:"用户信息录入",
             // height: 200,
              //width: 300,
              //labelWidth: 60,
             // labelAlign: "right",
              frame: true,
            xtype:'form',
            id:'addInfoForm',
            jsonSubmit: true,
             defaults:{
                 xtype:"textfield",
                 width:180
              },
            items: [
                 {name: "tbnf", value:yearNum},
                 {name: "mbbsm",value:attrData[i][j++]},
                 {name: "ysdm", value:attrData[i][j++]},
                 {name: "kfqdm", value:attrData[i][j++]},
                 {name: "kfqmc", value:attrData[i][j++]},
                 {name: "kfqpjfw",value:"主区"},
                 {name: "kfqpjlx", value:attrData[i][j++]},
                  {name: "tbbh", value:attrData[i][j++]},
                 {name: "dlmc", value:attrData[i][j++]},
                 {name: "dldm", value:attrData[i][j++]},
                 {name: "dlmj", value:attrData[i][j++]},
                // {name: "tdxzqk", value:""},
                 {name: "qs", value:attrData[i][j++]},
                 {name: "gysj", value:attrData[i][j++]},
                 {name: "gylx", value:attrData[i][j++]}/*,
                 {name: "tdzpg", value:attrData[i][j++]}*/
                 /*{name: "synx", value:attrData[i][j++]},
                 {name: "tdsyz", value:attrData[i][j++]},
                 {name: "pzyt", value:attrData[i][j++]},
                 {name: "pzdm", value:attrData[i][j++]},
                 {name: "ghyt", value:attrData[i][j++]},
                 {name: "ghdm", value:attrData[i][j++]},
                 {name: "ghjzmj", value:attrData[i][j++]},
                 {name: "ghjdmj", value:attrData[i][j++]},
                 {name: "ghrjl", value:attrData[i][j++]},
                 {name: "ghjzmd", value:attrData[i][j++]},
                 {name: "bz", value:attrData[i][j++]},
                 {name: "rdyj", value:attrData[i][j++]},
                 {name: "dlmc1", value:attrData[i][j++]},
                 {name: "dldm1", value:attrData[i][j++]},
                 {name: "dlmj1", value:attrData[i][j++]},
                 {name: "dlmc2", value:attrData[i][j++]},
                 {name: "dldm2", value:attrData[i][j++]},
                 {name: "dlmj2", value:attrData[i][j++]},
                 {name: "jdzmj", value:attrData[i][j++]},
                 {name: "gxlb", value:attrData[i][j++]},
                 {name: "gxdm", value:attrData[i][j++]},
                 {name: "gxydmj", value:attrData[i][j++]},
                 {name: "gxzsbl", value:attrData[i][j++]},
                 {name: "gxsr", value:attrData[i][j++]},
                 {name: "gxss", value:""},
                 {name: "jzmj", value:attrData[i][j++]},
                 {name: "jzjdmj", value:attrData[i][j++]},
                 {name: "gdzctzze", value:attrData[i][j++]},
                 {name: "esssze", value:""},
                 {name: "qyzsr", value:attrData[i][j++]},
                 {name: "qyssze", value:attrData[i][j++]}*/
              ],
              //data:attrData[i],
              /*buttons:[{
                 text:"提交",
                 handler: function(){
                    form.form.submit({
                       waitTitle:"请稍候",
                       waitMsg:"正在提交表单数据，请稍候"
                    });
                 }
              }, {
                 text:"重置",
                 handler: function(){
                    form.form.reset();
                 }
             }]*/
             
              //url:'add_zdinfo'
        })
        //Ext.getCmp("dlname").setValue(attrData[i][0]);
        //console.log(Ext.getCmp("dlname").getValue());
        var myForm=Ext.getCmp('addInfoForm').getForm();
        myForm.submit({
        url : 'add_zdinfomation',
        success : function (form, action)
        {
           // Ext.Msg.alert('成功', '内容添加成功。');
          console.log(i+"添加成功")
           
        },
        failure: function(form, action){
            Ext.Msg.alert('失败', '内容添加失败，请重试。');
            //return;
        }
    });
}
         var Grid=Ext.getCmp('thematic_LCCT_Grid');
        Grid.reconfigure(store, columnsArr);
      /* //数据计算
       store.setGroupField('DLMC');
       store.setGroupField('DLDM');
       var dlmj = store.sum("DLMJ", true);
       console.log("地类面积："+dlmj)
       //增加面积列
       var newYField = kfqname + yearNum;
       var field = {

            "name":newYField,
            "type": "float"
        };
        //console.log(newYField);
        fieldsArr.push(field);
        var column = {
           
            
            xtype: 'numbercolumn',
            format: '0.000',
            "header": yearNum + "年",
            "dataIndex": newYField,
            width: 150
            
        };
        columnsArr.push(column);
        if (dataMulti.length == 0) {
            for (var key in dlmj) {
                var rec = [];

                rec.push(key);
                rec.push(dlmj[key]);
                dataMulti.push(rec);
                
            }
           
        } else {
            for (var i = 0; i < dataMulti.length; i++) {
                var mj = dlmj[dataMulti[i][0]];
                if (mj) {
                    dataMulti[i].push(mj);
                } else {
                    dataMulti[i].push(0);
                }
            }
        }
        gridStore = Ext.create('Ext.data.ArrayStore', {
            // store configs
            storeId: 'myStore' + yearNum,
            //data
            data: dataMulti,
            // reader configs
            fields: fieldsArr,
            autoLoad: true
        });
       var Grid=Ext.getCmp('thematic_LCCT_Grid');
        Grid.reconfigure(store, columnsArr);
        yearNum++;*/
       //Grid.setSource(attrData);
   /*    var newYField = kfqname + yearNum;//'Y'
        yFieldsOfChart.push(newYField);
        //store.setGroupField('DLDM');
        //统计
        store.setGroupField('DLMC');
        store.setGroupField('DLDM');
        //var dlsl = store.sum("DLMC",true);
        var dlmj = store.sum("DLMJ", true);

        var dataTemp = [];
        if (dataMulti.length == 0) {
            for (var key in dlmj) {
                var rec = [];
                rec.push(key);
                rec.push(dlmj[key]);
                dataMulti.push(rec);
                
            }
           
        } else {
            for (var i = 0; i < dataMulti.length; i++) {
                var mj = dlmj[dataMulti[i][0]];
                if (mj) {
                    dataMulti[i].push(mj);
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
        console.log(newYField);
        fieldsArr.push(field);
        var column = {
           
            
            xtype: 'numbercolumn',
            format: '0.000',
            "header": yearNum + "年",
            "dataIndex": newYField,
            width: 150
            
        };
        columnsArr.push(column);
          
         console.log("这是第二次输出："+fieldsArr);
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


        //if (grid) {
        //    grid.reconfigure(store);
        //
        //    //统计
        //    store.setGroupField('DLMC');
        //    //var counts = store.count(true);
        //    var counts = store.sum("DLMJ", true);
        //    var data = [];
        //    for (var key in counts) {
        //        var rec = {
        //            name: key,
        //            value: counts[key]
        //        };
        //        data.push(rec);
        //    }
        //    var storePie = Ext.data.StoreManager.get("thematic_LCC_PieStore");
        //    storePie.setData(data);
        //    storePie.reload();
        //}
 */    }

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
