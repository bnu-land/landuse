/*
 * File: app/store/notice_newsDraftStore.js
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

Ext.define('MyApp.store.notice_newsDraftStore', {
    extend: 'Ext.data.Store',

    requires: [
        'MyApp.model.noticeNewsModel',
        'Ext.data.proxy.Ajax',
        'Ext.data.reader.Json'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            storeId: 'notice_newsDraftStore',
            autoLoad: true,
            model: 'MyApp.model.noticeNewsModel',
            proxy: {
                type: 'ajax',
                extraParams: {
                    searchKeyword: '',
                    noticeState: '1'
                },
                url: 'get_NoticeNews',
                reader: {
                    type: 'json',
                    rootProperty: 'root'
                }
            }
        }, cfg)]);
    }
});