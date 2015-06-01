/*
 * File: app/view/survey_TypicalEnterprise.js
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

Ext.define('MyApp.view.survey_TypicalEnterprise', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.survey_TypicalEnterprise',

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
    title: '典型企业调查',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'center',
            split: true,
            html: '<div id = "survey_TypicalEnterprise_LayerCombo_div" style = "width=100%;height:100%;"></div>',
            id: 'survey_TypicalEnterprise_MapPanel',
            layout: 'fit',
            title: '',
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'combobox',
                            id: 'survey_TypicalEnterprise_LayerCombo',
                            width: 350,
                            fieldLabel: '选择开发区',
                            displayField: 'name',
                            store: 'systemMapQYYDLayerStore',
                            valueField: 'url'
                        }
                    ]
                }
            ],
            listeners: {
                afterrender: 'onPanelAfterRender1'
            }
        },
        {
            xtype: 'gridpanel',
            region: 'south',
            split: true,
            height: 250,
            id: 'survey_TypicalEnterpriseGrid',
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
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/survey_TypicalEnterprise_map.js";
        head.appendChild(script);
    }

});