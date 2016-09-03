/*
 * File: app/store/thematic_LCCT_KFQStore.js
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

Ext.define('MyApp.store.thematic_LCCT_KFQStore', {
    extend: 'Ext.data.Store',

    requires: [
        'Ext.data.field.Field'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            storeId: 'thematic_LCCT_KFQStore',
            data: [
                {
                    name: '宾西',
                    value: 'binxi'
                },
                {
                    name: '海林',
                    value: 'hailin'
                },
                {
                    name: '利民',
                    value: 'limin'
                },
                {
                    name: '牡丹江',
                    value: 'mudanjiang'
                },
                {
                    name: '绥芬河保税区',
                    value: 'suifenhe'
                },
                {
                    name: '绥芬河市合作区',
                    value: 'suifenheshi'
                },
                {
                    name: '绥化',
                    value: 'suihua'
                }
            ],
            fields: [
                {
                    name: 'name'
                },
                {
                    name: 'value'
                }
            ]
        }, cfg)]);
    }
});