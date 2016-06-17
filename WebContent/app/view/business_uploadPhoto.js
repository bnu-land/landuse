/*
 * File: app/view/business_uploadPhoto.js
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

Ext.define('MyApp.view.business_uploadPhoto', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.business_uploadPhoto',

    requires: [
        'MyApp.view.business_uploadPhotoViewModel',
        'Ext.button.Button',
        'Ext.form.field.TextArea',
        'Ext.form.field.File',
        'Ext.grid.Panel',
        'Ext.grid.column.Number',
        'Ext.grid.column.Date',
        'Ext.grid.column.Boolean',
        'Ext.grid.View',
        'Ext.Img'
    ],

    viewModel: {
        type: 'business_uploadphoto'
    },
    height: 491,
    width: 959,
    layout: 'border',
    title: '企业上传图片数据',

    items: [
        {
            xtype: 'panel',
            region: 'west',
            width: 450,
            layout: 'absolute',
            title: '图片信息录入',
            items: [
                {
                    xtype: 'button',
                    x: 270,
                    y: 340,
                    text: '提交审核'
                },
                {
                    xtype: 'textareafield',
                    x: 30,
                    y: 250,
                    width: 360,
                    fieldLabel: '备注',
                    labelWidth: 70
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 140,
                    fieldLabel: '图片标题',
                    labelWidth: 70
                },
                {
                    xtype: 'button',
                    x: 360,
                    y: 130,
                    text: '预览图片-->'
                },
                {
                    xtype: 'filefield',
                    x: 30,
                    y: 90,
                    width: 400,
                    fieldLabel: '上传图片',
                    labelWidth: 70,
                    buttonText: '选择图片'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 190,
                    fieldLabel: '上传用户',
                    labelWidth: 70
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 40,
                    fieldLabel: '项目编号',
                    labelWidth: 70
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'center',
            layout: 'border',
            animCollapse: false,
            collapseDirection: 'left',
            collapseFirst: false,
            collapsed: false,
            collapsible: false,
            title: '图片预览',
            titleAlign: 'center',
            titleCollapse: false,
            items: [
                {
                    xtype: 'gridpanel',
                    region: 'west',
                    width: 300,
                    title: '图片列表',
                    columns: [
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'string',
                            text: 'String'
                        },
                        {
                            xtype: 'numbercolumn',
                            dataIndex: 'number',
                            text: 'Number'
                        },
                        {
                            xtype: 'datecolumn',
                            dataIndex: 'date',
                            text: 'Date'
                        },
                        {
                            xtype: 'booleancolumn',
                            dataIndex: 'bool',
                            text: 'Boolean'
                        }
                    ]
                },
                {
                    xtype: 'image',
                    region: 'center',
                    src: 'D:%5Cxiao'
                }
            ]
        }
    ]

});