/*
 * File: app/view/survey_zdxx.js
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

Ext.define('MyApp.view.survey_zdxx', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.survey_zdxx',

    requires: [
        'Ext.toolbar.Toolbar',
        'Ext.form.field.ComboBox',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Number',
        'Ext.grid.View'
    ],

    height: 671,
    width: 786,
    layout: 'border',
    title: '宗地信息调查',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'center',
            split: true,
            html: '<div id = "survey_Landuse_div" style = "width=100%;height:100%;"></div>',
            id: 'survey_Landuse_MapPanel1',
            layout: 'fit',
            title: '',
            listeners: {
                afterrender: 'onPanelAfterRender1'
            },
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'combobox',
                            id: 'ent_check_gradeCombo3',
                            width: 181,
                            fieldLabel: '开发区级别',
                            labelWidth: 80,
                            store: [
                                '全部',
                                '国家级',
                                '省级',
                                '示范区'
                            ],
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'ent_check_typeCombo3',
                            width: 190,
                            fieldLabel: '开发区类型',
                            labelWidth: 80,
                            store: [
                                '全部',
                                '工业主导型',
                                '产城融合型'
                            ],
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'survey_Landuse_LayerCombo1',
                            width: 250,
                            fieldLabel: '选择开发区',
                            labelWidth: 80,
                            displayField: 'mapName',
                            store: 'systemMapFeatureLayerStore',
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'ent_check_yearCombo3',
                            width: 190,
                            fieldLabel: '选择年份',
                            labelWidth: 80,
                            store: [
                                '2016',
                                '2015',
                                '2014',
                                '2013',
                                '2012',
                                '2011',
                                '2010'
                            ],
                            valueField: 'mapUrl'
                        }
                    ]
                }
            ]
        },
        {
            xtype: 'gridpanel',
            region: 'south',
            split: true,
            height: 250,
            id: 'survey_LanduseGrid1',
            title: '宗地信息列表',
            columns: [
                {
                    xtype: 'rownumberer'
                },
                {
                    xtype: 'numbercolumn',
                    width: 80,
                    dataIndex: 'TBBH',
                    text: '图斑编号',
                    format: '0,000'
                },
                {
                    xtype: 'gridcolumn',
                    width: 150,
                    dataIndex: 'DLMC',
                    text: '地类名称'
                },
                {
                    xtype: 'gridcolumn',
                    width: 80,
                    dataIndex: 'DLDM',
                    text: '地类代码'
                },
                {
                    xtype: 'gridcolumn',
                    width: 150,
                    dataIndex: 'GHYT',
                    text: '规划用途'
                },
                {
                    xtype: 'gridcolumn',
                    width: 80,
                    dataIndex: 'GHDM',
                    text: '规划代码'
                },
                {
                    xtype: 'gridcolumn',
                    width: 150,
                    dataIndex: 'TDSYZ',
                    text: '土地使用者'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'QS',
                    text: '权属'
                },
                {
                    xtype: 'numbercolumn',
                    dataIndex: 'DLMJ',
                    text: '地类面积'
                }
            ]
        }
    ],

    onPanelAfterRender1: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/survey_Landuse_map.js";
        head.appendChild(script);
    }

});