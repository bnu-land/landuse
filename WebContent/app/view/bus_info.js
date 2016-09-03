/*
 * File: app/view/bus_info.js
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

Ext.define('MyApp.view.bus_info', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.bus_info',

    requires: [
        'MyApp.view.bus_infoViewModel',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View',
        'Ext.selection.CheckboxModel'
    ],

    viewModel: {
        type: 'bus_info'
    },
    height: 485,
    id: 'buss_info',
    width: 530,
    layout: 'border',
    title: '数据填报状态',

    items: [
        {
            xtype: 'panel',
            region: 'center',
            layout: 'absolute',
            title: '企业信息列表',
            dockedItems: [
                {
                    xtype: 'toolbar',
                    x: 0,
                    y: 140,
                    dock: 'top',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: ''
                        },
                        {
                            xtype: 'button',
                            text: '搜索'
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                // //var xtype = 'law_Import';
                                // var mainView = Ext.getCmp('mywindow');
                                // mainView.removeAll();
                                // mainView.add(Ext.widget('mywindow'));
                                var win = Ext.widget('mywindow');
                                console.log(win);
                                win.show();
                            },
                            text: '新增'
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                var grid = Ext.getCmp('bus1_info');
                                var records = grid.getSelection();
                                if (records.length === 0) {
                                    Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
                                    return;
                                } else if (records.length > 1) {
                                    Ext.Msg.alert('提示', '每次只能 一条信息。');
                                    return;
                                }
                                var record = records[0];

                                Ext.Msg.confirm('您正在删除', '企业：' + record.get('businessName') + '，企业编号为：'+record.get('businessId')+'，<br/> 确认删除？', getResult);
                                function getResult(confirm)
                                {
                                    console.log('confirm:', confirm);
                                    if (confirm == "yes"){
                                        var businessId = record.get("businessId");
                                        console.log('businessId:',businessId);
                                        Ext.Ajax.request(
                                        {
                                            url : 'del_info',
                                            params :
                                            {
                                                businessId : businessId
                                            },
                                            success : function (response){
                                                Ext.Msg.alert('成功提示', '记录删除成功。');
                                                //successResult();
                                                var mystore = Ext.StoreMgr.get('bussinessinformation');
                                                mystore.load();
                                            },
                                            failure : function (response){
                                                //failedResult();
                                                // Ext.Msg.alert('失败提示', '记录删除失败。');
                                            }
                                        });
                                    }
                                }
                            },
                            text: '清除'
                        }
                    ]
                }
            ],
            items: [
                {
                    xtype: 'gridpanel',
                    height: 220,
                    id: 'bus1_info',
                    width: 531,
                    title: '',
                    store: 'bussinessinformation',
                    columns: [
                        {
                            xtype: 'rownumberer',
                            dataIndex: '',
                            text: '序号'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'businessId',
                            text: '企业代码'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'businessName',
                            text: '企业名称'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'businessAddress',
                            text: '企业地址'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'businessWorker',
                            text: '企业人数'
                        }
                    ],
                    selModel: {
                        selType: 'checkboxmodel'
                    }
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'north',
            height: 150,
            title: ''
        }
    ]

});