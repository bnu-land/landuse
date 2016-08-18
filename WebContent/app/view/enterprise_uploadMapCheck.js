/*
 * File: app/view/enterprise_uploadMapCheck.js
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

Ext.define('MyApp.view.enterprise_uploadMapCheck', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.enterprise_uploadMapCheck',

    requires: [
        'MyApp.view.business_uploadMapViewModel1',
        'Ext.grid.Panel',
        'Ext.selection.CheckboxModel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.ComboBox',
        'Ext.toolbar.Separator',
        'Ext.form.Label',
        'Ext.button.Button',
        'Ext.toolbar.TextItem'
    ],

    viewModel: {
        type: 'enterprise_uploadmapcheck'
    },
    autoScroll: true,
    height: 675,
    width: 879,
    layout: 'border',
    title: '上报数据审核',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'gridpanel',
            region: 'center',
            autoScroll: true,
            id: 'ent_uploadInfoCheckGrid',
            collapsed: false,
            collapsible: false,
            enableColumnHide: false,
            store: 'Business_mapStore',
            selModel: {
                selType: 'checkboxmodel'
            },
            columns: [
                {
                    xtype: 'rownumberer',
                    width: 63,
                    dataIndex: 'string',
                    text: '序号'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'proCode',
                    text: '项目编号'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'uploadUser',
                    text: '上传用户'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'isPass',
                    text: '审核结果'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'checkResult',
                    text: '审核批语'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoor',
                    text: '北至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'northCoorw',
                    text: '北至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoor',
                    text: '西至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoorw',
                    text: '西至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'eastCoor',
                    text: '东至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'eastCoorw',
                    text: '东至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'southCoor',
                    text: '南至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'southCoorw',
                    text: '南至坐标纬度'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'combobox',
                            fieldLabel: '选择开发区',
                            labelWidth: 80
                        },
                        {
                            xtype: 'combobox',
                            width: 150,
                            fieldLabel: '选择年份',
                            labelWidth: 60
                        },
                        {
                            xtype: 'tbseparator'
                        },
                        {
                            xtype: 'label',
                            text: '操作：'
                        },
                        {
                            xtype: 'button',
                            text: '查看基本信息'
                        },
                        {
                            xtype: 'button',
                            text: '查看照片'
                        },
                        {
                            xtype: 'button',
                            text: '查看位置'
                        },
                        {
                            xtype: 'tbseparator'
                        },
                        {
                            xtype: 'tbtext',
                            text: '审核操作：'
                        },
                        {
                            xtype: 'button',
                            text: '通过',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        },
                        {
                            xtype: 'button',
                            text: '不通过',
                            listeners: {
                                click: 'onButtonClick1'
                            }
                        }
                    ]
                }
            ]
        }
    ],

    onButtonClick: function(button, e, eOpts) {
        //获取数据
        var grid = Ext.getCmp('ent_uploadInfoCheckGrid');
        var records = grid.getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后进行审核。');
            return;
        }
        var ids = [];
        for (var re in records) {
            var record = records[re];
            ids.push(record.get('id'));
        }
        //执行通过或拒绝
        Ext.Ajax.request({
            url: 'set_EntUploadCheckPass',
            params: {
                "ids": ids,
                "isPass": 1
            },
            success: function() {
                Ext.Msg.alert('成功', '企业信息通过审核！');
                grid.getStore().reload();
            },
            failure: function() {
                Ext.Msg.alert('失败', '审核失败，可能由网络问题造成，请刷新重试。');
            }
        });

    },

    onButtonClick1: function(button, e, eOpts) {
        //获取数据
        var records = Ext.getCmp('ent_uploadInfoCheckGrid').getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后进行审核。');
            return;
        }
        var ids = [];
        for (var re in records) {
            var record = records[re];
            ids.push(record.get('id'));
        }
        //执行通过或拒绝
        Ext.Ajax.request({
            url: 'set_EntUploadCheckPass',
            params: {
                "ids": ids,
                "isPass": 2
            },
            success: function() {
                //启动窗口
                var win = Ext.widget('enterprise_uploadMapCheckResultWindow');
                win.show();
            },
            failure: function() {
                Ext.Msg.alert('失败', '审核失败，可能由网络问题造成，请刷新重试。');
            }
        });

    }

});