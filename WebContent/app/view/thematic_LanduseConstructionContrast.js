/*
 * File: app/view/thematic_LanduseConstructionContrast.js
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

Ext.define('MyApp.view.thematic_LanduseConstructionContrast', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.thematic_LanduseConstructionContrast',

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
    title: '土地利用结构对比分析',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'north',
            split: true,
            height: 441,
            layout: 'border',
            title: '',
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'combobox',
                            id: 'thematicLCC_LayerCombo',
                            width: 350,
                            fieldLabel: '选择开发区',
                            displayField: 'mapName',
                            store: 'systemMapFeatureLayerStore',
                            valueField: 'mapUrl'
                        }
                    ]
                }
            ],
            items: [
                {
                    xtype: 'panel',
                    region: 'west',
                    split: true,
                    html: '<div id = "thematic_LanduseConstructionContrast_echart" class="echartsDiv"></div>',
                    width: 591,
                    layout: 'fit',
                    title: '统计图表',
                    listeners: {
                        afterrender: 'onPanelAfterRender1'
                    }
                },
                {
                    xtype: 'panel',
                    region: 'center',
                    split: true,
                    html: '<div id = "thematic_LanduseConstructionContrast_div" class="MapDiv"></div>',
                    id: 'thematic_LanduseConstructionContrast_MapPanel',
                    title: '开发区地图',
                    listeners: {
                        afterrender: 'onPanelAfterRender'
                    }
                }
            ]
        },
        {
            xtype: 'gridpanel',
            region: 'center',
            split: true,
            id: 'thematic_LanduseConstructionContrastGrid',
            title: '属性数据',
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
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="echarts/thematic_LanduseConstructionContrast.js";
        head.appendChild(script);
    },

    onPanelAfterRender: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/thematic_LanduseConstructionContrast_map.js";
        head.appendChild(script);
    }

});