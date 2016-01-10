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
], function (Map,
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

    var DLMJ = 'DLMJ';
    var DLDM = 'DLDM';
    var urlCombo = Ext.getCmp('survey_layerUrls_Combo');
    var url = urlCombo.getValue(); //取得url
    var store;

    var queryTask = new QueryTask(url);
    var query = new Query();
    query.returnGeometry = false;
    query.outFields = [DLDM, DLMJ];
    query.where = "1=1";
    queryTask.execute(query, showResult);


    function showResult(results) {
        if (!results.features) {
            return;
        }
        var attrData = [];
        var resultCount = results.features.length;
        for (var i = 0; i < resultCount; i++) {
            var featureAttributes = results.features[i].attributes;
            var record = [];
            for (var attr in featureAttributes) {
                record.push(featureAttributes[attr]);
            }
            attrData.push(record);
        }

        store = Ext.create('Ext.data.ArrayStore', {
            // store configs
            storeId: 'myStore',
            //data
            data: attrData,
            // reader configs
            fields: [
                {name: 'DLDM', type: 'auto'},
                {name: 'DLMJ', type: 'float'}
            ],
            autoLoad: true
        });


        //总面积
        store.filter(DLDM, 'A');
        var yjcczzmj = store.sum(DLMJ);
        //工矿仓储面积
        store.clearFilter();
        store.filter(DLDM, 'A2');
        var gkcczmj = store.sum(DLMJ);
        //工矿仓储比例
        var gkccRate = gkcczmj / yjcczzmj;
        //住宅面积
        store.clearFilter();
        store.filter(DLDM, 'A1');
        var zzzmj = store.sum(DLMJ);
        //住宅比例
        var zzRate = zzzmj / yjcczzmj;

        Ext.getCmp('survey_index_yjcczzmjText').setValue(yjcczzmj.toFixed(3));
        Ext.getCmp('survey_index_gkccmjText').setValue(gkcczmj.toFixed(3));
        Ext.getCmp('survey_index_gkccRateText').setValue(gkccRate.toFixed(3));
        Ext.getCmp('survey_index_zzmjText').setValue(zzzmj.toFixed(3));
        Ext.getCmp('survey_index_zzmjRateText').setValue(zzRate.toFixed(3));

        Ext.getCmp('survey_index_CalcNameText').setValue(urlCombo.getRawValue());

        //计算地区工业类型
        var kfqTypeCombo = Ext.getCmp('survey_index_kfqTypeCombo');
        var kfqArea = Ext.getCmp('survey_KfqArea_Combo').getRawValue();
        if (kfqArea.indexOf("保税") > -1 || kfqArea.indexOf("加工区") > -1) {
            kfqTypeCombo.setValue('工业主导型开发区');
            return;
        }

        var gkccRate = Ext.getCmp('survey_index_gkccRateText').getValue();
        var zzRate = Ext.getCmp('survey_index_zzmjRateText').getValue();

        if (gkccRate == "") {
            Ext.Msg.alert('提示', '请先计算现状值再计算开发区类型。');
            return;
        }

        if (gkccRate > 0.30 && zzRate < 0.25) {
            kfqTypeCombo.setValue('工业主导型开发区');
        } else if (gkccRate <= 0.30 && zzRate >= 0.25) {
            kfqTypeCombo.setValue('产城融合型开发区');
        } else {
            kfqTypeCombo.setValue('其他类型开发区');
        }


    }

});