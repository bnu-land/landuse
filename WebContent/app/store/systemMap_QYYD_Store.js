/*
 * File: app/store/systemMap_QYYD_Store.js
 *
 * This file was generated by Sencha Architect version 3.1.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 5.0.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 5.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('MyApp.store.systemMap_QYYD_Store', {
    extend: 'Ext.data.Store',

    requires: [
        'MyApp.model.systemMapModel',
        'Ext.data.proxy.Ajax',
        'Ext.data.reader.Json'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            storeId: 'systemMap_QYYD_Store',
            autoLoad: true,
            autoSync: true,
            model: 'MyApp.model.systemMapModel',
            proxy: {
                type: 'ajax',
                extraParams: {
                    LayerGroups: [
                        'qyyd'
                    ]
                },
                url: 'get_FeatureLayerURLs',
                reader: {
                    type: 'json',
                    rootProperty: 'root'
                }
            }
        }, cfg)]);
    }
});