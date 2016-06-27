/*
 * File: app/view/business_uploadPhoto.js
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

Ext.define('MyApp.view.business_uploadPhoto', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.business_uploadPhoto',

    requires: [
        'MyApp.view.business_uploadPhotoViewModel',
        'Ext.form.Panel',
        'Ext.button.Button',
        'Ext.form.field.TextArea',
        'Ext.form.field.File',
        'Ext.form.field.Hidden',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Date',
        'Ext.grid.View',
        'Ext.Img'
    ],

    viewModel: {
        type: 'business_uploadphoto'
    },
    height: 491,
    width: 959,
    layout: 'border',
    title: '企业上传图片数据',

    items: [
        {
            xtype: 'form',
            region: 'west',
            id: 'photo_info',
            width: '40%',
            layout: 'absolute',
            title: '图片信息录入',
            jsonSubmit: true,
            url: 'add_picture',
            items: [
                {
                    xtype: 'button',
                    handler: function() {
                        var myform = Ext.getCmp('photo_info').getForm();
                        if (myform.isValid())
                        {
                            console.log("控件有效");
                            myform.submit({
                                //url : 'add_law',
                                success : function (form, action)
                                {
                                    console.log("成功进入");
                                    Ext.Msg.alert('成功', '图片上传成功。');
                                    var mystore = Ext.StoreMgr.get('Business_photoStore'); //获得store对象
                                    mystore.reload();
                                    var xtype = 'business_uploadPhoto';
                                    var mainView = Ext.getCmp('mainView');
                                    mainView.removeAll();
                                    mainView.add(Ext.widget(xtype));
                                },
                                failure: function(form, action){
                                    Ext.Msg.alert('失败', '图片上传失败，请重试。');
                                }
                            });
                        }
                        else
                        {
                            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
                        }
                    },
                    x: 270,
                    y: 340,
                    text: '提交审核'
                },
                {
                    xtype: 'textareafield',
                    x: 30,
                    y: 250,
                    width: 360,
                    fieldLabel: '备注',
                    labelWidth: 70,
                    name: 'other'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 140,
                    fieldLabel: '图片标题',
                    labelWidth: 70,
                    name: 'photoTitle'
                },
                {
                    xtype: 'button',
                    x: 360,
                    y: 130,
                    text: '预览图片-->'
                },
                {
                    xtype: 'filefield',
                    x: 30,
                    y: 90,
                    width: 400,
                    fieldLabel: '上传图片',
                    labelWidth: 70,
                    name: 'photoPath',
                    allowBlank: false,
                    buttonText: '选择图片'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 190,
                    fieldLabel: '上传用户',
                    labelWidth: 70,
                    name: 'uploadUser'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 40,
                    fieldLabel: '项目编号',
                    labelWidth: 70,
                    name: 'proCode'
                },
                {
                    xtype: 'hiddenfield',
                    x: 340,
                    y: 238,
                    fieldLabel: 'ID',
                    name: 'id'
                },
                {
                    xtype: 'hiddenfield',
                    x: 326,
                    y: 234,
                    fieldLabel: 'Label',
                    name: 'upDate'
                },
                {
                    xtype: 'hiddenfield',
                    x: 355,
                    y: 237,
                    fieldLabel: 'Label',
                    name: 'isPass',
                    value: 0
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'center',
            layout: 'border',
            animCollapse: false,
            collapseDirection: 'left',
            collapseFirst: false,
            collapsed: false,
            collapsible: false,
            title: '图片预览',
            titleAlign: 'center',
            titleCollapse: false,
            items: [
                {
                    xtype: 'gridpanel',
                    region: 'west',
                    width: '50%',
                    title: '图片列表',
                    store: 'Business_photoStore',
                    columns: [
                        {
                            xtype: 'rownumberer',
                            dataIndex: 'string',
                            text: '序号'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'photoTitle',
                            text: '图片标题'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'uploadUser',
                            text: '上传用户'
                        },
                        {
                            xtype: 'datecolumn',
                            dataIndex: 'upDate',
                            text: '上传时间'
                        }
                    ]
                },
                {
                    xtype: 'image',
                    region: 'center',
                    src: 'images/login/login_center_left.jpg'
                }
            ]
        }
    ]

});