/*
 * File: app/view/zd_information.js
 *
 * This file was generated by Sencha Architect
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

Ext.define('MyApp.view.zd_information', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.zd_information',

    requires: [
        'MyApp.view.zd_informationViewModel',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.View',
        'Ext.selection.CheckboxModel'
    ],

    viewModel: {
        type: 'zd_information'
    },
    height: 450,
    width: 654,
    title: '宗地信息填报',

    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'textfield',
                    id: 'searchKeyword_zdInfo',
                    fieldLabel: ''
                },
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        var getKeyword = Ext.getCmp('searchKeyword_zdInfo').getValue();
                        console.log("keyword:",getKeyword);
                        var mystore = Ext.StoreMgr.get('zd_infoStore'); //获得store对象
                        //在load事件中添加参数
                        mystore.load(
                        {
                            params :
                            {
                                searchKeyword : getKeyword
                            }
                        }
                        );
                    },
                    id: '',
                    text: '搜索'
                },
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        Ext.getCmp('searchKeyword_zdInfo').setValue('');
                        var mystore = Ext.StoreMgr.get('zd_infoStore'); //获得store对象
                        mystore.load();
                    },
                    text: '刷新'
                },
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        var win = Ext.widget('add_zdinnfo');
                        console.log(win);
                        win.show();
                    },
                    text: '添加宗地信息'
                },
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        //获取数据
                        var models = Ext.getCmp('zd_info').getSelection();
                        if (models.length === 0){
                            Ext.Msg.alert('提示', '请选择一条数据后再修改信息。');
                            return;
                        } else if(models.length >1){
                            Ext.Msg.alert('提示', '每次只能修改一条信息，请重新选择。');
                            return;
                        }
                        //启动窗口
                        var win = Ext.widget('update_zdinnfo');
                        win.setTitle('修改宗地信息');
                        win.show();

                        //改变Ajax url
                        var form = Ext.getCmp('update_zdwidinfo').getForm();
                        form.loadRecord(models[0]);
                        form.url = 'update_zdInfo';
                    },
                    text: '编辑宗地信息'
                }
            ]
        }
    ],
    items: [
        {
            xtype: 'gridpanel',
            id: 'zd_info',
            title: '',
            store: 'zd_infoStore',
            columns: [
                {
                    xtype: 'rownumberer',
                    width: 66,
                    dataIndex: 'zdId',
                    text: '序号'
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
                    dataIndex: 'qyssze',
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
    ]

});