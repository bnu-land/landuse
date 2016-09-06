/*
 * File: app/view/taskNotice.js
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

Ext.define('MyApp.view.taskNotice', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.taskNotice',

    requires: [
        'MyApp.view.taskNoticeViewModel',
        'Ext.form.FieldSet',
        'Ext.grid.Panel',
        'Ext.grid.View',
        'Ext.button.Button',
        'Ext.grid.column.RowNumberer',
        'Ext.selection.CheckboxModel',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text'
    ],

    viewModel: {
        type: 'tasknotice'
    },
    height: 468,
    id: '',
    width: 882,
    layout: 'border',
    title: '任务通知动态',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'north',
            split: true,
            height: 182,
            layout: 'absolute',
            title: '',
            items: [
                {
                    xtype: 'fieldset',
                    x: 30,
                    y: 10,
                    height: 120,
                    width: 660,
                    layout: 'absolute',
                    title: '【数据填报】',
                    items: [
                        {
                            xtype: 'gridpanel',
                            height: 120,
                            width: 600,
                            icon: '',
                            columnLines: false,
                            rowLines: false,
                            sortableColumns: false,
                            store: 'taskStore',
                            columns: [
                                {
                                    xtype: 'gridcolumn',
                                    width: '80%',
                                    align: 'center',
                                    dataIndex: 'taskComment',
                                    text: '任务详情'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: '20%',
                                    align: 'center',
                                    dataIndex: 'taskFinish',
                                    text: '任务完成情况'
                                }
                            ],
                            listeners: {
                                cellclick: 'onGridpanelCellClick'
                            }
                        }
                    ]
                },
                {
                    xtype: 'button',
                    handler: function() {
                        Ext.Msg.alert("信息提示","本年度任务已下发至各单位",getResult);
                        //Ext.Msg.confirm('提示', '您正在删除一条宗地信息<br/>[' +columnName+']。<br/> 确认删除？', getResult);
                        //console.log(id);

                        /*function getResult(confirm)
                        {
                        console.log('confirm:', confirm);
                        if (confirm == "ok"){
                        Ext.Ajax.request(
                        {
                        url : 'add_task',

                        success : function (response){
                        Ext.Msg.alert('成功提示', '记录删除成功。');
                        var mystore = Ext.StoreMgr.get('taskStore');
                        mystore.load();
                        },
                        failure : function (response){
                        Ext.Msg.alert('失败提示', '记录删除失败。');
                        }
                        });
                        }
                        }*/
                    },
                    x: 707,
                    y: 30,
                    height: 100,
                    width: 150,
                    text: '一键下发评价任务'
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'center',
            split: false,
            autoScroll: true,
            title: '宗地信息列表',
            items: [
                {
                    xtype: 'gridpanel',
                    focusOnToFront: false,
                    id: 'zd_infoGrid',
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
                            id: 'support_type',
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
            ],
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '',
                            emptyText: '请输入搜索关键字',
                            listeners: {
                                change: 'onTextfieldChange'
                            }
                        },
                        {
                            xtype: 'button',
                            icon: 'images/table/preview.png',
                            text: '查看',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        },
                        {
                            xtype: 'button',
                            handler: function() {
                                //获取数据
                                var records = Ext.getCmp('zd_infoGrid').getSelection();
                                if (records.length === 0){
                                    Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
                                    return;
                                }else if(records.length >1){
                                    Ext.Msg.alert('提示', '每次只能删除一条记录。');
                                    return;
                                }
                                var id = records[0].get("id");
                                var columnName= records[0].get("support_type");
                                Ext.Msg.confirm('提示', '您正在删除一条宗地信息<br/>[' +columnName+']。<br/> 确认删除？', getResult);
                                console.log(id);

                                function getResult(confirm)
                                {
                                    console.log('confirm:', confirm);
                                    if (confirm == "yes"){
                                        Ext.Ajax.request(
                                        {
                                            url : 'del_zdinfo',
                                            params :
                                            {
                                                id : id
                                            },
                                            success : function (response){
                                                Ext.Msg.alert('成功提示', '记录删除成功。');
                                                var mystore = Ext.StoreMgr.get('zd_infoStore');
                                                mystore.load();
                                            },
                                            failure : function (response){
                                                Ext.Msg.alert('失败提示', '记录删除失败。');
                                            }
                                        });
                                    }
                                }
                            },
                            icon: 'images/table/delete.png',
                            text: '清除'
                        }
                    ]
                }
            ]
        }
    ],

    onGridpanelCellClick: function(tableview, td, cellIndex, record, tr, rowIndex, e, eOpts) {
        var win=record.get('taskWindow');
        if(record.get('taskFinish')=="未提交")
        {
            var mainview=Ext.getCmp("mainView");
            mainview.removeAll();
            mainview.add(Ext.widget(win));
        }
        else
        {
            Ext.Msg.alert("提示消息","数据目前处于【"+record.get('taskFinish')+"】");
        }
        console.log(win);
        console.log(record.get("taskComment"));
    },

    onTextfieldChange: function(field, newValue, oldValue, eOpts) {
        var mystore = Ext.StoreMgr.get('zd_infoStore'); //获得store对象
        //在load事件中添加参数
        mystore.load(
        {
            params :
            {
                searchKeyword : newValue
            }
        }
        );
    },

    onButtonClick: function(button, e, eOpts) {
        //获取数据
        var models = Ext.getCmp('zd_infoGrid').getSelection();
        if (models.length === 0){
            Ext.Msg.alert('提示', '未选中某宗地。');
            return;
        } else if(models.length >1){
            Ext.Msg.alert('提示', '每次只能查看一条宗地信息，请重新选择。');
            return;
        }
        //启动窗口
        var win = Ext.widget('add_zdinnfo');
        win.setTitle('查看宗地信息');
        win.show();

        //改变Ajax url
        var form = Ext.getCmp('add_zdwidinfo').getForm();
        form.loadRecord(models[0]);
        form.url = 'update_zdInfo';
    }

});