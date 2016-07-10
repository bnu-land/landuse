/*
 * File: app/view/business_message.js
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

Ext.define('MyApp.view.business_message', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.business_message',

    requires: [
        'MyApp.view.business_messageViewModel',
        'Ext.grid.Panel',
        'Ext.grid.column.Date',
        'Ext.grid.View',
        'Ext.toolbar.Toolbar',
        'Ext.button.Button',
        'Ext.selection.CheckboxModel',
        'Ext.form.field.Text'
    ],

    viewModel: {
        type: 'business_message'
    },
    height: 488,
    width: 729,
    layout: 'border',
    title: '企业预警与通知',

    items: [
        {
            xtype: 'panel',
            region: 'west',
            split: true,
            width: '50%',
            title: '',
            items: [
                {
                    xtype: 'gridpanel',
                    autoScroll: true,
                    height: '50%',
                    id: 'notice_NewsManageGrid1',
                    title: '新闻速递',
                    store: 'notice_newsStore',
                    columns: [
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
                        }
                    ],
                    dockedItems: [
                        {
                            xtype: 'toolbar',
                            dock: 'top',
                            items: [
                                {
                                    xtype: 'button',
                                    href: 'http://localhost:8080/landuse/public/more.html?title=news',
                                    icon: 'images/table/search.png',
                                    text: '查看更多'
                                }
                            ]
                        }
                    ],
                    selModel: {
                        selType: 'checkboxmodel'
                    }
                },
                {
                    xtype: 'gridpanel',
                    autoScroll: true,
                    height: 223,
                    id: 'notice_NewsManageGrid2',
                    title: '通知公告',
                    store: 'notice_newsStore',
                    columns: [
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
                        }
                    ],
                    dockedItems: [
                        {
                            xtype: 'toolbar',
                            dock: 'top',
                            items: [
                                {
                                    xtype: 'button',
                                    href: 'http://localhost:8080/landuse/public/more.html?title=notice',
                                    icon: 'images/table/search.png',
                                    text: '查看更多'
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
            region: 'center',
            items: [
                {
                    xtype: 'panel',
                    height: 158,
                    layout: 'absolute',
                    title: '企业用地集约度',
                    items: [
                        {
                            xtype: 'textfield',
                            handler: function() {
                                alert("当前企业集约度为87");
                            },
                            x: 40,
                            y: 40,
                            width: 250,
                            fieldLabel: '当前企业用地集约度为',
                            labelWidth: 140
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    height: 151,
                    layout: 'absolute',
                    title: '企业用地到期提醒',
                    items: [
                        {
                            xtype: 'textfield',
                            x: 40,
                            y: 40,
                            width: 250,
                            fieldLabel: '企业用地到期土地',
                            labelWidth: 140
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    height: 147,
                    layout: 'absolute',
                    title: '数据上报任务到期提醒',
                    items: [
                        {
                            xtype: 'textfield',
                            x: 40,
                            y: 40,
                            width: 250,
                            fieldLabel: '企业数据上报任务到期',
                            labelWidth: 140
                        }
                    ]
                }
            ]
        }
    ]

});