/*
 * File: app/view/business_uploadMap.js
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

Ext.define('MyApp.view.business_uploadMap', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.business_uploadMap',

    requires: [
        'MyApp.view.business_uploadMapViewModel',
        'Ext.form.Panel',
        'Ext.button.Button',
        'Ext.form.field.Text',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View'
    ],

    viewModel: {
        type: 'business_uploadmap'
    },
    autoScroll: true,
    height: 792,
    width: 704,
    layout: 'border',
    title: '企业上传地图数据',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'form',
            region: 'west',
            autoScroll: true,
            id: 'map_info',
            width: 474,
            layout: 'absolute',
            title: '地图数据录入',
            jsonSubmit: true,
            url: 'add_map',
            items: [
                {
                    xtype: 'button',
                    handler: function() {
                        var myform = Ext.getCmp('map_info').getForm();
                        if (myform.isValid())
                        {
                            console.log("控件有效");
                            myform.submit({
                                //url : 'add_map',
                                success : function (form, action)
                                {
                                    console.log("成功进入");
                                    Ext.Msg.alert('成功', '地图四至信息上传成功。');
                                    var mystore = Ext.StoreMgr.get('Business_mapStore'); //获得store对象
                                    mystore.reload();
                                    var xtype = 'business_uploadMap';
                                    var mainView = Ext.getCmp('mainView');
                                    mainView.removeAll();
                                    mainView.add(Ext.widget(xtype));
                                },
                                failure: function(form, action){
                                    Ext.Msg.alert('失败', '地图四至信息上传失败，请重试。');
                                }
                            });
                        }
                        else
                        {
                            Ext.Msg.alert('注意', '填写的信息有误，请检查！');
                        }
                    },
                    x: 200,
                    y: 410,
                    text: '提交审核'
                },
                {
                    xtype: 'button',
                    x: 63,
                    y: 413,
                    text: '保存预览'
                },
                {
                    xtype: 'textfield',
                    x: 90,
                    y: 160,
                    width: 140,
                    fieldLabel: '北至坐标',
                    labelWidth: 60,
                    name: 'northCoor',
                    emptyText: '经度'
                },
                {
                    xtype: 'textfield',
                    x: 240,
                    y: 160,
                    width: 80,
                    fieldLabel: '',
                    labelWidth: 60,
                    name: 'northCoorw',
                    emptyText: '纬度'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 240,
                    width: 80,
                    fieldLabel: '',
                    labelWidth: 60,
                    name: 'westCoorw',
                    emptyText: '纬度'
                },
                {
                    xtype: 'textfield',
                    x: 0,
                    y: 240,
                    width: 140,
                    fieldLabel: '西至坐标',
                    labelWidth: 60,
                    name: 'westCoor',
                    emptyText: '经度'
                },
                {
                    xtype: 'textfield',
                    x: 230,
                    y: 240,
                    width: 140,
                    fieldLabel: '东至坐标',
                    labelWidth: 60,
                    name: 'eastCoor',
                    emptyText: '经度'
                },
                {
                    xtype: 'textfield',
                    x: 380,
                    y: 240,
                    width: 80,
                    labelWidth: 60,
                    name: 'eastCoorw',
                    emptyText: '纬度'
                },
                {
                    xtype: 'textfield',
                    x: 90,
                    y: 330,
                    width: 140,
                    fieldLabel: '南至坐标',
                    labelWidth: 60,
                    name: 'southCoor',
                    emptyText: '经度'
                },
                {
                    xtype: 'textfield',
                    x: 240,
                    y: 330,
                    width: 80,
                    fieldLabel: '',
                    labelWidth: 60,
                    name: 'southCoorw',
                    emptyText: '纬度'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 100,
                    width: 290,
                    fieldLabel: '企业用户',
                    labelWidth: 70,
                    name: 'uploadUser'
                },
                {
                    xtype: 'textfield',
                    x: 30,
                    y: 40,
                    width: 290,
                    fieldLabel: '项目编号',
                    labelWidth: 70,
                    name: 'proCode'
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'center',
            html: '<div id="map"></div>',
            collapseDirection: 'right',
            collapsible: false,
            title: '地图预览',
            titleAlign: 'center',
            listeners: {
                beforerender: 'onPanelBeforeRender'
            }
        },
        {
            xtype: 'gridpanel',
            region: 'south',
            autoScroll: true,
            height: 180,
            collapsed: false,
            collapsible: false,
            title: '数据浏览',
            enableColumnHide: false,
            store: 'Business_mapStore',
            columns: [
                {
                    xtype: 'rownumberer',
                    dataIndex: 'string',
                    text: '序号'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'proCode',
                    text: '项目编号'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'uploadUser',
                    text: '上传用户'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoor',
                    text: '北至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'northCoorw',
                    text: '北至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoor',
                    text: '西至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'westCoorw',
                    text: '西至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'eastCoor',
                    text: '东至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'eastCoorw',
                    text: '东至坐标纬度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'southCoor',
                    text: '南至坐标经度'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'southCoorw',
                    text: '南至坐标纬度'
                }
            ]
        }
    ],

    onPanelBeforeRender: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/uploadmap.js";
        head.appendChild(script);
    }

});