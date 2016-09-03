/*
 * File: app/store/entLanduseChange.js
 *
 * This file was generated by Sencha Architect
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

Ext.define('MyApp.store.entLanduseChange', {
    extend: 'Ext.data.Store',
    alias: 'store.entLanduseChange',

    requires: [
        'MyApp.model.entLanduseChange',
        'Ext.data.proxy.Ajax',
        'Ext.data.reader.Json'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            storeId: 'entLanduseChange',
            autoLoad: true,
            autoSync: true,
            model: 'MyApp.model.entLanduseChange',
            proxy: {
                type: 'ajax',
                extraParams: {
                    searchKeyword: ''
                },
                url: 'get_EntLandChange',
                reader: {
                    type: 'json',
                    rootProperty: 'root'
                }
            }
        }, cfg)]);
    }
});