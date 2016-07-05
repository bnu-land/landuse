/*
 * File: app/view/system_UserManage.js
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

Ext.define('MyApp.view.system_UserManage', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.system_UserManage',

    requires: [
        'MyApp.view.system_UserManageViewModel',
        'Ext.toolbar.Toolbar',
        'Ext.form.field.Text',
        'Ext.button.Button',
        'Ext.grid.Panel',
        'Ext.grid.column.RowNumberer',
        'Ext.grid.column.Action',
        'Ext.grid.column.Date',
        'Ext.grid.column.Boolean',
        'Ext.grid.View',
        'Ext.selection.CheckboxModel'
    ],

    viewModel: {
        type: 'db_UserPrivilegeManagerTab'
    },
    id: 'db_UserPrivilegeManagerTab',
    layout: 'fit',
    title: '用户管理',
    defaultListenerScope: true,

    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'top',
            items: [
                {
                    xtype: 'textfield',
                    id: 'searchKeyword_UserInfo',
                    emptyText: '请输入搜索关键字'
                },
                {
                    xtype: 'button',
                    icon: 'images/table/search.png',
                    text: '搜索',
                    listeners: {
                        click: 'onButtonClick'
                    }
                },
                {
                    xtype: 'button',
                    icon: 'images/table/refresh.png',
                    text: '刷新',
                    listeners: {
                        click: 'onButtonClick1'
                    }
                },
                {
                    xtype: 'button',
                    icon: 'images/table/add.png',
                    text: '添加用户',
                    listeners: {
                        click: 'onButtonClick2'
                    }
                },
                {
                    xtype: 'button',
                    icon: 'images/table/add.png',
                    text: '编辑用户',
                    listeners: {
                        click: 'onButtonClick21'
                    }
                },
                {
                    xtype: 'button',
                    icon: 'images/table/add.png',
                    text: '删除用户',
                    listeners: {
                        click: 'onButtonClick211'
                    }
                }
            ]
        }
    ],

    initConfig: function(instanceConfig) {
        var me = this,
            config = {
                items: [
                    {
                        xtype: 'gridpanel',
                        autoScroll: true,
                        id: 'system_userManagerGrid',
                        store: 'uUserInfoStore',
                        columns: [
                            {
                                xtype: 'rownumberer',
                                width: 40,
                                text: '序号'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 70,
                                dataIndex: 'userId',
                                text: '用户编号'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 100,
                                dataIndex: 'userName',
                                text: '用户名'
                            },
                            {
                                xtype: 'actioncolumn',
                                handler: function(grid, rowIndex, colIndex, actionItem, event, record, row) {
                                    var win = Ext.widget('db_UserRoleSettingWindow');
                                    win.show();

                                    //查询该用户的所有用户
                                    Ext.Ajax.request(
                                    {
                                        url : 'del_UserInfoById',
                                        params :
                                        {
                                            userId : userId
                                        },
                                        success : function (response){
                                            Ext.Msg.alert('成功提示', '记录删除成功。');
                                            //successResult();
                                            var mystore = Ext.StoreMgr.get('uUserInfoStore');
                                            mystore.load();
                                        },
                                        failure : function (response){
                                            //failedResult();
                                            // Ext.Msg.alert('失败提示', '记录删除失败。');
                                        }
                                    });



                                    //		var keyword = record.get('userName').getValue();
                                    //
                                    //		var extra_params={
                                    //		    searchKeyword:keyword
                                    //		};
                                    //		Ext.apply(store.proxy.extraParams,extra_params);
                                    //
                                    //		if (colIndex === undefined || colIndex < 2) {
                                    //		    return;
                                    //		}
                                    //		var win = Ext.widget('db_UserInfoWindow');
                                    //		win.show();
                                    //
                                    //		//var form = Ext.widget('db_UserWindowForm');
                                    //		var form = Ext.getCmp('db_UserWindowForm');
                                    //		console.log("form:",form);
                                    //		form.loadRecord(record);
                                    //
                                    //
                                    //		//对显示的结果进行处理
                                    //		//注册日期的处理
                                    //		var registerdateField = Ext.getCmp('users_registerdatew');
                                    //		var value = registerdateField.getValue();
                                    //		var date = new Date(value);
                                    //		console.log('date',date);
                                    //		if(date instanceof Date){
                                    //		    var str = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
                                    //		    console.log('date2',str);
                                    //		    registerdateField.setValue(str);
                                    //		}
                                    //		//密码框的处理
                                    //		var pwdField = Ext.getCmp('users_passwordw');
                                    //		pwdField.setValue("");
                                },
                                renderer: function(value, metaData, record, rowIndex, colIndex, store, view) {
                                    var deptId = record.get('deptId');
                                    return '<div style="float:right; font-size: 13px; line-height: 1em;">' + deptId + '</div>'
                                },
                                width: 120,
                                dataIndex: 'enabled',
                                menuText: '',
                                icon: 'images/table/edit.png'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 80,
                                dataIndex: 'trueName',
                                text: '真实姓名'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 120,
                                dataIndex: 'email',
                                text: '邮箱地址'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 100,
                                dataIndex: 'mobileNum',
                                text: '手机号码'
                            },
                            {
                                xtype: 'gridcolumn',
                                dataIndex: 'phoneNum',
                                text: '固定电话'
                            },
                            {
                                xtype: 'gridcolumn',
                                width: 200,
                                dataIndex: 'description',
                                text: '用户描述'
                            },
                            {
                                xtype: 'datecolumn',
                                dataIndex: 'registerdate',
                                text: '注册日期',
                                format: 'Y-m-d'
                            },
                            {
                                xtype: 'booleancolumn',
                                width: 60,
                                dataIndex: 'enabled',
                                text: '是否可用',
                                falseText: '否',
                                trueText: '是'
                            }
                        ],
                        selModel: Ext.create('Ext.selection.CheckboxModel', {
                            selType: 'checkboxmodel'
                        }),
                        listeners: {
                            cellclick: 'onGridpanelCellClick'
                        }
                    }
                ]
            };
        if (instanceConfig) {
            me.getConfigurator().merge(me, config, instanceConfig);
        }
        return me.callParent([config]);
    },

    onButtonClick: function(button, e, eOpts) {
        var getKeyword = Ext.getCmp('searchKeyword_UserInfo').getValue();
        console.log("keyword:",getKeyword);
        var mystore = Ext.StoreMgr.get('uUserInfoStore'); //获得store对象
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

    onButtonClick1: function(button, e, eOpts) {
        Ext.getCmp('searchKeyword_UserInfo').setValue('');
        var mystore = Ext.StoreMgr.get('uUserInfoStore'); //获得store对象
        mystore.load();

    },

    onButtonClick2: function(button, e, eOpts) {
        var win = Ext.widget('db_UserInfoAddWindow');
        win.show();
    },

    onButtonClick21: function(button, e, eOpts) {
        var grid = Ext.getCmp('system_userManagerGrid');
        var records = grid.getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后再点击编辑按钮。');
            return;
        } else if (records.length > 1) {
            Ext.Msg.alert('提示', '每次只能编辑一条信息。');
            return;
        }

        var win = Ext.widget('db_UserInfoWindow');
        win.show();

        //var form = Ext.widget('db_UserWindowForm');
        var form = Ext.getCmp('db_UserWindowForm');
        console.log("form:",form);
        form.loadRecord(records[0]);


        //对显示的结果进行处理
        //注册日期的处理
        var registerdateField = Ext.getCmp('users_registerdatew');
        var value = registerdateField.getValue();
        var date = new Date(value);
        console.log('date',date);
        if(date instanceof Date){
            var str = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
            console.log('date2',str);
            registerdateField.setValue(str);
        }
        //密码框的处理
        var pwdField = Ext.getCmp('users_passwordw');
        pwdField.setValue("");
    },

    onButtonClick211: function(button, e, eOpts) {
        var grid = Ext.getCmp('system_userManagerGrid');
        var records = grid.getSelection();
        if (records.length === 0) {
            Ext.Msg.alert('提示', '请选择一条数据后再点击删除按钮。');
            return;
        } else if (records.length > 1) {
            Ext.Msg.alert('提示', '每次只能 一条信息。');
            return;
        }
        var record = records[0];

        Ext.Msg.confirm('您正在删除', '用户：' + record.get('userName') + '，用户编号为：'+record.get('userId')+'，<br/> 确认删除？', getResult);
        function getResult(confirm)
        {
            console.log('confirm:', confirm);
            if (confirm == "yes"){
                var userId = record.get("userId");
                console.log('userId:',userId);
                Ext.Ajax.request(
                {
                    url : 'del_UserInfoById',
                    params :
                    {
                        userId : userId
                    },
                    success : function (response){
                        Ext.Msg.alert('成功提示', '记录删除成功。');
                        //successResult();
                        var mystore = Ext.StoreMgr.get('uUserInfoStore');
                        mystore.load();
                    },
                    failure : function (response){
                        //failedResult();
                        // Ext.Msg.alert('失败提示', '记录删除失败。');
                    }
                });
            }
        }
    },

    onGridpanelCellClick: function(tableview, td, cellIndex, record, tr, rowIndex, e, eOpts) {
        //console.log('this is cellclick');
        //console.log('tableview:',tableview);
        //console.log('td:',td);
        //console.log('cellIndex:',cellIndex);
        //console.log('record:',record);
        //console.log('tr:',tr);
        //console.log('rowIndex:',rowIndex);


    }

});