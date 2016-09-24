/*
 * File: app/view/enterprise_LandusePropertyChangeMonitor.js
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

Ext.define('MyApp.view.enterprise_LandusePropertyChangeMonitor', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.enterprise_LandusePropertyChangeMonitor',

    requires: [
        'Ext.toolbar.Toolbar',
        'Ext.form.field.ComboBox',
        'Ext.form.Panel',
        'Ext.form.field.TextArea',
        'Ext.toolbar.Separator',
        'Ext.tab.Panel',
        'Ext.tab.Tab',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Number',
        'Ext.grid.View'
    ],

    layout: 'border',
    title: '企业用地性质变更监控',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'center',
            split: true,
            autoScroll: true,
            html: '<div id="ent_landuseChange_div" class="MapDiv" ></div>',
            id: 'ent_landusePropertyChangeMapPanel',
            collapsed: false,
            collapsible: false,
            listeners: {
                afterrender: 'onPanelAfterRender1'
            },
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'combobox',
                            id: 'ent_landuse_gradeCombo',
                            width: 181,
                            fieldLabel: '开发区级别',
                            labelWidth: 80,
                            store: [
                                '全部',
                                '国家级',
                                '省级',
                                '示范区'
                            ],
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'ent_landuse_typeCombo',
                            width: 190,
                            fieldLabel: '开发区类型',
                            labelWidth: 80,
                            store: [
                                '全部',
                                '工业主导型',
                                '产城融合型'
                            ],
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'ent_landusePropertyChangeXZQ_Combo',
                            width: 220,
                            fieldLabel: '选择开发区',
                            labelWidth: 80,
                            displayField: 'mapName',
                            store: 'systemMap_QYYD_Store',
                            valueField: 'mapUrl'
                        },
                        {
                            xtype: 'combobox',
                            id: 'ent_landuse_yearCombo',
                            width: 190,
                            fieldLabel: '选择年份',
                            labelWidth: 80,
                            store: [
                                '2016',
                                '2015',
                                '2014',
                                '2013',
                                '2012',
                                '2011',
                                '2010'
                            ],
                            valueField: 'mapUrl'
                        }
                    ]
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'east',
            split: true,
            autoScroll: true,
            width: '25%',
            layout: 'border',
            collapseFirst: false,
            collapsed: false,
            collapsible: false,
            title: '企业用地变更详情',
            items: [
                {
                    xtype: 'form',
                    region: 'north',
                    height: 205,
                    id: 'ent_landuseChangeAttr_Form',
                    layout: 'form',
                    bodyPadding: 10,
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '审核状态',
                            labelWidth: 80,
                            name: 'shzt'
                        },
                        {
                            xtype: 'textareafield',
                            fieldLabel: '审核意见',
                            labelWidth: 80,
                            name: 'shyj'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '采集人',
                            labelWidth: 80,
                            name: 'cjr'
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '采集时间',
                            labelWidth: 80,
                            name: 'cjsj'
                        }
                    ],
                    dockedItems: [
                        {
                            xtype: 'toolbar',
                            dock: 'bottom',
                            items: [
                                {
                                    xtype: 'button',
                                    text: '通过变更'
                                },
                                {
                                    xtype: 'tbseparator',
                                    width: 50
                                },
                                {
                                    xtype: 'button',
                                    text: '拒绝变更'
                                },
                                {
                                    xtype: 'button',
                                    text: '取消'
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    flex: 1,
                    region: 'center',
                    autoScroll: true,
                    layout: 'border',
                    manageHeight: false,
                    items: [
                        {
                            xtype: 'form',
                            flex: 1,
                            region: 'center',
                            maxHeight: 1000,
                            minHeight: 1000,
                            bodyPadding: 10,
                            manageHeight: false,
                            title: '变更前',
                            titleAlign: 'right',
                            layout: {
                                type: 'vbox',
                                align: 'stretch'
                            },
                            items: [
                                {
                                    xtype: 'textfield',
                                    fieldLabel: '目标识别码',
                                    labelWidth: 90,
                                    name: 'mbbsm'
                                },
                                {
                                    xtype: 'textfield',
                                    fieldLabel: '要素代码',
                                    labelWidth: 90,
                                    name: 'ysdm'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '开发区代码',
                                    labelWidth: 90,
                                    name: 'kfqdm'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '开发区名称',
                                    labelWidth: 90,
                                    name: 'kfqmc'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '图斑编号',
                                    labelWidth: 90,
                                    name: 'tbbh'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '企业代码',
                                    labelWidth: 90,
                                    name: 'dxdm'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '企业名称',
                                    labelWidth: 90,
                                    name: 'qymc'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '企业地址',
                                    labelWidth: 90,
                                    name: 'qydz'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '评价范围',
                                    labelWidth: 90,
                                    name: 'sspjfw'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '行业类别',
                                    labelWidth: 90,
                                    name: 'hylb'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '行业代码',
                                    labelWidth: 90,
                                    name: 'hydm'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '企业人数',
                                    labelWidth: 90,
                                    name: 'qyrs'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '预计总投资',
                                    labelWidth: 90,
                                    name: 'yjztz'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '实际投资',
                                    labelWidth: 90,
                                    name: 'wctz'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '总收入',
                                    labelWidth: 90,
                                    name: 'zsr'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '总产值',
                                    labelWidth: 90,
                                    name: 'zcz'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '总税收/万元',
                                    labelWidth: 90,
                                    name: 'ssze'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '企业面积/公顷',
                                    labelWidth: 90,
                                    name: 'qyydmj'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '厂房配套面积',
                                    labelWidth: 90,
                                    name: 'cfpt'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '办公生活面积',
                                    labelWidth: 90,
                                    name: 'xzbg'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '操作堆场面积',
                                    labelWidth: 90,
                                    name: 'ltcd'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '预留地面积',
                                    labelWidth: 90,
                                    name: 'nbyld'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '道路停车面积',
                                    labelWidth: 90,
                                    name: 'dltcc'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '绿地面积',
                                    labelWidth: 90,
                                    name: 'ld'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '其他用地面积',
                                    labelWidth: 90,
                                    name: 'qt'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '总建筑面积',
                                    labelWidth: 90,
                                    name: 'zjzmj'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '容积率/%',
                                    labelWidth: 90,
                                    name: 'rjl'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '构筑基底面积',
                                    labelWidth: 90,
                                    name: 'jdzmj'
                                },
                                {
                                    xtype: 'textareafield',
                                    width: 150,
                                    fieldLabel: '备注',
                                    labelWidth: 90,
                                    name: 'bz'
                                },
                                {
                                    xtype: 'textfield',
                                    width: 150,
                                    fieldLabel: '建筑系数/%',
                                    labelWidth: 90,
                                    name: 'jzxs'
                                }
                            ]
                        },
                        {
                            xtype: 'form',
                            flex: 1,
                            region: 'east',
                            maxHeight: 1000,
                            maxWidth: 80,
                            minHeight: 1000,
                            width: 80,
                            layout: 'fit',
                            bodyPadding: 10,
                            title: '变更后',
                            items: [
                                {
                                    xtype: 'container',
                                    layout: {
                                        type: 'vbox',
                                        align: 'stretch'
                                    },
                                    items: [
                                        {
                                            xtype: 'textfield',
                                            name: 'mbbsm'
                                        },
                                        {
                                            xtype: 'textfield',
                                            labelWidth: 90,
                                            name: 'ysdm'
                                        },
                                        {
                                            xtype: 'textfield',
                                            labelWidth: 90,
                                            name: 'kfqdm'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'kfqmc'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'tbbh'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'dxdm'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            fieldLabel: '',
                                            labelWidth: 90,
                                            name: 'qymc'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'qydz'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            fieldLabel: '',
                                            labelWidth: 90,
                                            name: 'sspjfw'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'hylb'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'hydm'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'qyrs'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'yjztz'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'wctz'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            fieldLabel: '',
                                            labelWidth: 90,
                                            name: 'zsr'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'zcz'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'ssze'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'qyydmj'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'cfpt'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'xzbg'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'ltcd'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'nbyld'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'dltcc'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'ld'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'qt'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'zjzmj'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'rjl'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'jdzmj'
                                        },
                                        {
                                            xtype: 'textareafield',
                                            width: 60,
                                            labelWidth: 80,
                                            name: 'bz'
                                        },
                                        {
                                            xtype: 'textfield',
                                            width: 60,
                                            labelWidth: 90,
                                            name: 'jzxs'
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            xtype: 'tabpanel',
            region: 'south',
            split: true,
            height: 250,
            referenceHolder: false,
            collapsed: false,
            collapsible: true,
            overlapHeader: false,
            title: '企业用地性质变更列表',
            titleCollapse: false,
            activeTab: 0,
            items: [
                {
                    xtype: 'panel',
                    layout: 'fit',
                    title: '全部',
                    items: [
                        {
                            xtype: 'gridpanel',
                            height: 150,
                            id: 'ent_landuseChange_all',
                            title: '',
                            store: 'entLanduseChange',
                            columns: [
                                {
                                    xtype: 'rownumberer'
                                },
                                {
                                    xtype: 'numbercolumn',
                                    dataIndex: 'shzt',
                                    text: '审核状态',
                                    format: '0'
                                },
                                {
                                    xtype: 'numbercolumn',
                                    dataIndex: 'mbbsm',
                                    text: '目标识别码'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'ysdm',
                                    text: '要素代码'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqdm',
                                    text: '开发区代码'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqmc',
                                    text: '开发区名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tbbh',
                                    text: '图斑编号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'cjr',
                                    text: '采集人'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'cjsj',
                                    text: '采集时间'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dxdm',
                                    text: '典型企业代码'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qymc',
                                    text: '企业名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'sspjfw',
                                    text: '所属评价范围'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'hylb',
                                    text: '行业类别'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'hydm',
                                    text: '行业代码'
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    layout: 'fit',
                    title: '待审批'
                },
                {
                    xtype: 'panel',
                    layout: 'fit',
                    title: '已通过'
                },
                {
                    xtype: 'panel',
                    layout: 'fit',
                    title: '已驳回'
                }
            ]
        }
    ],

    onPanelAfterRender1: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/testMap.js";
        head.appendChild(script);
    }

});