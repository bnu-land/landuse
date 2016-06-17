/*
 * File: app/store/Business_mapStore.js
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

Ext.define('MyApp.store.Business_mapStore', {
    extend: 'Ext.data.Store',
    alias: 'store.Business_mapStore',

    requires: [
        'MyApp.model.businessMapModel',
        'Ext.data.proxy.Ajax',
        'Ext.data.reader.Json'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            storeId: 'Business_mapStore',
            autoLoad: true,
            autoSync: true,
            model: 'MyApp.model.businessMapModel',
            proxy: {
                type: 'ajax',
                extraParams: {
                    searchKeyword: ''
                },
                url: 'get_maps',
                reader: {
                    type: 'json',
                    rootProperty: 'root'
                }
            }
        }, cfg)]);
    }
});