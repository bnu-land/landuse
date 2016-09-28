/*
 * File: app.js
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

// @require @packageOverrides
Ext.Loader.setConfig({

});


Ext.application({
    models: [
        'systemMapModel',
        'noticeNewsModel',
        'noticeColumnsModel',
        'thematic_LCC_PieModel',
        'thematic_LCCT_GridModel',
        'uUserRoleModel',
        'uUserInfoModel',
        'uRoleInfoModel',
        'uRightListModel',
        'uRightInfoModel',
        'uDeptInfoModel',
        'uRoleRightModel',
        'lawRegulationModel',
        'lawTypesModel',
        'landKfqTypeModel',
        'land_indexWeightModel',
        'landIndexMetaModel',
        'land_intensityExpansionModel',
        'land_intensityConstructModel',
        'land_intensityIntensionModel',
        'land_intensityManagerModel',
        'entLanduseChange',
        'enterprise_IntensityAlertModel',
        'enterprise_expirealertModel',
        'survey_dataManager',
        'sys_MapAttrNameIndexModel',
        'businessMapModel',
        'businessPhotoModel',
        'sys_KfqInfoModel',
	    'BusinessInfoModel',
        'businessinformationmodel',
        'zdinformationModel',
        'BusinessInfoModel',
        'taskModel',
        'kfqInfoModel',
        'achievementFileModel',
        'ExcelExportionModel',
        'dxqy_uploadModel'
    ],
    stores: [
        'systemManageMapStore',
        'notice_newsStore',
        'systemManageMapTreeStore',
        'notice_columnsStore',
        'systemMapFeatureLayerStore',
        'thematic_LCCT_KFQStore',
        'tmematic_LCCT_StartYearStore',
        'tmematic_LCCT_EndYearStore',
        'MyArrayStore',
        'thematic_LCCT_GridStore',
        'thematic_LCC_PieStore',
        'systemMapQYYDLayerStore',
        'uDeptInfoStore',
        'uUserInfoStore',
        'uUserRoleStore',
        'uRoleInfoStore',
        'uRightInfoStore',
        'uRightListStore',
        'law_RegulationStore',
        'law_TypesStore',
        'landKfqTypeStore',
        'survey_IndexCurrent_MapStore',
        'landKfqTypeComboStore',
        'landIndexWeightIdealStore',
        'landIndexWeightFormStore',
        'landIndexWeightStore',
        'landIndexIdealStore',
        'landIndexIdealFormStore',
        'landIndexMetaStore',
        'landIndexIntensityValueStore',
        'landIndexMetaFilterStore',
        'notice_newsDraftStore',
        'notice_newsDeleteStore',
        'landIntensityExpansionStore',
        'landIntensityConstructStore',
        'landIntensityIntensionStore',
        'landIntensityManagerStore',
        'entLanduseChange',
        'systemMap_QYYD_Store',
        'enterprise_IntensityAlertStore',
        'enterprise_ExpireAlertStore',
        'survey_dataManagerStore',
        'thematic_LCCT_ChartStore',
        'kfqZoneTreeStore',
        'sys_MapAttrNameIndexStore',
        'Business_mapStore',
        'Business_photoStore',
        'sys_TreeStore',
        'sys_MapKfqTypeStore',
        'sys_MapKfqNameStore',
        'sys_MapKfqMapStore',
        'system_roleNameStore',
        'uRoleRightByIdStore',
        'uRightInfoCurUserStore',
        'BusinessInfo',
        'taskStore',
        'kfqInfoStore',
	    'BusinessInfo',
        'bussinessinformation',
        'zd_infoStore',
        'achievementFileStore',
        'achievementFileUploadStore',
        'ExcelExportionStore',
        'zd_checkStore',
        'dxqy_uploadStore'
    ],
    views: [
        'MainView',
        'thematic_LanduseConstructionContrast',
        'homePanel',
        'enterprise_LandusePropertyChangeMonitor',
        'enterprise_IntensityDynamicMonitor',
        'enterprise_UseRightExpireWarning',
        'thematic_LanuseIntensityTrend',
        'thematic_LanuseIntensityPotentialTrend',
        'intensityPotential_Expansion',
        'intensityPotential_Construct',
        'intensityPotential_Intension',
        'intensityPotential_Manage',
        'intensityuse_IndexWeightDetermine',
        'intensityuse_IndexStandard',
        'survey_DataReceive',
        'survey_IndexCurrentValueCalculation',
        'survey_DataManager',
        'task_Report',
        'task_DynamicInspect',
        'task_Locate',
        'task_Release',
        'notice_Publish',
        'notice_Browse',
        'notice_Manage',
        'law_Manage',
        'law_Import',
        'law_Search',

      //  'achievement_DataUpload',



        'system_DepartmentManage',
        'system_RightManage',
        'system_MapManageTree',
        'system_DataSearch',
        'system_DataEdit',
        'system_DataManage',
        'mapInfoWindow',
        'system_MapManage',
        'system_MapAddWindow',
        'notice_Columns',
        'notice_ColumnsWindow',
        'thematic_LanduseConstructionChangeTrend',
        'survey_Landuse',
        'survey_TypicalEnterprise',
        'db_RightInfoAddWindow',
        'db_RightInfoWindow',
        'db_DeptInfoWindow',
        'db_RoleInfoWindow',
        'db_UserInfoEditTab',
        'db_UserInfoWindow',
        'system_UserManage',
        'db_UserRoleSettingWindow',
        'db_DeptInfoAddWindow',
        'db_UserInfoAddWindow',
        'law_TypesManagerWindow',
        'law_TypeWindow',
        'intensityuse_IndexIdealValueBinding',
        'intensityuse_IntensityScoreCalculation',
        'system_Log',
        'sys_MapAttrNameIndexWindow',
        'sys_MapAddAttrNameIndexWindow',
      
        'system_MenuManage',
        'db_RoleInfoAddWindow',
        'db_RoleInfoEditWindow',
        'db_RoleRightSettingWindow',
        'kfq_uploadDataCheck',
        'enterprise_uploadMapCheckResultWindow',
        'system_test',
      
     
        'taskMation',
      
        "survey_zdxx",
        'kfq_manager',
        'chart_bar',
        'chart_pie',
       // 'win_kfqinfo_add',
        'kfqChangeWindow',
        'zdxx_upload',
	    'zdxx_add',
        
        'dxqy_upload',
        'achievement_DataImportDB',
        'achievement_DataExport',
        'achievement_ExcelExport',
        'dxqy_adduplod',
        'dxqy_photoupload',
        'dxqy_mapupload',
        'kfq_add',

        'dxqy_photoPreview',
        'dxqy_mapPreview'
        

        
    ],
    name: 'MyApp',

    launch: function() {
        Ext.create('MyApp.view.MainView');
    }

});
