/*
 * File: app/view/data_report.js
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

Ext.define('MyApp.view.data_report', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.data_report',

    requires: [
        'MyApp.view.data_reportViewModel',
        'Ext.toolbar.Toolbar',
        'Ext.button.Button'
    ],

    viewModel: {
        type: 'data_report'
    },
    height: 484,
    width: 541,
    title: '数据填报',

    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'button',
                    text: '填写企业信息'
                },
                {
                    xtype: 'button',
                    text: '上传照片'
                },
                {
                    xtype: 'button',
                    text: '上传位置'
                }
            ]
        }
    ]

});