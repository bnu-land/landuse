/*
 * File: app/view/dxqy_adduplod.js
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

Ext.define('MyApp.view.dxqy_adduplod', {
    extend: 'Ext.window.Window',
    alias: 'widget.dxqy_adduplod',

    requires: [
        'MyApp.view.dxqy_adduplodViewModel',
        'Ext.form.Panel',
        'Ext.form.FieldSet',
        'Ext.form.field.ComboBox',
        'Ext.form.RadioGroup',
        'Ext.form.field.Radio',
        'Ext.toolbar.Toolbar',
        'Ext.toolbar.Fill',
        'Ext.button.Button'
    ],

    viewModel: {
        type: 'dxqy_adduplod'
    },
    height: 652,
    id: 'business_addinformation',
    width: 771,
    layout: 'border',
    title: '企业信息录入',

    items: [
        {
            xtype: 'form',
            region: 'center',
            autoScroll: true,
            id: 'dxqy_addinformation',
            layout: 'absolute',
            title: '',
            jsonSubmit: true,
            url: 'add_dxqyinfo',
            items: [
                {
                    xtype: 'fieldset',
                    x: 20,
                    y: 20,
                    height: 350,
                    width: 350,
                    title: '企业基本情况',
                    items: [
                        {
                            xtype: 'textfield',
                            width: '',
                            fieldLabel: '企业名称',
                            name: 'qymc'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '企业地址',
                            name: 'qydz'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '宗地编号',
                            name: 'zdbh'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '所属评价范围',
                            name: 'sspjfw'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '行业类别',
                            name: 'hylb'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '行业代码',
                            name: 'hydm'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '企业人数(人)',
                            name: 'qyrs'
                        },
                        {
                            xtype: 'combobox',
                            width: 200,
                            fieldLabel: '上报年份',
                            name: 'sbnf',
                            store: [
                                '2016年',
                                '2015年'
                            ]
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '所属开发区',
                            name: 'kfqmc'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '开发区代码',
                            name: 'kfqdm'
                        },
                        {
                            xtype: 'radiogroup',
                            width: 300,
                            fieldLabel: '开发区类型',
                            items: [
                                {
                                    xtype: 'radiofield',
                                    name: 'kfqlx',
                                    boxLabel: '国家级',
                                    inputValue: '国家级'
                                },
                                {
                                    xtype: 'radiofield',
                                    autoShow: true,
                                    name: 'kfqlx',
                                    boxLabel: '省级',
                                    inputValue: '省级'
                                },
                                {
                                    xtype: 'radiofield',
                                    width: '',
                                    name: 'kfqlx',
                                    boxLabel: '示范区',
                                    inputValue: '示范区'
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    x: 370,
                    y: 20,
                    height: 100,
                    minHeight: 80,
                    width: 370,
                    title: '企业投入情况',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '实际完成累计固定资产投资  (万元)',
                            labelStyle: '',
                            labelWidth: 160,
                            name: 'wctz'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '预计固定资产总投资  (万元)',
                            labelWidth: 160,
                            name: 'yjztz'
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    x: 370,
                    y: 130,
                    height: 110,
                    width: 370,
                    title: '企业出产情况',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '总产值  (万元)',
                            name: 'zcz'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '总收入  (万元)',
                            name: 'zsr'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '税收总额  (万元)',
                            name: 'ssze'
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    x: 370,
                    y: 245,
                    height: 305,
                    width: 370,
                    title: '企业用地情况',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '企业用地面积  (h㎡)',
                            labelWidth: 150,
                            name: 'qyydmj'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '1.厂房及配套用地面积',
                            labelWidth: 150,
                            name: 'cfpt'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '7.企业内部行政办公及生活服务设施用地面积',
                            labelWidth: 150,
                            name: 'xzbg'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '3.露天堆场、露天操作场地面积',
                            labelWidth: 150,
                            name: 'ltcd'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '4.厂区内部预留地面积',
                            labelWidth: 150,
                            name: 'nbyld'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '5.企业内部道路停车场面积',
                            labelWidth: 150,
                            name: 'dltcc'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '6.绿地面积',
                            labelWidth: 150,
                            name: 'ld'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '2.其他用地面积',
                            labelWidth: 150,
                            name: 'qt'
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    x: 20,
                    y: 375,
                    height: 175,
                    width: 350,
                    title: '企业建设情况',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '总建筑面积',
                            labelWidth: 150,
                            name: 'zjzmj'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '容积率',
                            labelWidth: 150,
                            name: 'rjl'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '建筑物构筑物基底、露天堆场和露天操作场地总面积',
                            labelWidth: 150,
                            name: 'jdzmj'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '建筑系数  (%)',
                            labelWidth: 150,
                            name: 'jzxs'
                        }
                    ]
                },
                {
                    xtype: 'textfield',
                    x: 68,
                    y: 555,
                    hidden: true,
                    fieldLabel: 'id',
                    name: 'id'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    x: 0,
                    y: 540,
                    dock: 'bottom',
                    items: [
                        {
                            xtype: 'tbfill'
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                // var tab =Ext.getCmp('panel_infomation');// 'panel_info';
                                // tab.setActiveTab(1);

                                var win = Ext.getCmp('business_addinformation');
                                win.close();
                                // var mainView = Ext.getCmp('bus_information');
                                // mainView.removeAll();
                                // //mainView.add(Ext.widget(xtype));
                                // mainView.add(Ext.getCmp(xtype));

                            },
                            width: 70,
                            text: '取消'
                        },
                        {
                            xtype: 'button',
                            handler: function(button, e) {
                                /*var myform = Ext.getCmp('dxqy_addinformation').getForm();
                                if (myform.isValid())
                                {
                                console.log('form is ava');
                                myform.submit({
                                //url : 'add_info',
                                success : function (form, action)
                                {
                                    Ext.Msg.alert('成功', '提交成功。');
                                    var mystore = Ext.StoreMgr.get('dxqy_uploadStore'); //获得store对象
                                    mystore.reload();
                                    //var xtype = 'dxqy_upload';
                                    //var mainView = Ext.getCmp('mainView');
                                    //mainView.removeAll();
                                    // mainView.add(Ext.widget(xtype));
                                    var tab =Ext.getCmp('panel_infomation');// 'panel_info';
                                    tab.setActiveTab(1);
                                },
                                failure: function(form, action){
                                    Ext.Msg.alert('失败', '提交失败，请重试。');
                                }
                            });
                        }
                        else
                        {
                            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
                        }*/


                        Ext.Msg.confirm('提示',' 确认添加？注:添加后不可更改!', getResult);
                        function getResult(confirm)
                        {
                            console.log('confirm:', confirm);
                            if (confirm == "yes"){
                                var myform = Ext.getCmp('dxqy_addinformation').getForm();
                                if (myform.isValid())
                                {
                                    console.log('form is ava');
                                    myform.submit({
                                        //url : 'add_info',
                                        success : function (form, action)
                                        {
                                            Ext.Msg.alert('成功', '提交成功。',message);
                                            function message(alert){
                                                if(alert=='ok') {
                                                    var mystore = Ext.StoreMgr.get('dxqy_uploadStore'); //获得store对象
                                                    mystore.reload();
                                                    //var xtype = 'dxqy_upload';
                                                    //var mainView = Ext.getCmp('mainView');
                                                    //mainView.removeAll();
                                                    // mainView.add(Ext.widget(xtype));
                                                    var tab =Ext.getCmp('panel_infomation');// 'panel_info';
                                                    tab.setActiveTab(1);
                                                }
                                            }


                                        },
                                        failure: function(form, action){
                                            Ext.Msg.alert('失败', '提交失败，请重试。');
                                        }
                                    });
                                }
                            }
                        }
                            },
                            width: 70,
                            text: '保存提交'
                        }
                    ]
                }
            ]
        }
    ]

});