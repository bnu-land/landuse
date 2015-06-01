/*
 * File: app/view/system_MapAddWindow.js
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

Ext.define('MyApp.view.system_MapAddWindow', {
    extend: 'Ext.window.Window',
    alias: 'widget.system_MapAddWindow',

    requires: [
        'Ext.form.Panel',
        'Ext.form.field.Number',
        'Ext.form.field.TextArea',
        'Ext.toolbar.Toolbar',
        'Ext.toolbar.Fill',
        'Ext.button.Button'
    ],

    height: 272,
    id: 'system_MapAddWindow',
    width: 445,
    layout: 'fit',
    title: '添加地图',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'form',
            id: 'system_MapAddForm',
            modelValidation: false,
            bodyPadding: 10,
            jsonSubmit: true,
            url: 'add_Map',
            items: [
                {
                    xtype: 'numberfield',
                    anchor: '100%',
                    fieldLabel: '图层编号',
                    labelAlign: 'right',
                    labelWidth: 80,
                    name: 'pid'
                },
                {
                    xtype: 'textfield',
                    anchor: '100%',
                    fieldLabel: '地图名称',
                    labelAlign: 'right',
                    labelWidth: 80,
                    name: 'name',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    anchor: '100%',
                    fieldLabel: '地图标识',
                    labelAlign: 'right',
                    labelWidth: 80,
                    name: 'key'
                },
                {
                    xtype: 'textfield',
                    anchor: '100%',
                    fieldLabel: '地图地址',
                    labelAlign: 'right',
                    labelWidth: 80,
                    name: 'url',
                    inputType: 'url'
                },
                {
                    xtype: 'textareafield',
                    anchor: '100%',
                    fieldLabel: '描述',
                    labelAlign: 'right',
                    labelWidth: 80,
                    name: 'description'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'bottom',
                    items: [
                        {
                            xtype: 'tbfill'
                        },
                        {
                            xtype: 'button',
                            text: '取消',
                            listeners: {
                                click: 'onButtonClick1'
                            }
                        },
                        {
                            xtype: 'button',
                            text: '添加',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        }
                    ]
                }
            ]
        }
    ],
    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top'
        }
    ],

    onButtonClick1: function(button, e, eOpts) {

    },

    onButtonClick: function(button, e, eOpts) {
        var win  = Ext.getCmp('system_MapAddWindow');

        var myform = Ext.getCmp('system_MapAddForm').getForm();
        if (myform.isValid())
        {
            myform.submit({
                //url : 'add_Map',
                success : function (form, action)
                {
                    Ext.Msg.alert('成功', '添加地图成功。');

                    var mystore = Ext.StoreMgr.get('systemManageMapStore'); //获得store对象
                    mystore.reload();
                    win.close();
                },
                failure: function(form, action){
                    Ext.Msg.alert('失败', '添加地图失败，请重试。');
                    win.close();
                }
            });
        }
        else
        {
            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
        }
    }

});