/*
 * File: app/store/systemManageMapTreeStore.js
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

Ext.define('MyApp.store.systemManageMapTreeStore', {
    extend: 'Ext.data.TreeStore',
    alias: 'store.systemManageMapTreeStore',

    requires: [
        'MyApp.model.systemMapModel',
        'Ext.data.proxy.Ajax',
        'Ext.data.reader.Json'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            groupField: 'id',
            storeId: 'systemManageMapTreeStore',
            autoLoad: true,
            autoSync: true,
            model: 'MyApp.model.systemMapModel',
            folderSort: true,
            defaultRootId: 'children',
            defaultRootText: 'children',
            proxy: {
                type: 'ajax',
                url: 'get_systemManageMapTree',
                reader: {
                    type: 'json',
                    typeProperty: 'children'
                }
            },
            listeners: {
                load: {
                    fn: me.onTreeStoreLoad,
                    scope: me
                }
            }
        }, cfg)]);
    },

    onTreeStoreLoad: function(treestore, records, successful, operation, node, eOpts) {
        //var jsonData = Ext.pluck(treestore.data.items, 'data'); //从store获取数据
        //var store = Ext.StoreMgr.get('sys_TreeStore');
        //store.setRoot(jsonData);
        //console.log("json:",jsonData);
    }

});