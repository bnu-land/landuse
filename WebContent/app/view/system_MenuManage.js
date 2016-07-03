/*
 * File: app/view/system_MenuManage.js
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

Ext.define('MyApp.view.system_MenuManage', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.system_MenuManage',

    requires: [
        'Ext.tree.Panel',
        'Ext.tree.View',
        'Ext.tree.Column'
    ],

    html: '<div id="map"></div>',
    layout: 'border',
    title: '主页',

    items: [
        {
            xtype: 'treepanel',
            region: 'north',
            height: 308,
            collapsible: true,
            title: 'My Tree Grid Panel',
            store: 'systemManageMapTreeStore',
            rootVisible: false,
            useArrows: true,
            viewConfig: {

            },
            columns: [
                {
                    xtype: 'treecolumn',
                    width: 300,
                    dataIndex: 'kfqName',
                    text: 'Nodes',
                    flex: 1
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'mapName',
                    text: 'Value'
                }
            ]
        },
        {
            xtype: 'treepanel',
            region: 'center',
            title: 'My Tree Panel',
            store: 'systemManageMapTreeStore',
            viewConfig: {

            },
            columns: [
                {
                    xtype: 'treecolumn',
                    width: 200,
                    dataIndex: 'kfqName',
                    text: 'MyTreeColumn2'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'mapName',
                    text: 'MyColumn1'
                }
            ]
        }
    ]

});