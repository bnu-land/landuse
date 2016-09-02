/*
 * File: app/view/MainView.js
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

Ext.define('MyApp.view.MainView', {
    extend: 'Ext.container.Viewport',
    alias: 'widget.mainview',

    requires: [
        'MyApp.view.MainViewViewModel',
        'Ext.toolbar.Toolbar',
        'Ext.button.Button',
        'Ext.toolbar.Fill',
        'Ext.form.Label',
        'Ext.menu.Menu',
        'Ext.menu.Item'
    ],

    viewModel: {
        type: 'mainview'
    },
    itemId: 'mainView',
    layout: 'border',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'north',
            height: 90,
            html: '<h1 style="color:#197bc1;;font-family:Microsoft YaHei;margin:10px 0px 0px 35px;"> 黑龙江开发区土地利用监测巡检系统</h1>',
            itemId: 'headerPanel',
            dockedItems: [
                {
                    xtype: 'toolbar',
                    dock: 'top',
                    width: 150,
                    items: [
                        {
                            xtype: 'button',
                            id: 'homePanel',
                            text: '主页',
                            listeners: {
                                click: 'onButtonClick'
                            }
                        },
                        {
                            xtype: 'tbfill'
                        },
                        {
                            xtype: 'label',
                            text: ''
                        },
                        {
                            xtype: 'label',
                            text: '当前用户：'
                        },
                        {
                            xtype: 'label',
                            html: '<%= request.getSession().getAttribute("currentUser"); %>',
                            id: 'mainview_curUernameLabel',
                            text: 'admin',
                            listeners: {
                                render: 'onMainview_curUernameLabelRender'
                            }
                        },
                        {
                            xtype: 'button',
                            href: 'j_spring_security_logout',
                            hrefTarget: '_parent',
                            text: '退出'
                        }
                    ]
                }
            ]
        },
        {
            xtype: 'panel',
            region: 'west',
            split: true,
            id: 'mainLeftMenuPanel',
            itemId: 'menuPanel',
            width: 250,
            layout: 'accordion',
            collapseDirection: 'left',
            items: [
                {
                    xtype: 'panel',
                    collapsed: true,
                    title: '开发区数据管理',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'business_baseinfo',
                                    hideOnClick: false,
                                    text: '任务动态'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'business_dataReport',
                                    hideOnClick: false,
                                    text: '数据填报'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'enterprise_kfq_manager',
                                    hideOnClick: false,
                                    text: '开发区信息管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    hideMode: 'visibility',
                                    id: 'enterprise_uploadMapCheck',
                                    hideOnClick: false,
                                    text: '开发区填报数据审核'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    hideMode: 'visibility',
                                    id: 'system_test',
                                    hideOnClick: false,
                                    text: '功能测试'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click9'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '开发区动态监控',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu1',
                            placeholderCollapseHideMode: 2,
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'enterprise_LandusePropertyChangeMonitor',
                                    hideOnClick: false,
                                    text: '宗地用地性质变更监控'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'enterprise_IntensityDynamicMonitor',
                                    hideOnClick: false,
                                    text: '开发区集约度动态监控'
                                },
                                {
                                    xtype: 'menuitem',
                                    hideMode: 'visibility',
                                    id: 'enterprise_UseRightExpireWarning',
                                    hideOnClick: false,
                                    text: '宗地使用权到期预警'
                                }
                            ],
                            listeners: {
                                click: 'onMenu1Click'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '专题统计分析',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu2',
                            placeholderCollapseHideMode: 2,
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'thematic_LanduseConstructionContrast',
                                    hideOnClick: false,
                                    text: '土地利用结构统计'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'thematic_LanduseConstructionChangeTrend',
                                    hideOnClick: false,
                                    text: '土地利用结构变化趋势分析'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'thematic_LanuseIntensityTrend',
                                    hideOnClick: false,
                                    text: '土地利用集约度趋势分析'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'thematic_LanuseIntensityPotentialTrend',
                                    hideOnClick: false,
                                    text: '土地集约利用潜力趋势分析'
                                }
                            ],
                            listeners: {
                                click: 'onMenu2Click'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '土地利用现状调查',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'survey_DataReceive',
                                    hideOnClick: false,
                                    text: '调查数据接收'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'survey_DataManager',
                                    hideOnClick: false,
                                    text: '调查数据管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'survey_TypicalEnterprise',
                                    hideOnClick: false,
                                    text: '典型企业调查'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'survey_IndexCurrentValueCalculation',
                                    hideOnClick: false,
                                    text: '指标现状值计算'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'survey_Landuse',
                                    hideOnClick: false,
                                    text: '土地利用现状地图'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click2'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '集约利用评价',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityuse_IndexWeightDetermine',
                                    hideOnClick: false,
                                    text: '指标权重确定'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityuse_IndexIdealValueBinding',
                                    hideOnClick: false,
                                    text: '指标理想值绑定'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityuse_IndexStandard',
                                    hideOnClick: false,
                                    text: '指标标准化处理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityuse_IntensityScoreCalculation',
                                    hideOnClick: false,
                                    text: '集约度分值计算'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click1'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '集约潜力测算',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityPotential_Expansion',
                                    hideOnClick: false,
                                    text: '扩展潜力测算'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityPotential_Construct',
                                    hideOnClick: false,
                                    text: '结构潜力测算'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityPotential_Intension',
                                    hideOnClick: false,
                                    text: '强度潜力测算'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'intensityPotential_Manage',
                                    hideOnClick: false,
                                    text: '管理潜力测算'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    hidden: true,
                    title: '任务管理',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'task_Report',
                                    hideOnClick: false,
                                    text: '举报任务'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'task_DynamicInspect',
                                    hideOnClick: false,
                                    text: '动态巡查任务'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'task_Locate',
                                    hideOnClick: false,
                                    text: '任务定位'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'task_Release',
                                    hideOnClick: false,
                                    text: '任务下发'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click3'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '通知通告发布',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'notice_Publish',
                                    hideOnClick: false,
                                    text: '内容发布'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'notice_Browse',
                                    hideOnClick: false,
                                    text: '内容浏览'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'notice_Manage',
                                    hideOnClick: false,
                                    text: '内容管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'notice_Columns',
                                    hideOnClick: false,
                                    text: '栏目管理'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click4'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '法律法规查询',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'law_Manage',
                                    hideOnClick: false,
                                    text: '法律法规管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'law_Import',
                                    hideOnClick: false,
                                    text: '法律法规导入'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'law_Search',
                                    hideOnClick: false,
                                    text: '法律法规查询'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click5'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '成果数据管理',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_DataImportDatabase',
                                    hideOnClick: false,
                                    text: '成果数据入库'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_DataIBrowse',
                                    hideOnClick: false,
                                    text: '成果数据浏览'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_DataIEdit',
                                    hideOnClick: false,
                                    text: '成果数据编辑'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_DataExport',
                                    hideOnClick: false,
                                    text: '成果资料导出'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click7'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    hidden: true,
                    title: '成果数据上报',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_UploadDataManage',
                                    hideOnClick: false,
                                    text: '上报数据管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'achievement_DataUpload',
                                    hideOnClick: false,
                                    text: '数据上报'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click6'
                            }
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    title: '系统管理维护',
                    items: [
                        {
                            xtype: 'menu',
                            floating: false,
                            itemId: 'menu3',
                            items: [
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'system_MenuManage',
                                    hideOnClick: false,
                                    text: '系统菜单管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'system_UserManage',
                                    hideOnClick: false,
                                    text: '人员信息管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'system_RightManage',
                                    hideOnClick: false,
                                    text: '系统权限管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'system_DepartmentManage',
                                    hideOnClick: false,
                                    text: '部门信息管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    id: 'system_MapManage',
                                    hideOnClick: false,
                                    text: '地图管理'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'system_Log',
                                    hideOnClick: false,
                                    text: '系统日志'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'system_DataSearch',
                                    hideOnClick: false,
                                    text: '数据查询'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'system_DataEdit',
                                    hideOnClick: false,
                                    text: '数据编辑'
                                },
                                {
                                    xtype: 'menuitem',
                                    hidden: true,
                                    id: 'system_DataManage',
                                    hideOnClick: false,
                                    text: '数据管理'
                                }
                            ],
                            listeners: {
                                click: 'onMenu3Click8'
                            }
                        }
                    ]
                }
            ],
            listeners: {
                beforerender: 'onMenuPanelBeforeRender'
            }
        },
        {
            xtype: 'panel',
            region: 'center',
            id: 'mainView',
            layout: 'fit'
        }
    ],
    listeners: {
        afterrender: 'onMainViewAfterRender'
    },

    onButtonClick: function(button, e, eOpts) {
        var xtype = button.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMainview_curUernameLabelRender: function(component, eOpts) {
        Ext.Ajax.request({
            url: 'get_currentUsername',
            success: function(response) {
                var username = response.responseText;
                if (username) {
                    Ext.getCmp('mainview_curUernameLabel').text = username;
                    //component.text = username;
                    //console.log("username:",username);
                } else {
                    //console.log("errorrr.");
                }
            },
            failure: function(conn, response, options, eOpts) {
                console.log("请求错误。");
            }
        });
    },

    onMenu3Click9: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu1Click: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu2Click: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click2: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click1: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click3: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click4: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click5: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click7: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click6: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenu3Click8: function(menu, item, e, eOpts) {
        var xtype = item.id;
        var mainView = Ext.getCmp('mainView');
        mainView.removeAll();
        mainView.add(Ext.widget(xtype));
    },

    onMenuPanelBeforeRender: function(component, eOpts) {

        console.log("权限管理开始..");
        Ext.Ajax.request({
            url: 'get_currentUserRight',
            success: function(response) {
                var result = JSON.parse(response.responseText);
                if (result.success) {
                    var rightMap = result.root;
                    var children = component.query('panel');
                    for (var index in children) {
                        var child = children[index];
                        if (child && child.xtype == 'panel') {
                            var title = child.title;
                            var isShow = rightMap[title];
                            if (!isShow || isShow=='undefined') {
                                child.setHidden(true);
                            }
                        }
                    }
                } else {
                    console.log("errorrr.");
                }
            },
            failure: function(conn, response, options, eOpts) {
                console.log("请求错误。");
            }
        });
    },

    onMainViewAfterRender: function(component, eOpts) {
        var xtype = 'homePanel';
                var mainView = Ext.getCmp('mainView');
                mainView.removeAll();
                mainView.add(Ext.widget(xtype));
    }

});