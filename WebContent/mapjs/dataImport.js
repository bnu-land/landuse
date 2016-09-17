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

        console.log("数组长度："+attrData.length);
        console.log(attrData[0]);
        console.log("Value："+attrData[0][2]);
        
        for(var i=0 ;i<attrData.length;i++){
            var j=0;
        var form=new Ext.form.Panel({
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
         
        })
     
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
      Ext.Msg.alert('完成', '数据完成同步');  
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
