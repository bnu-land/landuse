/*
 * File: app/view/notice_Manage.js
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

Ext.define('MyApp.view.notice_Manage', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.notice_Manage',

    requires: [
        'Ext.tab.Panel',
        'Ext.tab.Tab',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Date',
        'Ext.grid.column.Action',
        'Ext.grid.View',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.toolbar.Separator',
        'Ext.selection.CheckboxModel'
    ],

    height: 588,
    width: 866,
    layout: 'fit',
    title: '内容管理',

    items: [
        {
            xtype: 'tabpanel',
            activeTab: 0,
            items: [
                {
                    xtype: 'panel',
                    layout: 'fit',
                    title: '已发布',
                    items: [
                        {
                            xtype: 'gridpanel',
                            id: 'notice_NewsManageGrid',
                            store: 'notice_newsStore',
                            columns: [
                                {
                                    xtype: 'rownumberer'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 120,
                                    dataIndex: 'noticeColumn',
                                    text: '所属栏目'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 250,
                                    dataIndex: 'noticeTitle',
                                    text: '标题'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'noticeAuthor',
                                    text: '作者'
                                },
                                {
                                    xtype: 'datecolumn',
                                    width: 100,
                                    dataIndex: 'publishDate',
                                    text: '发表时间',
                                    format: 'Y-m-d'
                                },
                                {
                                    xtype: 'datecolumn',
                                    width: 100,
                                    dataIndex: 'editDate',
                                    text: '最近修改',
                                    format: 'Y-m-d'
                                },
                                {
                                    xtype: 'actioncolumn',
                                    dataIndex: 'attachment',
                                    text: '附件'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 200,
                                    dataIndex: 'description',
                                    text: '备注'
                                }
                            ],
                            dockedItems: [
                                {
                                    xtype: 'toolbar',
                                    dock: 'top',
                                    items: [
                                        {
                                            xtype: 'textfield',
                                            id: 'noticeNews_SearchText'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                var searchKeyword = Ext.getCmp('noticeNews_SearchText').getValue();
                                                var mystore = Ext.StoreMgr.get('notice_newsStore'); //获得store对象
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
                                            icon: 'images/table/preview.png',
                                            text: '预览'
                                        },
                                        {
                                            xtype: 'tbseparator'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                var xtype = 'notice_Publish';
                                                var mainView = Ext.getCmp('mainView');
                                                mainView.removeAll();
                                                mainView.add(Ext.widget(xtype));
                                            },
                                            icon: 'images/table/add.png',
                                            text: '添加'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                //获取数据
                                                var records = Ext.getCmp('notice_NewsManageGrid').getSelection();
                                                if (records.length === 0){
                                                    Ext.Msg.alert('提示', '请选择一条数据后再修改信息。');
                                                    return;
                                                } else if(records.length >1){
                                                    Ext.Msg.alert('提示', '每次只能修改一条信息，请重新选择。');
                                                    return;
                                                }
                                                //启动窗口
                                                var xtype = 'notice_Publish';
                                                var mainView = Ext.getCmp('mainView');
                                                mainView.removeAll();
                                                mainView.add(Ext.widget(xtype));

                                                //改变Ajax url
                                                var form = Ext.getCmp('notice_PublishForm').getForm();
                                                form.loadRecord(records[0]);
                                                form.url = 'update_NoticeNews';
                                            },
                                            icon: 'images/table/edit.png',
                                            text: '修改'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                //获取数据
                                                var records = Ext.getCmp('notice_NewsManageGrid').getSelection();
                                                if (records.length === 0){
                                                    Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
                                                    return;
                                                }else if(records.length >1){
                                                    Ext.Msg.alert('提示', '每次只能删除一条文章。');
                                                    return;
                                                }
                                                var id = records[0].get("id");
                                                var columnName= records[0].get("noticeTitle");
                                                Ext.Msg.confirm('提示', '您正在删除<br/>[' +columnName+']。<br/> 确认删除？', getResult);

                                                var record = records[0];

                                                function getResult(confirm)
                                                {
                                                    console.log('confirm:', confirm);
                                                    if (confirm == "yes"){
                                                        Ext.Ajax.request(
                                                        {
                                                            url : 'del_NoticeToDraft',
                                                            params :
                                                            {
                                                                news : record
                                                            },
                                                            success : function (response){
                                                                Ext.Msg.alert('成功提示', '记录删除成功。');
                                                                var mystore = Ext.StoreMgr.get('notice_newsStore');
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
                                            text: '删除'
                                        }
                                    ]
                                }
                            ],
                            selModel: {
                                selType: 'checkboxmodel'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '草稿箱',
                    items: [
                        {
                            xtype: 'gridpanel',
                            id: 'notice_NewsDraftGrid',
                            store: 'notice_newsDraftStore',
                            columns: [
                                {
                                    xtype: 'rownumberer'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 120,
                                    dataIndex: 'noticeColumn',
                                    text: '所属栏目'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 250,
                                    dataIndex: 'noticeTitle',
                                    text: '标题'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'noticeAuthor',
                                    text: '作者'
                                },
                                {
                                    xtype: 'datecolumn',
                                    width: 100,
                                    dataIndex: 'publishDate',
                                    text: '发表时间',
                                    format: 'Y-m-d'
                                },
                                {
                                    xtype: 'datecolumn',
                                    width: 100,
                                    dataIndex: 'editDate',
                                    text: '最近修改',
                                    format: 'Y-m-d'
                                },
                                {
                                    xtype: 'actioncolumn',
                                    dataIndex: 'attachment',
                                    text: '附件'
                                },
                                {
                                    xtype: 'gridcolumn',
                                    width: 200,
                                    dataIndex: 'description',
                                    text: '备注'
                                }
                            ],
                            dockedItems: [
                                {
                                    xtype: 'toolbar',
                                    dock: 'top',
                                    items: [
                                        {
                                            xtype: 'textfield',
                                            id: 'noticeNews_draft_SearchText'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                var searchKeyword = Ext.getCmp('noticeNews_draft_SearchText').getValue();
                                                var mystore = Ext.StoreMgr.get('notice_newsDraftStore'); //获得store对象
                                                //在load事件中添加参数
                                                mystore.load({
                                                    params :{
                                                        searchKeyword : searchKeyword,
                                                        noticeState:'1'
                                                    }
                                                });
                                            },
                                            icon: 'images/table/search.png',
                                            text: '查询'
                                        },
                                        {
                                            xtype: 'button',
                                            icon: 'images/table/preview.png',
                                            text: '预览'
                                        },
                                        {
                                            xtype: 'tbseparator'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                //获取数据
                                                var records = Ext.getCmp('notice_NewsDraftGrid').getSelection();
                                                if (records.length === 0){
                                                    Ext.Msg.alert('提示', '请选择一条数据后再修改信息。');
                                                    return;
                                                } else if(records.length >1){
                                                    Ext.Msg.alert('提示', '每次只能修改一条信息，请重新选择。');
                                                    return;
                                                }
                                                //启动窗口
                                                var xtype = 'notice_Publish';
                                                var mainView = Ext.getCmp('mainView');
                                                mainView.removeAll();
                                                mainView.add(Ext.widget(xtype));

                                                //改变Ajax url
                                                var form = Ext.getCmp('notice_PublishForm').getForm();
                                                form.loadRecord(records[0]);
                                                form.url = 'update_NoticeNews';
                                            },
                                            icon: 'images/table/edit.png',
                                            text: '发布'
                                        },
                                        {
                                            xtype: 'button',
                                            handler: function() {
                                                //获取数据
                                                var records = Ext.getCmp('notice_NewsDraftGrid').getSelection();
                                                if (records.length === 0){
                                                    Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
                                                    return;
                                                }else if(records.length >1){
                                                    Ext.Msg.alert('提示', '每次只能删除一条文章。');
                                                    return;
                                                }
                                                var id = records[0].get("id");
                                                var columnName= records[0].get("noticeTitle");
                                                Ext.Msg.confirm('提示', '您正在删除<br/>[' +columnName+']。<br/> 确认删除？', getResult);


                                                function getResult(confirm)
                                                {
                                                    console.log('confirm:', confirm);
                                                    if (confirm == "yes"){
                                                        Ext.Ajax.request(
                                                        {
                                                            url : 'del_NoticeToDelete',
                                                            params :
                                                            {
                                                                id : id
                                                            },
                                                            success : function (response){
                                                                Ext.Msg.alert('成功提示', '记录删除成功。');
                                                                var mystore = Ext.StoreMgr.get('notice_newsStore');
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
                                            text: '删除'
                                        }
                                    ]
                                }
                            ],
                            selModel: {
                                selType: 'checkboxmodel'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '已删除'
                }
            ]
        }
    ]

});