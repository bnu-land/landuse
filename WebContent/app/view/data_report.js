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
        'Ext.button.Button',
        'Ext.form.Panel'
    ],

    viewModel: {
        type: 'data_report'
    },
    height: 588,
    width: 810,
    layout: 'border',
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
                    text: '填写照片信息'
                },
                {
                    xtype: 'button',
                    text: '填写位置信息'
                }
            ]
        }
    ],
    items: [
        {
            xtype: 'form',
            region: 'center',
            bodyPadding: 10,
            title: '填写企业信息'
        }
    ]

});