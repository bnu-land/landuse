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
        'MyApp.view.homePanelViewModel1'
    ],

    viewModel: {
        type: 'enterprise_landusepropertychangemonitor'
    },
    html: '<div id="map" ></div>',
    title: '企业用地性质变更监控',
    defaultListenerScope: true,

    listeners: {
        afterrender: 'onPanelAfterRender'
    },

    onPanelAfterRender: function(component, eOpts) {
        //加入地图的js文件
        var head = document.getElementsByTagName('head')[0];
        var script= document.createElement("script");
        script.type = "text/javascript";
        script.src="mapjs/testMap.js";
        head.appendChild(script);
    }

});