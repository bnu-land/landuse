/*
 * File: app/view/zdxx_add.js
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

Ext.define('MyApp.view.zdxx_add', {
    extend: 'Ext.window.Window',
    alias: 'widget.zdxx_add',

    requires: [
        'MyApp.view.zdxx_addViewModel',
        'Ext.form.Panel',
        'Ext.form.field.ComboBox',
        'Ext.form.field.Date',
        'Ext.form.field.TextArea',
        'Ext.toolbar.Toolbar',
        'Ext.toolbar.Fill',
        'Ext.button.Button',
        'Ext.toolbar.Spacer'
    ],

    viewModel: {
        type: 'zdxx_add'
    },
    height: 606,
    id: 'zdxx_add',
    width: 825,
    layout: 'border',
    title: '添加宗地信息',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'form',
            region: 'center',
            autoScroll: true,
            id: 'add_zdwidinfo',
            layout: 'absolute',
            bodyPadding: 10,
            title: '',
            jsonSubmit: true,
            url: 'add_zdinfo',
            items: [
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 20,
                    width: 220,
                    fieldLabel: '开发区名称',
                    name: 'kfqmc'
                },
                {
                    xtype: 'textfield',
                    x: 20,
                    y: 510,
                    hidden: true,
                    width: 220,
                    fieldLabel: '开发区名称',
                    name: 'id'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 60,
                    width: 220,
                    fieldLabel: '图斑编号',
                    name: 'tbbh'
                },
                {
                    xtype: 'combobox',
                    x: 300,
                    y: 20,
                    width: 220,
                    fieldLabel: '开发区评价范围',
                    name: 'kfqpjfw',
                    store: [
                        '主区',
                        '发展方向区'
                    ]
                },
                {
                    xtype: 'combobox',
                    x: 570,
                    y: 20,
                    width: 220,
                    fieldLabel: '开发区评价类型',
                    name: 'kfqpjlx',
                    store: [
                        '产城融合型',
                        '工业主导型'
                    ]
                },
                {
                    xtype: 'combobox',
                    x: 300,
                    y: 60,
                    width: 220,
                    fieldLabel: '地类名称',
                    name: 'dlmc',
                    store: [
                        '住宅用地',
                        '工矿仓储用地',
                        '街巷用地',
                        '其他交通运输用地',
                        '商服用地',
                        '公园与绿地',
                        '其他公共管理与公共服务用地',
                        '其他城镇建设用地',
                        '河湖及其蓄滞洪区土地',
                        '自然、生态保护区土地',
                        '其他不可建设土地'
                    ]
                },
                {
                    xtype: 'textfield',
                    x: 570,
                    y: 60,
                    width: 220,
                    fieldLabel: '地类面积(公顷)',
                    name: 'dlmj'
                },
                {
                    xtype: 'combobox',
                    x: 30,
                    y: 100,
                    width: 220,
                    fieldLabel: '权属',
                    name: 'qs',
                    store: [
                        '国有',
                        '集体'
                    ]
                },
                {
                    xtype: 'datefield',
                    x: 300,
                    y: 100,
                    width: 220,
                    fieldLabel: '供应时间',
                    name: 'gysj',
                    allowBlank: false,
                    format: 'Y-m'
                },
                {
                    xtype: 'combobox',
                    x: 570,
                    y: 100,
                    width: 220,
                    fieldLabel: '供应类型',
                    name: 'gylx',
                    store: [
                        '划拨土地',
                        '有偿使用但未到期土地',
                        '有偿使用且已到期但未处置土地',
                        '尚可划拨土地',
                        '尚可供应工矿仓储用地(必须有偿)',
                        '其他尚可有偿使用土地',
                        '不可供应土地'
                    ]
                },
                {
                    xtype: 'combobox',
                    x: 30,
                    y: 140,
                    width: 220,
                    fieldLabel: '土地招拍佳情况',
                    name: 'tdzpg',
                    store: [
                        '是',
                        '否'
                    ]
                },
                {
                    xtype: 'textfield',
                    x: 300,
                    y: 140,
                    width: 220,
                    fieldLabel: '使用年限',
                    name: 'synx'
                },
                {
                    xtype: 'textfield',
                    x: 570,
                    y: 140,
                    width: 220,
                    fieldLabel: '土地使用者',
                    name: 'tdsyz'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 175,
                    width: 220,
                    fieldLabel: '建筑面积(平方米)',
                    name: 'jzmj'
                },
                {
                    xtype: 'textfield',
                    x: 300,
                    y: 175,
                    width: 220,
                    fieldLabel: '建筑基底面积(平方米)',
                    name: 'jzjdmj'
                },
                {
                    xtype: 'combobox',
                    x: 570,
                    y: 175,
                    width: 220,
                    fieldLabel: '高新技术产业用地类别',
                    name: 'gxlb',
                    store: [
                        '一类',
                        '二类'
                    ]
                },
                {
                    xtype: 'textfield',
                    x: 28,
                    y: 225,
                    width: 490,
                    fieldLabel: '建筑物、构筑物基底及露天堆场、露天操作场地的总面积（平方米）',
                    labelWidth: 395,
                    name: 'jdzmj'
                },
                {
                    xtype: 'textfield',
                    x: 570,
                    y: 220,
                    width: 220,
                    fieldLabel: '高新技术产业用地面积(公顷）',
                    name: 'gxydmj'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 260,
                    width: 220,
                    fieldLabel: '高新技术产业用地面积折算比例 ',
                    name: 'gxzsbl'
                },
                {
                    xtype: 'textfield',
                    x: 300,
                    y: 260,
                    width: 220,
                    fieldLabel: '高新技术产业收入（万元）',
                    name: 'gxsr'
                },
                {
                    xtype: 'textfield',
                    x: 570,
                    y: 260,
                    width: 220,
                    fieldLabel: '高新技术产业税收（万元）',
                    name: 'gxss'
                },
                {
                    xtype: 'combobox',
                    x: 30,
                    y: 310,
                    width: 220,
                    fieldLabel: '规划用途',
                    name: 'ghyt',
                    store: [
                        '住宅用地',
                        '工矿仓储用地',
                        '街巷用地',
                        '其他交通运输用地',
                        '商服用地',
                        '公园与绿地',
                        '其他公共管理与公共服务用地',
                        '其他城镇建设用地'
                    ]
                },
                {
                    xtype: 'combobox',
                    x: 300,
                    y: 310,
                    width: 220,
                    fieldLabel: '土地闲置情况',
                    name: 'tdxzqk',
                    store: [
                        '是',
                        '否'
                    ]
                },
                {
                    xtype: 'combobox',
                    x: 570,
                    y: 310,
                    width: 220,
                    fieldLabel: '批准用途',
                    name: 'pzyt',
                    store: [
                        '住宅用地',
                        '工矿仓储用地',
                        '街巷用地',
                        '其他交通运输用地',
                        '商服用地',
                        '公园与绿地',
                        '其他公共管理与公共服务用地',
                        '其他城镇建设用地'
                    ]
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 350,
                    width: 220,
                    fieldLabel: '认定依据',
                    name: 'rdyj'
                },
                {
                    xtype: 'textfield',
                    x: 300,
                    y: 350,
                    width: 490,
                    fieldLabel: '工业企业、工业物流企业固定资产投资总额(万元）',
                    labelWidth: 330,
                    name: 'gdzctzze'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 385,
                    width: 220,
                    fieldLabel: '二、三产业税收总额（万元/年）',
                    name: 'esssze'
                },
                {
                    xtype: 'textfield',
                    x: 300,
                    y: 385,
                    width: 220,
                    fieldLabel: '工业企业工业物流企业总收入（万元/年）',
                    labelWidth: 130,
                    name: 'qyzsr'
                },
                {
                    xtype: 'textfield',
                    x: 570,
                    y: 385,
                    width: 220,
                    fieldLabel: '工业企业工业物流企业税收总额（万元/年）',
                    labelWidth: 130,
                    name: 'qyssze'
                },
                {
                    xtype: 'textareafield',
                    x: 27,
                    y: 431,
                    width: 760,
                    fieldLabel: '备注',
                    name: 'bz'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    x: 96,
                    y: 517,
                    dock: 'bottom',
                    items: [
                        {
                            xtype: 'tbfill'
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                var win = Ext.getCmp('zdxx_add');
                                win.close();
                            },
                            width: 80,
                            text: '取消'
                        },
                        {
                            xtype: 'tbspacer',
                            width: 30
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                var myform = Ext.getCmp('add_zdwidinfo').getForm();
                                if (myform.isValid())
                                {
                                    console.log('form is ava');
                                    myform.submit({
                                        // url : 'add_zdinfo',
                                        success : function (form, action)
                                        {
                                            Ext.Msg.alert('成功', '内容添加成功。');
                                            var mystore = Ext.StoreMgr.get('zd_infoStore'); //获得store对象
                                            mystore.reload();

                                            var win = Ext.getCmp('add_zdinfo');
                                            win.close();

                                            var grid = Ext.getCmp('zd_info');
                                            grid.reconfigure(store);


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
                            id: 'addZdConfirm',
                            width: 80,
                            text: '确定'
                        }
                    ]
                }
            ]
        }
    ],
    listeners: {
        afterrender: 'onAdd_zdinfoAfterRender'
    },

    onAdd_zdinfoAfterRender: function(component, eOpts) {
        var title=this.getTitle();
        var form=Ext.getCmp('add_zdwidinfo').getForm();
        var button=Ext.getCmp('addZdConfirm');
         console.log(form.url);
        if(title=="查看宗地信息")
            {
                button.setHidden(true);
            }
        if(title=="修改宗地信息")
        {
            form.url='upload_zdinfo';
        }
        if(title=="添加宗地信息")
        {
            form.url='add_zdinfo';
            console.log(form.url);
        }
    }

});