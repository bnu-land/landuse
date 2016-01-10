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
    var GYDM = 'GYDM';
    var urlCombo = Ext.getCmp('expansion_layerUrls_Combo');
    var url = urlCombo.getValue(); //取得url
    var store;

    var queryTask = new QueryTask(url);
    var query = new Query();
    query.returnGeometry = false;
    query.outFields = [GYDM, DLMJ];
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
                {name: GYDM, type: 'auto'},
                {name: DLMJ, type: 'float'}
            ],
            autoLoad: true
        });


        //尚可供地面积
        store.clearFilter();
        store.filter(GYDM, 'E');
        var skgdmj = store.sum(DLMJ);
        //尚可供应工矿仓储面积
        store.clearFilter();
        store.filter(GYDM, 'E21');
        var skgkcc = store.sum(DLMJ);

        Ext.getCmp('expansion_mainskgytdmj_field').setValue(skgdmj.toFixed(3));
        Ext.getCmp('expansion_mainskgygkcc_field').setValue(skgkcc.toFixed(3));
        Ext.getCmp('expansion_developskgytdmj_field').setValue(0);
        Ext.getCmp('expansion_developskgygkcc_field').setValue(0);

        Ext.getCmp('expansion_isCalculated').setValue('true');
    }

});