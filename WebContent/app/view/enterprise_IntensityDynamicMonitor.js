/*
 * File: app/view/enterprise_IntensityDynamicMonitor.js
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

Ext.define('MyApp.view.enterprise_IntensityDynamicMonitor', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.enterprise_IntensityDynamicMonitor',

    requires: [
        'Ext.grid.Panel',
        'Ext.grid.column.Column',
        'Ext.grid.View',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.toolbar.Separator'
    ],

    html: '<div id = "enterprise_IntensityDynamicMonitor_div" style = "width=100%;height:100%;"></div>',
    layout: 'fit',
    title: '企业集约度动态监测',
    defaultListenerScope: true,

    listeners: {
        afterrender: 'onPanelAfterRender'
    },
    items: [
        {
            xtype: 'gridpanel',
            store: 'enterprise_IntensityAlertStore',
            columns: [
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'kfqdm',
                    text: '开发区代码'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'kfqmc',
                    text: '开发区名称'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'jyddj',
                    text: '集约度等级'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'tbbh',
                    text: '图斑编号'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'dxdm',
                    text: '企业代码'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'qymc',
                    text: '企业名称'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'qydz',
                    text: '企业地址'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'sspjfw',
                    text: '所属评价范围'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'hylb',
                    text: '行业类别'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'qyrs',
                    text: '企业人数'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'qyydmj',
                    text: '企业用地面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'cfpt',
                    text: '厂房配套面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'xzbg',
                    text: '行政办公面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'ltcd',
                    text: '操作场地面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'nbyld',
                    text: '厂区预留面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'dltcc',
                    text: '道路停车面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'ld',
                    text: '绿地面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'qt',
                    text: '其他用地面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'zjzmj',
                    text: '总建筑面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'rjl',
                    text: '容积率'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'jdzmj',
                    text: '建筑基底面积'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'jzxs',
                    text: '建筑系数'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'bz',
                    text: '备注'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'textfield',
                            id: 'ent_intensityMonitor_SearchField'
                        },
                        {
                            xtype: 'button',
                            text: '搜索',
                            listeners: {
                                click: 'onButtonClick3'
                            }
                        },
                        {
                            xtype: 'tbseparator'
                        },
                        {
                            xtype: 'button',
                            text: '全部',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        },
                        {
                            xtype: 'button',
                            text: '低集约度企业',
                            listeners: {
                                click: 'onButtonClick2'
                            }
                        },
                        {
                            xtype: 'button',
                            text: '中集约度企业',
                            listeners: {
                                click: 'onButtonClick1'
                            }
                        },
                        {
                            xtype: 'button',
                            text: '高集约度企业',
                            listeners: {
                                click: 'onButtonClick11'
                            }
                        }
                    ]
                }
            ]
        }
    ],

    onPanelAfterRender: function(component, eOpts) {

    },

    onButtonClick3: function(button, e, eOpts) {
        var keyword = Ext.getCmp('ent_intensityMonitor_SearchField').getValue();
        var store = Ext.StoreMgr.get('enterprise_IntensityAlertStore'); //获得store对象
        //在load事件中添加参数
        store.load({
            params: {
                searchKeyword: keyword,
                code : ''
            }
        });

    },

    onButtonClick: function(button, e, eOpts) {
        var keyword = Ext.getCmp('ent_intensityMonitor_SearchField').getValue();
        var store = Ext.StoreMgr.get('enterprise_IntensityAlertStore'); //获得store对象
        //在load事件中添加参数
        store.load({
            params: {
                searchKeyword: '',
                code : ''
            }
        });

    },

    onButtonClick2: function(button, e, eOpts) {
        var keyword = Ext.getCmp('ent_intensityMonitor_SearchField').getValue();
        var store = Ext.StoreMgr.get('enterprise_IntensityAlertStore'); //获得store对象
        //在load事件中添加参数
        store.load({
            params: {
                searchKeyword: '',
                code : '1'
            }
        });

    },

    onButtonClick1: function(button, e, eOpts) {
        var keyword = Ext.getCmp('ent_intensityMonitor_SearchField').getValue();
        var store = Ext.StoreMgr.get('enterprise_IntensityAlertStore'); //获得store对象
        //在load事件中添加参数
        store.load({
            params: {
                searchKeyword: '',
                code : '2'
            }
        });

    },

    onButtonClick11: function(button, e, eOpts) {
        var keyword = Ext.getCmp('ent_intensityMonitor_SearchField').getValue();
        var store = Ext.StoreMgr.get('enterprise_IntensityAlertStore'); //获得store对象
        //在load事件中添加参数
        store.load({
            params: {
                searchKeyword: '',
                code : '3'
            }
        });

    }

});