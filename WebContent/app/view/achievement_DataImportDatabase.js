/*
 * File: app/view/achievement_DataImportDatabase.js
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

Ext.define('MyApp.view.achievement_DataImportDatabase', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.achievement_DataImportDatabase',

    requires: [
        'Ext.grid.Panel',
        'Ext.grid.column.Number',
        'Ext.grid.column.Date',
        'Ext.grid.column.Boolean',
        'Ext.grid.View'
    ],

    height: 588,
    width: 786,
    layout: 'border',
    title: '成果数据入库',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'center',
            layout: 'border',
            title: '',
            items: [
                {
                    xtype: 'gridpanel',
                    region: 'west',
                    split: true,
                    autoScroll: true,
                    width: '50%',
                    title: '电子表格数据预览',
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
                    xtype: 'panel',
                    region: 'center',
                    html: '<div id = "map" style = "width=100%;height:100%;"></div>',
                    title: '地理矢量数据预览',
                    listeners: {
                        afterrender: 'onPanelAfterRender'
                    }
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'north',
            height: 91,
            html: '<input type="file" name="file" id="file_dataImport" multiple id="file" />',
            title: 'My Panel'
        }
    ],

    onPanelAfterRender: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/homeMap.js";
        head.appendChild(script);
    }

});