/*
 * File: app/view/win_kfqinfo_add.js
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

Ext.define('MyApp.view.win_kfqinfo_add', {
    extend: 'Ext.window.Window',
    alias: 'widget.win_kfqinfo_add',

    requires: [
        'MyApp.view.win_kfqinfo_addViewModel',
        'Ext.form.Panel',
        'Ext.form.FieldSet',
        'Ext.toolbar.Toolbar',
        'Ext.toolbar.Fill',
        'Ext.button.Button',
        'Ext.toolbar.Spacer',
        'Ext.form.field.Date'
    ],

    viewModel: {
        type: 'win_kfqinfo_add'
    },
    autoScroll: true,
    height: 575,
    id: 'win_kfqInfo_add',
    width: 427,
    title: '新增开发区信息表单',
    titleAlign: 'center',

    items: [
        {
            xtype: 'form',
            height: 1183,
            id: 'form_kfqinfo_add',
            width: 405,
            layout: 'absolute',
            bodyPadding: 10,
            title: '',
            url: 'add_kfqInfomation',
            items: [
                {
                    xtype: 'fieldset',
                    x: 20,
                    y: 20,
                    height: 200,
                    hidden: true,
                    width: 361,
                    layout: 'auto',
                    title: '开发区基本信息',
                    items: [
                        {
                            xtype: 'textfield',
                            width: 325,
                            fieldLabel: '开发区名称',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'kfqmc'
                        },
                        {
                            xtype: 'textfield',
                            width: 325,
                            fieldLabel: '开发区级别',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'kfqjb'
                        },
                        {
                            xtype: 'textfield',
                            height: 25,
                            width: 325,
                            fieldLabel: '开发区审批单位',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'spdw'
                        },
                        {
                            xtype: 'textfield',
                            height: 25,
                            width: 325,
                            fieldLabel: '开发区管理机构',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'gljg'
                        },
                        {
                            xtype: 'textfield',
                            height: 25,
                            width: 325,
                            fieldLabel: '开发区管理机构地址',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'gljgdz'
                        },
                        {
                            xtype: 'textfield',
                            height: 25,
                            width: 325,
                            fieldLabel: '开发区主导产业',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'zdcy'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '开发区依法审批土地总面积（hm2）',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'sptdzmj'
                        },
                        {
                            xtype: 'textfield',
                            height: 25,
                            width: 325,
                            fieldLabel: '开发区评价类型',
                            labelAlign: 'right',
                            labelWidth: 150,
                            name: 'kfqpjlx'
                        }
                    ]
                }
            ]
        }
    ],
    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'bottom',
            height: 38,
            items: [
                {
                    xtype: 'tbfill'
                },
                {
                    xtype: 'button',
                    handler: function() {
                        Ext.getCmp('win_kfqInfo_add').close();
                    },
                    text: '取       消'
                },
                {
                    xtype: 'tbspacer',
                    width: 20
                },
                {
                    xtype: 'button',
                    handler: function() {
                        //添加开发区信息,url:add_kfqinfo

                        var myform = Ext.getCmp('form_kfqinfo_add').getForm();
                        if (myform.isValid())
                        {
                            console.log('form is ava');
                            myform.submit({
                                //url : 'add_kfqinfo',
                                success : function (form, action)
                                {
                                    Ext.Msg.alert('成功', '内容添加成功。');
                                    var mystore = Ext.StoreMgr.get('kfqInfoStore'); //获得store对象
                                    mystore.reload();

                                    var win = Ext.getCmp('form_kfqInfo_add');
                                    win.close();

                                },
                                failure: function(form, action){
                                    Ext.Msg.alert('失败', '内容添加失败，请重试。');
                                }
                            });
                        }
                        else
                        {
                            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
                        }
                    },
                    text: '增  添'
                },
                {
                    xtype: 'tbspacer',
                    width: 20
                },
                {
                    xtype: 'datefield',
                    height: 25,
                    width: 325,
                    fieldLabel: '开发区设立时间',
                    labelAlign: 'right',
                    labelWidth: 150,
                    name: 'slsj',
                    submitValue: false,
                    format: 'Y-m-d'
                }
            ]
        }
    ]

});