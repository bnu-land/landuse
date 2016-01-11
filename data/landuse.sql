/*
SQLyog Ultimate v8.32 
MySQL - 5.5.30 : Database - landuse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`landuse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `landuse`;

/*Table structure for table `ent_dxqyyd_pda` */

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

/*Data for the table `ent_dxqyyd_pda` */

insert  into `ent_dxqyyd_pda`(`id`,`MBBSM`,`YSDM`,`KFQDM`,`KFQMC`,`TBBH`,`DXDM`,`QYMC`,`QYDZ`,`SSPJFW`,`HYLB`,`HYDM`,`QYRS`,`YJZTZ`,`WCTZ`,`ZSR`,`ZCZ`,`SSZE`,`QYYDMJ`,`CFPT`,`XZBG`,`LTCD`,`NBYLD`,`DLTCC`,`LD`,`QT`,`ZJZMJ`,`RJL`,`JDZMJ`,`JZXS`,`BZ`,`CJR`,`CJSJ`,`SHZT`,`SHYJ`) values (1,40,'2001050101','G231062','宾西经济技术开发区','16','07','黑龙江宏瑞彩包装制品有限公司','兴宾大道东','主区','包装印刷业','2239',126,8.22,2.74,0.47,1.89,0.2,0.24,0,2.68,5.82,0.70802897,4.05,49.27000046,NULL,NULL,NULL,NULL,NULL,NULL,'张克明','2015-07-21',0,NULL);

/*Table structure for table `ent_expirealert` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ent_expirealert` */

insert  into `ent_expirealert`(`id`,`MBBSM`,`YSDM`,`KFQDM`,`KFQMC`,`TBBH`,`QYMC`,`SSPJFW`,`HYLB`,`DQSJ`) values (1,40,'2001050101','G231062','宾西经济技术开发区','18','哈尔滨大北农牧业科技有限公司','主区','饲料加工','2016-09-21');

/*Table structure for table `ent_qyjyd` */

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

/*Data for the table `ent_qyjyd` */

insert  into `ent_qyjyd`(`id`,`MBBSM`,`YSDM`,`KFQDM`,`KFQMC`,`TBBH`,`DXDM`,`QYMC`,`QYDZ`,`SSPJFW`,`HYLB`,`HYDM`,`QYRS`,`QYYDMJ`,`CFPT`,`XZBG`,`LTCD`,`NBYLD`,`DLTCC`,`LD`,`QT`,`ZJZMJ`,`RJL`,`JDZMJ`,`JZXS`,`BZ`,`JYDDJ`) values (3,40,'2001050101','G231062','宾西经济技术开发区','16','07','黑龙江宏瑞彩包装制品有限公司','兴宾大道东','主区','包装印刷业','2239',126,8.22,2.74,0.47,1.89,0.2,0.24,0,2.68,5.82,0.70802897,4.05,49.27000046,'无','高');

/*Table structure for table `land_kfq_type` */

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

/*Data for the table `land_kfq_type` */

insert  into `land_kfq_type`(`id`,`calc_name`,`calc_date`,`kfq_type`,`jcczzmj`,`gkcczmj`,`zzzmj`,`gkcc_rate`,`zz_rate`) values (3,'海林2012','2015-06-10','工业主导型开发区',110.89,61.35,7.49,0.55,0.07),(4,'宾西2012','2015-06-10','工业主导型开发区',646.27,476.47,3.23,0.74,0.01),(5,'利民2013','2015-06-13','产城融合型开发区',1274.68,680.74,226.32,0.53,0.18),(6,'宾西2013','2015-06-16','工业主导型开发区',771.29,548.92,3.23,0.71,0),(7,'宾西2013','2015-08-23','工业主导型开发区',771.29,548.92,3.23,0.71,0),(8,'宾西2013','2015-08-24','工业主导型开发区',771.29,548.92,3.23,0.71,0);

/*Table structure for table `landuse_index_meta` */

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

/*Data for the table `landuse_index_meta` */

insert  into `landuse_index_meta`(`id`,`pid`,`level_code`,`index_name`,`index_key`,`description`) values (1,0,'sum','','mainDevelopSum',NULL),(2,1,'mm','','mainArea',NULL),(3,2,'ma','','mainLanduse',NULL),(4,3,'mb','','mainLanduseDegree',NULL),(5,4,'mc','','mainLanduseDegreeSupply',NULL),(6,5,'md','','mainLanduseDegreeSupplyReason',NULL),(7,4,'mc','','mainLanduseDegreeBuild',NULL),(8,7,'md','','mainLanduseDegreeBuildReason',NULL),(9,3,'mb','','mainLanduseConstruct',NULL),(10,9,'mc','','mainLanduseConstructIndustry',NULL),(11,10,'md','','mainLanduseConstructIndustryReason',NULL),(12,3,'mb','','mainLanduseIntensity',NULL),(13,12,'mc','','mainLanduseIntensityRatio',NULL),(14,13,'md','','mainLanduseIntensityRatioReason',NULL),(15,12,'mc','','mainLanduseIntensityDensity',NULL),(16,15,'md','','mainLanduseIntensityDensityReason',NULL),(17,12,'mc','','mainLanduseIntensitySumratio',NULL),(18,17,'md','','mainLanduseIntensitySumratioReason',NULL),(19,12,'mc','','mainLanduseIntensityBuildindex',NULL),(20,19,'md','','mainLanduseIntensityBuildindexReason',NULL),(21,2,'ma','','mainBenefit',NULL),(22,21,'mb','','mainBenefitInexport',NULL),(23,22,'mc','','mainBenefitInexportAssets',NULL),(24,23,'md','','mainBenefitInexportAssetsReason',NULL),(25,22,'mc','','mainBenefitInexportTax',NULL),(26,25,'md','','mainBenefitInexportTaxReason',NULL),(27,22,'mc','','mainBenefitInexportPopulation',NULL),(28,27,'md','','mainBenefitInexportPopulationReason',NULL),(29,2,'ma','','mainPerformance',NULL),(30,29,'mb','','mainPerformanceManage',NULL),(31,30,'mc','','mainPerformanceManageIdle',NULL),(32,31,'md','','mainPerformanceManageIdleReason',NULL),(33,1,'mm','','developArea',NULL),(34,33,'da','','developLanduse',NULL),(35,34,'db','','developLanduseDegree',NULL),(36,35,'dc','','developLanduseDegreeDevratio',NULL),(37,36,'dd','','developLanduseDegreeDevratioReason',NULL),(38,34,'db','','developLanduseConstruct',NULL),(39,38,'dc','','developLanduseConstructIndustry',NULL),(40,39,'dd','','developLanduseConstructIndustryReason',NULL),(41,34,'db','','developLanduseIntensity',NULL),(42,41,'dc','','developLanduseIntensityRatio',NULL),(43,42,'dd','','developLanduseIntensityRatioReason',NULL),(44,41,'dc','','developLanduseIntensityDensity',NULL),(45,44,'dd','','developLanduseIntensityDensityReason',NULL),(46,41,'dc','','developLanduseIntensitySumratio',NULL),(47,46,'dd','','developLanduseIntensitySumratioReason',NULL),(48,41,'dc','','developLanduseIntensityBuildindex',NULL),(49,48,'dd','','developLanduseIntensityBuildindexReason',NULL),(50,33,'da','','developBenefit',NULL),(51,50,'db','','developBenefitInexport',NULL),(52,51,'dc','','developBenefitInexportAssets',NULL),(53,52,'dd','','developBenefitInexportAssetsReason',NULL),(54,51,'dc','','developBenefitInexportTax',NULL),(55,54,'dd','','developBenefitInexportTaxReason',NULL),(56,51,'dc','','developBenefitInexportPopulation',NULL),(57,56,'dd','','developBenefitInexportPopulationReason',NULL),(58,33,'da','','developPerformance',NULL),(59,58,'db','','developPerformanceManage',NULL),(60,59,'dc','','developPerformanceManageIdle',NULL),(61,60,'dd','','developPerformanceManageIdleReason',NULL);

/*Table structure for table `landuse_index_weight` */

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `landuse_index_weight` */

insert  into `landuse_index_weight`(`id`,`project_id`,`kfq_name`,`kfq_type`,`mark_type`,`main_develop_sum`,`main_area`,`main_landuse`,`main_landuse_degree`,`main_landuse_degree_supply`,`main_landuse_degree_supply_reason`,`main_landuse_degree_build`,`main_landuse_degree_build_reason`,`main_landuse_construct`,`main_landuse_construct_industry`,`main_landuse_construct_industry_reason`,`main_landuse_intensity`,`main_landuse_intensity_ratio`,`main_landuse_intensity_ratio_reason`,`main_landuse_intensity_density`,`main_landuse_intensity_density_reason`,`main_landuse_intensity_sumratio`,`main_landuse_intensity_sumratio_reason`,`main_landuse_intensity_buildindex`,`main_landuse_intensity_buildindex_reason`,`main_benefit`,`main_benefit_Inexport`,`main_benefit_Inexport_assets`,`main_benefit_Inexport_assets_reason`,`main_benefit_Inexport_tax`,`main_benefit_Inexport_tax_reason`,`main_benefit_Inexport_population`,`main_benefit_Inexport_population_reason`,`main_performance`,`main_performance_manage`,`main_performance_manage_idle`,`main_performance_manage_idle_reason`,`develop_area`,`develop_landuse`,`develop_landuse_degree`,`develop_landuse_degree_devratio`,`develop_landuse_degree_devratio_reason`,`develop_landuse_construct`,`develop_landuse_construct_industry`,`develop_landuse_construct_industry_reason`,`develop_landuse_intensity`,`develop_landuse_intensity_ratio`,`develop_landuse_intensity_ratio_reason`,`develop_landuse_intensity_density`,`develop_landuse_intensity_density_reason`,`develop_landuse_intensity_sumratio`,`develop_landuse_intensity_sumratio_reason`,`develop_landuse_intensity_buildindex`,`develop_landuse_intensity_buildindex_reason`,`develop_benefit`,`develop_benefit_Inexport`,`develop_benefit_Inexport_assets`,`develop_benefit_Inexport_assets_reason`,`develop_benefit_Inexport_tax`,`develop_benefit_Inexport_tax_reason`,`develop_benefit_Inexport_population`,`develop_benefit_Inexport_population_reason`,`develop_performance`,`develop_performance_manage`,`develop_performance_manage_idle`,`develop_performance_manage_idle_reason`) values (41,'201506151710','宾西2012','工业主导型开发区','权重值汇总',NULL,0.8,0.7,0.25,0.5,NULL,0.5,NULL,0.25,1,NULL,0.5,0.25,NULL,0.22,NULL,0.25,NULL,0.28,NULL,0.2,1,0.5,NULL,0.5,NULL,NULL,NULL,0.1,1,1,NULL,0.2,0.7,0.25,0.5,NULL,0.25,1,NULL,0.5,0.25,NULL,0.22,NULL,0.25,NULL,0.28,NULL,0.2,1,0.5,NULL,0.5,NULL,NULL,NULL,0.1,1,1,NULL),(42,'201506151715','利民2013','产城融合型开发区','权重值汇总',NULL,0.8,0.7,0.25,0.5,NULL,0.5,NULL,NULL,NULL,NULL,0.5,0.25,NULL,0.22,NULL,NULL,NULL,NULL,NULL,0.2,1,NULL,NULL,0.5,NULL,0.5,NULL,0.1,1,1,NULL,0.2,0.7,0.25,0.5,NULL,NULL,NULL,NULL,0.5,0.25,NULL,0.22,NULL,NULL,NULL,NULL,NULL,0.2,1,NULL,NULL,0.5,NULL,0.5,NULL,0.1,1,1,NULL),(44,'201506151815','海林2012','工业主导型开发区','权重值汇总',NULL,0.8,0.7,0.25,0.5,NULL,0.5,NULL,0.25,1,NULL,0.5,0.25,NULL,0.22,NULL,0.25,NULL,0.28,NULL,0.2,1,0.5,NULL,0.5,NULL,NULL,NULL,0.1,1,1,NULL,0.2,0.7,0.25,0.5,NULL,0.25,1,NULL,0.5,0.25,NULL,0.22,NULL,0.25,NULL,0.28,NULL,0.2,1,0.5,NULL,0.5,NULL,NULL,NULL,0.1,1,1,NULL),(48,'201506151815','海林2012','工业主导型开发区','理想值汇总',NULL,NULL,NULL,NULL,0.5,'qwe',0.5,'',NULL,1,'',NULL,0.25,'',0.22,'',0.25,'',0.28,'',NULL,NULL,0.5,'',0.5,'',NULL,NULL,NULL,NULL,1,'',NULL,NULL,NULL,0.5,'',NULL,1,'',NULL,0.25,'',0.22,'',0.25,'',0.28,'',NULL,NULL,0.5,'',0.5,'',NULL,NULL,NULL,NULL,1,''),(49,'201506151715','利民2013','产城融合型开发区','理想值汇总',NULL,NULL,NULL,NULL,0.5,'',0.5,'',NULL,0,'',NULL,0.25,'',0.22,'',0,'',0,'',NULL,NULL,0,'',0.5,'',NULL,NULL,NULL,NULL,1,'',NULL,NULL,NULL,0.5,'',NULL,0,'',NULL,0.25,'',0.22,'',0,'',0,'',NULL,NULL,0,'',0.5,'',NULL,NULL,NULL,NULL,1,''),(50,'201506151815','海林2012','工业主导型开发区','集约度分值',98.25,100,100,100,100,NULL,100,NULL,100,100,NULL,100,100,NULL,100,NULL,100,NULL,100,NULL,100,100,100,NULL,100,NULL,NULL,NULL,100,100,100,NULL,91.25,87.5,50,100,NULL,100,100,NULL,100,100,NULL,100,NULL,100,NULL,100,NULL,100,100,100,NULL,100,NULL,NULL,NULL,100,100,100,NULL),(60,'201506162029','宾西2013','工业主导型开发区','权重值汇总',NULL,0.8,0.25,0.44,0.5,NULL,0.5,NULL,0.29,1,NULL,0.53,0.25,NULL,0.22,NULL,0.41,NULL,0.29,NULL,0.42,0.4,0.5,NULL,0.5,NULL,NULL,NULL,0.17,0.48,1,NULL,0.2,0.7,0.25,0.5,NULL,0.25,1,NULL,0.5,0.25,NULL,0.22,NULL,0.25,NULL,0.28,NULL,0.2,1,0.5,NULL,0.5,NULL,NULL,NULL,0.1,1,1,NULL),(62,'201506162029','宾西2013','工业主导型开发区','集约度分值',63.84,56.99,128.13,100,100,NULL,100,NULL,100,100,NULL,104.02,100,NULL,100,NULL,68.33,NULL,100,NULL,40,100,100,NULL,100,NULL,NULL,NULL,48,100,100,NULL,91.25,87.5,50,100,NULL,100,100,NULL,100,100,NULL,100,NULL,100,NULL,100,NULL,100,100,100,NULL,100,NULL,NULL,NULL,100,100,100,NULL);

/*Table structure for table `landuse_intensity_construct` */

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

/*Data for the table `landuse_intensity_construct` */

insert  into `landuse_intensity_construct`(`id`,`kfq_name`,`kfq_map`,`calc_date`,`main_yjcczmj`,`main_build_weight`,`main_build_ideal`,`main_construct`,`develop_yjcczmj`,`develop_build_weight`,`develop_build_ideal`,`develop_construct`,`description`) values (4,'海林','海林2013','2015-06-17',155.128,1,1,0,0,1,1,0,NULL);

/*Table structure for table `landuse_intensity_expansion` */

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

/*Data for the table `landuse_intensity_expansion` */

insert  into `landuse_intensity_expansion`(`id`,`kfq_name`,`kfq_map`,`calc_date`,`main_skgytd`,`main_skgygkcc`,`main_snnjgytd`,`main_wngytdzdz`,`main_snnjgkcc`,`main_wngkcczdz`,`develop_skgytd`,`develop_skgygkcc`,`develop_snnjgytd`,`develop_wngytdzdz`,`develop_snnjgkcc`,`develop_wngkcczdz`) values (2,'宾西','宾西2013开发区','2015-06-17',920.539,752.319,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL),(3,'海林','海林2013','2015-08-23',87.381,3.432,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL);

/*Table structure for table `landuse_intensity_intension` */

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

/*Data for the table `landuse_intensity_intension` */

insert  into `landuse_intensity_intension`(`id`,`kfq_name`,`kfq_map`,`calc_date`,`dldm_gkccmj`,`main_sumratio_weight`,`main_sumratio_ideal`,`main_sumratio_intension`,`main_buildrate_weight`,`main_buildrate_ideal`,`main_buildrate_intension`,`main_asset_weight`,`main_asset_ideal`,`main_asset_intension`,`main_tax_weight`,`main_tax_ideal`,`main_tax_intension`,`main_sumtax_weight`,`main_sumtax_ideal`,`main_sumtax_intension`,`develop_sumratio_weight`,`develop_sumratio_ideal`,`develop_sumratio_intension`,`develop_buildrate_weight`,`develop_buildrate_ideal`,`develop_buildrate_intension`,`develop_asset_weight`,`develop_asset_ideal`,`develop_asset_intension`,`develop_tax_weight`,`develop_tax_ideal`,`develop_tax_intension`,`develop_sumtax_weight`,`develop_sumtax_ideal`,`develop_sumtax_intension`) values (2,'a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'海林','海林2013','2015-06-17',66.9194,0.28,0.28,7.17,0.25,0.25,-8.03,0.5,0.5,0,0.5,0.5,0,NULL,NULL,NULL,0.25,0.25,0,0.28,0.28,0,0.5,0.5,0,0.5,0.5,0,NULL,NULL,NULL);

/*Table structure for table `landuse_intensity_manager` */

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

/*Data for the table `landuse_intensity_manager` */

insert  into `landuse_intensity_manager`(`id`,`kfq_name`,`kfq_map`,`calc_date`,`main_expire`,`main_ideal`,`develop_expire`,`develop_ideal`,`sum_expire`,`sum_ideal`) values (1,'a','b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'d','c',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `law_regulation` */

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `law_regulation` */

insert  into `law_regulation`(`id`,`law_type`,`law_title`,`publish_date`,`publish_dept`,`description`,`law_content`,`law_editor`) values (1,'国土保护','矿产保护','2005-01-01','国土资源部','这是与矿产保护相关的法律','法律规定，政府单位须定时监察矿产保护情况。	','张东民'),(3,'土地管理','《土地复垦条例实施办法》',NULL,'国土资源部','　《土地复垦条例实施办法》已经2012年12月11日国土资源部第4次部务会议审议通过，现予以发布，自2013年3月1日起施行。\n　　部  长 徐绍史\n　　2012年12月27日\n','　<strong>土地复垦条例实施办法</strong>\n<p align=\"center\">　　（2012年12月11日国土资源部第4次部务会议审议通过）</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第一章&nbsp; 总&nbsp; 则</strong></p>\n<p>　　</p>\n<p>　　第一条&nbsp; 为保证土地复垦的有效实施，根据《土地复垦条例》（以下简称条例），制定本办法。</p>\n<p>　　第二条&nbsp; 土地复垦应当综合考虑复垦后土地利用的社会效益、经济效益和生态效益。</p>\n<p>　　生产建设活动造成耕地损毁的，能够复垦为耕地的，应当优先复垦为耕地。</p>\n<p>　　第三条&nbsp; 县级以上国土资源主管部门应当明确专门机构并配备专职人员负责土地复垦监督管理工作。</p>\n<p>　　县级以上国土资源主管部门应当加强与发展改革、财政、城乡规划、铁路、交通、水利、环保、农业、林业等部门的协同配合和行业指导监督。</p>\n<p>　　上级国土资源主管部门应当加强对下级国土资源主管部门土地复垦工作的监督和指导。</p>\n<p>　　第四条&nbsp; \n除条例第六条规定外，开展土地复垦调查评价、编制土地复垦规划设计、确定土地复垦工程建设和造价、实施土地复垦工程质量控制、进行土地复垦评价等活动，也应当遵守有关国家标准和土地管理行业标准。</p>\n<p>　　省级国土资源主管部门可以结合本地实际情况，补充制定本行政区域内土地复垦工程建设和造价等标准。</p>\n<p>　　第五条&nbsp; \n县级以上国土资源主管部门应当建立土地复垦信息管理系统，利用国土资源综合监管平台，对土地复垦情况进行动态监测，及时收集、汇总、分析和发布本行政区域内土地损毁、土地复垦等数据信息。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第二章&nbsp; 生产建设活动损毁土地的复垦</strong></p>\n<p>　　</p>\n<p>　　第六条&nbsp; \n属于条例第十条规定的生产建设项目，土地复垦义务人应当在办理建设用地申请或者采矿权申请手续时，依据国土资源部《土地复垦方案编制规程》的要求，组织编制土地复垦方案，随有关报批材料报送有关国土资源主管部门审查。</p>\n<p>　　具体承担相应建设用地审查和采矿权审批的国土资源主管部门负责对土地复垦义务人报送的土地复垦方案进行审查。</p>\n<p>　　第七条&nbsp; \n条例施行前已经办理建设用地手续或者领取采矿许可证，条例施行后继续从事生产建设活动造成土地损毁的，土地复垦义务人应当在本办法实施之日起一年内完成土地复垦方案的补充编制工作，报有关国土资源主管部门审查。</p>\n<p>　　第八条&nbsp; 土地复垦方案分为土地复垦方案报告书和土地复垦方案报告表。</p>\n<p>　　依法由省级以上人民政府审批建设用地的建设项目，以及由省级以上国土资源主管部门审批登记的采矿项目，应当编制土地复垦方案报告书。其他项目可以编制土地复垦方案报告表。</p>\n<p>　　第九条&nbsp; 生产建设周期长、需要分阶段实施土地复垦的生产建设项目，土地复垦方案应当包含阶段土地复垦计划和年度实施计划。</p>\n<p>　　跨县（市、区）域的生产建设项目，应当在土地复垦方案中附具以县（市、区）为单位的土地复垦实施方案。</p>\n<p>　　阶段土地复垦计划和以县（市、区）为单位的土地复垦实施方案应当明确土地复垦的目标、任务、位置、主要措施、投资概算、工程规划设计等。</p>\n<p>　　第十条&nbsp; 有关国土资源主管部门受理土地复垦方案审查申请后，应当组织专家进行论证。</p>\n<p>　　根据论证所需专业知识结构，从土地复垦专家库中选取专家。专家与土地复垦方案申请人或者申请项目有利害关系的，应当主动要求回避。土地复垦方案申请人也可以向有关国土资源主管部门申请专家回避。</p>\n<p>　　土地复垦方案申请人或者相关利害关系人可以按照《政府信息公开条例》的规定，向有关国土资源主管部门申请查询专家意见。有关国土资源主管部门应当依法提供查询结果。</p>\n<p>　　第十一条&nbsp; 土地复垦方案经专家论证通过后，由有关国土资源主管部门进行最终审查。符合下列条件的，方可通过审查：</p>\n<p>　　（一）土地利用现状明确；</p>\n<p>　　（二）损毁土地的分析预测科学；</p>\n<p>　　（三）土地复垦目标、任务和利用方向合理，措施可行；</p>\n<p>　　（四）土地复垦费用测算合理，预存与使用计划清晰并符合本办法规定要求；</p>\n<p>　　（五）土地复垦计划安排科学、保障措施可行；</p>\n<p>　　（六）土地复垦方案已经征求意见并采纳合理建议。</p>\n<p>　　第十二条&nbsp; \n土地复垦方案通过审查的，有关国土资源主管部门应当向土地复垦义务人出具土地复垦方案审查意见书。土地复垦方案审查意见书应当包含本办法第十一条规定的有关内容。</p>\n<p>　　土地复垦方案未通过审查的，有关国土资源主管部门应当书面告知土地复垦义务人补正。逾期不补正的，不予办理建设用地或者采矿审批相关手续。</p>\n<p>　　第十三条&nbsp; \n土地复垦义务人因生产建设项目的用地位置、规模等发生变化，或者采矿项目发生扩大变更矿区范围等重大内容变化的，应当在三个月内对原土地复垦方案进行修改，报原审查的国土资源主管部门审查。</p>\n<p>　　第十四条&nbsp; 土地复垦义务人不按照本办法第七条、第十三条规定补充编制或者修改土地复垦方案的，依照条例第二十条规定处理。</p>\n<p>　　第十五条&nbsp; \n土地复垦义务人在实施土地复垦工程前，应当依据审查通过的土地复垦方案进行土地复垦规划设计，将土地复垦方案和土地复垦规划设计一并报所在地县级国土资源主管部门备案。</p>\n<p>　　第十六条&nbsp; \n土地复垦义务人应当按照条例第十五条规定的要求，与损毁土地所在地县级国土资源主管部门在双方约定的银行建立土地复垦费用专门账户，按照土地复垦方案确定的资金数额，在土地复垦费用专门账户中足额预存土地复垦费用。</p>\n<p>　　预存的土地复垦费用遵循“土地复垦义务人所有，国土资源主管部门监管，专户储存专款使用”的原则。</p>\n<p>　　第十七条&nbsp; \n土地复垦义务人应当与损毁土地所在地县级国土资源主管部门、银行共同签订土地复垦费用使用监管协议，按照本办法规定的原则明确土地复垦费用预存和使用的时间、数额、程序、条件和违约责任等。</p>\n<p>　　土地复垦费用使用监管协议对当事人具有法律效力。</p>\n<p>　　第十八条&nbsp; 土地复垦义务人应当在项目动工前一个月内预存土地复垦费用。</p>\n<p>　　土地复垦义务人按照本办法第七条规定补充编制土地复垦方案的，应当在土地复垦方案通过审查后一个月内预存土地复垦费用。</p>\n<p>　　土地复垦义务人按照本办法第十三条规定修改土地复垦方案后，已经预存的土地复垦费用不足的，应当在土地复垦方案通过审查后一个月内补齐差额费用。</p>\n<p>　　第十九条&nbsp; 土地复垦费用预存实行一次性预存和分期预存两种方式。</p>\n<p>　　生产建设周期在三年以下的项目，应当一次性全额预存土地复垦费用。</p>\n<p>　　生产建设周期在三年以上的项目，可以分期预存土地复垦费用，但第一次预存的数额不得少于土地复垦费用总金额的百分之二十。余额按照土地复垦方案确定的土地复垦费用预存计划预存，在生产建设活动结束前一年预存完毕。</p>\n<p>　　第二十条&nbsp; \n条例实施前，采矿生产项目按照有关规定向国土资源主管部门缴存的矿山地质环境治理恢复保证金中已经包含了土地复垦费用的，土地复垦义务人可以向所在地国土资源主管部门提出申请，经审核属实的，可以不再预存相应数额的土地复垦费用。</p>\n<p>　　第二十一条&nbsp; \n土地复垦义务人应当按照土地复垦方案确定的工作计划和土地复垦费用使用计划，向损毁土地所在地县级国土资源主管部门申请出具土地复垦费用支取通知书。县级国土资源主管部门应当在七日内出具土地复垦费用支取通知书。</p>\n<p>　　土地复垦义务人凭土地复垦费用支取通知书，从土地复垦费用专门账户中支取土地复垦费用，专项用于土地复垦。</p>\n<p>　　第二十二条&nbsp; \n土地复垦义务人应当按照条例第十七条规定于每年12月31日前向所在地县级国土资源主管部门报告当年土地复垦义务履行情况，包括下列内容：</p>\n<p>　　（一）年度土地损毁情况，包括土地损毁方式、地类、位置、权属、面积、程度等；</p>\n<p>　　（二）年度土地复垦费用预存、使用和管理等情况；</p>\n<p>　　（三）年度土地复垦实施情况，包括复垦地类、位置、面积、权属、主要复垦措施、工程量等；</p>\n<p>　　（四）国土资源主管部门规定的其他年度报告内容。</p>\n<p>　　县级国土资源主管部门应当加强对土地复垦义务人报告事项履行情况的监督核实，并可以根据情况将土地复垦义务履行情况年度报告在门户网站上公开。</p>\n<p>　　第二十三条&nbsp; \n县级国土资源主管部门应当加强对土地复垦义务人使用土地复垦费用的监督管理，发现有不按照规定使用土地复垦费用的，可以按照土地复垦费用使用监管协议的约定依法追究土地复垦义务人的违约责任。</p>\n<p>　　第二十四条&nbsp; 土地复垦义务人在生产建设活动中应当遵循“保护、预防和控制为主，生产建设与复垦相结合”的原则，采取下列预防控制措施：</p>\n<p>　　（一）对可能被损毁的耕地、林地、草地等，应当进行表土剥离，分层存放，分层回填，优先用于复垦土地的土壤改良。表土剥离厚度应当依据相关技术标准,根据实际情况确定。表土剥离应当在生产工艺和施工建设前进行或者同步进行；</p>\n<p>　　（二）露天采矿、烧制砖瓦、挖沙取土、采石，修建铁路、公路、水利工程等，应当合理确定取土的位置、范围、深度和堆放的位置、高度等；</p>\n<p>　　（三）地下采矿或者疏干抽排地下水等施工，对易造成地面塌陷或者地面沉降等特殊地段应当采取充填、设置保护支柱等工程技术方法以及限制、禁止开采地下水等措施；</p>\n<p>　　（四）禁止不按照规定排放废气、废水、废渣、粉灰、废油等。</p>\n<p>　　第二十五条&nbsp; \n土地复垦义务人应当对生产建设活动损毁土地的规模、程度和复垦过程中土地复垦工程质量、土地复垦效果等实施全程控制，并对验收合格后的复垦土地采取管护措施，保证土地复垦效果。</p>\n<p>　　第二十六条&nbsp; 土地复垦义务人依法转让采矿权或者土地使用权的，土地复垦义务同时转移。但原土地复垦义务人应当完成的土地复垦义务未履行完成的除外。</p>\n<p>　　原土地复垦义务人已经预存的土地复垦费用以及未履行完成的土地复垦义务，由原土地复垦义务人与新的土地复垦义务人在转让合同中约定。</p>\n<p>　　新的土地复垦义务人应当重新与损毁土地所在地国土资源主管部门、银行签订土地复垦费用使用监管协议。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第三章&nbsp; 历史遗留损毁土地和自然灾害损毁土地的复垦</strong></p>\n<p>　　</p>\n<p>　　第二十七条&nbsp; 历史遗留损毁土地和自然灾害损毁土地调查评价，应当包括下列内容：</p>\n<p>　　（一）损毁土地现状调查，包括地类、位置、面积、权属、损毁类型、损毁特征、损毁原因、损毁时间、污染情况、自然条件、社会经济条件等；</p>\n<p>　　（二）损毁土地复垦适宜性评价，包括损毁程度、复垦潜力、利用方向及生态环境影响等；</p>\n<p>　　（三）土地复垦效益分析，包括社会、经济、生态等效益。</p>\n<p>　　第二十八条&nbsp; 符合下列条件的土地，所在地的县级国土资源主管部门应当认定为历史遗留损毁土地：</p>\n<p>　　（一）土地复垦义务人灭失的生产建设活动损毁的土地；</p>\n<p>　　（二）《土地复垦规定》实施以前生产建设活动损毁的土地。</p>\n<p>　　第二十九条&nbsp; \n县级国土资源主管部门应当将历史遗留损毁土地认定结果予以公告，公告期间不少于三十日。土地复垦义务人对认定结果有异议的，可以向县级国土资源主管部门申请复核。</p>\n<p>　　县级国土资源主管部门应当自收到复核申请之日起三十日内做出答复。土地复垦义务人不服的，可以向上一级国土资源主管部门申请裁定。</p>\n<p>　　上一级国土资源主管部门发现县级国土资源主管部门做出的认定结果不符合规定的，可以责令县级国土资源主管部门重新认定。</p>\n<p>　　第三十条&nbsp; 土地复垦专项规划应当包括下列内容：</p>\n<p>　　（一）土地复垦潜力分析；</p>\n<p>　　（二）土地复垦的原则、目标、任务和计划安排；</p>\n<p>　　（三）土地复垦重点区域和复垦土地利用方向；</p>\n<p>　　（四）土地复垦项目的划定，复垦土地的利用布局和工程布局；</p>\n<p>　　（五）土地复垦资金的测算，资金筹措方式和资金安排；</p>\n<p>　　（六）预期经济、社会和生态等效益；</p>\n<p>　　（七）土地复垦的实施保障措施。</p>\n<p>　　土地复垦专项规划可以根据实际情况纳入土地整治规划。</p>\n<p>　　土地复垦专项规划的修改应当按照条例第二十二条的规定报本级人民政府批准。</p>\n<p>　　第三十一条&nbsp; 县级以上地方国土资源主管部门应当依据土地复垦专项规划制定土地复垦年度计划，分年度、有步骤地组织开展土地复垦工作。</p>\n<p>　　第三十二条&nbsp; 条例第二十三条规定的历史遗留损毁土地和自然灾害损毁土地的复垦资金来源包括下列资金：</p>\n<p>　　（一）土地复垦费；</p>\n<p>　　（二）耕地开垦费；</p>\n<p>　　（三）新增建设用地土地有偿使用费；</p>\n<p>　　（四）用于农业开发的土地出让收入;</p>\n<p>　　（五）可以用于土地复垦的耕地占用税地方留成部分；</p>\n<p>　　（六）其他可以用于土地复垦的资金。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第四章 土地复垦验收</strong></p>\n<p>　　</p>\n<p>　　第三十三条&nbsp; 土地复垦义务人完成土地复垦任务后，应当组织自查，向项目所在地县级国土资源主管部门提出验收书面申请，并提供下列材料：</p>\n<p>　　（一）验收调查报告及相关图件；</p>\n<p>　　（二）规划设计执行报告；</p>\n<p>　　（三）质量评估报告；</p>\n<p>　　（四）检测等其他报告。</p>\n<p>　　第三十四条&nbsp; 生产建设周期五年以上的项目，土地复垦义务人可以分阶段提出验收申请，负责组织验收的国土资源主管部门实行分级验收。</p>\n<p>　　阶段验收由项目所在地县级国土资源主管部门负责组织，总体验收由审查通过土地复垦方案的国土资源主管部门负责组织或者委托有关国土资源主管部门组织。</p>\n<p>　　第三十五条&nbsp; \n负责组织验收的国土资源主管部门应当会同同级农业、林业、环境保护等有关部门，组织邀请有关专家和农村集体经济组织代表，依据土地复垦方案、阶段土地复垦计划，对下列内容进行验收：</p>\n<p>　　（一）土地复垦计划目标与任务完成情况；</p>\n<p>　　（二）规划设计执行情况；</p>\n<p>　　（三）复垦工程质量和耕地质量等级；</p>\n<p>　　（四）土地权属管理、档案资料管理情况；</p>\n<p>　　（五）工程管护措施。</p>\n<p>　　第三十六条&nbsp; \n土地复垦阶段验收和总体验收形成初步验收结果后，负责组织验收的国土资源主管部门应当在项目所在地公告，听取相关权利人的意见。公告时间不少于三十日。</p>\n<p>　　相关土地权利人对验收结果有异议的，可以在公告期内向负责组织验收的国土资源主管部门书面提出。</p>\n<p>　　国土资源主管部门应当在接到书面异议之日起十五日内，会同同级农业、林业、环境保护等有关部门核查，形成核查结论反馈相关土地权利人。异议情况属实的，还应当向土地复垦义务人提出整改意见，限期整改。</p>\n<p>　　第三十七条&nbsp; \n土地复垦工程经阶段验收或者总体验收合格的，负责验收的国土资源主管部门应当依照条例第二十九条规定出具阶段或者总体验收合格确认书。验收合格确认书应当载明下列事项：</p>\n<p>　　（一）土地复垦工程概况；</p>\n<p>　　（二）损毁土地情况；</p>\n<p>　　（三）土地复垦完成情况；</p>\n<p>　　（四）土地复垦中存在的问题和整改建议、处理意见；</p>\n<p>　　（五）验收结论。</p>\n<p>　　第三十八条&nbsp; \n土地复垦义务人在申请新的建设用地、申请新的采矿许可证或者申请采矿许可证延续、变更、注销时，应当一并提供按照本办法规定到期完工土地复垦项目的验收合格确认书或者土地复垦费缴费凭据。未提供相关材料的，按照条例第二十条规定，有关国土资源主管部门不得通过审查和办理相关手续。</p>\n<p>　　第三十九条&nbsp; \n政府投资的土地复垦项目竣工后，由负责组织实施土地复垦项目的国土资源主管部门进行初步验收，验收程序和要求除依照本办法规定外，按照资金来源渠道及相应的项目管理办法执行。</p>\n<p>　　初步验收完成后，依照条例第三十条规定进行最终验收，并依照本办法第三十七条规定出具验收合格确认书。</p>\n<p>　　国土资源主管部门代复垦的项目竣工后，依照本条规定进行验收。</p>\n<p>　　第四十条&nbsp; \n土地权利人自行复垦或者社会投资进行复垦的土地复垦项目竣工后，由项目所在地县级国土资源主管部门进行验收，验收程序和要求依照本办法规定执行。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第五章 土地复垦激励措施</strong></p>\n<p>　　</p>\n<p>　　第四十一条&nbsp; \n土地复垦义务人将生产建设活动损毁的耕地、林地、牧草地等农用地复垦恢复为原用途的，可以依照条例第三十二条规定，凭验收合格确认书向所在地县级国土资源主管部门提出出具退还耕地占用税意见的申请。</p>\n<p>　　经审核属实的，县级国土资源主管部门应当在十五日内向土地复垦义务人出具意见。土地复垦义务人凭国土资源主管部门出具的意见向有关部门申请办理退还耕地占用税手续。</p>\n<p>　　第四十二条&nbsp; \n由社会投资将历史遗留损毁和自然灾害损毁土地复垦为耕地的，除依照条例第三十三条规定办理外，对属于将非耕地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，可以作为本省、自治区、直辖市的补充耕地指标，市、县政府可以出资购买指标。</p>\n<p>　　第四十三条&nbsp; \n由县级以上地方人民政府投资将历史遗留损毁和自然灾害损毁的建设用地复垦为耕地的，经验收合格并报省级国土资源主管部门复核同意后，依照条例第三十五条规定可以作为本省、自治区、直辖市的补充耕地指标。但使用新增建设用地有偿使用费复垦的耕地除外。</p>\n<p>　　属于农民集体所有的土地，复垦后应当交给农民集体使用。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第六章 土地复垦监督管理</strong></p>\n<p>　　</p>\n<p>　　第四十四条&nbsp; \n县级以上国土资源主管部门应当采取年度检查、专项核查、例行稽查、在线监管等形式，对本行政区域内的土地复垦活动进行监督检查，并可以采取下列措施：</p>\n<p>　　（一）要求被检查当事人如实反映情况和提供相关的文件、资料和电子数据；</p>\n<p>　　（二）要求被检查当事人就土地复垦有关问题做出说明；</p>\n<p>　　（三）进入土地复垦现场进行勘查；</p>\n<p>　　（四）责令被检查当事人停止违反条例的行为。</p>\n<p>　　第四十五条&nbsp; \n县级以上国土资源主管部门应当在门户网站上及时向社会公开本行政区域内的土地复垦管理规定、技术标准、土地复垦规划、土地复垦项目安排计划以及土地复垦方案审查结果、土地复垦工程验收结果等重大事项。</p>\n<p>　　第四十六条&nbsp; 县级以上地方国土资源主管部门应当通过国土资源主干网等按年度将本行政区域内的土地损毁情况、土地复垦工作开展情况等逐级上报。</p>\n<p>　　上级国土资源主管部门对下级国土资源主管部门落实土地复垦法律法规情况、土地复垦义务履行情况、土地复垦效果等进行绩效评价。</p>\n<p>　　第四十七条&nbsp; \n县级以上国土资源主管部门应当对土地复垦档案实行专门管理，将土地复垦方案、土地复垦资金使用监管协议、土地复垦验收有关材料和土地复垦项目计划书、土地复垦实施情况报告等资料和电子数据进行档案存储与管理。</p>\n<p>　　第四十八条&nbsp; 复垦后的土地权属和用途发生变更的，应当依法办理土地登记相关手续。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第七章 法律责任</strong></p>\n<p>　　</p>\n<p>　　第四十九条&nbsp; 条例第三十六条第六项规定的其他徇私舞弊、滥用职权、玩忽职守行为，包括下列行为：</p>\n<p>　　（一）违反本办法第二十一条规定，对不符合规定条件的土地复垦义务人出具土地复垦费用支取通知书，或者对符合规定条件的土地复垦义务人无正当理由未在规定期限内出具土地复垦费用支取通知书的；</p>\n<p>　　（二）违反本办法第四十一条规定，对不符合规定条件的申请人出具退还耕地占用税的意见，或者对符合规定条件的申请人无正当理由未在规定期限内出具退还耕地占用税的意见的；</p>\n<p>　　（三）其他违反条例和本办法规定的行为。</p>\n<p>　　第五十条&nbsp; \n土地复垦义务人未按照本办法第十五条规定将土地复垦方案、土地复垦规划设计报所在地县级国土资源主管部门备案的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p>\n<p>　　第五十一条&nbsp; \n土地复垦义务人未按照本办法第十六条、第十七条、第十八条、第十九条规定预存土地复垦费用的，由县级以上国土资源主管部门责令限期改正；逾期不改正的，依照条例第三十八条规定处罚。</p>\n<p>　　第五十二条&nbsp; \n土地复垦义务人未按照本办法第二十五条规定开展土地复垦质量控制和采取管护措施的，由县级以上地方国土资源主管部门责令限期改正；逾期不改正的，依照条例第四十一条规定处罚。</p>\n<p>　　</p>\n<p align=\"center\">　　<strong>第八章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 附&nbsp; 则</strong></p>\n<p>　　</p>\n<p>　　第五十三条&nbsp; 铀矿等放射性采矿项目的土地复垦具体办法，由国土资源部另行制定。</p>\n<p>　　第五十四条&nbsp; 本办法自2013年3月1日起施行。</p>','test'),(5,'土地管理','土地权属争议调查处理办法',NULL,'国土资源部','','<div style=\"text-align: center;\">​<strong>中华人民共和国国土资源部令第49号&nbsp;</strong></div><div class=\"Custom_UnionStyle\">\n\n<p align=\"justify\">　　《国土资源部关于修改部分规章的决定》，已经2010年11月29日国土资源部第6次部务会审议通过，现予发布，自发布之日起施行。&nbsp;</p>\n<p align=\"right\">　　部长&nbsp;&nbsp;徐绍史&nbsp;</p>\n<p align=\"right\">　　二〇一〇年十一月三十日&nbsp;</p>\n<p align=\"center\">　<strong>　土地权属争议调查处理办法&nbsp;</strong></p>\n<p align=\"justify\">　　（2003年1月3日中华人民共和国国土资源部令第17号公布，根据2010年11月30日《国土资源部关于修改部分规章的决定》（国土资源部令第49号）修正，将第二十条的“征用”改为&nbsp;“征收”。）&nbsp;</p>\n<p align=\"justify\">　　第一条&nbsp;&nbsp;为依法、公正、及时地做好土地权属争议的调查处理工作，保护当事人的合法权益，维护土地的社会主义公有制，根据《中华人民共和国土地管理法》，制定本办法。&nbsp;</p>\n<p align=\"justify\">　　第二条&nbsp;&nbsp;本办法所称土地权属争议，是指土地所有权或使用权归属争议。&nbsp;</p>\n<p align=\"justify\">　　第三条&nbsp;&nbsp;调查处理土地权属争议，应当以法律、法规和土地管理规章为依据。从实际出发，尊重历史，面对现实。&nbsp;</p>\n<p align=\"justify\">　　第四条&nbsp;&nbsp;县级以上国土资源行政主管部门负责土地权属争议案件（以下简称争议案件）的调查和调解工作；对需要依法作出处理决定的，拟定处理意见，报同级人民政府作出处理决定。&nbsp;</p>\n<p align=\"justify\">　　县级以上国土资源行政主管部门可以指定专门机构或者人员负责办理争议案件有关事宜。&nbsp;</p>\n<p align=\"justify\">　　第五条&nbsp;&nbsp;个人之间、个人与单位、单位与单位之间发生的争议案件，由争议土地所在地的县级国土资源行政主管部门调查处理。&nbsp;</p>\n<p align=\"justify\">　　前款规定的个人之间、个人与单位、单位与单位之间发生的争议案件，可以根据当事人的申请，由乡级人民政府受理和处理。&nbsp;</p>\n<p align=\"justify\">　　第六条&nbsp;&nbsp;设区的市、自治州国土资源行政主管部门调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）跨县级行政区域的；&nbsp;</p>\n<p align=\"justify\">　　（二）同级人民政府、上级国土资源部门交办或者其他部门转送的。&nbsp;</p>\n<p align=\"justify\">　　第七条&nbsp;&nbsp;省、自治区、直辖市国土资源行政主管部门调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）跨设区的市、自治州行政区域的；&nbsp;</p>\n<p align=\"justify\">　　（二）争议一方为中央国家机关或者其直属单位，且涉及土地面积较大的；&nbsp;</p>\n<p align=\"justify\">　　（三）争议一方为军队，且涉及土地面积较大的；&nbsp;</p>\n<p align=\"justify\">　　（四）在本行政区域内有较大影响的；&nbsp;</p>\n<p align=\"justify\">　　（五）同级人民政府、国土资源部交办或者其他部门转送的。&nbsp;</p>\n<p align=\"justify\">　　第八条&nbsp;&nbsp;国土资源部调查处理下列争议案件：&nbsp;</p>\n<p align=\"justify\">　　（一）国务院交办的；&nbsp;</p>\n<p align=\"justify\">　　（二）在全国范围内有重大影响的。&nbsp;</p>\n<p align=\"justify\">　　第九条&nbsp;当事人发生土地权属争议，经协商不能解决的；可以依法向县级以上人民政府或者乡级人民政府提出处理申请，也可以依照本办法第五、六、七、八条的规定，向有关的国土资源行政主管部门提出调查处理申请。&nbsp;</p>\n<p align=\"justify\">　　第十条&nbsp;申请调查处理土地权属争议的，应当符合下列条件：&nbsp;</p>\n<p align=\"justify\">　　（一）申请人与争议的土地有直接利害关系；&nbsp;</p>\n<p align=\"justify\">　　（二）有明确的请求处理对象、具体的处理请求和事实根据。&nbsp;</p>\n<p align=\"justify\">　　第十一条&nbsp;&nbsp;&nbsp;申请调查处理土地权属争议的，应当提交书面申请书和有关证据材料，并按照被申请人数提交副本。&nbsp;</p>\n<p align=\"justify\">　　申请书应当载明以下事项：&nbsp;</p>\n<p align=\"justify\">　　（一）申请人和被申请人的姓名或者名称、地址、邮政编码、法定代表人姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）请求的事项、事实和理由；&nbsp;</p>\n<p align=\"justify\">　　（三）证人的姓名、工作单位、住址、邮政编码。&nbsp;</p>\n<p align=\"justify\">　　第十二条当事人可以委托代理人代为申请土地权属争议的调查处理。委托代理人申请的，应当提交授权委托书。授权委托书应当写明委托事项和权限。&nbsp;</p>\n<p align=\"justify\">　　第十三条&nbsp;对申请人提出的土地权属争议的申请，国土資源行政主管部门应当依照本办法第十条的规定进行审查，并在收到申请书之日起7个工作日内提出是否受理的意见。&nbsp;</p>\n<p align=\"justify\">　　认为应当受理的，在决定受理之日起5个工作日内将申请书副本发送被申请人。被申请人应当在接到申请书副本之日起30日内提交答辩书和有关证据材料。逾期不提交答辩书的，不影响案件的处理。&nbsp;</p>\n<p align=\"justify\">　　认为不应当受理的，应当及时拟定不予受理建议书，报同级人民政府作出不予受理决定。&nbsp;</p>\n<p align=\"justify\">　　当事人对不予受理决定不服的，可以依法申请行政复议或者提起行政诉讼。&nbsp;</p>\n<p align=\"justify\">　　同级人民政府、上级国土资源行政主管部门交办或者其他部门转办的争议案件，按照本条有关规定审查处理。&nbsp;</p>\n<p align=\"justify\">　　第十四条&nbsp;下列案件不作为争议案件受理：&nbsp;</p>\n<p align=\"justify\">　　（一）土地侵权案件；&nbsp;</p>\n<p align=\"justify\">　　（二）行政区域边界争议案件；&nbsp;</p>\n<p align=\"justify\">　　（三）土地违法案件；&nbsp;</p>\n<p align=\"justify\">　　（四）农村土地承包经营权争议案件；&nbsp;</p>\n<p align=\"justify\">　　（五）其他不作为土地权属争议的案件。&nbsp;</p>\n<p align=\"justify\">　　第十五条&nbsp;国土资源行政主管部门决定受理后，应当及时指定承办人，对当事人争议的事实情况进行调查。&nbsp;</p>\n<p align=\"justify\">　　第十六条&nbsp;&nbsp;承办人与争议案件有利害关系的，应当申请回避；&nbsp;</p>\n<p align=\"justify\">　　当事人认为承办人与争议案件有利害关系的有权请求该承办人回避。承办人是否回避，由受理案件的国土资源行政主管部门决定。&nbsp;</p>\n<p align=\"justify\">　　第十七条&nbsp;承办人在调查处理土地权属争议过程中，可以向有关单位或者个人调查取证。被调查的单位或者个人应当协助，并如实提供有关证明材料。&nbsp;</p>\n<p align=\"justify\">　　第十八条&nbsp;&nbsp;在调查处理土地权属争议过程中，国土资源行政主管部门认为有必要对争议的土地进行实地调查的，应当通知当事人及有关人员到现现场。必要时，可以邀请有关部门派人协助调查。&nbsp;</p>\n<p align=\"justify\">　　第十九条&nbsp;土地权属争议双方当事人对各自提出的事实和理由负有举证责任，应当及时向负责调查处理的国土资源行政主管部门提供有关证据材料。&nbsp;</p>\n<p align=\"justify\">　　第二十条&nbsp;国土资源行政主管部门在调查处理争议案件时，应当审查双方当事人提供的有关证据材料：&nbsp;</p>\n<p align=\"justify\">　　（一）人民政府颁发的确定土地权属的凭证；&nbsp;</p>\n<p align=\"justify\">　　（二）人民政府或者主管部门批准征收、划拨、出让或者以其他方式批准使用土地的文件；&nbsp;</p>\n<p align=\"justify\">　　（三）争议双方当事人依法达成的书面协议；&nbsp;</p>\n<p align=\"justify\">　　（四）人民政府或者司法机关处理争议的文件或者附图；&nbsp;</p>\n<p align=\"justify\">　　（五）其他有关证明文件。&nbsp;</p>\n<p align=\"justify\">　　第二十一条&nbsp;对当事人提供的证据材料，国土资源行政主管部门应当查证属实，方可作为认定事实的依据。&nbsp;</p>\n<p align=\"justify\">　　第二十二条&nbsp;在土地所有权和使用权争议解决之前，任何一方不得改变土地利用的现状。&nbsp;</p>\n<p align=\"justify\">　　第二十三条&nbsp;国土资源行政主管部门对受理的争议案件，应当在查清事实、分清权属关系的基础上先行调解，促使当事人以协商方式达成协议。调解应当坚持自愿、合法的原则。&nbsp;</p>\n<p align=\"justify\">　　第二十四条&nbsp;调解达成协议的，应当制作调解书。调解书应当载明以下内容：&nbsp;</p>\n<p align=\"justify\">　　（一）当事人的姓名或者名称、法定代表人姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）争议的主要事实；&nbsp;</p>\n<p align=\"justify\">　　（三）协议内容及其他有关事项。&nbsp;</p>\n<p align=\"justify\">　　第二十五条&nbsp;调解书经双方当事人签名或者盖章，由承办人署名并加盖国土资源行政主管部门的印章后生效的调解书具有法律效力，使土地登记的依据。&nbsp;</p>\n<p align=\"justify\">　　第二十六条&nbsp;国土资源行政主管部门应当在调解书生效之日起15日内，依照民事诉讼法的有关规定，将调解书送达当事人，并同时报上级国土资源行政主管部门。&nbsp;</p>\n<p align=\"justify\">　　第二十七条调解未达成协议的，国土资源行政主管部门应当及时提出调查处理意见，报同级人民政府作出处理决定。&nbsp;</p>\n<p align=\"justify\">　　第二十八条国土资源行政主管部门应当自受理土地权属争议之日起6个月内提出调查处理意见。因情况复杂，在规定时间内不能提出调查处理意见的，经该国土资源行政主管部门负责人批准，可以适当延长。&nbsp;</p>\n<p align=\"justify\">　　第二十九条&nbsp;调查处理意见应当包括以下内容：&nbsp;</p>\n<p align=\"justify\">　　（一）当事人的姓名或者名称、地址、法定代表人的姓名和职务；&nbsp;</p>\n<p align=\"justify\">　　（二）争议的事实和理由和要求；&nbsp;</p>\n<p align=\"justify\">　　（三）认定的事实和适用的法律、法规等依据；&nbsp;</p>\n<p align=\"justify\">　　（四）拟定的处理结论。&nbsp;</p>\n<p align=\"justify\">　　第三十条&nbsp;国土资源行政主管部门提出调查处理意见后，应当在5个工作日内报同级人民政府，由人民政府下达处理决定。&nbsp;</p>\n<p align=\"justify\">　　国土资源行政主管部门的调查处理意见在报同级人民政府的同时，报上一级国土资源行政主管部门。&nbsp;</p>\n<p align=\"justify\">　　第三十一条&nbsp;&nbsp;当事人对人民政府作出的处理决定不服的，可以依法行申请政复议或者提起行政诉讼。&nbsp;</p>\n<p align=\"justify\">　　在规定的时间内，当事人既不申请政复议，也不提起行政诉讼，处理决定即发生法律效力。生效的处理决定是土地登记的依据。&nbsp;</p>\n<p align=\"justify\">　　第三十二条&nbsp;在土地权属争议调查处理过程中，国土资源行政主管部门的工作人员玩忽职守、滥用职权、徇斯舞弊，构成犯罪的，依法追究刑事责任；不构成犯罪的，由其所在单位或者上级机关依法给予行政处分。&nbsp;</p>\n<p align=\"justify\">　　第三十三条&nbsp;乡级人民政府处理土地权属争议参照本办法执行。&nbsp;</p>\n<p align=\"justify\">　　第三十四条&nbsp;调查处理争议案件的文书格式，由国土资源部统一制定。&nbsp;</p>\n<p align=\"justify\">　　第三十五条&nbsp;调查处理争议案件的费用，依照国家有关规定执行。&nbsp;</p>\n<p align=\"justify\">　　第三十六条&nbsp;本办法自2003年3月1日起施行。1995年12月18日原国家土地管理局发布的&lt;土地权属争议处理暂行办法&gt;同时废止。&nbsp;</p></div>','test');

/*Table structure for table `law_types` */

DROP TABLE IF EXISTS `law_types`;

CREATE TABLE `law_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) DEFAULT NULL COMMENT 'pid',
  `law_type` varchar(50) DEFAULT NULL COMMENT 'lay type',
  `description` varchar(300) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `law_types` */

insert  into `law_types`(`id`,`pid`,`law_type`,`description`) values (1,NULL,'矿产资源管理',''),(2,NULL,'土地管理',''),(3,NULL,'海洋管理',''),(4,NULL,'地方法规',''),(5,NULL,'综合管理','执法.'),(6,NULL,'地质环境管理',''),(7,NULL,'测绘管理','对象'),(8,NULL,'相关法律',''),(9,NULL,'法律解释',''),(10,NULL,'部门规章','');

/*Table structure for table `notice_columns` */

DROP TABLE IF EXISTS `notice_columns`;

CREATE TABLE `notice_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `column_name` varchar(50) DEFAULT NULL COMMENT 'columnName',
  `description` varchar(200) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `notice_columns` */

insert  into `notice_columns`(`id`,`column_name`,`description`) values (1,'新闻速递',''),(2,'通知公告','c'),(3,'土地政策',NULL),(4,'土地动态',NULL);

/*Table structure for table `notice_news` */

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `notice_news` */

insert  into `notice_news`(`id`,`notice_column`,`notice_title`,`notice_author`,`publish_date`,`edit_date`,`notice_content`,`notice_state`,`attachment`,`description`) values (1,'法律法规','土地资源法','李立明','2015-03-24',NULL,NULL,0,NULL,'首次添加'),(2,'通知公告','eg','吴灿',NULL,NULL,'sdfdsf',1,NULL,''),(3,'新闻速递','我省稳步推进土地利用监测监管工作','吴灿',NULL,NULL,'<span style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 16px; line-height: 24px;\">自今年1月1日，省启动建设用地供后开发利用巡查监管工作以来，该项工作稳步推进，在五方面取得显著成效。</span><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　一是运用土地市场监测监管系统开展网上排查。上半年累计土地出让公告排查806条;土地供应结果排查1786条，其中，出让合同1264条，划拨决定书494条，租赁合同28条。发现异常，及时与当地国土部门沟通，对异常信息进行认定或更正。上半年,处理各地上报信息撤回16份，撤回项目30个。供后土地开发利用预警信息统计通报。重点统计开、竣工，土地使用权出让价款缴纳等预警信息，按月向省厅土地利用处报表、形成通报报告，督促地方整改。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　二是土地利用动态巡查监管工作。强化培训指导，通过视频培训对全省动态巡查工作进行了人员作巡查管理操作演示，建立了全省土地利用动态巡查业务指导qq群，将所需课件上传到群共享文件中，同时，在线对全省各地提出的业务问题进行解答。根据工作需要，应绥化市、农垦总局、哈尔滨市、齐齐哈尔市申请，派技术人人员协助其开展现场培训，加强档案管理工作。截止到今年4月初，全省各地土地利用动态巡查领导小组和动态巡查人员登记表全部上报完毕，完成了整理、归档工作。日前网上审核工作已正式开启，累计审核巡查人员844名。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　三是开展土地市场运行情况统计分析工作。按月度和季度向厅土地利用处、省财政厅和国土资源部提交土地供应情况统计表、出让情况统计表（含出让金缴纳）、全省各市、县供地率统计表等，按季度编写全省土地市场运行情况分析报告。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　四是现场抽查督办工作。今年6月,配合厅土地利用处对全省范围内的部预警宗地的土地开发利用情况进行了现场抽查和督办工作，共抽查预警宗地127宗，将抽查中发现的问题及时与当地国土局交换意见，督促其按时整改。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　五是土地收购储备监管技术支撑工作。协助厅土地利用处开展全省土地储备监管培训会议，启动土地储备监管人员登记表上报、整理、归档，截至目前，全省60个储备机构注册审核工作已经完成。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　下一步，省土地利用监测中心将继续以建设用地供后开发利用情况和预警信息整改情况检查为突破口，开展现场抽查，提高市、县两级对此项工作的重视程度，督促未开展巡查工作地区尽快启动工作。并拟结合省厅建设用地批准情况开展土地供应数据填报情况核实。&nbsp;</div><div style=\"border: 0px; margin: 5px auto; padding: 0px; font-family: 宋体; font-size: 16px; color: rgb(45, 45, 45); line-height: 24px;\">　　同时，建议对于城市（镇、场）建成区外基础设施配套未到位导致无法项目实施的宗地，由项目所在地建设部门出具说明，国土分局、乡镇国土所核实后，变更合同；不能净地供应的宗地，供地后或建设中因拆迁原因无法开工或无法继续建设的宗地，建议由国土部门报地方政府处置；政府招商时承诺的扶持政策未兑现的宗地，建议由国土资源部门通知项目投资单位与地方政府协商解决，在规定期限不能开工的，按国家政策处理。通过建立软硬件系统对市、县交地、开工、竣工等节点巡查情况进行定时定轨迹监测，实现对市、县局工作开展情况的统计、监测、分析，为省厅监督考核市、县此项工作开展情况提供量化依据。将网上排查、现场抽查、技术监测等结合起来，建立一套检查考核办法，强化市县主体责任。</div>',0,NULL,''),(4,'新闻速递','黑龙江省再添11处省级地质公园','test','2015-06-03',NULL,'<span style=\"color: rgb(45, 45, 45); font-family: 宋体; font-size: 12pt; line-height: 1.5;\">为有效保护、合理开发和永续利用地质遗迹资源，近日，经黑龙江省第三批省级地质公园评审委员会审议，宾县大青山等11处地质公园获得省级地质公园资格。</span><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: 宋体; font-size: 12pt; color: rgb(45, 45, 45); line-height: 1.5;\">　　为做好第三批省级地质公园评审工作，省国土资源厅高度重视，多次召开专题会议，并聘请省国土厅、省财政厅、住建厅、林业厅、水利厅、环保厅、旅游局、地矿局等相关人员及省内地质公园专家组成15人评审委员会,按照省第三批省级地质公园评审办法和评审标准,对13个新申报的地质公园进行了评审。本次评审体现出三个特点，一是本次地质公园申报，受到地方政府高度重视，他们希望利用省级地质公园的平台，促进地质遗迹保护和旅游业发展。二是本次申报的地质公园，地质遗迹各具特色，多数已开发并具备一定规模，在地域分布上，弥补了齐齐哈尔市、七台河市、大兴安岭地区没有地质公园的空白，提高了地质公园在全省的覆盖面，对促进我省地质旅游和地学知识的普及将产生深远意义。三是本次评审坚持公平、公正、公开的原则，按照自然属性、可保护属性、保护管理基础三个方面及12项具体评审指标进行了赋分。</p><p style=\"border: 0px; margin: 0px; padding: 8px 0px; font-family: 宋体; font-size: 12pt; color: rgb(45, 45, 45); line-height: 1.5;\">　　最终宾县大青山、鸡冠山、碾子山、麒麟山、双子山、大兴安岭呼中苍山石林、鹤岗金顶山、五营、长寿山、那丹哈达岭、漠河等11个地质公园通过评审。至此我省已有世界级地质公园2个，国家级地质公园6个，省级地质公园24个。(孙佳岩）</p>',0,NULL,''),(5,'土地动态','农村产权交易中心助力土地流转','监管系统管理员','2015-06-04',NULL,'<span style=\"color: rgb(37, 37, 37); font-family: 宋体, sans-serif; font-size: 14px; line-height: 24px; text-align: justify;\">河北省滦平县农村产权交易中心于4月29日正式成立运营。该中心以农村土地承包经营权交易为主要业务，发挥信息聚集与发布、规范交易等职能作用，促进农业资源要素优化配置。截<b>至目前，共挂牌发布</b>项目信息9个，成功交易3个、面积2213.5亩，合同价款158.8万元。图为5月29日，农民在滦平县农村产权交易中心咨询相关事宜。</span>',0,NULL,''),(6,'土地政策','edf','吴灿','2015-06-08',NULL,'sdfsdfasd',1,NULL,'wer'),(8,'新闻速递','123','123333',NULL,NULL,'123123123',1,NULL,'11111');

/*Table structure for table `survey_data` */

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

/*Data for the table `survey_data` */

insert  into `survey_data`(`id`,`survey_date`,`survey_name`,`survey_address`,`kfqmc`,`kfqdm`,`survey_data`) values (1,'2015-12-21','张克俭','哈尔滨宾西开创路','宾西','G231062',NULL);

/*Table structure for table `system_map` */

DROP TABLE IF EXISTS `system_map`;

CREATE TABLE `system_map` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `map_pid` int(11) DEFAULT NULL COMMENT 'pid',
  `map_group` varchar(200) DEFAULT NULL COMMENT 'group',
  `map_name` varchar(50) DEFAULT NULL COMMENT 'name',
  `map_key` varchar(100) DEFAULT NULL COMMENT 'urlKey',
  `map_url` varchar(200) DEFAULT NULL COMMENT 'map url',
  `description` varchar(300) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `system_map` */

insert  into `system_map`(`map_id`,`map_pid`,`map_group`,`map_name`,`map_key`,`map_url`,`description`) values (1,0,'mapserver','2013年开发区评价地图','kaifaqu2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer',''),(2,1,'landuse,2013','宾西2013','binxi2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/0',''),(3,1,'landuse,2013','海林2013','hailin2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/1',''),(4,1,'landuse,2013','利民2013','limin2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/2',''),(5,1,'landuse,2013','牡丹江2013','mudanjiang2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/3',''),(6,1,'landuse,2013','绥芬河保税区2013','suifenhe2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/4',''),(7,1,'landuse,2013','绥芬河市合作区2013','suifenheshi2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/5',''),(8,1,'landuse,2013','绥化2013','suihua2013','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2013/MapServer/6',''),(9,0,'mapserver','2012年开发区评价地图','kaifaqu2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer',''),(10,9,'landuse,2012','宾西2012','binxi2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/0',''),(11,9,'landuse,2012','海林2012','hailin2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/1',''),(12,9,'landuse,2012','利民2012','limin2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/2',''),(13,9,'landuse,2012','牡丹江2012','mudanjiang2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/3',''),(14,9,'landuse,2012','绥芬河保税区2012','suifenhe2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/4',''),(15,9,'landuse,2012','绥芬河市合作区2012','suifenheshi2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/5',''),(16,9,'landuse,2012','绥化2012','suihua2012','http://localhost:6080/arcgis/rest/services/landuse/kaifaqu2012/MapServer/6',''),(17,0,'kaifaqu','2013宾西开发区评价地图','binxikaifaqu2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer',''),(18,17,'binxi,wjccz,2013','宾西2013未建成城镇建设用地','binxiwjccz2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/1',''),(19,17,'binxi,yjccz,2013','宾西2013已建成城镇建设用地','binxiyjccz2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/2',''),(20,17,'binxi,qyyd,2013','宾西2013典型企业用地','binxiqyyd2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/0',''),(21,17,'binxi,kfq,2013','宾西2013开发区','binxikfq2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/3',''),(22,17,'binxi,bkjs,2013','宾西2013不可建设土地','binxibkjs2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/4',''),(23,17,'binxi,jbxxmz,2013','宾西2013基本信息面状图斑','binxijbxxmz2013','http://localhost:6080/arcgis/rest/services/landuse/binxi2013/MapServer/5',''),(24,11,'cc','dd','ssaaaaaa','xxaaaasssss','zzzqqqqq');

/*Table structure for table `u_dept_info` */

DROP TABLE IF EXISTS `u_dept_info`;

CREATE TABLE `u_dept_info` (
  `dept_id` varchar(10) NOT NULL COMMENT '部门id，如010102',
  `dept_name` varchar(50) NOT NULL COMMENT '部门名称',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否可用',
  `description` text COMMENT '部门职能说明',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `u_dept_info` */

insert  into `u_dept_info`(`dept_id`,`dept_name`,`enabled`,`description`) values ('0100000000','重庆市',1,'<b style=\"color: rgb(0, 0, 0);\">管辖</b><font color=\"#ff0000\">重庆</font><span style=\"color: rgb(0, 0, 0);\">市下辖所有土地流转业务。</span>'),('0101000000','国土部门',1,'国土相关部门'),('0101010000','土地流转处',1,'<span style=\"color: rgb(0, 0, 0);\">管辖重庆市下辖所有</span><font color=\"#ff0000\"><b>土地流转业务</b></font>。'),('0101010100','test',1,'test'),('0101010101','tst2',1,'ttest2'),('0101010102','添加',0,'添加子部门。'),('0101010103','333',1,'333'),('0101020000','耕地保护处',1,'承担耕地保护工作；承担依据土地利用总体规划实施基本农田的划定、调整工作；承担土地整理复垦开发工作；承担耕地总量动态平衡和建设占用耕地占补平衡工作；承担耕地保护责任目标考核的有关工作'),('0101030000','建设用地处',1,'承担农用地转用和农村集体土地征收、征用的管理；承办农用地转用和土地征收、征用的审查及报批管理工作；承担新增建设用地批后实施的监管工作；组织调处土地征收、征用补偿安置重大争议；承担农村集体建设用地的管理工作。'),('0102000000','长寿区',1,'管辖<b>长寿区</b>下辖所有土地流转业务。'),('0102010000','凤城镇',1,'管辖凤城镇下辖所有土地流转业务。<br>'),('0102010100','三洞村',1,'管辖三洞村下辖所有土地流转业务。'),('0102020000','江南镇',1,'管辖江南镇下辖所有土地流转业务。'),('0200000000','长沙市',1,'长沙市'),('0201000000','芙蓉区',1,'芙蓉区'),('0201010000','ccc',1,'ccc'),('0201010100','dddd',0,'ddd'),('0201010101','ffff',1,'ffff'),('0201010102','ggg',0,'ggg'),('0300000000','del',1,'del');

/*Table structure for table `u_right_info` */

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

/*Data for the table `u_right_info` */

insert  into `u_right_info`(`right_id`,`right_name`,`right_index`,`url`,`enabled`,`description`) values ('0100000000','农村土地流转全过程监管系统',NULL,NULL,1,'查看农村土地流转全过程监管系统。'),('0101000000','信息管理与发布',NULL,'tree_infoPubManager',1,'信息管理与发布<b>。</b>'),('0101010000','建言献策',NULL,'infoArticleJYXCTab',1,NULL),('0101020000','违法监察',NULL,'infoArticleWFJCTab',1,NULL),('0101030000','办事指南',NULL,'infoArticleBSZNTab',1,NULL),('0101040000','业务介绍',NULL,'infoArticleYWJSTab',1,NULL),('0101050000','法律法规',NULL,'infoArticleFLFGTab',1,NULL),('0101060000','政策解读',NULL,'infoArticleZCJDTab',1,NULL),('0101070000','标准规范',NULL,'infoArticleBZGFTab',1,NULL),('0101080000','常见问题解答',NULL,'infoArticleCJWTTab',1,NULL),('0102000000','现状',NULL,'tree_xianzhuang',1,'现状'),('0102010000','现场调查','','fieldWatchPanel',1,''),('0102020000','撂荒地查询','','fieldLhdPanel',1,''),('0102030000','废弃地查询','','fieldFqdPanel',1,''),('0102040000','空心村查询','','fieldKxcPanel',1,''),('0103000000','规划',NULL,'tree_guihua',0,'规划。'),('0103010000','项目与规划',NULL,'xiangmu_guihua',1,''),('0103010100','项目创建',NULL,'301',1,''),('0103010200','项目管理',NULL,'302',1,''),('0103010300','规划复垦区域',NULL,'303',1,''),('0103010400','生成规划报告',NULL,'304',1,''),('0103020000','复垦申请管理',NULL,'fukenshenqingguanli',1,''),('0103020100','填写复垦申请',NULL,'401',1,''),('0103020200','上传权利证明',NULL,'402',1,''),('0103020300','撤销及修改申请',NULL,'403',1,''),('0103020400','审核申请',NULL,'404',1,''),('0103020500','查看申请状态',NULL,'405',1,''),('0103030000','公告及意见',NULL,'gonggao_yijian',1,''),('0103030100','查看公告',NULL,'601',1,''),('0103030200','添加公告',NULL,'602',1,''),('0103030300','发表意见',NULL,'603',1,''),('0103030400','查看意见',NULL,'604',1,''),('0103030500','意见统计',NULL,'605',1,''),('0104000000','拆迁',NULL,'tree_chaiqian',1,'拆迁'),('0104010000','拆迁过程管理','','cq_chaiqianguochengguanli',1,''),('0104010100','录入面积',NULL,'501',1,''),('0104010200','确认拆迁信息',NULL,'502',1,''),('0104010300','确认补偿信息',NULL,'503',1,''),('0104010400','管理拆迁日志',NULL,'504',1,''),('0104010500','管理农户确认汇总表',NULL,'505',1,''),('0104020000','监测监控','','cq_jiancejiankong',1,''),('0104020100','拆迁过程监控',NULL,'701',1,''),('0104020200','补偿监测',NULL,'702',1,''),('0104020300','安置监测',NULL,'703',1,''),('0104020400','拆迁进度监控',NULL,'704',1,''),('0104030000','预警管理','','cq_yujingguanli',1,''),('0104030100','预警规则管理',NULL,'801',1,''),('0104030200','预警日志管理',NULL,'802',1,''),('0104040000','入库备案',NULL,'cq_rukubeian',1,''),('0104040100','上传备案资料',NULL,'901',1,''),('0104040200','审核备案资料',NULL,'902',1,''),('0104040300','查看审核状态',NULL,'903',1,''),('0105000000','复垦及验收',NULL,'tree_fukenyanshou',1,'复垦及验收'),('0105010000','项目管理','','manageProject',1,''),('0105020000','复垦信息公告',NULL,'syrSchemeShow',1,NULL),('0105030000','复垦过程监控',NULL,'syrDataManagement',1,NULL),('0105040000','验收申请','','acceptApply',1,''),('0105050000','复垦验收评价','','fk_fukenyanshoupingjia',1,''),('0105050200','质量评价',NULL,'EvaluateSelectProject',1,NULL),('0105050300','复垦评价报告',NULL,'EvaluateReport',1,NULL),('0105060000','监管预警',NULL,'RegulatoryWarning',1,NULL),('0106000000','交易',NULL,'tree_jiaoyi',1,'交易'),('0106010000','交易态势查询',NULL,'TaishiFind',1,NULL),('0106020000','按交易价格分析',NULL,'TaishiPrice',1,NULL),('0106030000','按交易量分析',NULL,'TaishiVolume',1,NULL),('0106040000','按交易次数分析',NULL,'TaishiNumber',1,NULL),('0106050000','按交易区域分析',NULL,'TaishiArea',1,NULL),('0106060000','交易态势异常分析',NULL,'TaishiAlarm',1,NULL),('0106070000','交易风险预警',NULL,'abnmDkTransSupervisionTab',1,NULL),('0107000000','使用',NULL,'tree_shiyong',1,'使用'),('0107010000','监测抽样',NULL,'use_MonitoringSampling',1,''),('0107020000','抽样结果',NULL,'use_MonitorResult',1,''),('0108000000','监管',NULL,'tree_jianguan',1,'监管'),('0108010000','全过程异常监管',NULL,'abnmWholeSupervisionTab',1,NULL),('0108020000','意见征集与舆情分析','','jg_yijianzhengji',1,''),('0108020100','网上投票管理',NULL,'infoVoteTab',1,NULL),('0108020200','群众来信管理',NULL,'infoLetterTab',1,NULL),('0108020300','违规流转投诉举报管理','','infoReportTab',1,''),('0108030000','巡查监察','','abnmXunChaTab',1,''),('0108040000','监察信息查询统计',NULL,'abnmSupInfoTab',1,''),('0109000000','数据管理',NULL,'tree_shujuguanli',1,'数据管理'),('0109010000','备份与恢复',NULL,'db_BackupRecoveryData',1,'空间数据库。'),('0109020000','用户管理',NULL,'db_UserPrivilegeManagerTab',1,NULL),('0109030000','系统运行日志',NULL,'db_SystemLogTab',1,NULL),('0109050000','企业黑名单','','db_BlacklistTab',1,''),('0200000000','地图资源权限',NULL,'',1,''),('0201000000','抽样数据',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer',1,'高青山负责模块的MapServer URL。'),('0201010000','抽样范围',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/0',1,'<div><span style=\"font-family: Tahoma;\">双龙镇，城镇土地</span><font face=\"tahoma, arial, verdana, sans-serif\">。</font></div>'),('0201020000','抽样底图',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/1',1,'双龙镇抽样总体<br>'),('0201030000','知识层',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/2',1,'主驱动力。'),('0201040000','报告层',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/3',1,'双龙镇行政区划图。'),('0201050000','样本层',NULL,'http://localhost:6080/arcgis/rest/services/chouyang/MapServer/4',1,'双龙镇区域'),('0201060000','抽样地图','chouyang','http://localhost:6080/arcgis/rest/services/chouyang/MapServer',1,''),('0202000000','复垦验收',NULL,'',1,'王伟的复垦验收模块'),('0202010000','复垦项目','fukenxiangmu','http://localhost:6080/arcgis/rest/services/fukenxiangmu/MapServer',1,'复垦项目的MapServer，应用于【复垦及验收】-&gt;【复垦项目登记与管理】中。'),('0203000000','基础底图',NULL,'',1,''),('0203010000','长寿区镇级行政区','csqzjxzq','http://localhost:6080/arcgis/rest/services/csqzjxzq/MapServer',1,''),('0204000000','复垦进度',NULL,'',1,''),('0204010000','复垦进度图','fukenjindu','http://localhost:6080/arcgis/rest/services/fukenjindu/MapServer',1,''),('0204020000','复垦进度遥感影像图','fukenjindursimage','http://localhost:6080/arcgis/rest/services/fukenjindursimage/MapServer',1,''),('0205000000','交易预警',NULL,'',1,''),('0205010000','交易风险','jiaoyifengxian','http://localhost:6080/arcgis/rest/services/jiaoyifengxian/MapServer',1,''),('0206000000','现状',NULL,'',1,''),('0206010000','现状图',NULL,'http://localhost:6080/arcgis/rest/services/xianzhuang/MapServer',1,'');

/*Table structure for table `u_role_info` */

DROP TABLE IF EXISTS `u_role_info`;

CREATE TABLE `u_role_info` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name_cn` varchar(30) NOT NULL COMMENT '角色中文名称',
  `role_name` varchar(30) DEFAULT 'ROLE_OPER' COMMENT '角色名称',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `description` text COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `u_role_info` */

insert  into `u_role_info`(`role_id`,`role_name_cn`,`role_name`,`enabled`,`description`) values (1,'超级管理员','ROLE_ADMIN',1,'管理重庆市下辖所有土流业务。'),(2,'地图管理员','ROLE_MAP',1,'管理长寿区下辖业务。'),(3,'业务员','ROLE_USER',1,'管理凤城镇下辖业务。'),(4,'操作员','ROLE_OPER',1,'管理<b>关口村</b>下辖所有业务。'),(6,'ccc','cc',1,'cccc');

/*Table structure for table `u_role_right` */

DROP TABLE IF EXISTS `u_role_right`;

CREATE TABLE `u_role_right` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统自增字段',
  `role_id` varchar(10) NOT NULL COMMENT '角色id',
  `right_id` varchar(10) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `u_role_right` */

insert  into `u_role_right`(`id`,`role_id`,`right_id`) values (2,'6','0101000000'),(3,'6','0100000000'),(4,'6','0101010000'),(5,'6','0101020000'),(6,'1','0109000000'),(7,'1','0100000000'),(8,'1','0101000000'),(9,'1','0101010000'),(10,'1','0101020000'),(11,'1','0101030000'),(12,'1','0101040000'),(13,'1','0101050000'),(14,'1','0101060000'),(15,'1','0101070000'),(16,'1','0101080000'),(17,'1','0102000000'),(18,'1','0102010000'),(19,'1','0102020000'),(20,'1','0102030000'),(21,'1','0102040000'),(22,'1','0103000000'),(23,'1','0103010000'),(24,'1','0103020000'),(25,'1','0103030000'),(26,'1','0103040000'),(27,'1','0103040100'),(28,'1','0103040200'),(29,'1','0103040300'),(30,'1','0103040400'),(31,'1','0104000000'),(32,'1','0104010000'),(33,'1','0104020000'),(34,'1','0104020100'),(35,'1','0104020200'),(36,'1','0104020300'),(37,'1','0104030000'),(38,'1','0104030100'),(39,'1','0104030200'),(40,'1','0104030300'),(41,'1','0104030400'),(42,'1','0104040000'),(43,'1','0105000000'),(44,'1','0105010000'),(45,'1','0105020000'),(46,'1','0105030000'),(47,'1','0105040000'),(48,'1','0105050000'),(49,'1','0105050100'),(50,'1','0105050200'),(51,'1','0105050300'),(52,'1','0105060000'),(53,'1','0106000000'),(54,'1','0106010000'),(55,'1','0106020000'),(56,'1','0106030000'),(57,'1','0106040000'),(58,'1','0106050000'),(59,'1','0106060000'),(60,'1','0106070000'),(61,'1','0107000000'),(62,'1','0107010000'),(63,'1','0107010100'),(64,'1','0107010200'),(65,'1','0107010300'),(66,'1','0107010301'),(67,'1','0107010400'),(68,'1','0107010500'),(69,'1','0107020000'),(70,'1','0108000000'),(71,'1','0108010000'),(72,'1','0108020000'),(73,'1','0108020100'),(74,'1','0108020200'),(75,'1','0108020300'),(76,'1','0108030000'),(77,'1','0109010000'),(78,'1','0109020000'),(79,'1','0109030000'),(80,'1','0109040000'),(81,'1','0109050000'),(82,'1','0200000000'),(83,'1','0201000000'),(84,'1','0201010000'),(85,'1','0201020000'),(86,'1','0201030000'),(87,'1','0201040000'),(88,'1','0201050000'),(89,'1','0201060000'),(90,'1','0202000000'),(91,'1','0202010000'),(92,'1','0203000000'),(93,'1','0203010000'),(94,'1','0204000000'),(95,'1','0204010000'),(96,'1','0204020000'),(97,'1','0205000000'),(98,'1','0205010000'),(99,'1','0206000000'),(100,'1','0206010000');

/*Table structure for table `u_user_info` */

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
) ENGINE=InnoDB AUTO_INCREMENT=10018 DEFAULT CHARSET=utf8;

/*Data for the table `u_user_info` */

insert  into `u_user_info`(`user_id`,`user_name`,`user_pwd`,`true_name`,`email`,`mobile_num`,`phone_num`,`dept_id`,`enabled`,`registerdate`,`description`) values (10001,'admin','21232f297a57a5a743894a0e4a801fc3','123','123','1','123','0100000000',1,'2014-02-10','admin'),(10002,'456','250cf8b51c773f3f8dc8b4be867a9a02','test2','woshi.guanxi@gmail.com','1','1','0101000000',1,'2014-02-20',NULL),(10003,'789','68053af2923e00204c3ca7c6a3150cf7','test1','201121190002@mail.bnu.edu.cn','1','1','0102000000',1,'2014-02-20',NULL),(10004,'111','698d51a19d8a121ce581499d7b701668','test','tudiliuzhuan2013@163.com','18811478698','1','0102010000',1,'2014-02-20',NULL),(10005,'wucan','c4213846ba5c8e87c206cee8416fefc1','吴灿','wucan731@sina.com','18112345678','01055807713','0102010100',1,'2014-03-10',NULL),(10006,'oper','fd154ffe305c26b5004231ff709bd1b8','',NULL,'1','1','0102010100',1,'2014-03-10',NULL),(10008,'test','098f6bcd4621d373cade4e832627b4f6','',NULL,'1','1','0102010100',0,'2014-04-07',NULL),(10009,'监管系统','jgxt','','','1','1',NULL,1,'2014-04-15','jgxt'),(10010,'测试','ceshi','','','1','1',NULL,1,'2014-04-17','ceshi'),(10011,'del','del','test4','927683078@qq.com','1','1',NULL,1,NULL,'dddd'),(10014,'del3','81dc9bdb52d04dc20036dbd8313ed055','','123','1','123',NULL,1,'2014-04-18','123'),(10017,'监管系统管理员','f6060e83acf8f344b7664c9648c43fd8','监管系统管理员','jgxt@163.com','18132149876','010-55801234',NULL,1,'2014-06-02','此用户为监管系统的<b>管理员</b>。');

/*Table structure for table `u_user_role` */

DROP TABLE IF EXISTS `u_user_role`;

CREATE TABLE `u_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统自增序号',
  `username` varchar(30) DEFAULT NULL COMMENT '用户编号',
  `roleid` int(11) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `u_user_role` */

insert  into `u_user_role`(`id`,`username`,`roleid`) values (1,'admin',1),(2,'admin',2),(3,'admin',3),(4,'wucan',3),(5,'oper',4),(6,'test',4),(7,'admin',4),(8,'wucan',4),(9,'监管系统',6);

/*Table structure for table `u_user_true_info` */

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

/*Data for the table `u_user_true_info` */

insert  into `u_user_true_info`(`user_id`,`true_name`,`email`,`mobile_num`,`phone_num`,`dept_id`) values (1,'张三','wucan731@sina.com','+8613612345678','010-58801234','0101010000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
