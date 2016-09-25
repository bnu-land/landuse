/*
 * File: app/view/kfq_uploadDataCheck.js
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

Ext.define('MyApp.view.kfq_uploadDataCheck', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.kfq_uploadDataCheck',

    requires: [
        'MyApp.view.business_uploadMapViewModel1',
        'Ext.tab.Panel',
        'Ext.tab.Tab',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View',
        'Ext.selection.CheckboxModel',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.ComboBox',
        'Ext.toolbar.Separator',
        'Ext.form.Label',
        'Ext.toolbar.TextItem'
    ],

    viewModel: {
        type: 'kfq_uploaddatacheck'
    },
    autoScroll: true,
    height: 675,
    width: 879,
    layout: 'border',
    title: '上报数据审核',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'tabpanel',
            region: 'center',
            activeTab: 0,
            items: [
                {
                    xtype: 'panel',
                    layout: 'border',
                    title: '未审核',
                    items: [
                        {
                            xtype: 'gridpanel',
                            region: 'center',
                            id: 'zdxx_uncheck',
                            title: '',
                            sortableColumns: false,
                            store: 'zd_checkStore',
                            columns: [
                                {
                                    xtype: 'rownumberer',
                                    width: 66,
                                    dataIndex: 'zdId',
                                    text: '序号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 80,
                                    dataIndex: 'tbnf',
                                    text: '填报年份'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqmc',
                                    text: '开发区名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjfw',
                                    text: '开发区评价范围'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjlx',
                                    text: '开发区评价类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tbbh',
                                    text: '图斑编号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmc',
                                    text: '地类名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmj',
                                    text: '地类面积'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qs',
                                    text: '权属'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gysj',
                                    text: '供应时间'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gylx',
                                    text: '供应类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdzpg',
                                    text: '土地招拍佳情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'synx',
                                    text: '使用年限'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdsyz',
                                    text: '土地使用者'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzmj',
                                    text: '建筑面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzjdmj',
                                    text: '建筑基地面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jdzmj',
                                    text: '建筑物、构筑物基底及露天堆场、露天操作场地的总面积（平方米）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxlb',
                                    text: '高新技术产业用地类别'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxydmj',
                                    text: '高新技术产业用地面积(公顷）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxzsbl',
                                    text: '高新技术产业用地面积折算比例 '
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxsr',
                                    text: '高新技术产业收入（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxss',
                                    text: '高新技术产业税收（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'ghyt',
                                    text: '规划用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'pzyt',
                                    text: '批准用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdxzqk',
                                    text: '土地闲置情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'rdyj',
                                    text: '认定依据'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gdzctzze',
                                    text: '工业企业、工业物流企业固定资产投资总额(万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'esssze',
                                    text: '二、三产业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qyzsr',
                                    text: '工业企业工业物流企业总收入（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'check',
                                    text: '工业企业工业物流企业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'bz',
                                    text: '备注'
                                }
                            ],
                            selModel: {
                                selType: 'checkboxmodel'
                            }
                        }
                    ],
                    listeners: {
                        activate: 'onPanelActivate'
                    }
                },
                {
                    xtype: 'panel',
                    layout: 'border',
                    title: '已审核通过',
                    items: [
                        {
                            xtype: 'gridpanel',
                            region: 'center',
                            id: 'zdxx_pass',
                            title: '',
                            sortableColumns: false,
                            store: 'zd_checkStore',
                            columns: [
                                {
                                    xtype: 'rownumberer',
                                    width: 66,
                                    dataIndex: 'zdId',
                                    text: '序号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 80,
                                    dataIndex: 'tbnf',
                                    text: '填报年份'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqmc',
                                    text: '开发区名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjfw',
                                    text: '开发区评价范围'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjlx',
                                    text: '开发区评价类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tbbh',
                                    text: '图斑编号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmc',
                                    text: '地类名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmj',
                                    text: '地类面积'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qs',
                                    text: '权属'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gysj',
                                    text: '供应时间'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gylx',
                                    text: '供应类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdzpg',
                                    text: '土地招拍佳情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'synx',
                                    text: '使用年限'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdsyz',
                                    text: '土地使用者'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzmj',
                                    text: '建筑面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzjdmj',
                                    text: '建筑基地面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jdzmj',
                                    text: '建筑物、构筑物基底及露天堆场、露天操作场地的总面积（平方米）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxlb',
                                    text: '高新技术产业用地类别'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxydmj',
                                    text: '高新技术产业用地面积(公顷）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxzsbl',
                                    text: '高新技术产业用地面积折算比例 '
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxsr',
                                    text: '高新技术产业收入（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxss',
                                    text: '高新技术产业税收（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'ghyt',
                                    text: '规划用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'pzyt',
                                    text: '批准用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdxzqk',
                                    text: '土地闲置情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'rdyj',
                                    text: '认定依据'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gdzctzze',
                                    text: '工业企业、工业物流企业固定资产投资总额(万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'esssze',
                                    text: '二、三产业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qyzsr',
                                    text: '工业企业工业物流企业总收入（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'check',
                                    text: '工业企业工业物流企业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'bz',
                                    text: '备注'
                                }
                            ],
                            selModel: {
                                selType: 'checkboxmodel'
                            }
                        }
                    ],
                    listeners: {
                        activate: 'onPanelActivate1'
                    }
                },
                {
                    xtype: 'panel',
                    layout: 'border',
                    title: '审核未通过',
                    items: [
                        {
                            xtype: 'gridpanel',
                            region: 'center',
                            id: 'zdxx_unpass',
                            title: '',
                            sortableColumns: false,
                            store: 'zd_checkStore',
                            columns: [
                                {
                                    xtype: 'rownumberer',
                                    width: 66,
                                    dataIndex: 'zdId',
                                    text: '序号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 80,
                                    dataIndex: 'tbnf',
                                    text: '填报年份'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqmc',
                                    text: '开发区名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjfw',
                                    text: '开发区评价范围'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'kfqpjlx',
                                    text: '开发区评价类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tbbh',
                                    text: '图斑编号'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmc',
                                    text: '地类名称'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'dlmj',
                                    text: '地类面积'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qs',
                                    text: '权属'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gysj',
                                    text: '供应时间'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gylx',
                                    text: '供应类型'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdzpg',
                                    text: '土地招拍佳情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'synx',
                                    text: '使用年限'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdsyz',
                                    text: '土地使用者'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzmj',
                                    text: '建筑面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jzjdmj',
                                    text: '建筑基地面积(平方米)'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'jdzmj',
                                    text: '建筑物、构筑物基底及露天堆场、露天操作场地的总面积（平方米）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxlb',
                                    text: '高新技术产业用地类别'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxydmj',
                                    text: '高新技术产业用地面积(公顷）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxzsbl',
                                    text: '高新技术产业用地面积折算比例 '
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxsr',
                                    text: '高新技术产业收入（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gxss',
                                    text: '高新技术产业税收（万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'ghyt',
                                    text: '规划用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'pzyt',
                                    text: '批准用途'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'tdxzqk',
                                    text: '土地闲置情况'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'rdyj',
                                    text: '认定依据'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'gdzctzze',
                                    text: '工业企业、工业物流企业固定资产投资总额(万元）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'esssze',
                                    text: '二、三产业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'qyzsr',
                                    text: '工业企业工业物流企业总收入（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'check',
                                    text: '工业企业工业物流企业税收总额（万元/年）'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'bz',
                                    text: '备注'
                                }
                            ],
                            selModel: {
                                selType: 'checkboxmodel'
                            }
                        }
                    ],
                    listeners: {
                        activate: 'onPanelActivate2'
                    }
                }
            ]
        }
    ],
    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'combobox',
                    id: 'ent_check_gradeCombo',
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
                    id: 'ent_check_typeCombo',
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
                    id: 'ent_landusePropertyCheck_Combo',
                    width: 220,
                    fieldLabel: '选择开发区',
                    labelWidth: 80,
                    displayField: 'mapName',
                    store: 'systemMap_QYYD_Store',
                    valueField: 'mapUrl'
                },
                {
                    xtype: 'combobox',
                    id: 'ent_check_yearCombo',
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
        },
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'tbseparator'
                },
                {
                    xtype: 'label',
                    text: '操作：'
                },
                {
                    xtype: 'button',
                    text: '查看基本信息'
                },
                {
                    xtype: 'button',
                    text: '查看照片'
                },
                {
                    xtype: 'button',
                    text: '查看位置'
                },
                {
                    xtype: 'tbseparator'
                },
                {
                    xtype: 'tbtext',
                    text: '审核操作：'
                },
                {
                    xtype: 'button',
                    text: '通过',
                    listeners: {
                        click: 'onButtonClick'
                    }
                },
                {
                    xtype: 'button',
                    text: '不通过',
                    listeners: {
                        click: 'onButtonClick1'
                    }
                }
            ]
        }
    ],

    onPanelActivate: function(component, eOpts) {
        //var getKeyword = Ext.getCmp('searchKeyword_zdInfo').getValue();
        //console.log("keyword:",getKeyword);
        var mystore = Ext.StoreMgr.get('zd_checkStore'); //获得store对象
        //在load事件中添加参数
        mystore.load(
            {
                params :
                {
                    searchKeyword :0
                }
            }
        );
    },

    onPanelActivate1: function(component, eOpts) {
        var mystore = Ext.StoreMgr.get('zd_checkStore'); //获得store对象
        //在load事件中添加参数
        mystore.load(
            {
                params :
                {
                    searchKeyword : 1
                }
            }
        );
    },

    onPanelActivate2: function(component, eOpts) {
        var mystore = Ext.StoreMgr.get('zd_checkStore'); //获得store对象
        //在load事件中添加参数
        mystore.load(
            {
                params :
                {
                    searchKeyword : 2
                }
            }
        );
    },

    onButtonClick: function(button, e, eOpts) {
        //获取数据
        var grid = Ext.getCmp('zdxx_uncheck');
        var records = grid.getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后进行审核。');
            return;
        }
        var ids = [];
        for (var re in records) {
            var record = records[re];
            ids.push(record.get('id'));
        }
        //执行通过或拒绝
        Ext.Ajax.request({
            url: 'set_EntUploadCheckPass',
            params: {
                "ids": ids,
                "isPass": 1
            },
            success: function() {
                Ext.Msg.alert('成功', '企业信息通过审核！');
                grid.getStore().reload();
            },
            failure: function() {
                Ext.Msg.alert('失败', '审核失败，可能由网络问题造成，请刷新重试。');
            }
        });

    },

    onButtonClick1: function(button, e, eOpts) {
        //获取数据
        var records = Ext.getCmp('zdxx_uncheck').getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后进行审核。');
            return;
        }
        var ids = [];
        for (var re in records) {
            var record = records[re];
            ids.push(record.get('id'));
        }
        //执行通过或拒绝
        Ext.Ajax.request({
            url: 'set_EntUploadCheckPass',
            params: {
                "ids": ids,
                "isPass": 2
            },
            success: function() {
                //启动窗口
                var win = Ext.widget('enterprise_uploadMapCheckResultWindow');
                win.show();
            },
            failure: function() {
                Ext.Msg.alert('失败', '审核失败，可能由网络问题造成，请刷新重试。');
            }
        });

    }

});