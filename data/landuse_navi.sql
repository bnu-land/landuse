/*
Navicat MySQL Data Transfer

Source Server         : 202.112.95.178
Source Server Version : 50530
Source Host           : 202.112.95.178:7712
Source Database       : landuse

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2016-06-20 08:47:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_map
-- ----------------------------
DROP TABLE IF EXISTS `business_map`;
CREATE TABLE `business_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(20) NOT NULL,
  `upload_user` varchar(20) DEFAULT NULL,
  `west_coor` double NOT NULL DEFAULT '0',
  `east_coor` double NOT NULL DEFAULT '0',
  `north_coor` double NOT NULL DEFAULT '0',
  `south_coor` double NOT NULL DEFAULT '0',
  `is_pass` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_map
-- ----------------------------
INSERT INTO `business_map` VALUES ('1', '20160614', '科技公司', '116.34', '116.34', '116.34', '116.34', '0');
INSERT INTO `business_map` VALUES ('2', '20160614', '世纪九州', '116.34', '116.34', '116.34', '116.34', '1');
INSERT INTO `business_map` VALUES ('3', '20160614', '北京科技', '116.34', '116.34', '116.34', '116.34', '2');

-- ----------------------------
-- Table structure for business_photo
-- ----------------------------
DROP TABLE IF EXISTS `business_photo`;
CREATE TABLE `business_photo` (
  `id` int(11) NOT NULL,
  `pro_code` varchar(50) DEFAULT NULL,
  `up_date` datetime DEFAULT NULL,
  `photo_path` varchar(300) DEFAULT NULL,
  `photo_title` varchar(50) DEFAULT NULL,
  `is_pass` int(11) NOT NULL DEFAULT '0',
  `other` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_photo
-- ----------------------------
INSERT INTO `business_photo` VALUES ('1', '20160614', '2016-06-14 00:00:00', 'D:/小胡', '小胡', '0', null);

-- ----------------------------
-- Table structure for ent_dxqyyd_pda
-- ----------------------------
DROP TABLE IF EXISTS `ent_dxqyyd_pda`;
CREATE TABLE `ent_dxqyyd_pda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MBBSM` int(10) DEFAULT NULL COMMENT '目标标识码',
  `YSDM` varchar(10) DEFAULT NULL COMMENT '要素代码',
  `KFQDM` varchar(7) DEFAULT NULL COMMENT '开发区代码',
  `KFQMC` varchar(60) DEFAULT NULL COMMENT '开发区名称',
  `TBBH` varchar(20) NOT NULL COMMENT '图斑编号',
  `DXDM` varchar(2) DEFAULT NULL COMMENT '典型企业代码',
  `QYMC` varchar(40) DEFAULT NULL COMMENT '企业名称',
  `QYDZ` varchar(100) DEFAULT NULL COMMENT '企业地址',
  `SSPJFW` varchar(10) DEFAULT NULL COMMENT '所属评价范围',
  `HYLB` varchar(40) DEFAULT NULL COMMENT '行业类别',
  `HYDM` varchar(4) DEFAULT NULL COMMENT '行业代码',
  `QYRS` int(6) DEFAULT '0' COMMENT '企业人数',
  `YJZTZ` double DEFAULT '0' COMMENT '预计总投资',
  `WCTZ` double DEFAULT '0' COMMENT '完成投资',
  `ZSR` double DEFAULT '0' COMMENT '总收入',
  `ZCZ` double DEFAULT '0' COMMENT '总产值',
  `SSZE` double DEFAULT '0' COMMENT '税收总额',
  `QYYDMJ` double DEFAULT '0' COMMENT '企业用地面积',
  `CFPT` double DEFAULT '0' COMMENT '厂房及配套用地面积',
  `XZBG` double DEFAULT '0' COMMENT '企业内部行政办公及生活服务设施用地面积',
  `LTCD` double DEFAULT '0' COMMENT '露天场地、露天操作场地面积',
  `NBYLD` double DEFAULT '0' COMMENT '厂区内部预留地面积',
  `DLTCC` double DEFAULT '0' COMMENT '企业内部道路停车场面积',
  `LD` double DEFAULT '0' COMMENT '绿地面积',
  `QT` double DEFAULT '0' COMMENT '其他用地面积',
  `ZJZMJ` double DEFAULT '0' COMMENT '总建筑面积',
  `RJL` double DEFAULT '0' COMMENT '容积率',
  `JDZMJ` double DEFAULT '0' COMMENT '建筑物构筑物基底、露天堆场和露天操作场地的总面积',
  `JZXS` double DEFAULT '0' COMMENT '建筑系数',
  `BZ` varchar(200) DEFAULT NULL COMMENT '备注',
  `CJR` varchar(30) DEFAULT NULL COMMENT '采集人',
  `CJSJ` date DEFAULT NULL COMMENT '采集时间',
  `SHZT` int(11) DEFAULT '0' COMMENT '审核状态',
  `SHYJ` varchar(300) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_dxqyyd_pda
-- ----------------------------
INSERT INTO `ent_dxqyyd_pda` VALUES ('1', '40', '2001050101', 'G231062', '宾西经济技术开发区', '16', '07', '黑龙江宏瑞彩包装制品有限公司', '兴宾大道东', '主区', '包装印刷业', '2239', '126', '8.22', '2.74', '0.47', '1.89', '0.2', '0.24', '0', '2.68', '5.82', '0.70802897', '4.05', '49.27000046', null, null, null, null, null, null, '张克明', '2015-07-21', '0', null);

-- ----------------------------
-- Table structure for ent_expirealert
-- ----------------------------
DROP TABLE IF EXISTS `ent_expirealert`;
CREATE TABLE `ent_expirealert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `MBBSM` int(11) DEFAULT NULL,
  `YSDM` varchar(10) DEFAULT NULL,
  `KFQDM` varchar(10) DEFAULT NULL,
  `KFQMC` varchar(30) DEFAULT NULL,
  `TBBH` varchar(10) DEFAULT NULL,
  `QYMC` varchar(50) DEFAULT NULL,
  `SSPJFW` varchar(20) DEFAULT NULL,
  `HYLB` varchar(20) DEFAULT NULL,
  `DQSJ` date DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_expirealert
-- ----------------------------
INSERT INTO `ent_expirealert` VALUES ('1', '40', '2001050101', 'G231062', '宾西经济技术开发区', '18', '哈尔滨大北农牧业科技有限公司', '主区', '饲料加工', '2016-09-21');
INSERT INTO `ent_expirealert` VALUES ('2', '40', '2001050102', 'G231062', '宾西经济技术开发区', '18', '哈尔滨南投科技公司', '主区', '科技创新', '2016-07-22');
INSERT INTO `ent_expirealert` VALUES ('3', '40', '2001050102', 'G231062', '宾西经济技术开发区', '18', '黑龙江旺食食品有限公司', '主区', '食品餐饮', '2016-11-07');

-- ----------------------------
-- Table structure for ent_qyjyd
-- ----------------------------
DROP TABLE IF EXISTS `ent_qyjyd`;
CREATE TABLE `ent_qyjyd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MBBSM` int(10) DEFAULT NULL COMMENT '目标标识码',
  `YSDM` varchar(10) DEFAULT NULL COMMENT '要素代码',
  `KFQDM` varchar(7) DEFAULT NULL COMMENT '开发区代码',
  `KFQMC` varchar(60) DEFAULT NULL COMMENT '开发区名称',
  `TBBH` varchar(20) NOT NULL COMMENT '图斑编号',
  `DXDM` varchar(2) DEFAULT NULL COMMENT '典型企业代码',
  `QYMC` varchar(40) DEFAULT NULL COMMENT '企业名称',
  `QYDZ` varchar(100) DEFAULT NULL COMMENT '企业地址',
  `SSPJFW` varchar(10) DEFAULT NULL COMMENT '所属评价范围',
  `HYLB` varchar(40) DEFAULT NULL COMMENT '行业类别',
  `HYDM` varchar(4) DEFAULT NULL COMMENT '行业代码',
  `QYRS` int(6) DEFAULT '0' COMMENT '企业人数',
  `QYYDMJ` double DEFAULT '0' COMMENT '企业用地面积',
  `CFPT` double DEFAULT '0' COMMENT '厂房及配套用地面积',
  `XZBG` double DEFAULT '0' COMMENT '企业内部行政办公及生活服务设施用地面积',
  `LTCD` double DEFAULT '0' COMMENT '露天场地、露天操作场地面积',
  `NBYLD` double DEFAULT '0' COMMENT '厂区内部预留地面积',
  `DLTCC` double DEFAULT '0' COMMENT '企业内部道路停车场面积',
  `LD` double DEFAULT '0' COMMENT '绿地面积',
  `QT` double DEFAULT '0' COMMENT '其他用地面积',
  `ZJZMJ` double DEFAULT '0' COMMENT '总建筑面积',
  `RJL` double DEFAULT '0' COMMENT '容积率',
  `JDZMJ` double DEFAULT '0' COMMENT '建筑物构筑物基底、露天堆场和露天操作场地的总面积',
  `JZXS` double DEFAULT '0' COMMENT '建筑系数',
  `BZ` varchar(200) DEFAULT NULL COMMENT '备注',
  `JYDDJ` varchar(10) DEFAULT NULL COMMENT '集约度等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_qyjyd
-- ----------------------------
INSERT INTO `ent_qyjyd` VALUES ('3', '40', '2001050101', 'G231062', '宾西经济技术开发区', '16', '07', '黑龙江宏瑞彩包装制品有限公司', '兴宾大道东', '主区', '包装印刷业', '2239', '126', '8.22', '2.74', '0.47', '1.89', '0.2', '0.24', '0', '2.68', '5.82', '0.70802897', '4.05', '49.27000046', '无', '高');

-- ----------------------------
-- Table structure for landuse_index_meta
-- ----------------------------
DROP TABLE IF EXISTS `landuse_index_meta`;
CREATE TABLE `landuse_index_meta` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `level_code` varchar(20) DEFAULT NULL,
  `index_name` varchar(100) DEFAULT NULL,
  `index_key` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_index_meta
-- ----------------------------
INSERT INTO `landuse_index_meta` VALUES ('1', '0', 'sum', '', 'mainDevelopSum', null);
INSERT INTO `landuse_index_meta` VALUES ('2', '1', 'mm', '', 'mainArea', null);
INSERT INTO `landuse_index_meta` VALUES ('3', '2', 'ma', '', 'mainLanduse', null);
INSERT INTO `landuse_index_meta` VALUES ('4', '3', 'mb', '', 'mainLanduseDegree', null);
INSERT INTO `landuse_index_meta` VALUES ('5', '4', 'mc', '', 'mainLanduseDegreeSupply', null);
INSERT INTO `landuse_index_meta` VALUES ('6', '5', 'md', '', 'mainLanduseDegreeSupplyReason', null);
INSERT INTO `landuse_index_meta` VALUES ('7', '4', 'mc', '', 'mainLanduseDegreeBuild', null);
INSERT INTO `landuse_index_meta` VALUES ('8', '7', 'md', '', 'mainLanduseDegreeBuildReason', null);
INSERT INTO `landuse_index_meta` VALUES ('9', '3', 'mb', '', 'mainLanduseConstruct', null);
INSERT INTO `landuse_index_meta` VALUES ('10', '9', 'mc', '', 'mainLanduseConstructIndustry', null);
INSERT INTO `landuse_index_meta` VALUES ('11', '10', 'md', '', 'mainLanduseConstructIndustryReason', null);
INSERT INTO `landuse_index_meta` VALUES ('12', '3', 'mb', '', 'mainLanduseIntensity', null);
INSERT INTO `landuse_index_meta` VALUES ('13', '12', 'mc', '', 'mainLanduseIntensityRatio', null);
INSERT INTO `landuse_index_meta` VALUES ('14', '13', 'md', '', 'mainLanduseIntensityRatioReason', null);
INSERT INTO `landuse_index_meta` VALUES ('15', '12', 'mc', '', 'mainLanduseIntensityDensity', null);
INSERT INTO `landuse_index_meta` VALUES ('16', '15', 'md', '', 'mainLanduseIntensityDensityReason', null);
INSERT INTO `landuse_index_meta` VALUES ('17', '12', 'mc', '', 'mainLanduseIntensitySumratio', null);
INSERT INTO `landuse_index_meta` VALUES ('18', '17', 'md', '', 'mainLanduseIntensitySumratioReason', null);
INSERT INTO `landuse_index_meta` VALUES ('19', '12', 'mc', '', 'mainLanduseIntensityBuildindex', null);
INSERT INTO `landuse_index_meta` VALUES ('20', '19', 'md', '', 'mainLanduseIntensityBuildindexReason', null);
INSERT INTO `landuse_index_meta` VALUES ('21', '2', 'ma', '', 'mainBenefit', null);
INSERT INTO `landuse_index_meta` VALUES ('22', '21', 'mb', '', 'mainBenefitInexport', null);
INSERT INTO `landuse_index_meta` VALUES ('23', '22', 'mc', '', 'mainBenefitInexportAssets', null);
INSERT INTO `landuse_index_meta` VALUES ('24', '23', 'md', '', 'mainBenefitInexportAssetsReason', null);
INSERT INTO `landuse_index_meta` VALUES ('25', '22', 'mc', '', 'mainBenefitInexportTax', null);
INSERT INTO `landuse_index_meta` VALUES ('26', '25', 'md', '', 'mainBenefitInexportTaxReason', null);
INSERT INTO `landuse_index_meta` VALUES ('27', '22', 'mc', '', 'mainBenefitInexportPopulation', null);
INSERT INTO `landuse_index_meta` VALUES ('28', '27', 'md', '', 'mainBenefitInexportPopulationReason', null);
INSERT INTO `landuse_index_meta` VALUES ('29', '2', 'ma', '', 'mainPerformance', null);
INSERT INTO `landuse_index_meta` VALUES ('30', '29', 'mb', '', 'mainPerformanceManage', null);
INSERT INTO `landuse_index_meta` VALUES ('31', '30', 'mc', '', 'mainPerformanceManageIdle', null);
INSERT INTO `landuse_index_meta` VALUES ('32', '31', 'md', '', 'mainPerformanceManageIdleReason', null);
INSERT INTO `landuse_index_meta` VALUES ('33', '1', 'mm', '', 'developArea', null);
INSERT INTO `landuse_index_meta` VALUES ('34', '33', 'da', '', 'developLanduse', null);
INSERT INTO `landuse_index_meta` VALUES ('35', '34', 'db', '', 'developLanduseDegree', null);
INSERT INTO `landuse_index_meta` VALUES ('36', '35', 'dc', '', 'developLanduseDegreeDevratio', null);
INSERT INTO `landuse_index_meta` VALUES ('37', '36', 'dd', '', 'developLanduseDegreeDevratioReason', null);
INSERT INTO `landuse_index_meta` VALUES ('38', '34', 'db', '', 'developLanduseConstruct', null);
INSERT INTO `landuse_index_meta` VALUES ('39', '38', 'dc', '', 'developLanduseConstructIndustry', null);
INSERT INTO `landuse_index_meta` VALUES ('40', '39', 'dd', '', 'developLanduseConstructIndustryReason', null);
INSERT INTO `landuse_index_meta` VALUES ('41', '34', 'db', '', 'developLanduseIntensity', null);
INSERT INTO `landuse_index_meta` VALUES ('42', '41', 'dc', '', 'developLanduseIntensityRatio', null);
INSERT INTO `landuse_index_meta` VALUES ('43', '42', 'dd', '', 'developLanduseIntensityRatioReason', null);
INSERT INTO `landuse_index_meta` VALUES ('44', '41', 'dc', '', 'developLanduseIntensityDensity', null);
INSERT INTO `landuse_index_meta` VALUES ('45', '44', 'dd', '', 'developLanduseIntensityDensityReason', null);
INSERT INTO `landuse_index_meta` VALUES ('46', '41', 'dc', '', 'developLanduseIntensitySumratio', null);
INSERT INTO `landuse_index_meta` VALUES ('47', '46', 'dd', '', 'developLanduseIntensitySumratioReason', null);
INSERT INTO `landuse_index_meta` VALUES ('48', '41', 'dc', '', 'developLanduseIntensityBuildindex', null);
INSERT INTO `landuse_index_meta` VALUES ('49', '48', 'dd', '', 'developLanduseIntensityBuildindexReason', null);
INSERT INTO `landuse_index_meta` VALUES ('50', '33', 'da', '', 'developBenefit', null);
INSERT INTO `landuse_index_meta` VALUES ('51', '50', 'db', '', 'developBenefitInexport', null);
INSERT INTO `landuse_index_meta` VALUES ('52', '51', 'dc', '', 'developBenefitInexportAssets', null);
INSERT INTO `landuse_index_meta` VALUES ('53', '52', 'dd', '', 'developBenefitInexportAssetsReason', null);
INSERT INTO `landuse_index_meta` VALUES ('54', '51', 'dc', '', 'developBenefitInexportTax', null);
INSERT INTO `landuse_index_meta` VALUES ('55', '54', 'dd', '', 'developBenefitInexportTaxReason', null);
INSERT INTO `landuse_index_meta` VALUES ('56', '51', 'dc', '', 'developBenefitInexportPopulation', null);
INSERT INTO `landuse_index_meta` VALUES ('57', '56', 'dd', '', 'developBenefitInexportPopulationReason', null);
INSERT INTO `landuse_index_meta` VALUES ('58', '33', 'da', '', 'developPerformance', null);
INSERT INTO `landuse_index_meta` VALUES ('59', '58', 'db', '', 'developPerformanceManage', null);
INSERT INTO `landuse_index_meta` VALUES ('60', '59', 'dc', '', 'developPerformanceManageIdle', null);
INSERT INTO `landuse_index_meta` VALUES ('61', '60', 'dd', '', 'developPerformanceManageIdleReason', null);

-- ----------------------------
-- Table structure for landuse_index_weight
-- ----------------------------
DROP TABLE IF EXISTS `landuse_index_weight`;
CREATE TABLE `landuse_index_weight` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` varchar(20) DEFAULT NULL,
  `kfq_name` varchar(50) DEFAULT NULL,
  `kfq_type` varchar(50) DEFAULT NULL,
  `mark_type` varchar(20) DEFAULT NULL COMMENT 'weightCollect,weightMark,idleCollect,idleMark',
  `main_develop_sum` float DEFAULT NULL,
  `main_area` float DEFAULT NULL,
  `main_landuse` float DEFAULT NULL,
  `main_landuse_degree` float DEFAULT NULL,
  `main_landuse_degree_supply` float DEFAULT NULL,
  `main_landuse_degree_supply_reason` varchar(200) DEFAULT NULL,
  `main_landuse_degree_build` float DEFAULT NULL,
  `main_landuse_degree_build_reason` varchar(140) DEFAULT NULL,
  `main_landuse_construct` float DEFAULT NULL,
  `main_landuse_construct_industry` float DEFAULT NULL,
  `main_landuse_construct_industry_reason` varchar(200) DEFAULT NULL,
  `main_landuse_intensity` float DEFAULT NULL,
  `main_landuse_intensity_ratio` float DEFAULT NULL,
  `main_landuse_intensity_ratio_reason` varchar(200) DEFAULT NULL,
  `main_landuse_intensity_density` float DEFAULT NULL,
  `main_landuse_intensity_density_reason` varchar(200) DEFAULT NULL,
  `main_landuse_intensity_sumratio` float DEFAULT NULL,
  `main_landuse_intensity_sumratio_reason` varchar(200) DEFAULT NULL,
  `main_landuse_intensity_buildindex` float DEFAULT NULL,
  `main_landuse_intensity_buildindex_reason` varchar(200) DEFAULT NULL,
  `main_benefit` float DEFAULT NULL,
  `main_benefit_Inexport` float DEFAULT NULL,
  `main_benefit_Inexport_assets` float DEFAULT NULL,
  `main_benefit_Inexport_assets_reason` varchar(200) DEFAULT NULL,
  `main_benefit_Inexport_tax` float DEFAULT NULL,
  `main_benefit_Inexport_tax_reason` varchar(200) DEFAULT NULL,
  `main_benefit_Inexport_population` float DEFAULT NULL,
  `main_benefit_Inexport_population_reason` varchar(200) DEFAULT NULL,
  `main_performance` float DEFAULT NULL,
  `main_performance_manage` float DEFAULT NULL,
  `main_performance_manage_idle` float DEFAULT NULL,
  `main_performance_manage_idle_reason` varchar(200) DEFAULT NULL,
  `develop_area` float DEFAULT NULL,
  `develop_landuse` float DEFAULT NULL,
  `develop_landuse_degree` float DEFAULT NULL,
  `develop_landuse_degree_devratio` float DEFAULT NULL,
  `develop_landuse_degree_devratio_reason` varchar(200) DEFAULT NULL,
  `develop_landuse_construct` float DEFAULT NULL,
  `develop_landuse_construct_industry` float DEFAULT NULL,
  `develop_landuse_construct_industry_reason` varchar(200) DEFAULT NULL,
  `develop_landuse_intensity` float DEFAULT NULL,
  `develop_landuse_intensity_ratio` float DEFAULT NULL,
  `develop_landuse_intensity_ratio_reason` varchar(200) DEFAULT NULL,
  `develop_landuse_intensity_density` float DEFAULT NULL,
  `develop_landuse_intensity_density_reason` varchar(200) DEFAULT NULL,
  `develop_landuse_intensity_sumratio` float DEFAULT NULL,
  `develop_landuse_intensity_sumratio_reason` varchar(200) DEFAULT NULL,
  `develop_landuse_intensity_buildindex` float DEFAULT NULL,
  `develop_landuse_intensity_buildindex_reason` varchar(200) DEFAULT NULL,
  `develop_benefit` float DEFAULT NULL,
  `develop_benefit_Inexport` float DEFAULT NULL,
  `develop_benefit_Inexport_assets` float DEFAULT NULL,
  `develop_benefit_Inexport_assets_reason` varchar(200) DEFAULT NULL,
  `develop_benefit_Inexport_tax` float DEFAULT NULL,
  `develop_benefit_Inexport_tax_reason` varchar(200) DEFAULT NULL,
  `develop_benefit_Inexport_population` float DEFAULT NULL,
  `develop_benefit_Inexport_population_reason` varchar(200) DEFAULT NULL,
  `develop_performance` float DEFAULT NULL,
  `develop_performance_manage` float DEFAULT NULL,
  `develop_performance_manage_idle` float DEFAULT NULL,
  `develop_performance_manage_idle_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_index_weight
-- ----------------------------
INSERT INTO `landuse_index_weight` VALUES ('41', '201506151710', '宾西2012', '工业主导型开发区', '权重值汇总', null, '0.8', '0.7', '0.25', '0.5', null, '0.5', null, '0.25', '1', null, '0.5', '0.25', null, '0.22', null, '0.25', null, '0.28', null, '0.2', '1', '0.5', null, '0.5', null, null, null, '0.1', '1', '1', null, '0.2', '0.7', '0.25', '0.5', null, '0.25', '1', null, '0.5', '0.25', null, '0.22', null, '0.25', null, '0.28', null, '0.2', '1', '0.5', null, '0.5', null, null, null, '0.1', '1', '1', null);
INSERT INTO `landuse_index_weight` VALUES ('42', '201506151715', '利民2013', '产城融合型开发区', '权重值汇总', null, '0.8', '0.7', '0.25', '0.5', null, '0.5', null, null, null, null, '0.5', '0.25', null, '0.22', null, null, null, null, null, '0.2', '1', null, null, '0.5', null, '0.5', null, '0.1', '1', '1', null, '0.2', '0.7', '0.25', '0.5', null, null, null, null, '0.5', '0.25', null, '0.22', null, null, null, null, null, '0.2', '1', null, null, '0.5', null, '0.5', null, '0.1', '1', '1', null);
INSERT INTO `landuse_index_weight` VALUES ('44', '201506151815', '海林2012', '工业主导型开发区', '权重值汇总', null, '0.8', '0.7', '0.25', '0.5', null, '0.5', null, '0.25', '1', null, '0.5', '0.25', null, '0.22', null, '0.25', null, '0.28', null, '0.2', '1', '0.5', null, '0.5', null, null, null, '0.1', '1', '1', null, '0.2', '0.7', '0.25', '0.5', null, '0.25', '1', null, '0.5', '0.25', null, '0.22', null, '0.25', null, '0.28', null, '0.2', '1', '0.5', null, '0.5', null, null, null, '0.1', '1', '1', null);
INSERT INTO `landuse_index_weight` VALUES ('48', '201506151815', '海林2012', '工业主导型开发区', '理想值汇总', null, null, null, null, '0.5', 'qwe', '0.5', '', null, '1', '', null, '0.25', '', '0.22', '', '0.25', '', '0.28', '', null, null, '0.5', '', '0.5', '', null, null, null, null, '1', '', null, null, null, '0.5', '', null, '1', '', null, '0.25', '', '0.22', '', '0.25', '', '0.28', '', null, null, '0.5', '', '0.5', '', null, null, null, null, '1', '');
INSERT INTO `landuse_index_weight` VALUES ('49', '201506151715', '利民2013', '产城融合型开发区', '理想值汇总', null, null, null, null, '0.5', '', '0.5', '', null, '0', '', null, '0.25', '', '0.22', '', '0', '', '0', '', null, null, '0', '', '0.5', '', null, null, null, null, '1', '', null, null, null, '0.5', '', null, '0', '', null, '0.25', '', '0.22', '', '0', '', '0', '', null, null, '0', '', '0.5', '', null, null, null, null, '1', '');
INSERT INTO `landuse_index_weight` VALUES ('50', '201506151815', '海林2012', '工业主导型开发区', '集约度分值', '98.25', '100', '0', '100', '100', null, '100', null, '100', '100', null, '100', '100', null, '100', null, '100', null, '100', null, '0', '100', '100', null, '100', null, null, null, '0', '100', '100', null, '91.25', '0', '50', '100', null, '100', '100', null, '100', '100', null, '100', null, '100', null, '100', null, '0', '100', '100', null, '100', null, null, null, '0', '100', '100', null);
INSERT INTO `landuse_index_weight` VALUES ('60', '201506162029', '宾西2013', '工业主导型开发区', '权重值汇总', null, '0.8', '0.25', '0.44', '0.5', null, '0.5', null, '0.29', '1', null, '0.53', '0.25', null, '0.22', null, '0.41', null, '0.29', null, '0.42', '0.4', '0.5', null, '0.5', null, null, null, '0.17', '0.48', '1', null, '0.2', '0.7', '0.25', '0.5', null, '0.25', '1', null, '0.5', '0.25', null, '0.22', null, '0.25', null, '0.28', null, '0.2', '1', '0.5', null, '0.5', null, null, null, '0.1', '1', '1', null);
INSERT INTO `landuse_index_weight` VALUES ('62', '201506162029', '宾西2013', '工业主导型开发区', '集约度分值', '63.84', '68.55', '70.85', '100', '100', null, '100', null, '0', '100', null, '47', '100', null, '100', null, '68.33', null, '100', null, '50', '50', '100', null, '100', null, null, null, '100', '100', '100', null, '53.64', '47.9', '50', '100', null, '0', '100', null, '47', '100', null, '100', null, '100', null, '100', null, '50', '50', '100', null, '100', null, null, null, '100', '100', '100', null);
INSERT INTO `landuse_index_weight` VALUES ('63', '201606051742', '宾西2013', '工业主导型开发区', '权重值汇总', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `landuse_index_weight` VALUES ('64', '201606051742', '宾西2013', '工业主导型开发区', '权重值汇总', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `landuse_index_weight` VALUES ('65', '201606051742', '宾西2013', '工业主导型开发区', '权重值汇总', null, '0.8', '0.65', '0.45', '0.5', null, '0.5', null, null, null, null, '0.55', '0.25', null, '0.22', null, null, null, null, null, '0.25', '1', null, null, '0.5', null, '0.5', null, '0.1', '1', '1', null, '0.2', '0.65', '0.3', '0.5', null, null, null, null, '0.7', '0.25', null, '0.22', null, null, null, null, null, '0.25', '1', null, null, '0.5', null, '0.5', null, '0.1', '1', '1', null);

-- ----------------------------
-- Table structure for landuse_intensity_construct
-- ----------------------------
DROP TABLE IF EXISTS `landuse_intensity_construct`;
CREATE TABLE `landuse_intensity_construct` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kfq_name` varchar(50) DEFAULT NULL,
  `kfq_map` varchar(50) DEFAULT NULL,
  `calc_date` date DEFAULT NULL,
  `main_yjcczmj` double DEFAULT NULL,
  `main_build_weight` double DEFAULT NULL,
  `main_build_ideal` double DEFAULT NULL,
  `main_construct` double DEFAULT NULL,
  `develop_yjcczmj` double DEFAULT NULL,
  `develop_build_weight` double DEFAULT NULL,
  `develop_build_ideal` double DEFAULT NULL,
  `develop_construct` double DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_intensity_construct
-- ----------------------------
INSERT INTO `landuse_intensity_construct` VALUES ('4', '海林', '海林2013', '2015-06-17', '155.128', '1', '1', '0', '0', '1', '1', '0', null);

-- ----------------------------
-- Table structure for landuse_intensity_expansion
-- ----------------------------
DROP TABLE IF EXISTS `landuse_intensity_expansion`;
CREATE TABLE `landuse_intensity_expansion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kfq_name` varchar(50) DEFAULT NULL,
  `kfq_map` varchar(50) DEFAULT NULL,
  `calc_date` date DEFAULT NULL,
  `main_skgytd` double DEFAULT NULL,
  `main_skgygkcc` double DEFAULT NULL,
  `main_snnjgytd` double DEFAULT NULL,
  `main_wngytdzdz` double DEFAULT NULL,
  `main_snnjgkcc` double DEFAULT NULL,
  `main_wngkcczdz` double DEFAULT NULL,
  `develop_skgytd` double DEFAULT NULL,
  `develop_skgygkcc` double DEFAULT NULL,
  `develop_snnjgytd` double DEFAULT NULL,
  `develop_wngytdzdz` double DEFAULT NULL,
  `develop_snnjgkcc` double DEFAULT NULL,
  `develop_wngkcczdz` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_intensity_expansion
-- ----------------------------
INSERT INTO `landuse_intensity_expansion` VALUES ('2', '宾西', '宾西2013开发区', '2015-06-17', '920.539', '752.319', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `landuse_intensity_expansion` VALUES ('3', '海林', '海林2013', '2015-08-23', '87.381', '3.432', null, null, null, null, '0', '0', null, null, null, null);

-- ----------------------------
-- Table structure for landuse_intensity_intension
-- ----------------------------
DROP TABLE IF EXISTS `landuse_intensity_intension`;
CREATE TABLE `landuse_intensity_intension` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kfq_name` varchar(50) DEFAULT NULL,
  `kfq_map` varchar(50) DEFAULT NULL,
  `calc_date` date DEFAULT NULL,
  `dldm_gkccmj` double DEFAULT NULL,
  `main_sumratio_weight` double DEFAULT NULL,
  `main_sumratio_ideal` double DEFAULT NULL,
  `main_sumratio_intension` double DEFAULT NULL,
  `main_buildrate_weight` double DEFAULT NULL,
  `main_buildrate_ideal` double DEFAULT NULL,
  `main_buildrate_intension` double DEFAULT NULL,
  `main_asset_weight` double DEFAULT NULL,
  `main_asset_ideal` double DEFAULT NULL,
  `main_asset_intension` double DEFAULT NULL,
  `main_tax_weight` double DEFAULT NULL,
  `main_tax_ideal` double DEFAULT NULL,
  `main_tax_intension` double DEFAULT NULL,
  `main_sumtax_weight` double DEFAULT NULL,
  `main_sumtax_ideal` double DEFAULT NULL,
  `main_sumtax_intension` double DEFAULT NULL,
  `develop_sumratio_weight` double DEFAULT NULL,
  `develop_sumratio_ideal` double DEFAULT NULL,
  `develop_sumratio_intension` double DEFAULT NULL,
  `develop_buildrate_weight` double DEFAULT NULL,
  `develop_buildrate_ideal` double DEFAULT NULL,
  `develop_buildrate_intension` double DEFAULT NULL,
  `develop_asset_weight` double DEFAULT NULL,
  `develop_asset_ideal` double DEFAULT NULL,
  `develop_asset_intension` double DEFAULT NULL,
  `develop_tax_weight` double DEFAULT NULL,
  `develop_tax_ideal` double DEFAULT NULL,
  `develop_tax_intension` double DEFAULT NULL,
  `develop_sumtax_weight` double DEFAULT NULL,
  `develop_sumtax_ideal` double DEFAULT NULL,
  `develop_sumtax_intension` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_intensity_intension
-- ----------------------------
INSERT INTO `landuse_intensity_intension` VALUES ('2', 'a', 'a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `landuse_intensity_intension` VALUES ('3', '海林', '海林2013', '2015-06-17', '66.9194', '0.28', '0.28', '7.17', '0.25', '0.25', '-8.03', '0.5', '0.5', '0', '0.5', '0.5', '0', null, null, null, '0.25', '0.25', '0', '0.28', '0.28', '0', '0.5', '0.5', '0', '0.5', '0.5', '0', null, null, null);

-- ----------------------------
-- Table structure for landuse_intensity_manager
-- ----------------------------
DROP TABLE IF EXISTS `landuse_intensity_manager`;
CREATE TABLE `landuse_intensity_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kfq_name` varchar(50) DEFAULT NULL,
  `kfq_map` varchar(50) DEFAULT NULL,
  `calc_date` date DEFAULT NULL,
  `main_expire` double DEFAULT NULL,
  `main_ideal` double DEFAULT NULL,
  `develop_expire` double DEFAULT NULL,
  `develop_ideal` double DEFAULT NULL,
  `sum_expire` double DEFAULT NULL,
  `sum_ideal` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landuse_intensity_manager
-- ----------------------------
INSERT INTO `landuse_intensity_manager` VALUES ('1', 'a', 'b', null, null, null, null, null, null, null);
INSERT INTO `landuse_intensity_manager` VALUES ('2', 'd', 'c', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for land_kfq_type
-- ----------------------------
DROP TABLE IF EXISTS `land_kfq_type`;
CREATE TABLE `land_kfq_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `calc_name` varchar(50) DEFAULT NULL COMMENT 'the name of this calculation',
  `calc_date` date DEFAULT NULL COMMENT 'calculate date',
  `kfq_type` varchar(50) DEFAULT NULL COMMENT 'kfq type',
  `jcczzmj` double DEFAULT NULL COMMENT 'sum of builded area',
  `gkcczmj` double DEFAULT NULL COMMENT 'Mining and warehousing area',
  `zzzmj` double DEFAULT NULL COMMENT 'Residential Area',
  `gkcc_rate` double DEFAULT NULL COMMENT 'gkcczmj/jcczzmj',
  `zz_rate` double DEFAULT NULL COMMENT 'zzzmj/jcczzmj',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of land_kfq_type
-- ----------------------------
INSERT INTO `land_kfq_type` VALUES ('3', '海林2012', '2015-06-10', '工业主导型开发区', '110.89', '61.35', '7.49', '0.55', '0.07');
INSERT INTO `land_kfq_type` VALUES ('4', '宾西2012', '2015-06-10', '工业主导型开发区', '646.27', '476.47', '3.23', '0.74', '0.01');
INSERT INTO `land_kfq_type` VALUES ('5', '利民2013', '2015-06-13', '产城融合型开发区', '1274.68', '680.74', '226.32', '0.53', '0.18');
INSERT INTO `land_kfq_type` VALUES ('6', '宾西2013', '2015-06-16', '工业主导型开发区', '771.29', '548.92', '3.23', '0.71', '0');
INSERT INTO `land_kfq_type` VALUES ('7', '宾西2013', '2015-08-23', '工业主导型开发区', '771.29', '548.92', '3.23', '0.71', '0');
INSERT INTO `land_kfq_type` VALUES ('8', '宾西2013', '2015-08-24', '工业主导型开发区', '771.29', '548.92', '3.23', '0.71', '0');

-- ----------------------------
-- Table structure for law_regulation
-- ----------------------------
DROP TABLE IF EXISTS `law_regulation`;
CREATE TABLE `law_regulation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `law_type` varchar(30) DEFAULT NULL COMMENT 'lay type',
  `law_title` varchar(100) DEFAULT NULL COMMENT 'title',
  `publish_date` date DEFAULT NULL COMMENT 'date',
  `publish_dept` varchar(50) DEFAULT NULL COMMENT 'publish department',
  `description` varchar(300) DEFAULT NULL COMMENT 'law abstract',
  `law_content` text COMMENT 'law content',
  `law_editor` varchar(20) DEFAULT NULL COMMENT 'who edite this law',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of law_regulation
-- ----------------------------
INSERT INTO `law_regulation` VALUES ('1', '国土保护', '矿产保护', '2005-01-01', '国土资源部', '这是与矿产保护相关的法律', '法律规定，政府单位须定时监察矿产保护情况。	', '张东民', '9');
INSERT INTO `law_regulation` VALUES ('3', '土地管理', '《土地复垦条例实施办法》', null, '国土资源部', '　《土地复垦条例实施办法》已经2012年12月11日国土资源部第4次部务会议审议通过，现予以发布，自2013年3月1日起施行。\n　　部  长 徐绍史\n　　2012年12月27日\n', '　<strong>土地复垦条例实施办法</strong>\n<p align=\"center\">　　（2012年12月11日国土资源部第4次部务会议审议通过）</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第一章&nbsp; 总&nbsp; 则</strong></p>\n<p>　　</p>\n<p>　　第一条&nbsp; 为保证土地复垦的有效实施，根据《土地复垦条例》（以下简称条例），制定本办法。</p>\n<p>　　第二条&nbsp; 土地复垦应当综合考虑复垦后土地利用的社会效益、经济效益和生态效益。</p>\n<p>　　生产建设活动造成耕地损毁的，能够复垦为耕地的，应当优先复垦为耕地。</p>\n<p>　　第三条&nbsp; 县级以上国土资源主管部门应当明确专门机构并配备专职人员负责土地复垦监督管理工作。</p>\n<p>　　县级以上国土资源主管部门应当加强与发展改革、财政、城乡规划、铁路、交通、水利、环保、农业、林业等部门的协同配合和行业指导监督。</p>\n<p>　　上级国土资源主管部门应当加强对下级国土资源主管部门土地复垦工作的监督和指导。</p>\n<p>　　第四条&nbsp; \n除条例第六条规定外，开展土地复垦调查评价、编制土地复垦规划设计、确定土地复垦工程建设和造价、实施土地复垦工程质量控制、进行土地复垦评价等活动，也应当遵守有关国家标准和土地管理行业标准。</p>\n<p>　　省级国土资源主管部门可以结合本地实际情况，补充制定本行政区域内土地复垦工程建设和造价等标准。</p>\n<p>　　第五条&nbsp; \n县级以上国土资源主管部门应当建立土地复垦信息管理系统，利用国土资源综合监管平台，对土地复垦情况进行动态监测，及时收集、汇总、分析和发布本行政区域内土地损毁、土地复垦等数据信息。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第二章&nbsp; 生产建设活动损毁土地的复垦</strong></p>\n<p>　　</p>\n<p>　　第六条&nbsp; \n属于条例第十条规定的生产建设项目，土地复垦义务人应当在办理建设用地申请或者采矿权申请手续时，依据国土资源部《土地复垦方案编制规程》的要求，组织编制土地复垦方案，随有关报批材料报送有关国土资源主管部门审查。</p>\n<p>　　具体承担相应建设用地审查和采矿权审批的国土资源主管部门负责对土地复垦义务人报送的土地复垦方案进行审查。</p>\n<p>　　第七条&nbsp; \n条例施行前已经办理建设用地手续或者领取采矿许可证，条例施行后继续从事生产建设活动造成土地损毁的，土地复垦义务人应当在本办法实施之日起一年内完成土地复垦方案的补充编制工作，报有关国土资源主管部门审查。</p>\n<p>　　第八条&nbsp; 土地复垦方案分为土地复垦方案报告书和土地复垦方案报告表。</p>\n<p>　　依法由省级以上人民政府审批建设用地的建设项目，以及由省级以上国土资源主管部门审批登记的采矿项目，应当编制土地复垦方案报告书。其他项目可以编制土地复垦方案报告表。</p>\n<p>　　第九条&nbsp; 生产建设周期长、需要分阶段实施土地复垦的生产建设项目，土地复垦方案应当包含阶段土地复垦计划和年度实施计划。</p>\n<p>　　跨县（市、区）域的生产建设项目，应当在土地复垦方案中附具以县（市、区）为单位的土地复垦实施方案。</p>\n<p>　　阶段土地复垦计划和以县（市、区）为单位的土地复垦实施方案应当明确土地复垦的目标、任务、位置、主要措施、投资概算、工程规划设计等。</p>\n<p>　　第十条&nbsp; 有关国土资源主管部门受理土地复垦方案审查申请后，应当组织专家进行论证。</p>\n<p>　　根据论证所需专业知识结构，从土地复垦专家库中选取专家。专家与土地复垦方案申请人或者申请项目有利害关系的，应当主动要求回避。土地复垦方案申请人也可以向有关国土资源主管部门申请专家回避。</p>\n<p>　　土地复垦方案申请人或者相关利害关系人可以按照《政府信息公开条例》的规定，向有关国土资源主管部门申请查询专家意见。有关国土资源主管部门应当依法提供查询结果。</p>\n<p>　　第十一条&nbsp; 土地复垦方案经专家论证通过后，由有关国土资源主管部门进行最终审查。符合下列条件的，方可通过审查：</p>\n<p>　　（一）土地利用现状明确；</p>\n<p>　　（二）损毁土地的分析预测科学；</p>\n<p>　　（三）土地复垦目标、任务和利用方向合理，措施可行；</p>\n<p>　　（四）土地复垦费用测算合理，预存与使用计划清晰并符合本办法规定要求；</p>\n<p>　　（五）土地复垦计划安排科学、保障措施可行；</p>\n<p>　　（六）土地复垦方案已经征求意见并采纳合理建议。</p>\n<p>　　第十二条&nbsp; \n土地复垦方案通过审查的，有关国土资源主管部门应当向土地复垦义务人出具土地复垦方案审查意见书。土地复垦方案审查意见书应当包含本办法第十一条规定的有关内容。</p>\n<p>　　土地复垦方案未通过审查的，有关国土资源主管部门应当书面告知土地复垦义务人补正。逾期不补正的，不予办理建设用地或者采矿审批相关手续。</p>\n<p>　　第十三条&nbsp; \n土地复垦义务人因生产建设项目的用地位置、规模等发生变化，或者采矿项目发生扩大变更矿区范围等重大内容变化的，应当在三个月内对原土地复垦方案进行修改，报原审查的国土资源主管部门审查。</p>\n<p>　　第十四条&nbsp; 土地复垦义务人不按照本办法第七条、第十三条规定补充编制或者修改土地复垦方案的，依照条例第二十条规定处理。</p>\n<p>　　第十五条&nbsp; \n土地复垦义务人在实施土地复垦工程前，应当依据审查通过的土地复垦方案进行土地复垦规划设计，将土地复垦方案和土地复垦规划设计一并报所在地县级国土资源主管部门备案。</p>\n<p>　　第十六条&nbsp; \n土地复垦义务人应当按照条例第十五条规定的要求，与损毁土地所在地县级国土资源主管部门在双方约定的银行建立土地复垦费用专门账户，按照土地复垦方案确定的资金数额，在土地复垦费用专门账户中足额预存土地复垦费用。</p>\n<p>　　预存的土地复垦费用遵循“土地复垦义务人所有，国土资源主管部门监管，专户储存专款使用”的原则。</p>\n<p>　　第十七条&nbsp; \n土地复垦义务人应当与损毁土地所在地县级国土资源主管部门、银行共同签订土地复垦费用使用监管协议，按照本办法规定的原则明确土地复垦费用预存和使用的时间、数额、程序、条件和违约责任等。</p>\n<p>　　土地复垦费用使用监管协议对当事人具有法律效力。</p>\n<p>　　第十八条&nbsp; 土地复垦义务人应当在项目动工前一个月内预存土地复垦费用。</p>\n<p>　　土地复垦义务人按照本办法第七条规定补充编制土地复垦方案的，应当在土地复垦方案通过审查后一个月内预存土地复垦费用。</p>\n<p>　　土地复垦义务人按照本办法第十三条规定修改土地复垦方案后，已经预存的土地复垦费用不足的，应当在土地复垦方案通过审查后一个月内补齐差额费用。</p>\n<p>　　第十九条&nbsp; 土地复垦费用预存实行一次性预存和分期预存两种方式。</p>\n<p>　　生产建设周期在三年以下的项目，应当一次性全额预存土地复垦费用。</p>\n<p>　　生产建设周期在三年以上的项目，可以分期预存土地复垦费用，但第一次预存的数额不得少于土地复垦费用总金额的百分之二十。余额按照土地复垦方案确定的土地复垦费用预存计划预存，在生产建设活动结束前一年预存完毕。</p>\n<p>　　第二十条&nbsp; \n条例实施前，采矿生产项目按照有关规定向国土资源主管部门缴存的矿山地质环境治理恢复保证金中已经包含了土地复垦费用的，土地复垦义务人可以向所在地国土资源主管部门提出申请，经审核属实的，可以不再预存相应数额的土地复垦费用。</p>\n<p>　　第二十一条&nbsp; \n土地复垦义务人应当按照土地复垦方案确定的工作计划和土地复垦费用使用计划，向损毁土地所在地县级国土资源主管部门申请出具土地复垦费用支取通知书。县级国土资源主管部门应当在七日内出具土地复垦费用支取通知书。</p>\n<p>　　土地复垦义务人凭土地复垦费用支取通知书，从土地复垦费用专门账户中支取土地复垦费用，专项用于土地复垦。</p>\n<p>　　第二十二条&nbsp; \n土地复垦义务人应当按照条例第十七条规定于每年12月31日前向所在地县级国土资源主管部门报告当年土地复垦义务履行情况，包括下列内容：</p>\n<p>　　（一）年度土地损毁情况，包括土地损毁方式、地类、位置、权属、面积、程度等；</p>\n<p>　　（二）年度土地复垦费用预存、使用和管理等情况；</p>\n<p>　　（三）年度土地复垦实施情况，包括复垦地类、位置、面积、权属、主要复垦措施、工程量等；</p>\n<p>　　（四）国土资源主管部门规定的其他年度报告内容。</p>\n<p>　　县级国土资源主管部门应当加强对土地复垦义务人报告事项履行情况的监督核实，并可以根据情况将土地复垦义务履行情况年度报告在门户网站上公开。</p>\n<p>　　第二十三条&nbsp; \n县级国土资源主管部门应当加强对土地复垦义务人使用土地复垦费用的监督管理，发现有不按照规定使用土地复垦费用的，可以按照土地复垦费用使用监管协议的约定依法追究土地复垦义务人的违约责任。</p>\n<p>　　第二十四条&nbsp; 土地复垦义务人在生产建设活动中应当遵循“保护、预防和控制为主，生产建设与复垦相结合”的原则，采取下列预防控制措施：</p>\n<p>　　（一）对可能被损毁的耕地、林地、草地等，应当进行表土剥离，分层存放，分层回填，优先用于复垦土地的土壤改良。表土剥离厚度应当依据相关技术标准,根据实际情况确定。表土剥离应当在生产工艺和施工建设前进行或者同步进行；</p>\n<p>　　（二）露天采矿、烧制砖瓦、挖沙取土、采石，修建铁路、公路、水利工程等，应当合理确定取土的位置、范围、深度和堆放的位置、高度等；</p>\n<p>　　（三）地下采矿或者疏干抽排地下水等施工，对易造成地面塌陷或者地面沉降等特殊地段应当采取充填、设置保护支柱等工程技术方法以及限制、禁止开采地下水等措施；</p>\n<p>　　（四）禁止不按照规定排放废气、废水、废渣、粉灰、废油等。</p>\n<p>　　第二十五条&nbsp; \n土地复垦义务人应当对生产建设活动损毁土地的规模、程度和复垦过程中土地复垦工程质量、土地复垦效果等实施全程控制，并对验收合格后的复垦土地采取管护措施，保证土地复垦效果。</p>\n<p>　　第二十六条&nbsp; 土地复垦义务人依法转让采矿权或者土地使用权的，土地复垦义务同时转移。但原土地复垦义务人应当完成的土地复垦义务未履行完成的除外。</p>\n<p>　　原土地复垦义务人已经预存的土地复垦费用以及未履行完成的土地复垦义务，由原土地复垦义务人与新的土地复垦义务人在转让合同中约定。</p>\n<p>　　新的土地复垦义务人应当重新与损毁土地所在地国土资源主管部门、银行签订土地复垦费用使用监管协议。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第三章&nbsp; 历史遗留损毁土地和自然灾害损毁土地的复垦</strong></p>\n<p>　　</p>\n<p>　　第二十七条&nbsp; 历史遗留损毁土地和自然灾害损毁土地调查评价，应当包括下列内容：</p>\n<p>　　（一）损毁土地现状调查，包括地类、位置、面积、权属、损毁类型、损毁特征、损毁原因、损毁时间、污染情况、自然条件、社会经济条件等；</p>\n<p>　　（二）损毁土地复垦适宜性评价，包括损毁程度、复垦潜力、利用方向及生态环境影响等；</p>\n<p>　　（三）土地复垦效益分析，包括社会、经济、生态等效益。</p>\n<p>　　第二十八条&nbsp; 符合下列条件的土地，所在地的县级国土资源主管部门应当认定为历史遗留损毁土地：</p>\n<p>　　（一）土地复垦义务人灭失的生产建设活动损毁的土地；</p>\n<p>　　（二）《土地复垦规定》实施以前生产建设活动损毁的土地。</p>\n<p>　　第二十九条&nbsp; \n县级国土资源主管部门应当将历史遗留损毁土地认定结果予以公告，公告期间不少于三十日。土地复垦义务人对认定结果有异议的，可以向县级国土资源主管部门申请复核。</p>\n<p>　　县级国土资源主管部门应当自收到复核申请之日起三十日内做出答复。土地复垦义务人不服的，可以向上一级国土资源主管部门申请裁定。</p>\n<p>　　上一级国土资源主管部门发现县级国土资源主管部门做出的认定结果不符合规定的，可以责令县级国土资源主管部门重新认定。</p>\n<p>　　第三十条&nbsp; 土地复垦专项规划应当包括下列内容：</p>\n<p>　　（一）土地复垦潜力分析；</p>\n<p>　　（二）土地复垦的原则、目标、任务和计划安排；</p>\n<p>　　（三）土地复垦重点区域和复垦土地利用方向；</p>\n<p>　　（四）土地复垦项目的划定，复垦土地的利用布局和工程布局；</p>\n<p>　　（五）土地复垦资金的测算，资金筹措方式和资金安排；</p>\n<p>　　（六）预期经济、社会和生态等效益；</p>\n<p>　　（七）土地复垦的实施保障措施。</p>\n<p>　　土地复垦专项规划可以根据实际情况纳入土地整治规划。</p>\n<p>　　土地复垦专项规划的修改应当按照条例第二十二条的规定报本级人民政府批准。</p>\n<p>　　第三十一条&nbsp; 县级以上地方国土资源主管部门应当依据土地复垦专项规划制定土地复垦年度计划，分年度、有步骤地组织开展土地复垦工作。</p>\n<p>　　第三十二条&nbsp; 条例第二十三条规定的历史遗留损毁土地和自然灾害损毁土地的复垦资金来源包括下列资金：</p>\n<p>　　（一）土地复垦费；</p>\n<p>　　（二）耕地开垦费；</p>\n<p>　　（三）新增建设用地土地有偿使用费；</p>\n<p>　　（四）用于农业开发的土地出让收入;</p>\n<p>　　（五）可以用于土地复垦的耕地占用税地方留成部分；</p>\n<p>　　（六）其他可以用于土地复垦的资金。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第四章 土地复垦验收</strong></p>\n<p>　　</p>\n<p>　　第三十三条&nbsp; 土地复垦义务人完成土地复垦任务后，应当组织自查，向项目所在地县级国土资源主管部门提出验收书面申请，并提供下列材料：</p>\n<p>　　（一）验收调查报告及相关图件；</p>\n<p>　　（二）规划设计执行报告；</p>\n<p>　　（三）质量评估报告；</p>\n<p>　　（四）检测等其他报告。</p>\n<p>　　第三十四条&nbsp; 生产建设周期五年以上的项目，土地复垦义务人可以分阶段提出验收申请，负责组织验收的国土资源主管部门实行分级验收。</p>\n<p>　　阶段验收由项目所在地县级国土资源主管部门负责组织，总体验收由审查通过土地复垦方案的国土资源主管部门负责组织或者委托有关国土资源主管部门组织。</p>\n<p>　　第三十五条&nbsp; \n负责组织验收的国土资源主管部门应当会同同级农业、林业、环境保护等有关部门，组织邀请有关专家和农村集体经济组织代表，依据土地复垦方案、阶段土地复垦计划，对下列内容进行验收：</p>\n<p>　　（一）土地复垦计划目标与任务完成情况；</p>\n<p>　　（二）规划设计执行情况；</p>\n<p>　　（三）复垦工程质量和耕地质量等级；</p>\n<p>　　（四）土地权属管理、档案资料管理情况；</p>\n<p>　　（五）工程管护措施。</p>\n<p>　　第三十六条&nbsp; \n土地复垦阶段验收和总体验收形成初步验收结果后，负责组织验收的国土资源主管部门应当在项目所在地公告，听取相关权利人的意见。公告时间不少于三十日。</p>\n<p>　　相关土地权利人对验收结果有异议的，可以在公告期内向负责组织验收的国土资源主管部门书面提出。</p>\n<p>　　国土资源主管部门应当在接到书面异议之日起十五日内，会同同级农业、林业、环境保护等有关部门核查，形成核查结论反馈相关土地权利人。异议情况属实的，还应当向土地复垦义务人提出整改意见，限期整改。</p>\n<p>　　第三十七条&nbsp; \n土地复垦工程经阶段验收或者总体验收合格的，负责验收的国土资源主管部门应当依照条例第二十九条规定出具阶段或者总体验收合格确认书。验收合格确认书应当载明下列事项：</p>\n<p>　　（一）土地复垦工程概况；</p>\n<p>　　（二）损毁土地情况；</p>\n<p>　　（三）土地复垦完成情况；</p>\n<p>　　（四）土地复垦中存在的问题和整改建议、处理意见；</p>\n<p>　　（五）验收结论。</p>\n<p>　　第三十八条&nbsp; \n土地复垦义务人在申请新的建设用地、申请新的采矿许可证或者申请采矿许可证延续、变更、注销时，应当一并提供按照本办法规定到期完工土地复垦项目的验收合格确认书或者土地复垦费缴费凭据。未提供相关材料的，按照条例第二十条规定，有关国土资源主管部门不得通过审查和办理相关手续。</p>\n<p>　　第三十九条&nbsp; \n政府投资的土地复垦项目竣工后，由负责组织实施土地复垦项目的国土资源主管部门进行初步验收，验收程序和要求除依照本办法规定外，按照资金来源渠道及相应的项目管理办法执行。</p>\n<p>　　初步验收完成后，依照条例第三十条规定进行最终验收，并依照本办法第三十七条规定出具验收合格确认书。</p>\n<p>　　国土资源主管部门代复垦的项目竣工后，依照本条规定进行验收。</p>\n<p>　　第四十条&nbsp; \n土地权利人自行复垦或者社会投资进行复垦的土地复垦项目竣工后，由项目所在地县级国土资源主管部门进行验收，验收程序和要求依照本办法规定执行。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第五章 土地复垦激励措施</strong></p>\n<p>　　</p>\n<p>　　第四十一条&nbsp; \n土地复垦义务人将生产建设活动损毁的耕地、林地、牧草地等农用地复垦恢复为原用途的，可以依照条例第三十二条规定，凭验收合格确认书向所在地县级国土资源主管部门提出出具退还耕地占用税意见的申请。</p>\n<p>　　经审核属实的，县级国土资源主管部门应当在十五日内向土地复垦义务人出具意见。土地复垦义务人凭国土资源主管部门出具的意见向有关部门申请办理退还耕地占用税手续。</p>\n<p>　　第四十二条&nbsp; \n由社会投资将历史遗留损毁和自然灾害损毁土地复垦为耕地的，除依照条例第三十三条规定办理外，对属于将非耕地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，可以作为本省、自治区、直辖市的补充耕地指标，市、县政府可以出资购买指标。</p>\n<p>　　第四十三条&nbsp; \n由县级以上地方人民政府投资将历史遗留损毁和自然灾害损毁的建设用地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，依照条例第三十五条规定可以作为本省、自治区、直辖市的补充耕地指标。但使用新增建设用地有偿使用费复垦的耕地除外。</p>\n<p>　　属于农民集体所有的土地，复垦后应当交给农民集体使用。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第六章 土地复垦监督管理</strong></p>\n<p>　　</p>\n<p>　　第四十四条&nbsp; \n县级以上国土资源主管部门应当采取年度检查、专项核查、例行稽查、在线监管等形式，对本行政区域内的土地复垦活动进行监督检查，并可以采取下列措施：</p>\n<p>　　（一）要求被检查当事人如实反映情况和提供相关的文件、资料和电子数据；</p>\n<p>　　（二）要求被检查当事人就土地复垦有关问题做出说明；</p>\n<p>　　（三）进入土地复垦现场进行勘查；</p>\n<p>　　（四）责令被检查当事人停止违反条例的行为。</p>\n<p>　　第四十五条&nbsp; \n县级以上国土资源主管部门应当在门户网站上及时向社会公开本行政区域内的土地复垦管理规定、技术标准、土地复垦规划、土地复垦项目安排计划以及土地复垦方案审查结果、土地复垦工程验收结果等重大事项。</p>\n<p>　　第四十六条&nbsp; 县级以上地方国土资源主管部门应当通过国土资源主干网等按年度将本行政区域内的土地损毁情况、土地复垦工作开展情况等逐级上报。</p>\n<p>　　上级国土资源主管部门对下级国土资源主管部门落实土地复垦法律法规情况、土地复垦义务履行情况、土地复垦效果等进行绩效评价。</p>\n<p>　　第四十七条&nbsp; \n县级以上国土资源主管部门应当对土地复垦档案实行专门管理，将土地复垦方案、土地复垦资金使用监管协议、土地复垦验收有关材料和土地复垦项目计划书、土地复垦实施情况报告等资料和电子数据进行档案存储与管理。</p>\n<p>　　第四十八条&nbsp; 复垦后的土地权属和用途发生变更的，应当依法办理土地登记相关手续。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第七章 法律责任</strong></p>\n<p>　　</p>\n<p>　　第四十九条&nbsp; 条例第三十六条第六项规定的其他徇私舞弊、滥用职权、玩忽职守行为，包括下列行为：</p>\n<p>　　（一）违反本办法第二十一条规定，对不符合规定条件的土地复垦义务人出具土地复垦费用支取通知书，或者对符合规定条件的土地复垦义务人无正当理由未在规定期限内出具土地复垦费用支取通知书的；</p>\n<p>　　（二）违反本办法第四十一条规定，对不符合规定条件的申请人出具退还耕地占用税的意见，或者对符合规定条件的申请人无正当理由未在规定期限内出具退还耕地占用税的意见的；</p>\n<p>　　（三）其他违反条例和本办法规定的行为。</p>\n<p>　　第五十条&nbsp; \n土地复垦义务人未按照本办法第十五条规定将土地复垦方案、土地复垦规划设计报所在地县级国土资源主管部门备案的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p>\n<p>　　第五十一条&nbsp; \n土地复垦义务人未按照本办法第十六条、第十七条、第十八条、第十九条规定预存土地复垦费用的，由县级以上国土资源主管部门责令限期改正；逾期不改正的，依照条例第三十八条规定处罚。</p>\n<p>　　第五十二条&nbsp; \n土地复垦义务人未按照本办法第二十五条规定开展土地复垦质量控制和采取管护措施的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第八章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 附&nbsp; 则</strong></p>\n<p>　　</p>\n<p>　　第五十三条&nbsp; 铀矿等放射性采矿项目的土地复垦具体办法，由国土资源部另行制定。</p>\n<p>　　第五十四条&nbsp; 本办法自2013年3月1日起施行。</p>', 'test', '4');
INSERT INTO `law_regulation` VALUES ('5', '土地管理', '土地权属争议调查处理办法', null, '国土资源部', '', '<div style=\"text-align: center;\">​<strong>中华人民共和国国土资源部令第49号&nbsp;</strong></div><div class=\"Custom_UnionStyle\">\n\n<p align=\"justify\">　　《国土资源部关于修改部分规章的决定》，已经2010年11月29日国土资源部第6次部务会审议通过，现予发布，自发布之日起施行。&nbsp;</p>\n<p align=\"right\">　　部长&nbsp;&nbsp;徐绍史&nbsp;</p>\n<p align=\"right\">　　二〇一〇年十一月三十日&nbsp;</p>\n<p align=\"center\">　<strong>　土地权属争议调查处理办法&nbsp;</strong></p>\n<p align=\"justify\">　　（2003年1月3日中华人民共和国国土资源部令第17号公布，根据2010年11月30日《国土资源部关于修改部分规章的决定》（国土资源部令第49号）修正，将第二十条的“征用”改为&nbsp;“征收”。）&nbsp;</p>\n<p align=\"justify\">　　第一条&nbsp;&nbsp;为依法、公正、及时地做好土地权属争议的调查处理工作，保护当事人的合法权益，维护土地的社会主义公有制，根据《中华人民共和国土地管理法》，制定本办法。&nbsp;</p>\n<p align=\"justify\">　　第二条&nbsp;&nbsp;本办法所称土地权属争议，是指土地所有权或使用权归属争议。&nbsp;</p>\n<p align=\"justify\">　　第三条&nbsp;&nbsp;调查处理土地权属争议，应当以法律、法规和土地管理规章为依据。从实际出发，尊重历史，面对现实。&nbsp;</p>\n<p align=\"justify\">　　第四条&nbsp;&nbsp;县级以上国土资源行政主管部门负责土地权属争议案件（以下简称争议案件）的调查和调解工作；对需要依法作出处理决定的，拟定处理意见，报同级人民政府作出处理决定。&nbsp;</p>\n<p align=\"justify\">　　县级以上国土资源行政主管部门可以指定专门机构或者人员负责办理争议案件有关事宜。&nbsp;</p>\n<p align=\"justify\">　　第五条&nbsp;&nbsp;个人之间、个人与单位、单位与单位之间发生的争议案件，由争议土地所在地的县级国土资源行政主管部门调查处理。&nbsp;</p>\n<p align=\"justify\">　　前款规定的个人之间、个人与单位、单位与单位之间发生的争议案件，可以根据当事人的申请，由乡级人民政府受理和处理。&nbsp;</p>\n<p align=\"justify\">　　第六条&nbsp;&nbsp;设区的市、自治州国土资源行政主管部门调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）跨县级行政区域的；&nbsp;</p>\n<p align=\"justify\">　　（二）同级人民政府、上级国土资源部门交办或者其他部门转送的。&nbsp;</p>\n<p align=\"justify\">　　第七条&nbsp;&nbsp;省、自治区、直辖市国土资源行政主管部门调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）跨设区的市、自治州行政区域的；&nbsp;</p>\n<p align=\"justify\">　　（二）争议一方为中央国家机关或者其直属单位，且涉及土地面积较大的；&nbsp;</p>\n<p align=\"justify\">　　（三）争议一方为军队，且涉及土地面积较大的；&nbsp;</p>\n<p align=\"justify\">　　（四）在本行政区域内有较大影响的；&nbsp;</p>\n<p align=\"justify\">　　（五）同级人民政府、国土资源部交办或者其他部门转送的。&nbsp;</p>\n<p align=\"justify\">　　第八条&nbsp;&nbsp;国土资源部调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）国务院交办的；&nbsp;</p>\n<p align=\"justify\">　　（二）在全国范围内有重大影响的。&nbsp;</p>\n<p align=\"justify\">　　第九条&nbsp;当事人发生土地权属争议，经协商不能解决的；可以依法向县级以上人民政府或者乡级人民政府提出处理申请，也可以依照本办法第五、六、七、八条的规定，向有关的国土资源行政主管部门提出调查处理申请。&nbsp;</p>\n<p align=\"justify\">　　第十条&nbsp;申请调查处理土地权属争议的，应当符合下列条件：&nbsp;</p>\n<p align=\"justify\">　　（一）申请人与争议的土地有直接利害关系；&nbsp;</p>\n<p align=\"justify\">　　（二）有明确的请求处理对象、具体的处理请求和事实根据。&nbsp;</p>\n<p align=\"justify\">　　第十一条&nbsp;&nbsp;&nbsp;申请调查处理土地权属争议的，应当提交书面申请书和有关证据材料，并按照被申请人数提交副本。&nbsp;</p>\n<p align=\"justify\">　　申请书应当载明以下事项：&nbsp;</p>\n<p align=\"justify\">　　（一）申请人和被申请人的姓名或者名称、地址、邮政编码、法定代表人姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）请求的事项、事实和理由；&nbsp;</p>\n<p align=\"justify\">　　（三）证人的姓名、工作单位、住址、邮政编码。&nbsp;</p>\n<p align=\"justify\">　　第十二条当事人可以委托代理人代为申请土地权属争议的调查处理。委托代理人申请的，应当提交授权委托书。授权委托书应当写明委托事项和权限。&nbsp;</p>\n<p align=\"justify\">　　第十三条&nbsp;对申请人提出的土地权属争议的申请，国土資源行政主管部门应当依照本办法第十条的规定进行审查，并在收到申请书之日起7个工作日内提出是否受理的意见。&nbsp;</p>\n<p align=\"justify\">　　认为应当受理的，在决定受理之日起5个工作日内将申请书副本发送被申请人。被申请人应当在接到申请书副本之日起30日内提交答辩书和有关证据材料。逾期不提交答辩书的，不影响案件的处理。&nbsp;</p>\n<p align=\"justify\">　　认为不应当受理的，应当及时拟定不予受理建议书，报同级人民政府作出不予受理决定。&nbsp;</p>\n<p align=\"justify\">　　当事人对不予受理决定不服的，可以依法申请行政复议或者提起行政诉讼。&nbsp;</p>\n<p align=\"justify\">　　同级人民政府、上级国土资源行政主管部门交办或者其他部门转办的争议案件，按照本条有关规定审查处理。&nbsp;</p>\n<p align=\"justify\">　　第十四条&nbsp;下列案件不作为争议案件受理：&nbsp;</p>\n<p align=\"justify\">　　（一）土地侵权案件；&nbsp;</p>\n<p align=\"justify\">　　（二）行政区域边界争议案件；&nbsp;</p>\n<p align=\"justify\">　　（三）土地违法案件；&nbsp;</p>\n<p align=\"justify\">　　（四）农村土地承包经营权争议案件；&nbsp;</p>\n<p align=\"justify\">　　（五）其他不作为土地权属争议的案件。&nbsp;</p>\n<p align=\"justify\">　　第十五条&nbsp;国土资源行政主管部门决定受理后，应当及时指定承办人，对当事人争议的事实情况进行调查。&nbsp;</p>\n<p align=\"justify\">　　第十六条&nbsp;&nbsp;承办人与争议案件有利害关系的，应当申请回避；&nbsp;</p>\n<p align=\"justify\">　　当事人认为承办人与争议案件有利害关系的有权请求该承办人回避。承办人是否回避，由受理案件的国土资源行政主管部门决定。&nbsp;</p>\n<p align=\"justify\">　　第十七条&nbsp;承办人在调查处理土地权属争议过程中，可以向有关单位或者个人调查取证。被调查的单位或者个人应当协助，并如实提供有关证明材料。&nbsp;</p>\n<p align=\"justify\">　　第十八条&nbsp;&nbsp;在调查处理土地权属争议过程中，国土资源行政主管部门认为有必要对争议的土地进行实地调查的，应当通知当事人及有关人员到现现场。必要时，可以邀请有关部门派人协助调查。&nbsp;</p>\n<p align=\"justify\">　　第十九条&nbsp;土地权属争议双方当事人对各自提出的事实和理由负有举证责任，应当及时向负责调查处理的国土资源行政主管部门提供有关证据材料。&nbsp;</p>\n<p align=\"justify\">　　第二十条&nbsp;国土资源行政主管部门在调查处理争议案件时，应当审查双方当事人提供的有关证据材料：&nbsp;</p>\n<p align=\"justify\">　　（一）人民政府颁发的确定土地权属的凭证；&nbsp;</p>\n<p align=\"justify\">　　（二）人民政府或者主管部门批准征收、划拨、出让或者以其他方式批准使用土地的文件；&nbsp;</p>\n<p align=\"justify\">　　（三）争议双方当事人依法达成的书面协议；&nbsp;</p>\n<p align=\"justify\">　　（四）人民政府或者司法机关处理争议的文件或者附图；&nbsp;</p>\n<p align=\"justify\">　　（五）其他有关证明文件。&nbsp;</p>\n<p align=\"justify\">　　第二十一条&nbsp;对当事人提供的证据材料，国土资源行政主管部门应当查证属实，方可作为认定事实的依据。&nbsp;</p>\n<p align=\"justify\">　　第二十二条&nbsp;在土地所有权和使用权争议解决之前，任何一方不得改变土地利用的现状。&nbsp;</p>\n<p align=\"justify\">　　第二十三条&nbsp;国土资源行政主管部门对受理的争议案件，应当在查清事实、分清权属关系的基础上先行调解，促使当事人以协商方式达成协议。调解应当坚持自愿、合法的原则。&nbsp;</p>\n<p align=\"justify\">　　第二十四条&nbsp;调解达成协议的，应当制作调解书。调解书应当载明以下内容：&nbsp;</p>\n<p align=\"justify\">　　（一）当事人的姓名或者名称、法定代表人姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）争议的主要事实；&nbsp;</p>\n<p align=\"justify\">　　（三）协议内容及其他有关事项。&nbsp;</p>\n<p align=\"justify\">　　第二十五条&nbsp;调解书经双方当事人签名或者盖章，由承办人署名并加盖国土资源行政主管部门的印章后生效的调解书具有法律效力，使土地登记的依据。&nbsp;</p>\n<p align=\"justify\">　　第二十六条&nbsp;国土资源行政主管部门应当在调解书生效之日起15日内，依照民事诉讼法的有关规定，将调解书送达当事人，并同时报上级国土资源行政主管部门。&nbsp;</p>\n<p align=\"justify\">　　第二十七条调解未达成协议的，国土资源行政主管部门应当及时提出调查处理意见，报同级人民政府作出处理决定。&nbsp;</p>\n<p align=\"justify\">　　第二十八条国土资源行政主管部门应当自受理土地权属争议之日起6个月内提出调查处理意见。因情况复杂，在规定时间内不能提出调查处理意见的，经该国土资源行政主管部门负责人批准，可以适当延长。&nbsp;</p>\n<p align=\"justify\">　　第二十九条&nbsp;调查处理意见应当包括以下内容：&nbsp;</p>\n<p align=\"justify\">　　（一）当事人的姓名或者名称、地址、法定代表人的姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）争议的事实和理由和要求；&nbsp;</p>\n<p align=\"justify\">　　（三）认定的事实和适用的法律、法规等依据；&nbsp;</p>\n<p align=\"justify\">　　（四）拟定的处理结论。&nbsp;</p>\n<p align=\"justify\">　　第三十条&nbsp;国土资源行政主管部门提出调查处理意见后，应当在5个工作日内报同级人民政府，由人民政府下达处理决定。&nbsp;</p>\n<p align=\"justify\">　　国土资源行政主管部门的调查处理意见在报同级人民政府的同时，报上一级国土资源行政主管部门。&nbsp;</p>\n<p align=\"justify\">　　第三十一条&nbsp;&nbsp;当事人对人民政府作出的处理决定不服的，可以依法行申请政复议或者提起行政诉讼。&nbsp;</p>\n<p align=\"justify\">　　在规定的时间内，当事人既不申请政复议，也不提起行政诉讼，处理决定即发生法律效力。生效的处理决定是土地登记的依据。&nbsp;</p>\n<p align=\"justify\">　　第三十二条&nbsp;在土地权属争议调查处理过程中，国土资源行政主管部门的工作人员玩忽职守、滥用职权、徇斯舞弊，构成犯罪的，依法追究刑事责任；不构成犯罪的，由其所在单位或者上级机关依法给予行政处分。&nbsp;</p>\n<p align=\"justify\">　　第三十三条&nbsp;乡级人民政府处理土地权属争议参照本办法执行。&nbsp;</p>\n<p align=\"justify\">　　第三十四条&nbsp;调查处理争议案件的文书格式，由国土资源部统一制定。&nbsp;</p>\n<p align=\"justify\">　　第三十五条&nbsp;调查处理争议案件的费用，依照国家有关规定执行。&nbsp;</p>\n<p align=\"justify\">　　第三十六条&nbsp;本办法自2003年3月1日起施行。1995年12月18日原国家土地管理局发布的&lt;土地权属争议处理暂行办法&gt;同时废止。&nbsp;</p></div>', 'test', '0');
INSERT INTO `law_regulation` VALUES ('6', '相关法律', '地质灾害治理工程监理单位资质管理办法', null, '国土资源部', '', '<span style=\"font-size: 12pt; line-height: 1.5; font-family: 宋体; color: rgb(45, 45, 45);\">（2005年5月20日中华人民共和国国土资源部令第31号公布&nbsp; 根据2015年5月6日国土资源部第2次部务会议《国土资源部关于修改〈地质灾害危险性评估单位资质管理办法〉等5部规章的决定》修正）</span><div class=\"txtCon\" style=\"border: 0px; margin: auto; padding: 15px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\"><div class=\"TRS_Editor\" style=\"border: 0px; margin: auto; padding: 0px; font-family: 宋体; font-size: 12pt;\"><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第一章&nbsp; 总&nbsp;&nbsp; 则</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第一条&nbsp; 为保证地质灾害治理工程质量，控制治理工程工期，充分发挥治理工程投资效益，加强对治理工程监理单位的资质管理，根据《地质灾害防治条例》，制定本办法。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二条&nbsp; 在中华人民共和国境内申请地质灾害治理工程监理单位资质，实施对地质灾害治理工程监理单位资质管理，适用本办法。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第三条&nbsp; 从事地质灾害治理工程监理活动的单位，应当在取得相应等级的资质证书后，在其资质证书许可的范围内从事地质灾害治理工程监理活动。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第四条&nbsp; 地质灾害治理工程监理单位资质分为甲、乙、丙三个等级。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　国土资源部负责甲级地质灾害治理工程监理单位资质的审批和管理。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　省、自治区、直辖市国土资源管理部门负责乙级和丙级地质灾害治理工程监理单位资质的审批和管理。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二章&nbsp; 资质等级和业务范围</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第五条&nbsp; 地质灾害治理工程监理单位资质分级标准如下：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（一）甲级资质</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　1．地质灾害治理工程监理技术人员总数不少于三十人，其中具有水文地质、工程地质、环境地质、岩土工程、工程预算等专业技术人员不少于二十人；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　2．近三年内独立承担过五项以上中型地质灾害治理工程的监理项目，有优良的工作业绩。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（二）乙级资质</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　1．地质灾害治理工程监理技术人员总数不少于二十人，其中具有水文地质、工程地质、环境地质、岩土工程、工程预算等专业技术人员不少于十人；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　2．近三年内独立承担过五项以上小型地质灾害治理工程的监理项目，有良好的工作业绩。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（三）丙级资质</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　地质灾害治理工程监理技术人员总数不少于十人，其中具有水文地质、工程地质、环境地质、岩土工程、工程预算等专业技术人员不少于五人。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第六条&nbsp; 除本办法第五条规定的资质条件外，申请地质灾害治理工程监理资质的单位，还应当同时具备以下条件：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（一）具有独立的法人资格；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（二）具有健全的安全和质量管理监控体系，近五年内未发生过重大安全、质量事故；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（三）技术人员中外聘人员的数量不超过百分之十。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第七条&nbsp; 同一资质单位不能同时持有地质灾害治理工程监理资质和地质灾害治理工程施工资质。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第八条&nbsp; 甲级地质灾害治理工程监理资质单位，可以承揽大、中、小型地质灾害治理工程的监理业务。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　乙级地质灾害治理工程监理资质单位，可以承揽中、小型地质灾害治理工程的监理业务。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　丙级地质灾害治理工程监理资质单位，可以承揽小型地质灾害治理工程的监理业务。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第三章&nbsp; 审批和管理</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第九条&nbsp; 地质灾害治理工程监理单位资质的审批机关为国土资源部和省、自治区、直辖市国土资源管理部门。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　地质灾害治理工程监理单位资质申请的具体受理时间，由审批机关确定并公告。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十条&nbsp; 申请地质灾害治理工程监理资质的单位，应当在公告确定的受理时限内向审批机关提出申请，并提交以下材料：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（一）资质申请表；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（二）法人资格证明或者有关部门登记的证明文件；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（三）法定代表人和主要技术负责人任命或者聘任文件；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（四）当年在职人员的统计表、中级职称以上工程技术和经济管理人员名单、身份证明、职称证明；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（五）承担过的主要地质灾害治理工程监理项目有关证明材料，包括任务书、委托书、合同，工程管理部门验收意见；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（六）单位主要监理设备清单；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（七）质量管理体系的有关材料；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　（八）近五年内无质量事故证明。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　上述材料应当一式三份，并附电子文档一份。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　资质申请表可以从国土资源部门户网站上下载。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十一条&nbsp; 申请地质灾害治理工程监理资质的单位，应当如实提供有关材料，并对申请材料的真实性负责。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　资质单位在申请资质时弄虚作假的，资质证书自始无效。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十二条&nbsp; 申请甲级地质灾害治理工程监理单位资质的，向国土资源部申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　申请乙级和丙级地质灾害治理工程监理单位资质的，向单位所在地的省、自治区、直辖市国土资源管理部门申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十三条&nbsp; 审批机关应当自受理资质申请之日起二十日内完成审批工作。逾期不能完成的，经审批机关负责人批准，可以延长十日。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十四条&nbsp; 审批机关受理资质申请材料后，应当组织专家进行评审，专家评审所需时间不计算在审批时限内。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　对经过评审后拟批准的资质单位，应当在媒体上进行公示。公示时间不得少于七日。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　公示期满，对公示无异议的，审批机关应当予以审批，并颁发资质证书；对公示有异议的，审批机关应当对其申请材料予以复核。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　审批机关应当将审批结果在媒体上予以公告。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　省、自治区、直辖市国土资源管理部门审批的乙级和丙级资质，应当在批准后的六十日内报国土资源部备案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十五条&nbsp; 地质灾害治理工程监理单位资质证书分为正本和副本，正本和副本具有同等的法律效力。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　地质灾害治理工程监理单位资质证书，由国土资源部统一监制。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十六条 地质灾害治理工程监理单位资质证书有效期为三年。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　有效期届满需要继续从业的，应当在资质证书有效期届满前三个月内，向原审批机关提出延续申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　审批机关应当对申请延续的资质单位的从业活动进行审核。符合原资质等级条件的，由审批机关换发新的监理资质证书，有效期从换发之日起计算。经审核，不符合原定资质条件的，不予办理延续手续。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　符合上一级资质等级条件的资质单位，可以在获得资质证书两年后或者在申请延续的同时申请升级。符合本办法规定的资质条件的，审批机关应当重新审批，并颁发相应的资质证书。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十七条&nbsp; 资质单位遗失资质证书的，在媒体上声明后，方可申请补领。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十八条&nbsp; 资质单位发生合并或者分立的，应当及时到原审批机关办理资质证书注销手续。需要继续从业的，重新申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第十九条&nbsp; 资质单位名称、地址、法定代表人、技术负责人等事项发生变更的，应当在变更后三十日内，到原审批机关办理资质证书变更手续。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十条&nbsp; 资质单位破产、歇业或者因其他原因终止业务活动的，应当在办理营业执照注销手续后十五日内，到原审批机关办理资质证书注销手续。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第四章&nbsp; 监督管理</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十一条&nbsp; 县级以上国土资源管理部门负责对本行政区域内的地质灾害治理工程监理活动进行监督检查。被检查的单位应当配合，并如实提供相关材料。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十二条　地质灾害治理工程监理资质单位，应当建立监理业务手册，如实记载其工作业绩和存在的主要问题。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十三条&nbsp; 地质灾害治理工程监理资质单位，应当建立严格的技术成果和资质图章管理制度。资质证书的类别和等级编号，应当在地质灾害治理工程的有关监理技术文件上注明。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十四条&nbsp; 资质单位的技术负责人或者其他技术人员应当定期参加地质灾害治理工程监理业务培训。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十五条&nbsp; 地质灾害治理工程监理资质单位，对承担的监理项目，应当在监理合同签订后十日内，到工程所在地县级国土资源管理部门备案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　监理项目跨行政区域的，向项目所跨行政区域共同的上一级国土资源管理部门备案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第五章 法律责任</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十六条&nbsp; 资质单位不按照本办法第十八条、第十九条和第二十条的规定及时办理资质证书变更、注销手续的，由县级以上国土资源管理部门责令限期改正；逾期不改的，可以处五千元以下罚款。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十七条&nbsp; 资质单位不按照本办法第二十五条的规定进行备案的，由县级以上国土资源管理部门责令限期改正；逾期不改的，可以处一万元以下罚款。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十八条&nbsp; 县级以上国土资源管理部门在地质灾害治理工程监理单位资质审批及管理过程中徇私舞弊、玩忽职守、滥用职权，对直接负责的主管人员和其他直接责任人员依法给予行政处分；构成犯罪的，依法追究刑事责任。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第六章&nbsp; 附 则</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第二十九条&nbsp; 本办法实施前已经取得地质灾害防治工程监理资质证书的单位，应当于本办法实施后六个月内，依照本办法的规定到审批机关申请领取新的资质证书。逾期不申领的，原资质证书一律无效。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第三十条&nbsp; 本办法中的地质灾害治理工程及其分级标准，依照《地质灾害治理工程勘查设计施工单位资质管理办法》的有关规定执行。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-size: 12pt; line-height: 1.5;\">　　第三十一条&nbsp; 本办法自2005年7月1日起施行。</p></div></div><div class=\"txtCon\" style=\"border: 0px; margin: auto; padding: 15px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\"><ul style=\"border: 0px; margin: 0px; padding: 0px; font-size: 12px; list-style-type: none;\"><li><span style=\"font-size: 14px;\">附件：</span></li><li>　　　　</li></ul></div>', '张清泉', '0');
INSERT INTO `law_regulation` VALUES ('7', '综合管理', '地质环境监测管理办法', null, '国土资源部', '', '<strong style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 16px; line-height: 2;\">　（2014年4月29日国土资源部令第59号）</strong><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第一条</strong>&nbsp;为了加强地质环境监测管理，规范地质环境监测行为，保护人民生命和财产安全，根据《中华人民共和国矿产资源法》、《地质灾害防治条例》等有关法律法规，制定本办法。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二条</strong>&nbsp;本办法所称地质环境监测，是指对自然地质环境或者工程建设影响的地质环境及其变化，进行定期观察测量、采样测试、记录计算、分析评价和预警预报的活动。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第三条</strong>&nbsp;下列地质环境监测活动及其监督管理适用本办法：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（一）地质灾害监测；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（二）地下水地质环境监测；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（三）矿山地质环境监测；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（四）地质遗迹监测；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（五）其他相关地质环境监测。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第四条</strong>&nbsp;地质环境监测坚持政府主导、分级负责、科学规划、群专结合的原则。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第五条</strong>&nbsp;自然地质环境监测由县级以上人民政府国土资源主管部门负责组织实施；工程建设影响的地质环境监测由相关责任单位负责组织实施。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第六条</strong>&nbsp;国土资源部负责全国地质环境监测管理工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上地方人民政府国土资源主管部门负责本行政区域内的地质环境监测管理工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第七条</strong>&nbsp;县级以上人民政府国土资源主管部门应当将地质环境监测网络建设、运行、维护等所需经费纳入年度预算，保障地质环境监测工作的顺利开展。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第八条</strong>&nbsp;国家鼓励和支持地质环境监测科学研究、技术创新与国际合作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　对在地质环境监测工作中作出突出贡献的单位和个人，由县级以上人民政府国土资源主管部门给予奖励。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第九条</strong>&nbsp;县级以上人民政府国土资源主管部门应当编制地质环境监测规划。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　国土资源部负责组织编制全国地质环境监测规划。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上地方人民政府国土资源主管部门依据上级地质环境监测规划，结合本地区实际，组织编制本行政区域内的地质环境监测规划，并报同级人民政府和上一级人民政府国土资源主管部门备案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十条</strong>&nbsp;地质环境监测规划应当包括地质环境监测现状、需求分析、规划目标、规划原则、监测网络布局、重点监测工程、经费预算和规划实施的保障措施等内容。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十一条</strong>&nbsp;地质环境监测规划应当符合国民经济和社会发展规划，并与其他相关规划相互衔接。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十二条</strong>&nbsp;国土资源部所属地质环境监测机构，承担国家地质环境监测工作，统筹规划和组织建设全国地质环境监测网络，开展全国地质环境状况分析评价和预警预报，对全国地质环境监测工作进行技术指导。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上地方人民政府国土资源主管部门所属地质环境监测机构，承担本行政区域内的地质环境监测工作，并接受上级人民政府国土资源主管部门所属地质环境监测机构的技术指导。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十三条</strong>&nbsp;地质环境监测机构应当具备与其所承担的地质环境监测工作相适应的能力和条件，达到国土资源部制定的地质环境监测机构建设标准。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　各级国土资源主管部门应当对从事地质环境监测活动的技术人员进行岗位培训。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十四条</strong>&nbsp;地质环境监测机构及其工作人员从事地质环境监测活动应当遵守国家和行业有关地质环境监测技术规范。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　国土资源部负责制定国家和行业有关地质环境监测技术规范。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　省、自治区、直辖市人民政府国土资源主管部门可以根据本地区实际，依据国家和行业有关地质环境监测技术规范，制定本行政区域内的地质环境监测技术规范。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十五条</strong>&nbsp;因工程建设活动对地质环境造成影响的，相关责任单位应当委托具备能力的地质环境监测机构开展相应的地质环境监测工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十六条</strong>&nbsp;地质环境监测网络由地质环境监测点、地质环境监测站和地质环境监测信息系统组成。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上人民政府国土资源主管部门应当依据地质环境监测规划和技术规范组织建设地质环境监测网络。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十七条</strong>&nbsp;地质环境监测点是获取地质环境监测数据的工作位置。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测点的设置，应当依据地质环境监测规划，充分考虑地质环境条件和经济社会发展需求。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十八条</strong>&nbsp;地质环境监测站是为获取地质环境监测数据，在地质环境监测点建立的配置基础设施和相关设备的场所。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测站的建设、运行和维护，应当符合布局合理、技术先进、运行稳定、维护方便、经济适用的要求。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测站建设、运行和维护的标准由国土资源部制定。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第十九条</strong>&nbsp;地质环境监测信息系统是由信息网络与数据处理设施、设备等组成，实现地质环境监测数据采集、传输、管理现代化功能的综合系统。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测信息系统的建设、运行和维护，应当符合数据准确、传输及时、存储安全、管理高效、保障有力的要求。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测信息系统建设、运行和维护的标准由国土资源部制定。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十条</strong>&nbsp;国家保护地质环境监测设施。县级以上地方人民政府国土资源主管部门负责本行政区域内的地质环境监测设施保护工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测设施应当按照国土资源部要求统一标识。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　负责运行维护的地质环境监测机构对地质环境监测设施进行登记、造册，并及时将运行维护情况报送设施所在地的县级人民政府国土资源主管部门备案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　任何单位和个人不得侵占、损坏或者擅自移动地质环境监测设施，不得妨碍地质环境监测设施的正常使用。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十一条</strong>&nbsp;地质环境监测设施损坏的，负责运行维护的地质环境监测机构或者相关责任单位应当及时维修，确保其正常运行。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十二条</strong>&nbsp;因工程建设等原因确需拆除或者移动地质环境监测设施的，工程建设单位应当在项目可行性研究阶段向项目所在地的县级人民政府国土资源主管部门提出申请，由项目所在地的县级人民政府国土资源主管部门征得组织建设地质环境监测设施的国土资源主管部门同意后，进行拆除或者移动地质环境监测设施。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　拆除或者移动地质环境监测设施的费用由工程建设单位承担。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十三条</strong>&nbsp;县级以上人民政府国土资源主管部门应当建立地质环境监测信息发布制度，统一发布本行政区域内的地质环境监测信息，及时公布地质环境预警预报信息。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上人民政府国土资源主管部门在公开地质环境监测信息前，应当依照《中华人民共和国保守国家秘密法》、《中华人民共和国政府信息公开条例》等法律法规和国家有关规定对拟公开的地质环境监测信息进行审查。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十四条</strong>&nbsp;县级以上人民政府国土资源主管部门应当建立地质环境预警预报制度。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测机构发现地质环境显著变化或者监测数据异常的，应当分析原因和可能产生的影响，及时向监测区所在地的县级人民政府国土资源主管部门报告。县级人民政府国土资源主管部门接到报告后，应当立即组织应急调查，向同级人民政府提出采取相关措施的建议；依照有关规定发布地质环境预警预报信息，并报告上级人民政府国土资源主管部门。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十五条</strong>&nbsp;地质环境监测机构依据本办法取得的地质环境监测资料，应当依照《地质资料管理条例》等有关规定报送监测区所在地的县级地方人民政府国土资源主管部门，并由其逐级报送国土资源部。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　县级以上人民政府国土资源主管部门负责对地质环境监测资料进行汇总和分析。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　地质环境监测机构应当对地质环境监测数据的真实性和准确性负责。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十六条</strong>&nbsp;国家鼓励地质环境监测机构对取得的地质环境监测资料进行加工处理和应用性开发。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　因政府决策、防灾减灾或者公共安全等公共利益需要，政府及其有关主管部门可以无偿使用地质环境监测资料。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十七条</strong>&nbsp;县级以上人民政府国土资源主管部门应当建立地质环境监测监督检查制度，负责对地质环境监测规划编制和实施、地质环境监测机构能力建设、地质环境监测设施保护和地质环境监测工作质量等有关情况进行监督检查。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十八条</strong>&nbsp;县级以上人民政府国土资源主管部门及其工作人员违反本办法规定，给国家和人民生命财产造成损失，有下列情形之一的，对直接负责的主管人员和其他直接责任人员依法给予处分：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（一）未依照本办法的规定编制和实施地质环境监测规划的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（二）未依照本办法的规定组织建设地质环境监测网络的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（三）未依照本办法的规定对从事地质环境监测活动的技术人员进行岗位培训的;</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（四）未依照本办法的规定及时组织地质环境应急调查或者公布地质环境预警预报信息的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（五）其他不依法履行地质环境监测管理职责的行为。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第二十九条</strong>&nbsp;地质环境监测机构及其工作人员有下列行为之一的，由县级以上人民政府国土资源主管部门责令限期改正；逾期不改正的，对直接负责的主管人员和直接责任人员依法给予处分：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（一）未达到本办法规定的地质环境监测机构建设标准从事地质环境监测活动的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（二）未依照国家和行业有关地质环境监测技术规范从事地质环境监测活动的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（三）伪造、篡改地质环境监测数据和资料的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（四）发现地质环境监测数据出现异常或者显著变化，未及时报告地质环境预警信息的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（五）违反本办法规定擅自公开地质环境监测信息的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（六）未依照本办法规定报送地质环境监测资料的；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　（七）其他违反本办法规定从事地质环境监测活动的。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第三十条</strong>&nbsp;因工程建设活动对地质环境造成影响的，相关责任单位未依照本办法的规定履行地质环境监测义务的，由县级以上人民政府国土资源主管部门责令限期改正，并依法处以罚款。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第三十一条</strong>&nbsp;单位或者个人违反本办法规定，侵占、损坏或者擅自移动地质环境监测设施的，由县级以上人民政府国土资源主管部门责令限期改正，并依法处以罚款；情节严重，尚未构成犯罪的，由公安机关依照《中华人民共和国治安管理处罚条例》等有关规定予以处罚；情节特别严重，构成犯罪的，依法追究刑事责任。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第三十二条</strong>&nbsp;非法披露、提供和使用应当保密的地质环境监测信息的，依照《中华人民共和国保守国家秘密法》等法律法规的有关规定予以处罚。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\">　　<strong>第三十三条</strong>&nbsp;本办法自2014年7月1日起施行。</p>', '张清泉', '0');
INSERT INTO `law_regulation` VALUES ('8', '土地管理', '《土地复垦条例实施办法》', null, '国土资源部', '', '<span style=\"font-size: 12px; color: rgb(45, 45, 45); font-family: ����; line-height: 24px;\">《土地复垦条例实施办法》</span><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;&nbsp;&nbsp; 《土地复垦条例实施办法》已经2012年12月11日国土资源部第4次部务会议审议通过，现予以发布，自2013年3月1日起施行。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;</p><p align=\"right\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;部&nbsp; 长 徐绍史　</p><p align=\"right\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;2012年12月27日</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">&nbsp;</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\"><strong></strong>&nbsp;</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\"><strong><font style=\"font-size: 12px;\">土地复垦条例实施办法</font></strong></p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（2012年12月11日国土资源部第4次部务会议审议通过）</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第一章&nbsp; 总&nbsp; 则</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第一条&nbsp; 为保证土地复垦的有效实施，根据《土地复垦条例》（以下简称条例），制定本办法。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二条&nbsp; 土地复垦应当综合考虑复垦后土地利用的社会效益、经济效益和生态效益。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　生产建设活动造成耕地损毁的，能够复垦为耕地的，应当优先复垦为耕地。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三条&nbsp; 县级以上国土资源主管部门应当明确专门机构并配备专职人员负责土地复垦监督管理工作。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　县级以上国土资源主管部门应当加强与发展改革、财政、城乡规划、铁路、交通、水利、环保、农业、林业等部门的协同配合和行业指导监督。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　上级国土资源主管部门应当加强对下级国土资源主管部门土地复垦工作的监督和指导。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四条&nbsp; 除条例第六条规定外，开展土地复垦调查评价、编制土地复垦规划设计、确定土地复垦工程建设和造价、实施土地复垦工程质量控制、进行土地复垦评价等活动，也应当遵守有关国家标准和土地管理行业标准。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　省级国土资源主管部门可以结合本地实际情况，补充制定本行政区域内土地复垦工程建设和造价等标准。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五条&nbsp; 县级以上国土资源主管部门应当建立土地复垦信息管理系统，利用国土资源综合监管平台，对土地复垦情况进行动态监测，及时收集、汇总、分析和发布本行政区域内土地损毁、土地复垦等数据信息。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第二章&nbsp; 生产建设活动损毁土地的复垦</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第六条&nbsp; 属于条例第十条规定的生产建设项目，土地复垦义务人应当在办理建设用地申请或者采矿权申请手续时，依据国土资源部《土地复垦方案编制规程》的要求，组织编制土地复垦方案，随有关报批材料报送有关国土资源主管部门审查。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　具体承担相应建设用地审查和采矿权审批的国土资源主管部门负责对土地复垦义务人报送的土地复垦方案进行审查。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第七条&nbsp; 条例施行前已经办理建设用地手续或者领取采矿许可证，条例施行后继续从事生产建设活动造成土地损毁的，土地复垦义务人应当在本办法实施之日起一年内完成土地复垦方案的补充编制工作，报有关国土资源主管部门审查。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第八条&nbsp; 土地复垦方案分为土地复垦方案报告书和土地复垦方案报告表。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　依法由省级以上人民政府审批建设用地的建设项目，以及由省级以上国土资源主管部门审批登记的采矿项目，应当编制土地复垦方案报告书。其他项目可以编制土地复垦方案报告表。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第九条&nbsp; 生产建设周期长、需要分阶段实施土地复垦的生产建设项目，土地复垦方案应当包含阶段土地复垦计划和年度实施计划。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　跨县（市、区）域的生产建设项目，应当在土地复垦方案中附具以县（市、区）为单位的土地复垦实施方案。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　阶段土地复垦计划和以县（市、区）为单位的土地复垦实施方案应当明确土地复垦的目标、任务、位置、主要措施、投资概算、工程规划设计等。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十条&nbsp; 有关国土资源主管部门受理土地复垦方案审查申请后，应当组织专家进行论证。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　根据论证所需专业知识结构，从土地复垦专家库中选取专家。专家与土地复垦方案申请人或者申请项目有利害关系的，应当主动要求回避。土地复垦方案申请人也可以向有关国土资源主管部门申请专家回避。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦方案申请人或者相关利害关系人可以按照《政府信息公开条例》的规定，向有关国土资源主管部门申请查询专家意见。有关国土资源主管部门应当依法提供查询结果。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十一条&nbsp; 土地复垦方案经专家论证通过后，由有关国土资源主管部门进行最终审查。符合下列条件的，方可通过审查：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地利用现状明确；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）损毁土地的分析预测科学；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）土地复垦目标、任务和利用方向合理，措施可行；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）土地复垦费用测算合理，预存与使用计划清晰并符合本办法规定要求；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）土地复垦计划安排科学、保障措施可行；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（六）土地复垦方案已经征求意见并采纳合理建议。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十二条&nbsp; 土地复垦方案通过审查的，有关国土资源主管部门应当向土地复垦义务人出具土地复垦方案审查意见书。土地复垦方案审查意见书应当包含本办法第十一条规定的有关内容。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦方案未通过审查的，有关国土资源主管部门应当书面告知土地复垦义务人补正。逾期不补正的，不予办理建设用地或者采矿审批相关手续。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十三条&nbsp; 土地复垦义务人因生产建设项目的用地位置、规模等发生变化，或者采矿项目发生扩大变更矿区范围等重大内容变化的，应当在三个月内对原土地复垦方案进行修改，报原审查的国土资源主管部门审查。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十四条&nbsp; 土地复垦义务人不按照本办法第七条、第十三条规定补充编制或者修改土地复垦方案的，依照条例第二十条规定处理。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十五条&nbsp; 土地复垦义务人在实施土地复垦工程前，应当依据审查通过的土地复垦方案进行土地复垦规划设计，将土地复垦方案和土地复垦规划设计一并报所在地县级国土资源主管部门备案。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十六条&nbsp; 土地复垦义务人应当按照条例第十五条规定的要求，与损毁土地所在地县级国土资源主管部门在双方约定的银行建立土地复垦费用专门账户，按照土地复垦方案确定的资金数额，在土地复垦费用专门账户中足额预存土地复垦费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　预存的土地复垦费用遵循“土地复垦义务人所有，国土资源主管部门监管，专户储存专款使用”的原则。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十七条&nbsp; 土地复垦义务人应当与损毁土地所在地县级国土资源主管部门、银行共同签订土地复垦费用使用监管协议，按照本办法规定的原则明确土地复垦费用预存和使用的时间、数额、程序、条件和违约责任等。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦费用使用监管协议对当事人具有法律效力。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十八条&nbsp; 土地复垦义务人应当在项目动工前一个月内预存土地复垦费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦义务人按照本办法第七条规定补充编制土地复垦方案的，应当在土地复垦方案通过审查后一个月内预存土地复垦费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦义务人按照本办法第十三条规定修改土地复垦方案后，已经预存的土地复垦费用不足的，应当在土地复垦方案通过审查后一个月内补齐差额费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十九条&nbsp; 土地复垦费用预存实行一次性预存和分期预存两种方式。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　生产建设周期在三年以下的项目，应当一次性全额预存土地复垦费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　生产建设周期在三年以上的项目，可以分期预存土地复垦费用，但第一次预存的数额不得少于土地复垦费用总金额的百分之二十。余额按照土地复垦方案确定的土地复垦费用预存计划预存，在生产建设活动结束前一年预存完毕。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十条&nbsp; 条例实施前，采矿生产项目按照有关规定向国土资源主管部门缴存的矿山地质环境治理恢复保证金中已经包含了土地复垦费用的，土地复垦义务人可以向所在地国土资源主管部门提出申请，经审核属实的，可以不再预存相应数额的土地复垦费用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十一条&nbsp; 土地复垦义务人应当按照土地复垦方案确定的工作计划和土地复垦费用使用计划，向损毁土地所在地县级国土资源主管部门申请出具土地复垦费用支取通知书。县级国土资源主管部门应当在七日内出具土地复垦费用支取通知书。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦义务人凭土地复垦费用支取通知书，从土地复垦费用专门账户中支取土地复垦费用，专项用于土地复垦。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十二条&nbsp; 土地复垦义务人应当按照条例第十七条规定于每年12月31日前向所在地县级国土资源主管部门报告当年土地复垦义务履行情况，包括下列内容：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）年度土地损毁情况，包括土地损毁方式、地类、位置、权属、面积、程度等；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）年度土地复垦费用预存、使用和管理等情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）年度土地复垦实施情况，包括复垦地类、位置、面积、权属、主要复垦措施、工程量等；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）国土资源主管部门规定的其他年度报告内容。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　县级国土资源主管部门应当加强对土地复垦义务人报告事项履行情况的监督核实，并可以根据情况将土地复垦义务履行情况年度报告在门户网站上公开。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十三条&nbsp; 县级国土资源主管部门应当加强对土地复垦义务人使用土地复垦费用的监督管理，发现有不按照规定使用土地复垦费用的，可以按照土地复垦费用使用监管协议的约定依法追究土地复垦义务人的违约责任。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十四条&nbsp; 土地复垦义务人在生产建设活动中应当遵循“保护、预防和控制为主，生产建设与复垦相结合”的原则，采取下列预防控制措施：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）对可能被损毁的耕地、林地、草地等，应当进行表土剥离，分层存放，分层回填，优先用于复垦土地的土壤改良。表土剥离厚度应当依据相关技术标准,根据实际情况确定。表土剥离应当在生产工艺和施工建设前进行或者同步进行；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）露天采矿、烧制砖瓦、挖沙取土、采石，修建铁路、公路、水利工程等，应当合理确定取土的位置、范围、深度和堆放的位置、高度等；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）地下采矿或者疏干抽排地下水等施工，对易造成地面塌陷或者地面沉降等特殊地段应当采取充填、设置保护支柱等工程技术方法以及限制、禁止开采地下水等措施；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）禁止不按照规定排放废气、废水、废渣、粉灰、废油等。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十五条&nbsp; 土地复垦义务人应当对生产建设活动损毁土地的规模、程度和复垦过程中土地复垦工程质量、土地复垦效果等实施全程控制，并对验收合格后的复垦土地采取管护措施，保证土地复垦效果。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十六条&nbsp; 土地复垦义务人依法转让采矿权或者土地使用权的，土地复垦义务同时转移。但原土地复垦义务人应当完成的土地复垦义务未履行完成的除外。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　原土地复垦义务人已经预存的土地复垦费用以及未履行完成的土地复垦义务，由原土地复垦义务人与新的土地复垦义务人在转让合同中约定。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　新的土地复垦义务人应当重新与损毁土地所在地国土资源主管部门、银行签订土地复垦费用使用监管协议。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第三章&nbsp; 历史遗留损毁土地和自然灾害损毁土地的复垦</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十七条&nbsp; 历史遗留损毁土地和自然灾害损毁土地调查评价，应当包括下列内容：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）损毁土地现状调查，包括地类、位置、面积、权属、损毁类型、损毁特征、损毁原因、损毁时间、污染情况、自然条件、社会经济条件等；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）损毁土地复垦适宜性评价，包括损毁程度、复垦潜力、利用方向及生态环境影响等；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）土地复垦效益分析，包括社会、经济、生态等效益。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十八条&nbsp; 符合下列条件的土地，所在地的县级国土资源主管部门应当认定为历史遗留损毁土地：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地复垦义务人灭失的生产建设活动损毁的土地；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）《土地复垦规定》实施以前生产建设活动损毁的土地。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十九条&nbsp; 县级国土资源主管部门应当将历史遗留损毁土地认定结果予以公告，公告期间不少于三十日。土地复垦义务人对认定结果有异议的，可以向县级国土资源主管部门申请复核。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　县级国土资源主管部门应当自收到复核申请之日起三十日内做出答复。土地复垦义务人不服的，可以向上一级国土资源主管部门申请裁定。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　上一级国土资源主管部门发现县级国土资源主管部门做出的认定结果不符合规定的，可以责令县级国土资源主管部门重新认定。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十条&nbsp; 土地复垦专项规划应当包括下列内容：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地复垦潜力分析；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）土地复垦的原则、目标、任务和计划安排；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）土地复垦重点区域和复垦土地利用方向；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）土地复垦项目的划定，复垦土地的利用布局和工程布局；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）土地复垦资金的测算，资金筹措方式和资金安排；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（六）预期经济、社会和生态等效益；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（七）土地复垦的实施保障措施。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦专项规划可以根据实际情况纳入土地整治规划。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　土地复垦专项规划的修改应当按照条例第二十二条的规定报本级人民政府批准。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十一条&nbsp; 县级以上地方国土资源主管部门应当依据土地复垦专项规划制定土地复垦年度计划，分年度、有步骤地组织开展土地复垦工作。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十二条&nbsp; 条例第二十三条规定的历史遗留损毁土地和自然灾害损毁土地的复垦资金来源包括下列资金：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地复垦费；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）耕地开垦费；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）新增建设用地土地有偿使用费；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）用于农业开发的土地出让收入;</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）可以用于土地复垦的耕地占用税地方留成部分；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（六）其他可以用于土地复垦的资金。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第四章 土地复垦验收</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十三条&nbsp; 土地复垦义务人完成土地复垦任务后，应当组织自查，向项目所在地县级国土资源主管部门提出验收书面申请，并提供下列材料：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）验收调查报告及相关图件；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）规划设计执行报告；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）质量评估报告；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）检测等其他报告。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十四条&nbsp; 生产建设周期五年以上的项目，土地复垦义务人可以分阶段提出验收申请，负责组织验收的国土资源主管部门实行分级验收。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　阶段验收由项目所在地县级国土资源主管部门负责组织，总体验收由审查通过土地复垦方案的国土资源主管部门负责组织或者委托有关国土资源主管部门组织。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十五条&nbsp; 负责组织验收的国土资源主管部门应当会同同级农业、林业、环境保护等有关部门，组织邀请有关专家和农村集体经济组织代表，依据土地复垦方案、阶段土地复垦计划，对下列内容进行验收：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地复垦计划目标与任务完成情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）规划设计执行情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）复垦工程质量和耕地质量等级；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）土地权属管理、档案资料管理情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）工程管护措施。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十六条&nbsp; 土地复垦阶段验收和总体验收形成初步验收结果后，负责组织验收的国土资源主管部门应当在项目所在地公告，听取相关权利人的意见。公告时间不少于三十日。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　相关土地权利人对验收结果有异议的，可以在公告期内向负责组织验收的国土资源主管部门书面提出。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　国土资源主管部门应当在接到书面异议之日起十五日内，会同同级农业、林业、环境保护等有关部门核查，形成核查结论反馈相关土地权利人。异议情况属实的，还应当向土地复垦义务人提出整改意见，限期整改。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十七条&nbsp; 土地复垦工程经阶段验收或者总体验收合格的，负责验收的国土资源主管部门应当依照条例第二十九条规定出具阶段或者总体验收合格确认书。验收合格确认书应当载明下列事项：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）土地复垦工程概况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）损毁土地情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）土地复垦完成情况；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）土地复垦中存在的问题和整改建议、处理意见；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）验收结论。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十八条&nbsp; 土地复垦义务人在申请新的建设用地、申请新的采矿许可证或者申请采矿许可证延续、变更、注销时，应当一并提供按照本办法规定到期完工土地复垦项目的验收合格确认书或者土地复垦费缴费凭据。未提供相关材料的，按照条例第二十条规定，有关国土资源主管部门不得通过审查和办理相关手续。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十九条&nbsp; 政府投资的土地复垦项目竣工后，由负责组织实施土地复垦项目的国土资源主管部门进行初步验收，验收程序和要求除依照本办法规定外，按照资金来源渠道及相应的项目管理办法执行。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　初步验收完成后，依照条例第三十条规定进行最终验收，并依照本办法第三十七条规定出具验收合格确认书。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　国土资源主管部门代复垦的项目竣工后，依照本条规定进行验收。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十条&nbsp; 土地权利人自行复垦或者社会投资进行复垦的土地复垦项目竣工后，由项目所在地县级国土资源主管部门进行验收，验收程序和要求依照本办法规定执行。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第五章 土地复垦激励措施</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十一条&nbsp; 土地复垦义务人将生产建设活动损毁的耕地、林地、牧草地等农用地复垦恢复为原用途的，可以依照条例第三十二条规定，凭验收合格确认书向所在地县级国土资源主管部门提出出具退还耕地占用税意见的申请。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　经审核属实的，县级国土资源主管部门应当在十五日内向土地复垦义务人出具意见。土地复垦义务人凭国土资源主管部门出具的意见向有关部门申请办理退还耕地占用税手续。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十二条&nbsp; 由社会投资将历史遗留损毁和自然灾害损毁土地复垦为耕地的，除依照条例第三十三条规定办理外，对属于将非耕地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，可以作为本省、自治区、直辖市的补充耕地指标，市、县政府可以出资购买指标。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十三条&nbsp; 由县级以上地方人民政府投资将历史遗留损毁和自然灾害损毁的建设用地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，依照条例第三十五条规定可以作为本省、自治区、直辖市的补充耕地指标。但使用新增建设用地有偿使用费复垦的耕地除外。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　属于农民集体所有的土地，复垦后应当交给农民集体使用。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第六章 土地复垦监督管理</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十四条&nbsp; 县级以上国土资源主管部门应当采取年度检查、专项核查、例行稽查、在线监管等形式，对本行政区域内的土地复垦活动进行监督检查，并可以采取下列措施：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）要求被检查当事人如实反映情况和提供相关的文件、资料和电子数据；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）要求被检查当事人就土地复垦有关问题做出说明；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）进入土地复垦现场进行勘查；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）责令被检查当事人停止违反条例的行为。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十五条&nbsp; 县级以上国土资源主管部门应当在门户网站上及时向社会公开本行政区域内的土地复垦管理规定、技术标准、土地复垦规划、土地复垦项目安排计划以及土地复垦方案审查结果、土地复垦工程验收结果等重大事项。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十六条&nbsp; 县级以上地方国土资源主管部门应当通过国土资源主干网等按年度将本行政区域内的土地损毁情况、土地复垦工作开展情况等逐级上报。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　上级国土资源主管部门对下级国土资源主管部门落实土地复垦法律法规情况、土地复垦义务履行情况、土地复垦效果等进行绩效评价。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十七条&nbsp; 县级以上国土资源主管部门应当对土地复垦档案实行专门管理，将土地复垦方案、土地复垦资金使用监管协议、土地复垦验收有关材料和土地复垦项目计划书、土地复垦实施情况报告等资料和电子数据进行档案存储与管理。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十八条&nbsp; 复垦后的土地权属和用途发生变更的，应当依法办理土地登记相关手续。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第七章 法律责任</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四十九条&nbsp; 条例第三十六条第六项规定的其他徇私舞弊、滥用职权、玩忽职守行为，包括下列行为：</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）违反本办法第二十一条规定，对不符合规定条件的土地复垦义务人出具土地复垦费用支取通知书，或者对符合规定条件的土地复垦义务人无正当理由未在规定期限内出具土地复垦费用支取通知书的；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）违反本办法第四十一条规定，对不符合规定条件的申请人出具退还耕地占用税的意见，或者对符合规定条件的申请人无正当理由未在规定期限内出具退还耕地占用税的意见的；</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）其他违反条例和本办法规定的行为。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五十条&nbsp; 土地复垦义务人未按照本办法第十五条规定将土地复垦方案、土地复垦规划设计报所在地县级国土资源主管部门备案的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五十一条&nbsp; 土地复垦义务人未按照本办法第十六条、第十七条、第十八条、第十九条规定预存土地复垦费用的，由县级以上国土资源主管部门责令限期改正；逾期不改正的，依照条例第三十八条规定处罚。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五十二条&nbsp; 土地复垦义务人未按照本办法第二十五条规定开展土地复垦质量控制和采取管护措施的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>第八章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 附&nbsp; 则</strong></p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五十三条&nbsp; 铀矿等放射性采矿项目的土地复垦具体办法，由国土资源部另行制定。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: ����; font-size: 14px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五十四条&nbsp; 本办法自2013年3月1日起施行。</p>', '谢东海', '0');
INSERT INTO `law_regulation` VALUES ('9', '综合管理', '土地储备管理办法', null, '国土资源部', '', '<strong style=\"font-family: ����; font-size: 12px; color: rgb(45, 45, 45); line-height: 2;\">第一章 总 则</strong><span style=\"font-family: ����; font-size: 12px; color: rgb(45, 45, 45); line-height: 2;\">&nbsp;</span><span style=\"font-family: ����; font-size: 12px; color: rgb(45, 45, 45); line-height: 2;\">　　</span><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第一条 为完善土地储备制度，加强土地调控，规范土地市场运行，促进土地节约集约利用，提高建设用地保障能力，根据《国务院关于加强国有土地资产管理的通知》(国发〔2001〕15号)、《国务院办公厅关于规范国有土地使用权出让收支管理的通知》(国办发〔2006〕100号)，制定本办法。 　　<br>　　第二条 本办法所称土地储备，是指市、县人民政府国土资源管理部门为实现调控土地市场、促进土地资源合理利用目标，依法取得土地，进行前期开发、储存以备供应土地的行为。 　　<br>土地储备工作的具体实施，由土地储备机构承担。 　　<br>　　第三条 土地储备机构应为市、县人民政府批准成立、具有独立的法人资格、隶属于国土资源管理部门、统一承担本行政辖区内土地储备工作的事业单位。 　　<br>　　第四条 市、县人民政府国土资源管理、财政及当地人民银行等部门，按照职责分工，各负其责，互相配合，保证土地储备工作顺利开展。 　　<br>　　第五条 建立信息共享制度。县级以上人民政府国土资源管理、财政及人民银行相关分支行要将土地储备与供应数量、储备资金收支、贷款数量等信息按季逐级汇总上报主管部门，并在同级部门间进行信息交换。 　　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第二章 计划与管理</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第六条 各地应根据调控土地市场的需要，合理确定储备土地规模，储备土地必须符合规划、计划，优先储备闲置、空闲和低效利用的国有存量建设用地。 　　<br>　　第七条 土地储备实行计划管理。市、县人民政府国土资源管理、财政及当地人民银行相关分支行等部门应根据当地经济和社会发展计划、土地利用总体规划、城市总体规划、土地利用年度计划和土地市场供需状况等共同编制年度土地储备计划，报同级人民政府批准，并报上级国土资源管理部门备案。 　　<br>　　第八条 年度土地储备计划应包括： 　　<br>　　(一) 年度储备土地规模； 　　<br>　　(二) 年度储备土地前期开发规模； 　　<br>　　(三) 年度储备土地供应规模； 　　<br>　　(四) 年度储备土地临时利用计划； 　　<br>　　(五) 计划年度末储备土地规模。 　　<br>　　第九条 市、县人民政府国土资源管理部门实施土地储备计划，应编制项目实施方案，经同级人民政府批准后，作为办理相关审批手续的依据。 　　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第三章 范围与程序</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第十条 下列土地可以纳入土地储备范围： 　　<br>　　(一) 依法收回的国有土地； 　　<br>　　(二) 收购的土地； 　　<br>　　(三) 行使优先购买权取得的土地； 　　<br>　　(四) 已办理农用地转用、土地征收批准手续的土地； 　　<br>　　(五) 其他依法取得的土地。 　　<br>　　第十一条 市、县人民政府或国土资源管理部门依法无偿收回国有土地使用权的土地，由土地登记机关办理注销土地登记手续后纳入土地储备。 　　<br>　　第十二条 因实施城市规划进行旧城区改建需要调整使用土地的，应由国土资源管理部门报经有批准权的人民政府批准，依法对土地使用权人给予补偿后，收回土地使用权。对政府有偿收回的土地，由土地登记机关办理注销土地登记手续后纳入土地储备。 　　<br>　　第十三条 根据土地储备计划收购国有土地使用权的，土地储备机构应与土地使用权人签订土地使用权收购合同。收购土地的补偿标准，由土地储备机构与土地使用权人根据土地评估结果协商，经国土资源管理、财政部门或地方法规规定的机构批准确认。完成收购程序后的土地，由土地登记机关办理注销土地登记手续后纳入土地储备。 　　<br>　　第十四条 政府行使优先购买权取得的土地，由土地登记机关办理注销土地登记手续后纳入土地储备。 　　<br>　　第十五条 已办理农用地转用、土地征收批准手续的土地，由土地登记机关办理注销土地登记手续后纳入土地储备。 　　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第四章 开发与利用</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第十六条 对纳入储备的土地，经市、县人民政府国土资源管理部门批准，土地储备机构有权对储备土地进行前期开发、保护、管理、临时利用及为储备土地、实施前期开发进行融资等活动。 　　<br>　　第十七条 市、县人民政府可根据需要，对产权清晰、申请资料齐全的储备土地，办理土地登记手续，核发土地证书。供应已发证储备土地前，应收回土地证书，设立土地抵押权的，要先行依法解除。 　　<br>　　第十八条 土地储备机构应对储备土地特别是依法征收后纳入储备的土地进行必要的前期开发，使之具备供应条件。 　　<br>　　第十九条 前期开发涉及道路、供水、供电、供气、排水、通讯、照明、绿化、土地平整等基础设施建设的，要按照有关规定，通过公开招标方式选择工程实施单位。 　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第二十条 土地储备机构应对纳入储备的土地采取必要的措施予以保护管理，防止侵害储备土地权利行为的发生。 　　<br>　　第二十一条 在储备土地未供应前，土地储备机构可将储备土地或连同地上建(构)筑物，通过出租、临时使用等方式加以利用。设立抵押权的储备土地临时利用，应征得抵押权人同意。储备土地的临时利用，一般不超过两年，且不能影响土地供应。 　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第五章 土地供应</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第二十二条 储备土地完成前期开发整理后，纳入当地市、县土地供应计划，由市、县人民政府国土资源管理部门统一组织供地。 　　<br>　　第二十三条 依法办理农用地转用、土地征收后的土地，纳入储备满两年未供应的，在下达下一年度农用地转用计划时扣减相应指标。 　　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第六章 资金管理</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第二十四条 土地储备资金收支管理严格执行《土地储备资金财务管理暂行办法》(财综〔2007〕17号)的规定。 　　<br>　　第二十五条 土地储备机构向银行等金融机构申请的贷款应为担保贷款，其中抵押贷款必须具有合法的土地使用证；申请贷款的土地储备机构必须满足商业银行及其他金融机构的贷款要求。土地储备机构举借的贷款规模，应当与年度土地储备计划、土地储备资金项目预算相衔接，并报经同级财政部门批准，不得超计划、超规模贷款。土地储备机构申请贷款时，应持财政部门的贷款规模批准文件及同级人民政府批准的项目实施方案等书面材料向当地商业银行及其他金融机构申请担保贷款。商业银行及其他金融机构应严格按照商业原则在批准的规模内发放土地储备贷款。土地储备贷款应实行专款专用、封闭管理，不得挪用。 　　<br>　　政府储备土地设定抵押权，其价值按照市场评估价值扣除应当上缴政府的土地出让收益确定，抵押程序参照划拨土地使用权抵押程序执行。 　　<br>　　商业银行及其他金融机构应当准确、完整、及时地向人民银行建立的全国统一的企业信用信息基础数据库报送土地储备机构的土地储备贷款相关信息。在贷款发放前，商业银行及其他金融机构应当查询贷款储备机构的信息，对有不良记录的土地储备机构审慎发放贷款。商业银行及其他金融机构应当根据监管要求，合理、科学确定贷款期限。 　　<br>　　第二十六条 土地储备机构举借商业银行及其他金融机构贷款的，必须按贷款合同约定，及时足额偿还贷款本息。 　　<br>　　第二十七条 各类财政性资金依法不得用于土地储备贷款担保。土地储备机构应加强资金风险管理，不得以任何形式为第三方提供担保。 　　</font></p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"><strong>第七章 附 则</strong>&nbsp;　　</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">　　第二十八条 各省、自治区、直辖市及计划单列市人民政府国土资源管理部门可依据本办法规定，结合当地实际，会同财政部门、人民银行制定具体实施办法。 　　<br>　　第二十九条 本办法由国土资源部会同财政部、中国人民银行负责解释。 　　<br>　　第三十条 本办法自发布之日起实施。</font></p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\"></font>&nbsp;</p><p style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 2;\"><font style=\"font-family: ����; font-size: 12px;\">以上来自国土资源部网站</font></p>', '谢东海', '1');
INSERT INTO `law_regulation` VALUES ('10', '矿产资源管理', '矿山地质环境保护规定', null, '国土资源部', '', '<span style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 16px; line-height: 24px;\">（2009年3月2日中华人民共和国国土资源部令第44号公布&nbsp; 根据2015年5月6日国土资源部第2次部务会议《国土资源部关于修改〈地质灾害危险性评估单位资质管理办法〉等5部规章的决定》修正）</span><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第一章 总 则</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第一条 为保护矿山地质环境，减少矿产资源勘查开采活动造成的矿山地质环境破坏，保护人民生命和财产安全，促进矿产资源的合理开发利用和经济社会、资源环境的协调发展，根据《中华人民共和国矿产资源法》和《地质灾害防治条例》，制定本规定。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二条 因矿产资源勘查开采等活动造成矿区地面塌陷、地裂缝、崩塌、滑坡，含水层破坏，地形地貌景观破坏等的预防和治理恢复，适用本规定。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　开采矿产资源涉及土地复垦的，依照国家有关土地复垦的法律法规执行。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三条 矿山地质环境保护，坚持预防为主、防治结合，谁开发谁保护、谁破坏谁治理、谁投资谁受益的原则。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四条 国土资源部负责全国矿山地质环境的保护工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　县级以上地方国土资源行政主管部门负责本行政区的矿山地质环境保护工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五条 国家鼓励开展矿山地质环境保护科学技术研究，普及相关科学技术知识，推广先进技术和方法，制定有关技术标准，提高矿山地质环境保护的科学技术水平。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第六条 国家鼓励企业、社会团体或者个人投资，对已关闭或者废弃矿山的地质环境进行治理恢复。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第七条 任何单位和个人对破坏矿山地质环境的违法行为都有权进行检举和控告。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二章 规 划</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第八条 国土资源部负责全国矿山地质环境的调查评价工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　省、自治区、直辖市国土资源行政主管部门负责本行政区域内的矿山地质环境调查评价工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　市、县国土资源行政主管部门根据本地区的实际情况，开展本行政区域的矿山地质环境调查评价工作。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第九条 国土资源部依据全国矿山地质环境调查评价结果，编制全国矿山地质环境保护规划。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　省、自治区、直辖市国土资源行政主管部门依据全国矿山地质环境保护规划，结合本行政区域的矿山地质环境调查评价结果，编制省、自治区、直辖市的矿山地质环境保护规划，报省、自治区、直辖市人民政府批准实施。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　市、县级矿山地质环境保护规划的编制和审批，由省、自治区、直辖市国土资源行政主管部门规定。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十条 矿山地质环境保护规划应当包括下列内容：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）矿山地质环境现状和发展趋势；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）矿山地质环境保护的指导思想、原则和目标；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）矿山地质环境保护的主要任务；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）矿山地质环境保护的重点工程；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）规划实施保障措施。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十一条 矿山地质环境保护规划应当符合矿产资源规划，并与土地利用总体规划、地质灾害防治规划等相协调。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三章 治理恢复</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十二条 采矿权申请人申请办理采矿许可证时，应当编制矿山地质环境保护与治理恢复方案，报有批准权的国土资源行政主管部门批准。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　矿山地质环境保护与治理恢复方案应当包括下列内容：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）矿山基本情况；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）矿山地质环境现状；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）矿山开采可能造成地质环境影响的分析评估（含地质灾害危险性评估）；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）矿山地质环境保护与治理恢复措施；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）矿山地质环境监测方案；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（六）矿山地质环境保护与治理恢复工程经费概算；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（七）缴存矿山地质环境保护与治理恢复保证金承诺书。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　依照前款规定已编制矿山地质环境保护与治理恢复方案的，不再单独进行地质灾害危险性评估。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十三条 矿山地质环境保护与治理恢复方案的编制单位应当具备下列条件：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）具有地质灾害危险性评估资质或者地质灾害治理工程勘查、设计资质和相关工作业绩；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）具有经过国土资源部组织的矿山地质环境保护和治理恢复方案编制业务培训且考核合格的专业技术人员。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十四条 采矿权申请人未编制矿山地质环境保护与治理恢复方案，或者编制的矿山地质环境保护与治理恢复方案不符合要求的，有批准权的国土资源行政主管部门应当告知申请人补正；逾期不补正的，不予受理其采矿权申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十五条 采矿权人扩大开采规模、变更矿区范围或者开采方式的，应当重新编制矿山地质环境保护与治理恢复方案，并报原批准机关批准。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十六条 采矿权人应当严格执行经批准的矿山地质环境保护与治理恢复方案。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　矿山地质环境保护与治理恢复工程的设计和施工，应当与矿产资源开采活动同步进行。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十七条 开采矿产资源造成矿山地质环境破坏的，由采矿权人负责治理恢复，治理恢复费用列入生产成本。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　矿山地质环境治理恢复责任人灭失的，由矿山所在地的市、县国土资源行政主管部门，使用经市、县人民政府批准设立的政府专项资金进行治理恢复。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　国土资源部，省、自治区、直辖市国土资源行政主管部门依据矿山地质环境保护规划，按照矿山地质环境治理工程项目管理制度的要求，对市、县国土资源行政主管部门给予资金补助。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十八条 采矿权人应当依照国家有关规定，缴存矿山地质环境治理恢复保证金。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　矿山地质环境治理恢复保证金的缴存标准和缴存办法，按照省、自治区、直辖市的规定执行。矿山地质环境治理恢复保证金的缴存数额，不得低于矿山地质环境治理恢复所需费用。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　矿山地质环境治理恢复保证金遵循企业所有、政府监管、专户储存、专款专用的原则。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第十九条 采矿权人按照矿山地质环境保护与治理恢复方案的要求履行了矿山地质环境治理恢复义务，经有关国土资源行政主管部门组织验收合格的，按义务履行情况返还相应额度的矿山地质环境治理恢复保证金及利息。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　采矿权人未履行矿山地质环境治理恢复义务，或者未达到矿山地质环境保护与治理恢复方案要求，经验收不合格的，有关国土资源行政主管部门应当责令采矿权人限期履行矿山地质环境治理恢复义务。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十条 因矿区范围、矿种或者开采方式发生变更的，采矿权人应当按照变更后的标准缴存矿山地质环境治理恢复保证金。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十一条 矿山地质环境治理恢复后，对具有观赏价值、科学研究价值的矿业遗迹，国家鼓励开发为矿山公园。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　国家矿山公园由省、自治区、直辖市国土资源行政主管部门组织申报，由国土资源部审定并公布。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十二条 国家矿山公园应当具备下列条件：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）国内独具特色的矿床成因类型且具有典型、稀有及科学价值的矿业遗迹；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）经过矿山地质环境治理恢复的废弃矿山或者部分矿段；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（三）自然环境优美、矿业文化历史悠久；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（四）区位优越，科普基础设施完善，具备旅游潜在能力；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（五）土地权属清楚，矿山公园总体规划科学合理。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十三条 矿山关闭前，采矿权人应当完成矿山地质环境治理恢复义务。采矿权人在申请办理闭坑手续时，应当经国土资源行政主管部门验收合格，并提交验收合格文件，经审定后，返还矿山地质环境治理恢复保证金。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　逾期不履行治理恢复义务或者治理恢复仍达不到要求的，国土资源行政主管部门使用该采矿权人缴存的矿山地质环境治理恢复保证金组织治理，治理资金不足部分由采矿权人承担。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十四条 采矿权转让的，矿山地质环境保护与治理恢复的义务同时转让。采矿权受让人应当依照本规定，履行矿山地质环境保护与治理恢复的义务。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十五条 以槽探、坑探方式勘查矿产资源，探矿权人在矿产资源勘查活动结束后未申请采矿权的，应当采取相应的治理恢复措施，对其勘查矿产资源遗留的钻孔、探井、探槽、巷道进行回填、封闭，对形成的危岩、危坡等进行治理恢复，消除安全隐患。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第四章 监督管理</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十六条 县级以上国土资源行政主管部门对采矿权人履行矿山地质环境保护与治理恢复义务的情况进行监督检查。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　相关责任人应当配合县级以上国土资源行政主管部门的监督检查，并提供必要的资料，如实反映情况。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十七条 县级以上国土资源行政主管部门应当建立本行政区域内的矿山地质环境监测工作体系，健全监测网络，对矿山地质环境进行动态监测，指导、监督采矿权人开展矿山地质环境监测。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　采矿权人应当定期向矿山所在地的县级国土资源行政主管部门报告矿山地质环境情况，如实提交监测资料。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　县级国土资源行政主管部门应当定期将汇总的矿山地质环境监测资料报上一级国土资源行政主管部门。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十八条 县级以上国土资源行政主管部门在履行矿山地质环境保护的监督检查职责时，有权对矿山地质环境保护与治理恢复方案确立的治理恢复措施落实情况和矿山地质环境监测情况进行现场检查，对违反本规定的行为有权制止并依法查处。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第二十九条 开采矿产资源等活动造成矿山地质环境突发事件的，有关责任人应当采取应急措施，并立即向当地人民政府报告。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第五章 法律责任</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十条 违反本规定，应当编制矿山地质环境保护与治理恢复方案而未编制的，或者扩大开采规模、变更矿区范围或者开采方式，未重新编制矿山地质环境保护与治理恢复方案并经原审批机关批准的，由县级以上国土资源行政主管部门责令限期改正；逾期不改正的，处3万元以下的罚款，颁发采矿许可证的国土资源行政主管部门不得通过其采矿许可证年检。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十一条 违反本规定第十六条、第二十三条规定，未按照批准的矿山地质环境保护与治理恢复方案治理的，或者在矿山被批准关闭、闭坑前未完成治理恢复的，由县级以上国土资源行政主管部门责令限期改正；逾期拒不改正的，处3万元以下的罚款，5年内不受理其新的采矿权申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十二条 违反本规定第十八条规定，未按期缴存矿山地质环境治理恢复保证金的，由县级以上国土资源行政主管部门责令限期缴存；逾期不缴存的，处3万元以下的罚款。颁发采矿许可证的国土资源行政主管部门不得通过其采矿活动年度报告，不受理其采矿权延续变更申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十三条 违反本规定第二十五条规定，探矿权人未采取治理恢复措施的，由县级以上国土资源行政主管部门责令限期改正；逾期拒不改正的，处3万元以下的罚款，5年内不受理其新的探矿权、采矿权申请。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十四条 违反本规定，扰乱、阻碍矿山地质环境保护与治理恢复工作，侵占、损坏、损毁矿山地质环境监测设施或者矿山地质环境保护与治理恢复设施的，由县级以上国土资源行政主管部门责令停止违法行为，限期恢复原状或者采取补救措施，并处3万元以下的罚款；构成犯罪的，依法追究刑事责任。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十五条 县级以上国土资源行政主管部门工作人员违反本规定，在矿山地质环境保护与治理恢复监督管理中玩忽职守、滥用职权、徇私舞弊的，对相关责任人依法给予行政处分；构成犯罪的，依法追究刑事责任。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第六章 附 则</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十六条 本规定实施前已建和在建矿山，采矿权人应当依照本规定编制矿山地质环境保护与治理恢复方案，报原采矿许可证审批机关批准，并缴存矿山地质环境治理恢复保证金。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　第三十七条 本规定自2009年5月1日起施行。</p>', '王莉群', '0');
INSERT INTO `law_regulation` VALUES ('11', '相关法律', '中华人民共和国农业部令', null, '国土资源部', '', '<strong style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 16px; line-height: 24px;\">2014 年 第 3 号</strong><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　现公布《农业部关于修订部分规章的决定》，自公布之日起施行。</p><p align=\"right\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　部长　韩长赋　　　</p><p align=\"right\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　2014年4月25日</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p><p align=\"center\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　<strong>农业部关于修订部分规章的决定&nbsp;</strong></p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　为贯彻《国务院关于取消和下放一批行政审批项目的决定》（国发〔2014〕5号），农业部决定对以下五部规章进行修订。</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　一、草原征占用审核审批管理办法（2006年1月27日农业部令第58号公布）将第八条第一款修改为：“在草原上修建直接为草原保护和畜牧业生产服务的工程设施确需使用草原的，依照下列规定的权限办理：</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（一）使用草原超过七十公顷的，由省级人民政府草原行政主管部门审批；</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　（二）使用草原七十公顷及其以下的，由县级以上地方人民政府草原行政主管部门依据所在省、自治区、直辖市确定的审批权限审批。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　二、中华人民共和国植物新品种保护条例实施细则（农业部分）（2007年9月19日农业部令第5号公布，2011年12月31日农业部令2011年第4号修订）</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第二十四条修改为：“中国的单位或者个人将国内培育的植物新品种向国外申请品种权的，应当向所在地省级人民政府农业行政主管部门申请登记。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　三、食用菌菌种管理办法（2006年3月27日农业部令第62号公布，2013年12月31日农业部令2013年第5号修订）</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第八条修改为：“任何单位和个人向境外提供食用菌种质资源（包括长有菌丝体的栽培基质及用于菌种分离的子实体），应当报农业部批准。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第二十六条第二款修改为：“承担菌种质量检验的机构应当具备相应的检测条件和能力，并经省级人民政府有关主管部门考核合格。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第三十条第一款修改为：“申请进出口菌种的单位和个人，应当填写《进（出）口菌种审批表》，经省级人民政府农业行政主管部门批准后，依法办理进出口手续。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　四、草种管理办法（2006年1月12日农业部令第56号公布，2013年12月31日农业部令2013年第5号修订）</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第三十八条第二款修改为：“承担草种质量检验的机构应当具备相应的检测条件和能力，并经省级人民政府有关主管部门考核合格。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第四十六条第二款修改为：“申请进出口草种的单位和个人，应当填写《进（出）口草种审批表》，经省级人民政府草原行政主管部门批准后，依法办理进出口手续。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　五、中华人民共和国水生动植物自然保护区管理办法（1997年10月17日农业部令第24号公布，2010年11月26日农业部令2010年第11号、2013年12月31日农业部令2013年第5号修订）</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第十八条修改为：“未经批准，禁止任何人进入国家级水生动植物自然保护区的核心区和一切可能对自然保护区造成破坏的活动。确因科学研究的需要，必须进入国家级水生动植物自然保护区核心区从事科学研究观测、调查活动的，应当事先向自然保护区管理机构提交申请和活动计划，并经省级人民政府渔业行政主管部门批准。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　将第二十一条修改为：“外国人进入国家级水生动植物自然保护区的，接待单位应当事先报省级人民政府渔业行政主管部门批准。”</p><p align=\"justify\" style=\"border: 0px; margin: 5px 0px; padding: 8px 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　</p>', '韩长赋', '0');
INSERT INTO `law_regulation` VALUES ('12', '海洋管理', '《海洋法》', null, '国家海事局', '', '这是一部关于海洋安全管理的法律', '测试人员', '1');
INSERT INTO `law_regulation` VALUES ('13', '矿产资源管理', '《矿产开采规定》', null, '工矿局', '', '这是一部关于矿产开采管理规定', '测试人员', '0');

-- ----------------------------
-- Table structure for law_types
-- ----------------------------
DROP TABLE IF EXISTS `law_types`;
CREATE TABLE `law_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) DEFAULT NULL COMMENT 'pid',
  `law_type` varchar(50) DEFAULT NULL COMMENT 'lay type',
  `description` varchar(300) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of law_types
-- ----------------------------
INSERT INTO `law_types` VALUES ('1', null, '矿产资源管理', '');
INSERT INTO `law_types` VALUES ('2', null, '土地管理', '');
INSERT INTO `law_types` VALUES ('3', null, '海洋管理', '');
INSERT INTO `law_types` VALUES ('4', null, '地方法规', '');
INSERT INTO `law_types` VALUES ('5', null, '综合管理', '执法.');
INSERT INTO `law_types` VALUES ('6', null, '地质环境管理', '');
INSERT INTO `law_types` VALUES ('7', null, '测绘管理', '对象');
INSERT INTO `law_types` VALUES ('8', null, '相关法律', '');
INSERT INTO `law_types` VALUES ('9', null, '法律解释', '');
INSERT INTO `law_types` VALUES ('10', null, '部门规章', '');

-- ----------------------------
-- Table structure for notice_columns
-- ----------------------------
DROP TABLE IF EXISTS `notice_columns`;
CREATE TABLE `notice_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `column_name` varchar(50) DEFAULT NULL COMMENT 'columnName',
  `description` varchar(200) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_columns
-- ----------------------------
INSERT INTO `notice_columns` VALUES ('1', '新闻速递', '');
INSERT INTO `notice_columns` VALUES ('2', '通知公告', 'c');
INSERT INTO `notice_columns` VALUES ('3', '土地政策', null);
INSERT INTO `notice_columns` VALUES ('4', '土地动态', null);

-- ----------------------------
-- Table structure for notice_news
-- ----------------------------
DROP TABLE IF EXISTS `notice_news`;
CREATE TABLE `notice_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_column` varchar(50) DEFAULT NULL COMMENT 'column',
  `notice_title` varchar(50) DEFAULT NULL COMMENT 'title',
  `notice_author` varchar(50) DEFAULT NULL COMMENT 'author',
  `publish_date` date DEFAULT NULL COMMENT 'publish date',
  `edit_date` date DEFAULT NULL COMMENT 'edit date',
  `notice_content` text COMMENT 'content',
  `notice_state` int(2) DEFAULT '0' COMMENT '1publish2draft3Recycle',
  `attachment` varchar(200) DEFAULT NULL COMMENT 'attachment',
  `description` varchar(300) DEFAULT NULL COMMENT 'description',
  `readCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_news
-- ----------------------------
INSERT INTO `notice_news` VALUES ('1', '法律法规', '土地资源法', '李立明', '2015-03-24', null, null, '0', null, '首次添加', '0');
INSERT INTO `notice_news` VALUES ('2', '通知公告', '我省稳步推进土地利用监测监管工作', '宣传员', null, null, 'sdfdsf', '1', null, '', '0');
INSERT INTO `notice_news` VALUES ('3', '新闻速递', '我省稳步推进土地利用监测监管工作', '宣传员', null, null, '<span style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 16px; line-height: 24px;\">自今年1月1日，省启动建设用地供后开发利用巡查监管工作以来，该项工作稳步推进，在五方面取得显著成效。</span><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　一是运用土地市场监测监管系统开展网上排查。上半年累计土地出让公告排查806条;土地供应结果排查1786条，其中，出让合同1264条，划拨决定书494条，租赁合同28条。发现异常，及时与当地国土部门沟通，对异常信息进行认定或更正。上半年,处理各地上报信息撤回16份，撤回项目30个。供后土地开发利用预警信息统计通报。重点统计开、竣工，土地使用权出让价款缴纳等预警信息，按月向省厅土地利用处报表、形成通报报告，督促地方整改。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　二是土地利用动态巡查监管工作。强化培训指导，通过视频培训对全省动态巡查工作进行了人员作巡查管理操作演示，建立了全省土地利用动态巡查业务指导qq群，将所需课件上传到群共享文件中，同时，在线对全省各地提出的业务问题进行解答。根据工作需要，应绥化市、农垦总局、哈尔滨市、齐齐哈尔市申请，派技术人人员协助其开展现场培训，加强档案管理工作。截止到今年4月初，全省各地土地利用动态巡查领导小组和动态巡查人员登记表全部上报完毕，完成了整理、归档工作。日前网上审核工作已正式开启，累计审核巡查人员844名。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　三是开展土地市场运行情况统计分析工作。按月度和季度向厅土地利用处、省财政厅和国土资源部提交土地供应情况统计表、出让情况统计表（含出让金缴纳）、全省各市、县供地率统计表等，按季度编写全省土地市场运行情况分析报告。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　四是现场抽查督办工作。今年6月,配合厅土地利用处对全省范围内的部预警宗地的土地开发利用情况进行了现场抽查和督办工作，共抽查预警宗地127宗，将抽查中发现的问题及时与当地国土局交换意见，督促其按时整改。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　五是土地收购储备监管技术支撑工作。协助厅土地利用处开展全省土地储备监管培训会议，启动土地储备监管人员登记表上报、整理、归档，截至目前，全省60个储备机构注册审核工作已经完成。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　下一步，省土地利用监测中心将继续以建设用地供后开发利用情况和预警信息整改情况检查为突破口，开展现场抽查，提高市、县两级对此项工作的重视程度，督促未开展巡查工作地区尽快启动工作。并拟结合省厅建设用地批准情况开展土地供应数据填报情况核实。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　同时，建议对于城市（镇、场）建成区外基础设施配套未到位导致无法项目实施的宗地，由项目所在地建设部门出具说明，国土分局、乡镇国土所核实后，变更合同；不能净地供应的宗地，供地后或建设中因拆迁原因无法开工或无法继续建设的宗地，建议由国土部门报地方政府处置；政府招商时承诺的扶持政策未兑现的宗地，建议由国土资源部门通知项目投资单位与地方政府协商解决，在规定期限不能开工的，按国家政策处理。通过建立软硬件系统对市、县交地、开工、竣工等节点巡查情况进行定时定轨迹监测，实现对市、县局工作开展情况的统计、监测、分析，为省厅监督考核市、县此项工作开展情况提供量化依据。将网上排查、现场抽查、技术监测等结合起来，建立一套检查考核办法，强化市县主体责任。</div>', '1', null, '', '0');
INSERT INTO `notice_news` VALUES ('4', '新闻速递', '黑龙江省再添11处省级地质公园', '测试员', '2015-06-03', null, '<span style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 12pt; line-height: 1.5;\">为有效保护、合理开发和永续利用地质遗迹资源，近日，经黑龙江省第三批省级地质公园评审委员会审议，宾县大青山等11处地质公园获得省级地质公园资格。</span><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: 宋体; font-size: 12pt; color: rgb(45, 45, 45); line-height: 1.5;\">　　为做好第三批省级地质公园评审工作，省国土资源厅高度重视，多次召开专题会议，并聘请省国土厅、省财政厅、住建厅、林业厅、水利厅、环保厅、旅游局、地矿局等相关人员及省内地质公园专家组成15人评审委员会,按照省第三批省级地质公园评审办法和评审标准,对13个新申报的地质公园进行了评审。本次评审体现出三个特点，一是本次地质公园申报，受到地方政府高度重视，他们希望利用省级地质公园的平台，促进地质遗迹保护和旅游业发展。二是本次申报的地质公园，地质遗迹各具特色，多数已开发并具备一定规模，在地域分布上，弥补了齐齐哈尔市、七台河市、大兴安岭地区没有地质公园的空白，提高了地质公园在全省的覆盖面，对促进我省地质旅游和地学知识的普及将产生深远意义。三是本次评审坚持公平、公正、公开的原则，按照自然属性、可保护属性、保护管理基础三个方面及12项具体评审指标进行了赋分。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: 宋体; font-size: 12pt; color: rgb(45, 45, 45); line-height: 1.5;\">　　最终宾县大青山、鸡冠山、碾子山、麒麟山、双子山、大兴安岭呼中苍山石林、鹤岗金顶山、五营、长寿山、那丹哈达岭、漠河等11个地质公园通过评审。至此我省已有世界级地质公园2个，国家级地质公园6个，省级地质公园24个。(孙佳岩）</p>', '1', null, '', '3');
INSERT INTO `notice_news` VALUES ('5', '土地动态', '农村产权交易中心助力土地流转', '监管系统管理员', '2015-06-04', null, '<span style=\"color: rgb(37, 37, 37); font-family: 宋体, sans-serif; font-size: 14px; line-height: 24px; text-align: justify;\">河北省滦平县农村产权交易中心于4月29日正式成立运营。该中心以农村土地承包经营权交易为主要业务，发挥信息聚集与发布、规范交易等职能作用，促进农业资源要素优化配置。截<b>至目前，共挂牌发布</b>项目信息9个，成功交易3个、面积2213.5亩，合同价款158.8万元。图为5月29日，农民在滦平县农村产权交易中心咨询相关事宜。</span>', '1', null, '', '0');
INSERT INTO `notice_news` VALUES ('6', '土地政策', '我省稳步推进土地利用监测监管工作', '宣传员', '2015-06-08', null, 'sdfsdfasd', '1', null, 'wer', '0');
INSERT INTO `notice_news` VALUES ('8', '新闻速递', '农村产权交易中心助力土地流转', '测试员', null, null, '123123123', '1', null, '11111', '1');
INSERT INTO `notice_news` VALUES ('9', '新闻速递', '国土资源部启动永久基本农田划定专项督察', '中国国土资源报', '2016-03-22', null, '<span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">按照今年政府工作报告提出的“2016年全面完成永久基本农田划定并实行特殊保护”的要求，3月17日下午，国土资源部召开永久基本农田划定情况专项督察动员培训视频会，全面启动永久基本农田划定情况专项督察。根据工作方案，2016年主要对106个重点城市周边永久基本农田划定情况开展督察，督促地方各级人民政府进一步提高对划定永久基本农田重大意义的认识并切实落实主体责任，对于工作推进不力的重点城市、省份，将纳入国务院重点专项督查范围。</span><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　专项督察的总体工作目标包括：重点监督检查106个重点城市周边永久基本农田划定工作完成情况，督促重点城市人民政府于今年6月30日前保质保量完成城市周边永久基本农田划定工作。督促各省（区、市）人民政府加快划定工作，部署落实并同步完成重点城市以外其他设区的城市和县级城市（镇）周边的永久基本农田划定工作。</p><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　根据工作方案，专项督察分部署启动、督察实施、成果汇总3个阶段。其中，3月中旬～6月底为督察实施阶段，各派驻地方的国家土地督察局组织开展宣讲，进行实地核查督导；6月开展重点督察，对达不到要求的重点城市、省份，各土地督察局督促省级人民政府约谈、向省级人民政府通报；7月为成果汇总阶段，主要是形成专项督察报告，确定工作推进不力的重点城市、省份名单，纳入国务院重点专项督查范围，发出整改意见书。</p><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　根据工作方案，2017年，国家土地督察机构还将对永久基本农田划定全面完成情况开展督察。</p><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　国土资源部党组成员、国家土地副总督察严之尧作动员讲话时指出，全面划定永久基本农田，是经济发展新常态下落实新发展理念、落实最严格的耕地保护制度、落实国家粮食安全、新型城镇化和生态文明建设战略的重要举措。专项督察是进一步推进全面划定永久基本农田并实行特殊保护的重要行动，是国家土地督察机构今年“天字第一号”工作。各级国土资源部门、各土地督察局要进一步将思想和行动统一到党中央国务院以及国土资源部党组的决策部署上来，确保按时全面完成划定工作。</p><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　国家土地总督察办公室负责人宣读了《城市周边永久基本农田划定情况专项督察工作方案》，部耕地保护司负责人对划定情况专项督察相关事项作了解读和培训。</p><p align=\"justify\" style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px; line-height: 24px;\">　　部相关司局和直属单位负责人，农业部相关负责人在主会场出席会议。各省级政府分管秘书长、106个重点城市政府分管市长、各省级国土资源和农业主管部门有关负责人在各地分会场出席会议。</p>', '0', null, '', '5');
INSERT INTO `notice_news` VALUES ('10', '通知公告', '测试内容', '测试人员', '2016-06-11', null, '这是一个测试<div><br></div>', '0', null, '', '3');
INSERT INTO `notice_news` VALUES ('11', '土地动态', '黑龙江省闲置土地调查', '测试人员', '2016-06-11', null, '黑龙江省近年新一轮闲置土地调查工作已经展开', '0', null, '', '1');

-- ----------------------------
-- Table structure for survey_data
-- ----------------------------
DROP TABLE IF EXISTS `survey_data`;
CREATE TABLE `survey_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_date` date DEFAULT NULL,
  `survey_name` varchar(20) DEFAULT NULL COMMENT '调查人姓名',
  `survey_address` varchar(100) DEFAULT NULL COMMENT '调查地址',
  `kfqmc` varchar(20) DEFAULT NULL COMMENT '开发区名称',
  `kfqdm` varchar(10) DEFAULT NULL COMMENT '开发区代码',
  `survey_data` text COMMENT '采集数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey_data
-- ----------------------------
INSERT INTO `survey_data` VALUES ('1', '2015-12-21', '张克俭', '哈尔滨宾西开创路', '宾西', 'G231062', null);

-- ----------------------------
-- Table structure for system_map
-- ----------------------------
DROP TABLE IF EXISTS `system_map`;
CREATE TABLE `system_map` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kfq_id` int(11) DEFAULT NULL COMMENT '隶属的开发区编号',
  `map_pid` int(11) DEFAULT NULL COMMENT 'pid',
  `map_group` varchar(200) DEFAULT NULL COMMENT 'group',
  `map_name` varchar(50) DEFAULT NULL COMMENT 'name',
  `map_key` varchar(100) DEFAULT NULL COMMENT 'urlKey',
  `map_url` varchar(200) DEFAULT NULL COMMENT 'map url',
  `description` varchar(300) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_map
-- ----------------------------
INSERT INTO `system_map` VALUES ('1', '5', '0', 'mapserver', '2013年开发区评价地图', 'kaifaqu2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer', '');
INSERT INTO `system_map` VALUES ('2', '7', '1', 'landuse,2013', '宾西2013', 'binxi2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/0', '');
INSERT INTO `system_map` VALUES ('3', '9', '1', 'landuse,2013', '海林2013', 'hailin2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/1', '');
INSERT INTO `system_map` VALUES ('4', '8', '1', 'landuse,2013', '利民2013', 'limin2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/2', '');
INSERT INTO `system_map` VALUES ('5', '11', '1', 'landuse,2013', '牡丹江2013', 'mudanjiang2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/3', '');
INSERT INTO `system_map` VALUES ('6', '12', '1', 'landuse,2013', '绥芬河保税区2013', 'suifenhe2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/4', '');
INSERT INTO `system_map` VALUES ('7', '13', '1', 'landuse,2013', '绥芬河市合作区2013', 'suifenheshi2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/5', '');
INSERT INTO `system_map` VALUES ('8', '11', '1', 'landuse,2013', '绥化2013', 'suihua2013', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/6', '');
INSERT INTO `system_map` VALUES ('9', '5', '0', 'mapserver', '2012年开发区评价地图', 'kaifaqu2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer', '');
INSERT INTO `system_map` VALUES ('10', '7', '9', 'landuse,2012', '宾西2012', 'binxi2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/0', '');
INSERT INTO `system_map` VALUES ('11', '9', '9', 'landuse,2012', '海林2012', 'hailin2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/1', '');
INSERT INTO `system_map` VALUES ('12', '8', '9', 'landuse,2012', '利民2012', 'limin2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/2', '');
INSERT INTO `system_map` VALUES ('13', '10', '9', 'landuse,2012', '牡丹江2012', 'mudanjiang2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/3', '');
INSERT INTO `system_map` VALUES ('14', '12', '9', 'landuse,2012', '绥芬河保税区2012', 'suifenhe2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/4', '');
INSERT INTO `system_map` VALUES ('15', '13', '9', 'landuse,2012', '绥芬河市合作区2012', 'suifenheshi2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/5', '');
INSERT INTO `system_map` VALUES ('16', '11', '9', 'landuse,2012', '绥化2012', 'suihua2012', 'http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/6', '');
INSERT INTO `system_map` VALUES ('17', '7', '0', 'kaifaqu', '2013宾西开发区评价地图', 'binxikaifaqu2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer', '');
INSERT INTO `system_map` VALUES ('18', '7', '17', 'binxi,wjccz,2013', '宾西2013未建成城镇建设用地', 'binxiwjccz2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/1', '');
INSERT INTO `system_map` VALUES ('19', '7', '17', 'binxi,yjccz,2013', '宾西2013已建成城镇建设用地', 'binxiyjccz2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/2', '');
INSERT INTO `system_map` VALUES ('20', '7', '17', 'binxi,qyyd,2013', '宾西2013典型企业用地', 'binxiqyyd2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/0', '');
INSERT INTO `system_map` VALUES ('21', '7', '17', 'binxi,kfq,2013', '宾西2013开发区', 'binxikfq2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/3', '');
INSERT INTO `system_map` VALUES ('22', '7', '17', 'binxi,bkjs,2013', '宾西2013不可建设土地', 'binxibkjs2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/4', '');
INSERT INTO `system_map` VALUES ('23', '7', '17', 'binxi,jbxxmz,2013', '宾西2013基本信息面状图斑', 'binxijbxxmz2013', 'http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/5', '');

-- ----------------------------
-- Table structure for sys_kfq_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_kfq_info`;
CREATE TABLE `sys_kfq_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) NOT NULL COMMENT '父节点编号',
  `kfq_name` varchar(50) NOT NULL COMMENT '开发区名称',
  `is_city` tinyint(4) NOT NULL COMMENT '是否为开发区',
  `enable` tinyint(4) NOT NULL COMMENT '是否启用',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_kfq_info
-- ----------------------------
INSERT INTO `sys_kfq_info` VALUES ('1', '0', '国家级', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('2', '0', '省级', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('3', '0', '示范区', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('4', '1', '国家级综合地图', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('5', '2', '省级综合地图', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('6', '3', '示范区综合地图', '0', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('7', '1', '宾西', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('8', '1', '利民', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('9', '2', '海林', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('10', '2', '牡丹江', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('11', '3', '绥化', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('12', '3', '绥芬河保税区', '1', '1', '无');
INSERT INTO `sys_kfq_info` VALUES ('13', '3', '绥芬河合作区', '1', '1', '无');

-- ----------------------------
-- Table structure for util_fieldname_index
-- ----------------------------
DROP TABLE IF EXISTS `util_fieldname_index`;
CREATE TABLE `util_fieldname_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `en_name` varchar(30) NOT NULL COMMENT '英文名',
  `cn_name` varchar(50) NOT NULL COMMENT '中文名',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `unit` varchar(15) DEFAULT NULL,
  `by_table_name` varchar(100) DEFAULT NULL COMMENT '摘自表名称',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of util_fieldname_index
-- ----------------------------
INSERT INTO `util_fieldname_index` VALUES ('1', 'BH', '编号', '1', '', '表13未建成城镇建设用地数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('2', 'BKJS', '不可建设土地', '1', '', '表14不可建设土地数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('3', 'BL', '比例', '1', '％', '表19开发区土地利用状况统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('4', 'BM', '编码', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('5', 'BZ', '备注', '1', '', '表20开发区闲置土地统计表数据结构', '见《规程》表F.6“类别”');
INSERT INTO `util_fieldname_index` VALUES ('6', 'CFPT', '厂房及配套用地面积', '1', '％', '表22开发区高新技术产业用地统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('7', 'CZRK', '开发区常住人口', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('8', 'DLDM', '地类代码', '1', '万元', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('9', 'DLDM1', '地类代码1', '1', '', '表2开发区土地集约利用评价基础地理信息要素分层表', '等高线等');
INSERT INTO `util_fieldname_index` VALUES ('10', 'DLDM2', '地类代码2', '1', '', '表2开发区土地集约利用评价基础地理信息要素分层表', '高程点等');
INSERT INTO `util_fieldname_index` VALUES ('11', 'DLMC', '地类名称', '1', '万元', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('12', 'DLMC1', '地类名称1', '1', '万元', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('13', 'DLMC2', '地类名称2', '1', '万元', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('14', 'DLMJ', '地类面积', '1', '万元', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容');
INSERT INTO `util_fieldname_index` VALUES ('15', 'DLMJ1', '地类面积1', '1', '万元', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容');
INSERT INTO `util_fieldname_index` VALUES ('16', 'DLMJ2', '地类面积2', '1', '', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容见附录A.20');
INSERT INTO `util_fieldname_index` VALUES ('17', 'DLTCC', '企业内部道路停车场面积', '1', '磅', '表7注记数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('18', 'DMD', '地貌点', '1', '年', '表34开发区尚可供地年数汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('19', 'DMX', '地貌线', '1', '年', '表34开发区尚可供地年数汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('20', 'DMZJ', '地貌注记', '1', '', '表15典型企业用地数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('21', 'DWJCD', '定位基础点', '1', '', '表16土地利用状况注记数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('22', 'DWJCX', '定位基础线', '1', '', '表4面数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('23', 'DWJCZJ', '定位基础注记', '1', '', '表5线数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('24', 'DXDM', '典型企业代码', '1', '', '表28开发区土地集约利用评价结果表数据结构', '见《规程》表F.16、F17“子目标');
INSERT INTO `util_fieldname_index` VALUES ('25', 'ESCYSSZE', '开发区二、三产业税收总额', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('26', 'GD', '高度', '1', '', '表6点数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('27', 'GDZCTZZE', '开发区工业（物流）企业固定资产投资总额', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('28', 'GDZDZ', '前五年年供应用地面积最大值', '1', '磅', '表16土地利用状况注记数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('29', 'GHDM', '规划用途代码', '1', '公顷', '表30开发区土地集约利用结构潜力测算表数据结构', '工业主导型填写本项内容');
INSERT INTO `util_fieldname_index` VALUES ('30', 'GHJDMJ', '规划建筑基底面积', '1', '', '表26开发区土地集约利用程度评价指标权重表数据结构', '见《规程》表F.12、F13“子目标');
INSERT INTO `util_fieldname_index` VALUES ('31', 'GHJZMD', '规划建筑密度', '1', '', '表26开发区土地集约利用程度评价指标权重表数据结构', '见《规程》表F.12、F13目标');
INSERT INTO `util_fieldname_index` VALUES ('32', 'GHJZMJ', '规划建筑面积', '1', '', '表27开发区土地集约利用程度评价指标汇总表数据结构', '见《规程》表F.14、F15“目标');
INSERT INTO `util_fieldname_index` VALUES ('33', 'GHRJL', '规划容积率', '1', '', '表27开发区土地集约利用程度评价指标汇总表数据结构', '见《规程》表F.14、F15“评价指标');
INSERT INTO `util_fieldname_index` VALUES ('34', 'GHYT', '规划用途', '1', '', '表26开发区土地集约利用程度评价指标权重表数据结构', '见《规程》表F.12、F13“指标”');
INSERT INTO `util_fieldname_index` VALUES ('35', 'GKCCMJ', '供应工矿仓储用地面积', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('36', 'GLJG', '开发区管理机构', '1', '', '表5线数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('37', 'GLJGDZ', '开发区管理机构地址', '1', '', '表6点数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('38', 'GXDM', '高新技术产业用地类别代码', '1', '人', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('39', 'GXLB', '高新技术产业用地类别', '1', '万平方米', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('40', 'GXSR', '高新技术产业收入', '1', '人', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('41', 'GXSS', '高新技术产业税收', '1', '人', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('42', 'GXSSZE', '开发区高新技术产业税收总额', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('43', 'GXYDMJ', '高新技术产业用地面积', '1', '万平方米', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('44', 'GXZSBL', '高新技术产业用地面积折算比例', '1', '万平方米', '表23开发区建筑工程状况统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('45', 'GXZSR', '开发区高新技术产业总收入', '1', '公顷', '表21开发区闲置土地情况调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('46', 'GYDM', '供应类型代码', '1', '', '表18开发区用地审批及调整情况调查表数据结构', '格式：YYYYMM');
INSERT INTO `util_fieldname_index` VALUES ('47', 'GYLX', '供应类型', '1', '', '表21开发区闲置土地情况调查表数据结构', '格式：YYYYMM');
INSERT INTO `util_fieldname_index` VALUES ('48', 'GYMJ', '供应土地面积', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('49', 'GYSJ', '供应时间', '1', '', '表24开发区土地供应情况统计表数据结构', '格式：YYYY');
INSERT INTO `util_fieldname_index` VALUES ('50', 'GYSSZE', '开发区工业（物流）企业税收总额', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('51', 'GYZSR', '开发区工业（物流）企业总收入', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('52', 'HYDM', '行业代码', '1', '', '表18开发区用地审批及调整情况调查表数据结构', '见《规程》表F.3“项目”');
INSERT INTO `util_fieldname_index` VALUES ('53', 'HYLB', '行业类别', '1', '', '表19开发区土地利用状况统计表数据结构', '见《规程》表F.4、F5“编码');
INSERT INTO `util_fieldname_index` VALUES ('54', 'JBXXD', '开发区基本信息点状地物', '1', '', '表29开发区土地集约利用扩展潜力测算表数据结构', '见《规程》表G1“项目”');
INSERT INTO `util_fieldname_index` VALUES ('55', 'JBXXM', '开发区基本信息面状图斑', '1', '', '表31开发区土地集约利用强度潜力测算表数据结构', '见《规程》表G3“项目”');
INSERT INTO `util_fieldname_index` VALUES ('56', 'JBXXX', '开发区基本信息线状地物', '1', '', '表30开发区土地集约利用结构潜力测算表数据结构', '见《规程》表G2“项目”');
INSERT INTO `util_fieldname_index` VALUES ('57', 'JBXXZJ', '开发区基本信息注记', '1', '', '表7注记数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('58', 'JDZMJ', '建筑物构筑物基底、露天堆场和露天操作场地的总面积', '1', '公顷', '表34开发区尚可供地年数汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('59', 'JGQL', '结构潜力', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('60', 'JTM', '交通面', '1', '', '表33开发区土地集约利用潜力汇总表数据结构', '见《规程》表G5“潜力类型”');
INSERT INTO `util_fieldname_index` VALUES ('61', 'JTZJ', '交通注记', '1', '', '表8基本信息面状图斑数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('62', 'JZJDMJ', '建筑基底面积', '1', '', '表21开发区闲置土地情况调查表数据结构', '格式：YYYYMM');
INSERT INTO `util_fieldname_index` VALUES ('63', 'JZMJ', '建筑面积', '1', '', '表2开发区土地集约利用评价基础地理信息要素分层表', '各级行政界线');
INSERT INTO `util_fieldname_index` VALUES ('64', 'JZXS', '建筑系数', '1', '％', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('65', 'KD', '宽度', '1', '', '表9基本信息线状地物数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('66', 'KFQDM', '开发区代码', '1', '万平方米', '表12已建成城镇设用地数据结构', '工矿仓储用地填写本项内容');
INSERT INTO `util_fieldname_index` VALUES ('67', 'KFQJB', '开发区级别', '1', '', '表22开发区高新技术产业用地统计表数据结构', '见《规程》表F.8“类别”');
INSERT INTO `util_fieldname_index` VALUES ('68', 'KFQMC', '开发区名称', '1', '', '表19开发区土地利用状况统计表数据结构', '见《规程》表F.4、F5“类别');
INSERT INTO `util_fieldname_index` VALUES ('69', 'KFQPJFW', '开发区评价范围', '1', '', '表22开发区高新技术产业用地统计表数据结构', '见《规程》表F.8“编码”');
INSERT INTO `util_fieldname_index` VALUES ('70', 'KFQPJLX', '开发区评价类型', '1', '', '表23开发区建筑工程状况统计表数据结构', '见《规程》表F.9“项目”');
INSERT INTO `util_fieldname_index` VALUES ('71', 'KFQPJMJ', '开发区评价面积', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('72', 'KFQSPLX', '开发区审批类型', '1', '', '表10基本信息点状地物数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('73', 'KGDNSI', '尚可供地年数I', '1', '公顷', '表32开发区土地集约利用管理潜力测算表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('74', 'KGDNSI', '尚可供地年数II', '1', '公顷', '表33开发区土地集约利用潜力汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('75', 'KQTZHMJ', '扩区或调整后总面积', '1', '', '表12已建成城镇设用地数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('76', 'KQTZMJ', '扩区或调整面积', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('77', 'KQTZSJ', '扩区或调整时间', '1', '万平方米', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('78', 'KZQL', '扩展潜力', '1', '公顷', '表34开发区尚可供地年数汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('79', 'LB', '类别', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('80', 'LD', '绿地面积', '1', '公顷', '表24开发区土地供应情况统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('81', 'LTCD', '露天堆场、露天操作场地面积', '1', '公顷', '表24开发区土地供应情况统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('82', 'LXZ', '理想值', '1', '％', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('83', 'LXZYJ', '理想值确定依据', '1', '', '表10基本信息点状地物数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('84', 'LYZKZJ', '土地利用状况注记', '1', '', '表11基本信息注记数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('85', 'MB', '目标', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('86', 'MBBSM', '目标标识码', '1', '万元', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('87', 'MBQZ', '目标集约度分值', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('88', 'MBQZ', '目标权重值', '1', '', '表12已建成城镇设用地数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('89', 'MJ', '面积', '1', '公顷', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('90', 'NBYLD', '厂区内部预留地面积', '1', '公顷', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('91', 'NF', '年份', '1', '万平方米', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('92', 'NJGD', '前三年年均供应用地面积', '1', '公顷', '表18开发区用地审批及调整情况调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('93', 'PJDXQZ', '评价对象权重值', '1', '', '表14不可建设土地数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('94', 'PJDXQZ', '评价范围集约度分值', '1', '', '表15典型企业用地数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('95', 'PJZB', '评价指标', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('96', 'PZDM', '批准用途代码', '1', '', '表34开发区尚可供地年数汇总表数据结构', '见《规程》表G6“用地类型”');
INSERT INTO `util_fieldname_index` VALUES ('97', 'PZYT', '批准用途', '1', '', '表3开发区土地集约利用评价信息要素分层表', '见本表注');
INSERT INTO `util_fieldname_index` VALUES ('98', 'QDQL', '强度潜力', '1', '公顷', '表34开发区尚可供地年数汇总表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('99', 'QLGC', '潜力构成', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('100', 'QLLX', '潜力类型', '1', '万元', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('101', 'QS', '权属', '1', '', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容见附录A.20');
INSERT INTO `util_fieldname_index` VALUES ('102', 'QT', '其他用地面积', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('103', 'QYDZ', '企业地址', '1', '', '表16土地利用状况注记数据结构', '见附录A.1');
INSERT INTO `util_fieldname_index` VALUES ('104', 'QYMC', '企业名称', '1', '', '表12已建成城镇设用地数据结构', '见附录A.10');
INSERT INTO `util_fieldname_index` VALUES ('105', 'QYRS', '企业人数', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('106', 'QYYD', '典型企业用地', '1', '万元', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('107', 'QYYDMJ', '企业用地面积', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('108', 'RDSJ', '认定为闲置土地的时间', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('109', 'RDYJ', '认定依据', '1', '', '表28开发区土地集约利用评价结果表数据结构', '见《规程》表F.16、F17“目标');
INSERT INTO `util_fieldname_index` VALUES ('110', 'RJL', '容积率', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.10');
INSERT INTO `util_fieldname_index` VALUES ('111', 'SLSJ', '开发区设立时间', '1', '', '表9基本信息线状地物数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('112', 'SPDW', '开发区审批单位', '1', '', '表7注记数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('113', 'SPTDZMJ', '开发区依法审批土地总面积', '1', '', '表8基本信息面状图斑数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('114', 'SSPJFW', '所属评价范围', '1', '', '表28开发区土地集约利用评价结果表数据结构', '见《规程》表F.16、F17指标');
INSERT INTO `util_fieldname_index` VALUES ('115', 'SSZE', '税收总额', '1', '公顷', '表4面数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('116', 'SXM', '水系面', '1', '', '表14不可建设土地数据结构', '见附录A.10');
INSERT INTO `util_fieldname_index` VALUES ('117', 'SXZJ', '水系注记', '1', '', '表15典型企业用地数据结构', '见附录A.10');
INSERT INTO `util_fieldname_index` VALUES ('118', 'SYNX', '使用年限', '1', '％', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容见附录A.21');
INSERT INTO `util_fieldname_index` VALUES ('119', 'SYQSJ', '获得使用权时间', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('120', 'SYZ', '使用者', '1', '', '表12已建成城镇设用地数据结构', '见附录A.11');
INSERT INTO `util_fieldname_index` VALUES ('121', 'TBBH', '图斑编号', '1', '万元', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('122', 'TDKFL', '土地开发率', '1', '', '表20开发区闲置土地统计表数据结构', '见《规程》表F.6“编码”');
INSERT INTO `util_fieldname_index` VALUES ('123', 'TDMJ', '土地面积', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('124', 'TDSYZ', '土地使用者', '1', '公顷', '表12已建成城镇设用地数据结构', '高新技术产业用地填写本项内容见附录A.21');
INSERT INTO `util_fieldname_index` VALUES ('125', 'TDXZQK', '土地闲置情况', '1', '', '表27开发区土地集约利用程度评价指标汇总表数据结构', '见《规程》表F.14、F15子目标');
INSERT INTO `util_fieldname_index` VALUES ('126', 'TDZPG', '土地招拍挂情况', '1', '', '表4面数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('127', 'WCTZ', '实际完成累计固定资产投资', '1', '弧度', '表7注记数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('128', 'WJCCZ', '未建成城镇建设用地', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.11');
INSERT INTO `util_fieldname_index` VALUES ('129', 'XM', '项目', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('130', 'XZB', 'X坐标', '1', '公顷', '表22开发区高新技术产业用地统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('131', 'XZBG', '企业内部行政办公及生活服务设施用地面积', '1', '公顷', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('132', 'XZQJX', '行政区界线', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('133', 'XZQM', '行政区面', '1', '', '表32开发区土地集约利用管理潜力测算表数据结构', '见《规程》表G4“项目”');
INSERT INTO `util_fieldname_index` VALUES ('134', 'XZQZJ', '行政区注记', '1', '', '表14不可建设土地数据结构', '见附录A.11');
INSERT INTO `util_fieldname_index` VALUES ('135', 'XZZ', '现状值', '1', '％', '表30开发区土地集约利用结构潜力测算表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('136', 'YDLX', '用地类型', '1', '万元', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('137', 'YJCCZ', '己建成城镇建设用地', '1', '', '表12已建成城镇设用地数据结构', '见附录A.11');
INSERT INTO `util_fieldname_index` VALUES ('138', 'YJZTZ', '预计固定资产总投资', '1', '弧度', '表16土地利用状况注记数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('139', 'YSDM', '要素代码', '1', '万元', '表25开发区典型企业情况调查表', '');
INSERT INTO `util_fieldname_index` VALUES ('140', 'YSMC', '要素名称', '1', '', '表12已建成城镇设用地数据结构', '见附录A.11');
INSERT INTO `util_fieldname_index` VALUES ('141', 'YSMJ', '要素面积', '1', '公顷', '表19开发区土地利用状况统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('142', 'YT', '用途', '1', '', '表12已建成城镇设用地数据结构', '见附录A.12');
INSERT INTO `util_fieldname_index` VALUES ('143', 'YZB', 'Y坐标', '1', '公顷', '表29开发区土地集约利用扩展潜力测算表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('144', 'ZB', '指标', '1', '万元', '表8基本信息面状图斑数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('145', 'ZBQZ', '指标标准化值', '1', '', '表14不可建设土地数据结构', '见附录A.12');
INSERT INTO `util_fieldname_index` VALUES ('146', 'ZBQZ', '指标权重值', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.12');
INSERT INTO `util_fieldname_index` VALUES ('147', 'ZCZ', '总产值', '1', '米', '表10基本信息点状地物数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('148', 'ZDBH', '宗地编号', '1', '', '表12已建成城镇设用地数据结构', '见附录A.12');
INSERT INTO `util_fieldname_index` VALUES ('149', 'ZDCY', '开发区主导产业', '1', '', '表11基本信息注记数据结构', '见表1');
INSERT INTO `util_fieldname_index` VALUES ('150', 'ZHFZ', '综合分值', '1', '', '表12已建成城镇设用地数据结构', '见附录A.12');
INSERT INTO `util_fieldname_index` VALUES ('151', 'ZJBS', '磅数', '1', '％', '表20开发区闲置土地统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('152', 'ZJFX', '注记方向', '1', '公顷', '表20开发区闲置土地统计表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('153', 'ZJNR', '注记内容', '1', '', '表12已建成城镇设用地数据结构', '见附录A.13');
INSERT INTO `util_fieldname_index` VALUES ('154', 'ZJXH', '下划线', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.13');
INSERT INTO `util_fieldname_index` VALUES ('155', 'ZJXZ', '形状', '1', '', '表14不可建设土地数据结构', '见附录A.13');
INSERT INTO `util_fieldname_index` VALUES ('156', 'ZJYS', '颜色', '1', '', '表12已建成城镇设用地数据结构', '见附录A.13');
INSERT INTO `util_fieldname_index` VALUES ('157', 'ZJZMJ', '建筑物构筑物基底、露天堆场和露天操作场地的总面积', '1', '公顷', '表15典型企业用地数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('158', 'ZJZMJ', '总建筑面积', '1', '公顷', '表31开发区土地集约利用强度潜力测算表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('159', 'ZJZT', '字体', '1', '', '表12已建成城镇设用地数据结构', '见附录A.13');
INSERT INTO `util_fieldname_index` VALUES ('160', 'ZL', '坐落', '1', '', '表12已建成城镇设用地数据结构', '见附录A.14');
INSERT INTO `util_fieldname_index` VALUES ('161', 'ZLLY', '资料来源', '1', '', '表13未建成城镇建设用地数据结构', '见附录A.14');
INSERT INTO `util_fieldname_index` VALUES ('162', 'ZMB', '子目标', '1', '万元', '表17开发区基本信息调查表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('163', 'ZMBQZ', '子目标集约度分值', '1', '', '表12已建成城镇设用地数据结构', '见附录A.15');
INSERT INTO `util_fieldname_index` VALUES ('164', 'ZMBQZ', '子目标权重值', '1', '', '表14不可建设土地数据结构', '见附录A.14');
INSERT INTO `util_fieldname_index` VALUES ('165', 'ZSR', '总收入', '1', '米', '表10基本信息点状地物数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('166', 'ZTDMJBL', '占土地面积比例', '1', '％', '表30开发区土地集约利用结构潜力测算表数据结构', '');
INSERT INTO `util_fieldname_index` VALUES ('171', 'OBJECTID_1', '要素编号', '1', '', '', '通用类型');
INSERT INTO `util_fieldname_index` VALUES ('172', 'OBJECTID', '要素编号', '1', '', '', '通用字段');

-- ----------------------------
-- Table structure for u_dept_info
-- ----------------------------
DROP TABLE IF EXISTS `u_dept_info`;
CREATE TABLE `u_dept_info` (
  `dept_id` varchar(10) NOT NULL COMMENT '部门id，如010102',
  `dept_name` varchar(50) NOT NULL COMMENT '部门名称',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否可用',
  `description` text COMMENT '部门职能说明',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_dept_info
-- ----------------------------
INSERT INTO `u_dept_info` VALUES ('0100000000', '黑龙江省', '1', '<b style=\"color: rgb(0, 0, 0);\">管辖</b><font color=\"#ff0000\">重庆</font><span style=\"color: rgb(0, 0, 0);\">市下辖所有土地流转业务。</span>');
INSERT INTO `u_dept_info` VALUES ('0101000000', '国土部门', '1', '国土相关部门');
INSERT INTO `u_dept_info` VALUES ('0101010000', '土地流转处', '1', '<span style=\"color: rgb(0, 0, 0);\">管辖重庆市下辖所有</span><font color=\"#ff0000\"><b>土地流转业务</b></font>。');
INSERT INTO `u_dept_info` VALUES ('0101010100', 'test', '1', 'test');
INSERT INTO `u_dept_info` VALUES ('0101010101', 'tst2', '1', 'ttest2');
INSERT INTO `u_dept_info` VALUES ('0101010102', '添加', '0', '添加子部门。');
INSERT INTO `u_dept_info` VALUES ('0101010103', '333', '1', '333');
INSERT INTO `u_dept_info` VALUES ('0101020000', '耕地保护处', '1', '承担耕地保护工作；承担依据土地利用总体规划实施基本农田的划定、调整工作；承担土地整理复垦开发工作；承担耕地总量动态平衡和建设占用耕地占补平衡工作；承担耕地保护责任目标考核的有关工作');
INSERT INTO `u_dept_info` VALUES ('0101030000', '建设用地处', '1', '承担农用地转用和农村集体土地征收、征用的管理；承办农用地转用和土地征收、征用的审查及报批管理工作；承担新增建设用地批后实施的监管工作；组织调处土地征收、征用补偿安置重大争议；承担农村集体建设用地的管理工作。');
INSERT INTO `u_dept_info` VALUES ('0102000000', '长寿区', '1', '管辖<b>长寿区</b>下辖所有土地流转业务。');
INSERT INTO `u_dept_info` VALUES ('0102010000', '凤城镇', '1', '管辖凤城镇下辖所有土地流转业务。<br>');
INSERT INTO `u_dept_info` VALUES ('0102010100', '三洞村', '1', '管辖三洞村下辖所有土地流转业务。');
INSERT INTO `u_dept_info` VALUES ('0102020000', '江南镇', '1', '管辖江南镇下辖所有土地流转业务。');
INSERT INTO `u_dept_info` VALUES ('0200000000', '长沙市', '1', '长沙市');
INSERT INTO `u_dept_info` VALUES ('0201000000', '芙蓉区', '1', '芙蓉区');
INSERT INTO `u_dept_info` VALUES ('0201010000', 'ccc', '1', 'ccc');
INSERT INTO `u_dept_info` VALUES ('0201010100', 'dddd', '0', 'ddd');
INSERT INTO `u_dept_info` VALUES ('0201010101', 'ffff', '1', 'ffff');
INSERT INTO `u_dept_info` VALUES ('0201010102', 'ggg', '0', 'ggg');
INSERT INTO `u_dept_info` VALUES ('0300000000', 'del', '1', 'del');

-- ----------------------------
-- Table structure for u_right_info
-- ----------------------------
DROP TABLE IF EXISTS `u_right_info`;
CREATE TABLE `u_right_info` (
  `right_id` varchar(10) NOT NULL COMMENT '权限id',
  `right_name` varchar(100) NOT NULL COMMENT '权限名称',
  `right_index` varchar(50) DEFAULT NULL COMMENT '权限索引，用于快速查找',
  `url` varchar(300) DEFAULT NULL COMMENT '权限链接',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `description` text COMMENT '权限说明',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_right_info
-- ----------------------------
INSERT INTO `u_right_info` VALUES ('0100000000', '农村土地流转全过程监管系统', null, null, '1', '查看农村土地流转全过程监管系统。');
INSERT INTO `u_right_info` VALUES ('0101000000', '信息管理与发布', null, 'tree_infoPubManager', '1', '信息管理与发布<b>。</b>');
INSERT INTO `u_right_info` VALUES ('0101010000', '建言献策', null, 'infoArticleJYXCTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101020000', '违法监察', null, 'infoArticleWFJCTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101030000', '办事指南', null, 'infoArticleBSZNTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101040000', '业务介绍', null, 'infoArticleYWJSTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101050000', '法律法规', null, 'infoArticleFLFGTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101060000', '政策解读', null, 'infoArticleZCJDTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101070000', '标准规范', null, 'infoArticleBZGFTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0101080000', '常见问题解答', null, 'infoArticleCJWTTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0102000000', '现状', null, 'tree_xianzhuang', '1', '现状');
INSERT INTO `u_right_info` VALUES ('0102010000', '现场调查', '', 'fieldWatchPanel', '1', '');
INSERT INTO `u_right_info` VALUES ('0102020000', '撂荒地查询', '', 'fieldLhdPanel', '1', '');
INSERT INTO `u_right_info` VALUES ('0102030000', '废弃地查询', '', 'fieldFqdPanel', '1', '');
INSERT INTO `u_right_info` VALUES ('0102040000', '空心村查询', '', 'fieldKxcPanel', '1', '');
INSERT INTO `u_right_info` VALUES ('0103000000', '规划', null, 'tree_guihua', '0', '规划。');
INSERT INTO `u_right_info` VALUES ('0103010000', '项目与规划', null, 'xiangmu_guihua', '1', '');
INSERT INTO `u_right_info` VALUES ('0103010100', '项目创建', null, '301', '1', '');
INSERT INTO `u_right_info` VALUES ('0103010200', '项目管理', null, '302', '1', '');
INSERT INTO `u_right_info` VALUES ('0103010300', '规划复垦区域', null, '303', '1', '');
INSERT INTO `u_right_info` VALUES ('0103010400', '生成规划报告', null, '304', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020000', '复垦申请管理', null, 'fukenshenqingguanli', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020100', '填写复垦申请', null, '401', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020200', '上传权利证明', null, '402', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020300', '撤销及修改申请', null, '403', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020400', '审核申请', null, '404', '1', '');
INSERT INTO `u_right_info` VALUES ('0103020500', '查看申请状态', null, '405', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030000', '公告及意见', null, 'gonggao_yijian', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030100', '查看公告', null, '601', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030200', '添加公告', null, '602', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030300', '发表意见', null, '603', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030400', '查看意见', null, '604', '1', '');
INSERT INTO `u_right_info` VALUES ('0103030500', '意见统计', null, '605', '1', '');
INSERT INTO `u_right_info` VALUES ('0104000000', '拆迁', null, 'tree_chaiqian', '1', '拆迁');
INSERT INTO `u_right_info` VALUES ('0104010000', '拆迁过程管理', '', 'cq_chaiqianguochengguanli', '1', '');
INSERT INTO `u_right_info` VALUES ('0104010100', '录入面积', null, '501', '1', '');
INSERT INTO `u_right_info` VALUES ('0104010200', '确认拆迁信息', null, '502', '1', '');
INSERT INTO `u_right_info` VALUES ('0104010300', '确认补偿信息', null, '503', '1', '');
INSERT INTO `u_right_info` VALUES ('0104010400', '管理拆迁日志', null, '504', '1', '');
INSERT INTO `u_right_info` VALUES ('0104010500', '管理农户确认汇总表', null, '505', '1', '');
INSERT INTO `u_right_info` VALUES ('0104020000', '监测监控', '', 'cq_jiancejiankong', '1', '');
INSERT INTO `u_right_info` VALUES ('0104020100', '拆迁过程监控', null, '701', '1', '');
INSERT INTO `u_right_info` VALUES ('0104020200', '补偿监测', null, '702', '1', '');
INSERT INTO `u_right_info` VALUES ('0104020300', '安置监测', null, '703', '1', '');
INSERT INTO `u_right_info` VALUES ('0104020400', '拆迁进度监控', null, '704', '1', '');
INSERT INTO `u_right_info` VALUES ('0104030000', '预警管理', '', 'cq_yujingguanli', '1', '');
INSERT INTO `u_right_info` VALUES ('0104030100', '预警规则管理', null, '801', '1', '');
INSERT INTO `u_right_info` VALUES ('0104030200', '预警日志管理', null, '802', '1', '');
INSERT INTO `u_right_info` VALUES ('0104040000', '入库备案', null, 'cq_rukubeian', '1', '');
INSERT INTO `u_right_info` VALUES ('0104040100', '上传备案资料', null, '901', '1', '');
INSERT INTO `u_right_info` VALUES ('0104040200', '审核备案资料', null, '902', '1', '');
INSERT INTO `u_right_info` VALUES ('0104040300', '查看审核状态', null, '903', '1', '');
INSERT INTO `u_right_info` VALUES ('0105000000', '复垦及验收', null, 'tree_fukenyanshou', '1', '复垦及验收');
INSERT INTO `u_right_info` VALUES ('0105010000', '项目管理', '', 'manageProject', '1', '');
INSERT INTO `u_right_info` VALUES ('0105020000', '复垦信息公告', null, 'syrSchemeShow', '1', null);
INSERT INTO `u_right_info` VALUES ('0105030000', '复垦过程监控', null, 'syrDataManagement', '1', null);
INSERT INTO `u_right_info` VALUES ('0105040000', '验收申请', '', 'acceptApply', '1', '');
INSERT INTO `u_right_info` VALUES ('0105050000', '复垦验收评价', '', 'fk_fukenyanshoupingjia', '1', '');
INSERT INTO `u_right_info` VALUES ('0105050200', '质量评价', null, 'EvaluateSelectProject', '1', null);
INSERT INTO `u_right_info` VALUES ('0105050300', '复垦评价报告', null, 'EvaluateReport', '1', null);
INSERT INTO `u_right_info` VALUES ('0105060000', '监管预警', null, 'RegulatoryWarning', '1', null);
INSERT INTO `u_right_info` VALUES ('0106000000', '交易', null, 'tree_jiaoyi', '1', '交易');
INSERT INTO `u_right_info` VALUES ('0106010000', '交易态势查询', null, 'TaishiFind', '1', null);
INSERT INTO `u_right_info` VALUES ('0106020000', '按交易价格分析', null, 'TaishiPrice', '1', null);
INSERT INTO `u_right_info` VALUES ('0106030000', '按交易量分析', null, 'TaishiVolume', '1', null);
INSERT INTO `u_right_info` VALUES ('0106040000', '按交易次数分析', null, 'TaishiNumber', '1', null);
INSERT INTO `u_right_info` VALUES ('0106050000', '按交易区域分析', null, 'TaishiArea', '1', null);
INSERT INTO `u_right_info` VALUES ('0106060000', '交易态势异常分析', null, 'TaishiAlarm', '1', null);
INSERT INTO `u_right_info` VALUES ('0106070000', '交易风险预警', null, 'abnmDkTransSupervisionTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0107000000', '使用', null, 'tree_shiyong', '1', '使用');
INSERT INTO `u_right_info` VALUES ('0107010000', '监测抽样', null, 'use_MonitoringSampling', '1', '');
INSERT INTO `u_right_info` VALUES ('0107020000', '抽样结果', null, 'use_MonitorResult', '1', '');
INSERT INTO `u_right_info` VALUES ('0108000000', '监管', null, 'tree_jianguan', '1', '监管');
INSERT INTO `u_right_info` VALUES ('0108010000', '全过程异常监管', null, 'abnmWholeSupervisionTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0108020000', '意见征集与舆情分析', '', 'jg_yijianzhengji', '1', '');
INSERT INTO `u_right_info` VALUES ('0108020100', '网上投票管理', null, 'infoVoteTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0108020200', '群众来信管理', null, 'infoLetterTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0108020300', '违规流转投诉举报管理', '', 'infoReportTab', '1', '');
INSERT INTO `u_right_info` VALUES ('0108030000', '巡查监察', '', 'abnmXunChaTab', '1', '');
INSERT INTO `u_right_info` VALUES ('0108040000', '监察信息查询统计', null, 'abnmSupInfoTab', '1', '');
INSERT INTO `u_right_info` VALUES ('0109000000', '数据管理', null, 'tree_shujuguanli', '1', '数据管理');
INSERT INTO `u_right_info` VALUES ('0109010000', '备份与恢复', null, 'db_BackupRecoveryData', '1', '空间数据库。');
INSERT INTO `u_right_info` VALUES ('0109020000', '用户管理', null, 'db_UserPrivilegeManagerTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0109030000', '系统运行日志', null, 'db_SystemLogTab', '1', null);
INSERT INTO `u_right_info` VALUES ('0109050000', '企业黑名单', '', 'db_BlacklistTab', '1', '');
INSERT INTO `u_right_info` VALUES ('0200000000', '地图资源权限', null, '', '1', '');
INSERT INTO `u_right_info` VALUES ('0201000000', '抽样数据', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer', '1', '高青山负责模块的MapServer URL。');
INSERT INTO `u_right_info` VALUES ('0201010000', '抽样范围', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/0', '1', '<div><span style=\"font-family: Tahoma;\">双龙镇，城镇土地</span><font face=\"tahoma, arial, verdana, sans-serif\">。</font></div>');
INSERT INTO `u_right_info` VALUES ('0201020000', '抽样底图', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/1', '1', '双龙镇抽样总体<br>');
INSERT INTO `u_right_info` VALUES ('0201030000', '知识层', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/2', '1', '主驱动力。');
INSERT INTO `u_right_info` VALUES ('0201040000', '报告层', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/3', '1', '双龙镇行政区划图。');
INSERT INTO `u_right_info` VALUES ('0201050000', '样本层', null, 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/4', '1', '双龙镇区域');
INSERT INTO `u_right_info` VALUES ('0201060000', '抽样地图', 'chouyang', 'http://localhost:6080/arcgis/rest/services/chouyang/MapServer', '1', '');
INSERT INTO `u_right_info` VALUES ('0202000000', '复垦验收', null, '', '1', '王伟的复垦验收模块');
INSERT INTO `u_right_info` VALUES ('0202010000', '复垦项目', 'fukenxiangmu', 'http://localhost:6080/arcgis/rest/services/fukenxiangmu/MapServer', '1', '复垦项目的MapServer，应用于【复垦及验收】-&gt;【复垦项目登记与管理】中。');
INSERT INTO `u_right_info` VALUES ('0203000000', '基础底图', null, '', '1', '');
INSERT INTO `u_right_info` VALUES ('0203010000', '长寿区镇级行政区', 'csqzjxzq', 'http://localhost:6080/arcgis/rest/services/csqzjxzq/MapServer', '1', '');
INSERT INTO `u_right_info` VALUES ('0204000000', '复垦进度', null, '', '1', '');
INSERT INTO `u_right_info` VALUES ('0204010000', '复垦进度图', 'fukenjindu', 'http://localhost:6080/arcgis/rest/services/fukenjindu/MapServer', '1', '');
INSERT INTO `u_right_info` VALUES ('0204020000', '复垦进度遥感影像图', 'fukenjindursimage', 'http://localhost:6080/arcgis/rest/services/fukenjindursimage/MapServer', '1', '');
INSERT INTO `u_right_info` VALUES ('0205000000', '交易预警', null, '', '1', '');
INSERT INTO `u_right_info` VALUES ('0205010000', '交易风险', 'jiaoyifengxian', 'http://localhost:6080/arcgis/rest/services/jiaoyifengxian/MapServer', '1', '');
INSERT INTO `u_right_info` VALUES ('0206000000', '现状', null, '', '1', '');
INSERT INTO `u_right_info` VALUES ('0206010000', '现状图', null, 'http://localhost:6080/arcgis/rest/services/xianzhuang/MapServer', '1', '');

-- ----------------------------
-- Table structure for u_role_info
-- ----------------------------
DROP TABLE IF EXISTS `u_role_info`;
CREATE TABLE `u_role_info` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name_cn` varchar(30) NOT NULL COMMENT '角色中文名称',
  `role_name` varchar(30) DEFAULT 'ROLE_OPER' COMMENT '角色名称',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `description` text COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_info
-- ----------------------------
INSERT INTO `u_role_info` VALUES ('1', '超级管理员', 'ROLE_ADMIN', '1', '管理重庆市下辖所有土流业务。');
INSERT INTO `u_role_info` VALUES ('2', '地图管理员', 'ROLE_MAP', '1', '管理长寿区下辖业务。');
INSERT INTO `u_role_info` VALUES ('3', '业务员', 'ROLE_USER', '1', '管理凤城镇下辖业务。');
INSERT INTO `u_role_info` VALUES ('4', '操作员', 'ROLE_OPER', '1', '管理<b>关口村</b>下辖所有业务。');

-- ----------------------------
-- Table structure for u_role_right
-- ----------------------------
DROP TABLE IF EXISTS `u_role_right`;
CREATE TABLE `u_role_right` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统自增字段',
  `role_id` varchar(10) NOT NULL COMMENT '角色id',
  `right_id` varchar(10) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_right
-- ----------------------------
INSERT INTO `u_role_right` VALUES ('2', '6', '0101000000');
INSERT INTO `u_role_right` VALUES ('3', '6', '0100000000');
INSERT INTO `u_role_right` VALUES ('4', '6', '0101010000');
INSERT INTO `u_role_right` VALUES ('5', '6', '0101020000');
INSERT INTO `u_role_right` VALUES ('6', '1', '0109000000');
INSERT INTO `u_role_right` VALUES ('7', '1', '0100000000');
INSERT INTO `u_role_right` VALUES ('8', '1', '0101000000');
INSERT INTO `u_role_right` VALUES ('9', '1', '0101010000');
INSERT INTO `u_role_right` VALUES ('10', '1', '0101020000');
INSERT INTO `u_role_right` VALUES ('11', '1', '0101030000');
INSERT INTO `u_role_right` VALUES ('12', '1', '0101040000');
INSERT INTO `u_role_right` VALUES ('13', '1', '0101050000');
INSERT INTO `u_role_right` VALUES ('14', '1', '0101060000');
INSERT INTO `u_role_right` VALUES ('15', '1', '0101070000');
INSERT INTO `u_role_right` VALUES ('16', '1', '0101080000');
INSERT INTO `u_role_right` VALUES ('17', '1', '0102000000');
INSERT INTO `u_role_right` VALUES ('18', '1', '0102010000');
INSERT INTO `u_role_right` VALUES ('19', '1', '0102020000');
INSERT INTO `u_role_right` VALUES ('20', '1', '0102030000');
INSERT INTO `u_role_right` VALUES ('21', '1', '0102040000');
INSERT INTO `u_role_right` VALUES ('22', '1', '0103000000');
INSERT INTO `u_role_right` VALUES ('23', '1', '0103010000');
INSERT INTO `u_role_right` VALUES ('24', '1', '0103020000');
INSERT INTO `u_role_right` VALUES ('25', '1', '0103030000');
INSERT INTO `u_role_right` VALUES ('26', '1', '0103040000');
INSERT INTO `u_role_right` VALUES ('27', '1', '0103040100');
INSERT INTO `u_role_right` VALUES ('28', '1', '0103040200');
INSERT INTO `u_role_right` VALUES ('29', '1', '0103040300');
INSERT INTO `u_role_right` VALUES ('30', '1', '0103040400');
INSERT INTO `u_role_right` VALUES ('31', '1', '0104000000');
INSERT INTO `u_role_right` VALUES ('32', '1', '0104010000');
INSERT INTO `u_role_right` VALUES ('33', '1', '0104020000');
INSERT INTO `u_role_right` VALUES ('34', '1', '0104020100');
INSERT INTO `u_role_right` VALUES ('35', '1', '0104020200');
INSERT INTO `u_role_right` VALUES ('36', '1', '0104020300');
INSERT INTO `u_role_right` VALUES ('37', '1', '0104030000');
INSERT INTO `u_role_right` VALUES ('38', '1', '0104030100');
INSERT INTO `u_role_right` VALUES ('39', '1', '0104030200');
INSERT INTO `u_role_right` VALUES ('40', '1', '0104030300');
INSERT INTO `u_role_right` VALUES ('41', '1', '0104030400');
INSERT INTO `u_role_right` VALUES ('42', '1', '0104040000');
INSERT INTO `u_role_right` VALUES ('43', '1', '0105000000');
INSERT INTO `u_role_right` VALUES ('44', '1', '0105010000');
INSERT INTO `u_role_right` VALUES ('45', '1', '0105020000');
INSERT INTO `u_role_right` VALUES ('46', '1', '0105030000');
INSERT INTO `u_role_right` VALUES ('47', '1', '0105040000');
INSERT INTO `u_role_right` VALUES ('48', '1', '0105050000');
INSERT INTO `u_role_right` VALUES ('49', '1', '0105050100');
INSERT INTO `u_role_right` VALUES ('50', '1', '0105050200');
INSERT INTO `u_role_right` VALUES ('51', '1', '0105050300');
INSERT INTO `u_role_right` VALUES ('52', '1', '0105060000');
INSERT INTO `u_role_right` VALUES ('53', '1', '0106000000');
INSERT INTO `u_role_right` VALUES ('54', '1', '0106010000');
INSERT INTO `u_role_right` VALUES ('55', '1', '0106020000');
INSERT INTO `u_role_right` VALUES ('56', '1', '0106030000');
INSERT INTO `u_role_right` VALUES ('57', '1', '0106040000');
INSERT INTO `u_role_right` VALUES ('58', '1', '0106050000');
INSERT INTO `u_role_right` VALUES ('59', '1', '0106060000');
INSERT INTO `u_role_right` VALUES ('60', '1', '0106070000');
INSERT INTO `u_role_right` VALUES ('61', '1', '0107000000');
INSERT INTO `u_role_right` VALUES ('62', '1', '0107010000');
INSERT INTO `u_role_right` VALUES ('63', '1', '0107010100');
INSERT INTO `u_role_right` VALUES ('64', '1', '0107010200');
INSERT INTO `u_role_right` VALUES ('65', '1', '0107010300');
INSERT INTO `u_role_right` VALUES ('66', '1', '0107010301');
INSERT INTO `u_role_right` VALUES ('67', '1', '0107010400');
INSERT INTO `u_role_right` VALUES ('68', '1', '0107010500');
INSERT INTO `u_role_right` VALUES ('69', '1', '0107020000');
INSERT INTO `u_role_right` VALUES ('70', '1', '0108000000');
INSERT INTO `u_role_right` VALUES ('71', '1', '0108010000');
INSERT INTO `u_role_right` VALUES ('72', '1', '0108020000');
INSERT INTO `u_role_right` VALUES ('73', '1', '0108020100');
INSERT INTO `u_role_right` VALUES ('74', '1', '0108020200');
INSERT INTO `u_role_right` VALUES ('75', '1', '0108020300');
INSERT INTO `u_role_right` VALUES ('76', '1', '0108030000');
INSERT INTO `u_role_right` VALUES ('77', '1', '0109010000');
INSERT INTO `u_role_right` VALUES ('78', '1', '0109020000');
INSERT INTO `u_role_right` VALUES ('79', '1', '0109030000');
INSERT INTO `u_role_right` VALUES ('80', '1', '0109040000');
INSERT INTO `u_role_right` VALUES ('81', '1', '0109050000');
INSERT INTO `u_role_right` VALUES ('82', '1', '0200000000');
INSERT INTO `u_role_right` VALUES ('83', '1', '0201000000');
INSERT INTO `u_role_right` VALUES ('84', '1', '0201010000');
INSERT INTO `u_role_right` VALUES ('85', '1', '0201020000');
INSERT INTO `u_role_right` VALUES ('86', '1', '0201030000');
INSERT INTO `u_role_right` VALUES ('87', '1', '0201040000');
INSERT INTO `u_role_right` VALUES ('88', '1', '0201050000');
INSERT INTO `u_role_right` VALUES ('89', '1', '0201060000');
INSERT INTO `u_role_right` VALUES ('90', '1', '0202000000');
INSERT INTO `u_role_right` VALUES ('91', '1', '0202010000');
INSERT INTO `u_role_right` VALUES ('92', '1', '0203000000');
INSERT INTO `u_role_right` VALUES ('93', '1', '0203010000');
INSERT INTO `u_role_right` VALUES ('94', '1', '0204000000');
INSERT INTO `u_role_right` VALUES ('95', '1', '0204010000');
INSERT INTO `u_role_right` VALUES ('96', '1', '0204020000');
INSERT INTO `u_role_right` VALUES ('97', '1', '0205000000');
INSERT INTO `u_role_right` VALUES ('98', '1', '0205010000');
INSERT INTO `u_role_right` VALUES ('99', '1', '0206000000');
INSERT INTO `u_role_right` VALUES ('100', '1', '0206010000');

-- ----------------------------
-- Table structure for u_user_info
-- ----------------------------
DROP TABLE IF EXISTS `u_user_info`;
CREATE TABLE `u_user_info` (
  `user_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统自动id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(50) NOT NULL COMMENT '帐户密码',
  `true_name` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱地址',
  `mobile_num` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '固定电话号码',
  `dept_id` varchar(10) DEFAULT NULL COMMENT '所属部门',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否可用',
  `registerdate` date DEFAULT NULL COMMENT '注册时间',
  `description` text COMMENT '用户信息介绍',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK_DEPT` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_info
-- ----------------------------
INSERT INTO `u_user_info` VALUES ('10001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', '123', '1', '123', '0100000000', '1', '2014-02-10', 'admin');
INSERT INTO `u_user_info` VALUES ('10002', '456', '250cf8b51c773f3f8dc8b4be867a9a02', '业务管理员', 'woshi.guanxi@gmail.com', '1', '1', '0101000000', '1', '2014-02-20', null);
INSERT INTO `u_user_info` VALUES ('10003', '789', '68053af2923e00204c3ca7c6a3150cf7', '部门工作人员', '201121190002@mail.bnu.edu.cn', '1', '1', '0102000000', '1', '2014-02-20', null);
INSERT INTO `u_user_info` VALUES ('10004', '111', '698d51a19d8a121ce581499d7b701668', '数据业务员', 'tudiliuzhuan2013@163.com', '18811478698', '1', '0102010000', '1', '2014-02-20', null);
INSERT INTO `u_user_info` VALUES ('10005', 'wucan', 'c4213846ba5c8e87c206cee8416fefc1', '地图业务员', 'wucan731@sina.com', '18112345678', '01055807713', '0102010100', '1', '2014-03-10', null);
INSERT INTO `u_user_info` VALUES ('10006', 'oper', 'fd154ffe305c26b5004231ff709bd1b8', '业务人员', null, '1', '1', '0102010100', '1', '2014-03-10', null);
INSERT INTO `u_user_info` VALUES ('10008', 'test', '098f6bcd4621d373cade4e832627b4f6', '测试人员', null, '1', '1', '0102010100', '0', '2014-04-07', null);
INSERT INTO `u_user_info` VALUES ('10009', '监管系统', 'jgxt', '', '', '1', '1', null, '1', '2014-04-15', 'jgxt');
INSERT INTO `u_user_info` VALUES ('10010', '测试', 'ceshi', '', '', '1', '1', null, '1', '2014-04-17', 'ceshi');
INSERT INTO `u_user_info` VALUES ('10011', 'del', 'del', '数据管理员', '927683078@qq.com', '1', '1', null, '1', null, 'dddd');
INSERT INTO `u_user_info` VALUES ('10014', 'del3', '81dc9bdb52d04dc20036dbd8313ed055', '', '123', '1', '123', null, '1', '2014-04-18', '123');
INSERT INTO `u_user_info` VALUES ('10017', '监管系统管理员', 'f6060e83acf8f344b7664c9648c43fd8', '监管系统管理员', 'jgxt@163.com', '18132149876', '010-55801234', null, '1', '2014-06-02', '此用户为监管系统的<b>管理员</b>。');
INSERT INTO `u_user_info` VALUES ('10018', '黑龙江省厅', 'f428c69faba7d9a43a9024937144a184', 'hljst', '', '', '', null, '1', '2016-06-19', '');

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统自增序号',
  `username` varchar(30) DEFAULT NULL COMMENT '用户编号',
  `roleid` int(11) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('1', 'admin', '1');
INSERT INTO `u_user_role` VALUES ('2', 'admin', '2');
INSERT INTO `u_user_role` VALUES ('3', 'admin', '3');
INSERT INTO `u_user_role` VALUES ('4', 'wucan', '3');
INSERT INTO `u_user_role` VALUES ('5', 'oper', '4');
INSERT INTO `u_user_role` VALUES ('6', 'test', '4');
INSERT INTO `u_user_role` VALUES ('7', 'admin', '4');
INSERT INTO `u_user_role` VALUES ('8', 'wucan', '4');
INSERT INTO `u_user_role` VALUES ('9', '监管系统', '6');

-- ----------------------------
-- Table structure for u_user_true_info
-- ----------------------------
DROP TABLE IF EXISTS `u_user_true_info`;
CREATE TABLE `u_user_true_info` (
  `user_id` int(5) unsigned NOT NULL COMMENT '用户id',
  `true_name` varchar(30) DEFAULT NULL COMMENT '用户真实姓名',
  `email` varchar(30) DEFAULT NULL COMMENT '用户邮箱',
  `mobile_num` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '固定电话号码',
  `dept_id` varchar(10) DEFAULT NULL COMMENT '所属部门名称',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_true_info
-- ----------------------------
INSERT INTO `u_user_true_info` VALUES ('1', '张三', 'wucan731@sina.com', '+8613612345678', '010-58801234', '0101010000');
