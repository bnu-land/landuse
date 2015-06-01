/*
 * File: app/view/system_MapManage.js
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

Ext.define('MyApp.view.system_MapManage', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.system_MapManage',

    requires: [
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.toolbar.Separator',
        'Ext.selection.CheckboxModel'
    ],

    height: 588,
    width: 786,
    layout: 'fit',
    title: '地图管理',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'gridpanel',
            id: 'system_MapManageGrid',
            store: 'systemManageMapStore',
            columns: [
                {
                    xtype: 'rownumberer'
                },
                {
                    xtype: 'gridcolumn',
                    width: 250,
                    dataIndex: 'name',
                    text: '名称'
                },
                {
                    xtype: 'gridcolumn',
                    width: 150,
                    dataIndex: 'key',
                    text: '键值'
                },
                {
                    xtype: 'gridcolumn',
                    width: 500,
                    dataIndex: 'url',
                    text: '图层地址'
                },
                {
                    xtype: 'gridcolumn',
                    width: 200,
                    dataIndex: 'description',
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
                            id: 'system_MapManage_SearchKey'
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/search.png',
                            text: '查询',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/preview.png',
                            text: '预览'
                        },
                        {
                            xtype: 'tbseparator'
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/add.png',
                            text: '添加',
                            listeners: {
                                click: 'onButtonClick1'
                            }
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/edit.png',
                            text: '修改',
                            listeners: {
                                click: 'onButtonClick2'
                            }
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/delete.png',
                            text: '删除'
                        }
                    ]
                }
            ],
            selModel: {
                selType: 'checkboxmodel'
            }
        }
    ],

    onButtonClick: function(button, e, eOpts) {
        var getKeyword = Ext.getCmp('system_MapManage_SearchKey').getValue();
        var mystore = Ext.StoreMgr.get('systemManageMapStore'); //获得store对象
        //在load事件中添加参数
        mystore.load({
            params :{searchKeyword : getKeyword}
        });
    },

    onButtonClick1: function(button, e, eOpts) {
        var win = Ext.widget('system_MapAddWindow');
        win.show();
    },

    onButtonClick2: function(button, e, eOpts) {

    }

});