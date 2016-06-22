/*
 * File: app/view/intensityPotential_Manage.js
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

Ext.define('MyApp.view.intensityPotential_Manage', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.intensityPotential_Manage',

    requires: [
        'Ext.toolbar.Toolbar',
        'Ext.form.field.ComboBox',
        'Ext.button.Button',
        'Ext.form.field.Hidden',
        'Ext.form.Panel',
        'Ext.form.field.Display',
        'Ext.form.Label',
        'Ext.form.FieldSet',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Date',
        'Ext.grid.column.Number',
        'Ext.grid.View'
    ],

    height: 673,
    width: 991,
    layout: 'border',
    title: '管理潜力测算',
    defaultListenerScope: true,

    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'combobox',
                    width: 250,
                    fieldLabel: '开发区名称',
                    name: 'kfqName',
                    submitValue: false,
                    displayField: 'name',
                    valueField: 'value',
                    listeners: {
                        change: 'onComboboxChange111'
                    }
                },
                {
                    xtype: 'combobox',
                    id: 'manager_layerUrls_Combo',
                    width: 220,
                    fieldLabel: '选择年份',
                    labelWidth: 70,
                    submitValue: false,
                    displayField: 'mapName',
                    store: 'survey_IndexCurrent_MapStore',
                    valueField: 'mapUrl',
                    listeners: {
                        change: 'onIntension_layerUrls_ComboChange1'
                    }
                },
                {
                    xtype: 'button',
                    handler: function() {
                        var url = Ext.getCmp('manager_layerUrls_Combo').getValue();
                        if(!url){
                            Ext.Msg.alert('提示','请先选择开发区和地图年份再进行测算。');
                            return;
                        }


                        var mainExpire = Ext.getCmp('manager_mainExpire_field').getValue();
                        var developExpire = Ext.getCmp('manager_developExpire_field').getValue();
                        var sumExpire = parseFloat(mainExpire)+parseFloat(developExpire);
                        Ext.getCmp('manager_sumExpire_field').setValue(sumExpire);

                        var mainIdeal = Ext.getCmp('manager_mainIdeal_field').getValue();
                        var developIdeal = Ext.getCmp('manager_developIdeal_field').getValue();
                        var sumIdeal = parseFloat(mainIdeal) +parseFloat(developIdeal);
                        Ext.getCmp('manager_sumIdeal_field').setValue(sumIdeal);

                        Ext.getCmp('manager_isCalculated').setValue(true);
                    },
                    text: '结构潜力测算'
                },
                {
                    xtype: 'button',
                    handler: function() {
                        var isCalc = Ext.getCmp('manager_isCalculated').getValue();
                        if(!isCalc){
                            Ext.Msg.alert('提示','请先进行强度测算，再保存结果。');
                            return;
                        }
                        var myform = Ext.getCmp('intensity_manager_form').getForm();
                        if (myform.isValid())
                        {
                            myform.submit({
                                url : 'add_managerPotential',
                                success : function (form, action)
                                {
                                    Ext.Msg.alert('成功', '测算结果保存成功。');
                                    Ext.getCmp('intensity_manager_grid').getStore().reload();
                                },
                                failure: function(form, action){
                                    Ext.Msg.alert('失败', '测算结果保存失败，请重试。');
                                }
                            });
                        }
                        else
                        {
                            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
                        }
                    },
                    text: '保存测算结果'
                },
                {
                    xtype: 'hiddenfield',
                    id: 'manager_isCalculated',
                    fieldLabel: 'Label',
                    value: false
                },
                {
                    xtype: 'hiddenfield',
                    id: 'manager_kfqType',
                    fieldLabel: 'Label',
                    value: false
                }
            ]
        }
    ],
    items: [
        {
            xtype: 'form',
            region: 'north',
            split: true,
            height: 227,
            id: 'intensity_manager_form',
            bodyPadding: 10,
            jsonSubmit: true,
            layout: {
                type: 'table',
                columns: 5
            },
            items: [
                {
                    xtype: 'hiddenfield',
                    id: 'manager_kfqName_field',
                    fieldLabel: 'Label',
                    name: 'kfqName'
                },
                {
                    xtype: 'hiddenfield',
                    id: 'manager_kfqMap_field',
                    fieldLabel: 'Label',
                    name: 'kfqMap'
                },
                {
                    xtype: 'displayfield',
                    colspan: 2,
                    width: 100,
                    fieldLabel: '项目',
                    value: ' '
                },
                {
                    xtype: 'displayfield',
                    width: 60,
                    fieldLabel: '主区',
                    labelWidth: 60,
                    value: ' '
                },
                {
                    xtype: 'label',
                    html: '1,4',
                    text: '发展方向区'
                },
                {
                    xtype: 'label',
                    html: '1,5',
                    text: '现状值(%)'
                },
                {
                    xtype: 'fieldset',
                    colspan: 5,
                    margin: '0,0,0,0',
                    width: 515,
                    layout: {
                        type: 'table',
                        columns: 4
                    },
                    items: [
                        {
                            xtype: 'textfield',
                            colspan: 2,
                            id: 'manager_mainExpire_field',
                            margin: '0,0,0,0',
                            width: 250,
                            fieldLabel: '有偿使用且已到期但未处置土地面积',
                            labelWidth: 130,
                            name: 'mainExpire'
                        },
                        {
                            xtype: 'textfield',
                            colspan: 1,
                            id: 'manager_developExpire_field',
                            margin: '0,0,0,0',
                            width: 120,
                            name: 'developExpire'
                        },
                        {
                            xtype: 'textfield',
                            colspan: 1,
                            id: 'manager_sumExpire_field',
                            margin: '0,0,0,0',
                            width: 120,
                            name: 'sumExpire'
                        }
                    ]
                },
                {
                    xtype: 'fieldset',
                    colspan: 5,
                    margin: '0,0,0,0',
                    width: 515,
                    layout: {
                        type: 'table',
                        columns: 4
                    },
                    items: [
                        {
                            xtype: 'textfield',
                            colspan: 2,
                            id: 'manager_mainIdeal_field',
                            margin: '0,0,0,0',
                            width: 250,
                            fieldLabel: '闲置土地面积',
                            labelWidth: 130,
                            name: 'mainIdeal'
                        },
                        {
                            xtype: 'textfield',
                            colspan: 1,
                            id: 'manager_developIdeal_field',
                            margin: '0,0,0,0',
                            width: 120,
                            name: 'developIdeal'
                        },
                        {
                            xtype: 'textfield',
                            colspan: 1,
                            id: 'manager_sumIdeal_field',
                            margin: '0,0,0,0',
                            width: 120,
                            name: 'sumIdeal'
                        }
                    ]
                }
            ]
        },
        {
            xtype: 'gridpanel',
            region: 'center',
            id: 'intensity_manager_grid',
            title: '管理潜力测算历史记录',
            store: 'landIntensityManagerStore',
            columns: [
                {
                    xtype: 'rownumberer'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'kfqName',
                    text: '开发区名称'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'kfqMap',
                    text: '使用地图'
                },
                {
                    xtype: 'datecolumn',
                    dataIndex: 'calcDate',
                    text: '测算时间',
                    format: 'Y-m-d'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'mainExpire',
                    text: '到期未处置(主区)'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'developExpire',
                    text: '到期未处置(发展区)'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'sumExpire',
                    text: '到期未处置(合计)'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'mainIdeal',
                    text: '闲置土地(主区)'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'developIdeal',
                    text: '闲置土地(发展区)'
                },
                {
                    xtype: 'numbercolumn',
                    width: 130,
                    dataIndex: 'sumIdeal',
                    text: '闲置土地(合计)'
                }
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'textfield',
                            id: 'manager_SearchText'
                        },
                        {
                            xtype: 'button',
                            handler: function() {
                                var searchKeyword = Ext.getCmp('manager_SearchText').getValue();
                                var mystore = Ext.getCmp('intensity_manager_grid').getStore(); //获得store对象
                                //在load事件中添加参数
                                mystore.load({
                                    params :{searchKeyword : searchKeyword}
                                });
                            },
                            icon: 'images/table/search.png',
                            text: '查询'
                        },
                        {
                            xtype: 'button',
                            handler: function() {
                                //获取数据
                                var grid = Ext.getCmp('intensity_manager_grid');
                                var records = grid.getSelection();
                                if (records.length === 0){
                                    Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
                                    return;
                                }else if(records.length >1){
                                    Ext.Msg.alert('提示', '每次只能删除一条法律。');
                                    return;
                                }
                                var id = records[0].get("id");
                                var columnName= records[0].get("kfqName");
                                Ext.Msg.confirm('提示', '您正在删除<br/>[' +columnName+']测算数据。<br/> 确认删除？', getResult);


                                function getResult(confirm)
                                {
                                    console.log('confirm:', confirm);
                                    if (confirm == "yes"){
                                        Ext.Ajax.request(
                                        {
                                            url : 'del_managerPotential',
                                            params :
                                            {
                                                id : id
                                            },
                                            success : function (response){
                                                Ext.Msg.alert('成功提示', '记录删除成功。');
                                                grid.getStore().reload();
                                            },
                                            failure : function (response){
                                                Ext.Msg.alert('失败提示', '记录删除失败。');
                                            }
                                        });
                                    }
                                }
                            },
                            icon: 'images/table/delete.png',
                            text: '删除'
                        }
                    ]
                }
            ]
        }
    ],

    onComboboxChange111: function(field, newValue, oldValue, eOpts) {
        var kfqName = field.getRawValue();
        //图层过滤
        var storeMap = Ext.getCmp('manager_layerUrls_Combo').getStore();
        storeMap.clearFilter();
        storeMap.filter('mapKey',newValue);

        Ext.getCmp('intensity_manager_form').getForm().reset();
        Ext.getCmp('manager_isCalculated').setValue('false');
        Ext.getCmp('manager_kfqName_field').setValue(kfqName);
    },

    onIntension_layerUrls_ComboChange1: function(field, newValue, oldValue, eOpts) {
        Ext.getCmp('manager_kfqMap_field').setValue(field.getRawValue());
        Ext.getCmp('manager_developExpire_field').setValue(0);
        Ext.getCmp('manager_developIdeal_field').setValue(0);


        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/intensity_manager_map.js";
        head.appendChild(script);
    }

});