/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.23-enterprise-commercial-advanced-log : Database - ccoa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ccoa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ccoa`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员账号',
  `AdminPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员密码',
  `MobilePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `OfficePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '办公室电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`AdminName`,`AdminPassword`,`MobilePhone`,`OfficePhone`) values (1,'yun','e10adc3949ba59abbe56e057f20f883e','18774017700','88473823'),(2,'fdas','e10adc3949ba59abbe56e057f20f883e','18724017700','345555'),(3,'sdfa','e10adc3949ba59abbe56e057f20f883e','18724017700','345555');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `Username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户密码',
  `LinkmanName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人姓名',
  `LinkmanPhone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人手机',
  `Email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮件',
  `CompanyName` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `CompanyAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位地址',
  `ZipCode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位邮编',
  `CompanyPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位电话',
  `CompanyFax` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsMember` int(1) DEFAULT NULL COMMENT '是否会员(1为会员，0为非会员)',
  `MemberCode` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员号',
  `Note` text CHARACTER SET utf8,
  `AccountType` int(50) DEFAULT NULL COMMENT '账号类别(0为普通账号,1为推荐账号)',
  `LoginTime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`id`,`Username`,`Password`,`LinkmanName`,`LinkmanPhone`,`Email`,`CompanyName`,`CompanyAddress`,`ZipCode`,`CompanyPhone`,`CompanyFax`,`IsMember`,`MemberCode`,`Note`,`AccountType`,`LoginTime`) values (1,'leilufeng','e10adc3949ba59abbe56e057f20f883e','leilufeng','leilufeng','leilufeng','讯得111','leilufeng','leilufeng','leilufeng','leilufeng',1,'leilufeng','leilufeng',1,NULL),(2,'eea','922aa8292277aac1bd8b88d476997512','eea','eea','eea','eea','eea','eea','eea','eea',1,NULL,'eea',0,NULL),(3,'eea12','49e443fe5918ec60381eaefae5fcda5b','eea2','eea2','eea2','eea2','eea2','eea2','eea2','eea2',1,'eea2','eea2',0,NULL),(4,'eea132','49e443fe5918ec60381eaefae5fcda5b','eea2','eea2','eea2','eea2','eea2','eea2','eea2','eea2',1,NULL,'eea2',0,NULL),(5,'asdf','7b064dad507c266a161ffc73c53dcdc5','asf','afd','asdf','彩利','afd','afds','af','asf',1,'adf','af',0,NULL),(6,'asdf11','100edd17d15056cc21411d095d123138','asf','afd','asdf','彩利','afd','afds','af','asf',1,'adf','af',0,NULL),(7,'asdf12','100edd17d15056cc21411d095d123138','asf','afd','asdf','彩利','afd','afds','af','asf',1,NULL,'af',0,NULL),(8,'asdf13','100edd17d15056cc21411d095d123138','asf','afd','asdf','彩利','afd','afds','af','asf',1,NULL,'af',0,NULL),(9,'eea122323','bc474a632bba14cfd321e7918a008a93','eea2','eea2','eea2','eea2','eea244444','eea2','eea2','eea2',0,NULL,'eea2',0,NULL),(10,'test','098f6bcd4621d373cade4e832627b4f6','test','test','test','test','test','test','test','test',1,'test','test',0,NULL),(11,'t1','e10adc3949ba59abbe56e057f20f883e','t1ln','t1lp','t1e','t1cn','t1ca','t1zc','t1cp','t1cf',0,'t1',NULL,0,NULL),(22,'t12','a461d688d013e47c4010387e7922940d',NULL,NULL,NULL,'彩利',NULL,NULL,NULL,NULL,1,NULL,'yeah',0,NULL),(23,'t13',NULL,NULL,NULL,NULL,'彩利',NULL,NULL,NULL,NULL,0,NULL,'nononodsaasdsdaasd11111',NULL,NULL),(24,'t14',NULL,NULL,NULL,NULL,'彩利',NULL,NULL,NULL,NULL,1,NULL,'dsaasdasd121212',NULL,NULL),(25,'t115',NULL,NULL,NULL,NULL,'彩利',NULL,NULL,NULL,NULL,1,NULL,'sdf',NULL,NULL),(26,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'t116',NULL,NULL,NULL,NULL,'彩利',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'ds',NULL,NULL),(29,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'t116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,NULL,NULL,NULL,NULL,NULL,'fsdafsd','afds','sdaf','123123312',NULL,NULL,NULL,NULL,NULL,NULL),(107,'test1','test1','test1linkname','312123','test1email','test1','test1ad','test1zipcod','1847017017','12312',NULL,NULL,NULL,0,NULL),(108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,'fsd','fsd','fasd','123231','fsd','fasdfd','af','fsa','32123','123',NULL,NULL,NULL,0,NULL),(110,'fsd','fsd','fasd','123231','fsd','fasdfd','af','fsa','32123','123',NULL,NULL,NULL,0,NULL),(111,'dfs','dfs','dfs','3123','dfs','dfs','sdf','123','312','234',NULL,NULL,NULL,0,NULL),(112,'dfs','dfs','dfs','3123','dfs','dfs','sdf','123','312','234',NULL,NULL,NULL,0,NULL),(116,'leilufeng','e10adc3949ba59abbe56e057f20f883e','leilufeng','leilufeng','leilufeng','讯得1','leilufeng','leilufeng','leilufeng','leilufeng',NULL,NULL,NULL,1,NULL),(117,'leilufeng','e10adc3949ba59abbe56e057f20f883e','leilufeng','leilufeng','leilufeng','讯得111','leilufeng','leilufeng','leilufeng','leilufeng',NULL,NULL,NULL,1,NULL),(118,'yyy','yyy','yyyy','2234','234234','yyyy2','2yyy2','23321','12312','1223',NULL,NULL,NULL,1,NULL);

/*Table structure for table `expert` */

DROP TABLE IF EXISTS `expert`;

CREATE TABLE `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录密码',
  `Name` varchar(50) DEFAULT NULL,
  `Nation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '民族',
  `Sex` bit(1) DEFAULT NULL COMMENT '性别',
  `Origin` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '籍贯',
  `Birthday` date DEFAULT NULL,
  `Parties` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '政治面貌',
  `Degree` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '学历学位',
  `Learn` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '所学专业',
  `Working` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '从事专业',
  `TechTitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '专业技术职称',
  `School` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '毕业学校',
  `Job` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作单位及职务',
  `Identity` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  `Address` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '通讯地址',
  `Phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Moblie` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `ChapterID` int(11) DEFAULT NULL COMMENT '所属分会编号',
  `Situation` text CHARACTER SET utf8 COMMENT '技术组织任职情况',
  `RecommendTime` datetime DEFAULT NULL COMMENT '推荐单位意见时间',
  `RecommendNote` text CHARACTER SET utf8 COMMENT '推荐单位意见',
  `OfficeTime` datetime DEFAULT NULL COMMENT '学会理事长办公会意见时间',
  `OfficeNote` text CHARACTER SET utf8 COMMENT '学会理事长办公会意见',
  `Change` int(1) DEFAULT NULL COMMENT '是否允许修改资料',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `expert` */

insert  into `expert`(`id`,`UserName`,`Password`,`Name`,`Nation`,`Sex`,`Origin`,`Birthday`,`Parties`,`Degree`,`Learn`,`Working`,`TechTitle`,`School`,`Job`,`Identity`,`Address`,`Phone`,`Email`,`Moblie`,`ChapterID`,`Situation`,`RecommendTime`,`RecommendNote`,`OfficeTime`,`OfficeNote`,`Change`) values (1,'admins','e10adc3949ba59abbe56e057f20f883e','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'讯得1111',NULL,'123123','12312123','123123',NULL,1,NULL,NULL,NULL,NULL,NULL,1),(3,'exp1','a03936a341bded3004cc5d039a7cfa37','exp1name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'exp1company',NULL,'dssd','2323','232323',NULL,3,NULL,NULL,NULL,NULL,NULL,1),(4,'exp2','exp2','exp2exp2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fasfasd',NULL,'exp2fsdsdfsdf','123123123','123123',NULL,2,NULL,NULL,NULL,NULL,NULL,1),(5,NULL,NULL,'aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,'aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `expert_jobs` */

DROP TABLE IF EXISTS `expert_jobs`;

CREATE TABLE `expert_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `Company` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作或学习单位',
  `Job` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '职务/职称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expert_jobs` */

/*Table structure for table `expert_results` */

DROP TABLE IF EXISTS `expert_results`;

CREATE TABLE `expert_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `JobName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '技术工作名称',
  `Role` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '担任角色',
  `Results` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '成果水平',
  `Situation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '完成情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `expert_results` */

/*Table structure for table `expert_winners` */

DROP TABLE IF EXISTS `expert_winners`;

CREATE TABLE `expert_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL COMMENT '时间',
  `Title` int(11) DEFAULT NULL COMMENT '获奖项目名称',
  `Level` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖励名称及等级',
  `Ranking` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '排名',
  `Contribute` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '贡献',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `expert_winners` */

/*Table structure for table `expert_writings` */

DROP TABLE IF EXISTS `expert_writings`;

CREATE TABLE `expert_writings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `Writings` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '论文/著作名称',
  `Identity` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '作者身份',
  `Publishers` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表期刊/出版社',
  `Date` date DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `expert_writings` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NewsTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻标题',
  `NewsContent` text CHARACTER SET utf8 COMMENT '新闻内容',
  `NewsType` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻类型',
  `NewsDate` date DEFAULT NULL COMMENT '发表时间',
  `NewsMan` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`id`,`NewsTitle`,`NewsContent`,`NewsType`,`NewsDate`,`NewsMan`) values (2,'fdasf',NULL,NULL,'2015-05-20',NULL),(4,'fdsas',NULL,NULL,'2015-05-20',NULL),(6,'fsd',NULL,NULL,'2015-05-20',NULL),(7,'fdsdd3333','<p>\n	3333fsdafsdFdsa\n</p>\n<p>\n	fdfs\n</p>\n<p>\n	df\n</p>\n<p>\n	sf\n</p>\n<p>\n	sd<img src=\"/attached/image/20150520/20150520172110_604.png\" alt=\"\" /> \n</p>',NULL,'2015-05-20',NULL),(8,'aaaab222','<p>\n	22222fsdaafddf\n</p>\n<p>\n	s\n</p>\n<p>\n	fd\n</p>\n<p>\n	sdf\n</p>\n<p>\n	fdsdf\n</p>\n<p>\n	a\n</p>\n<p>\n	df\n</p>\n<p>\n	as\n</p>',NULL,'2015-05-20',NULL);

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyID` int(11) DEFAULT NULL COMMENT '申报公司',
  `ProjectCN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目中文名称',
  `ProjectEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目英文名称',
  `Category` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '评奖类别(取数据字典)',
  `Group` varbinary(50) DEFAULT NULL COMMENT '专业评审组',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `FromTask` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源',
  `FromOther` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源其他',
  `PlanFund` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '计划（基金）/名称/编号',
  `Secret` int(1) DEFAULT NULL COMMENT '是否保密',
  `SecretTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '保密期限',
  `RecommendCompany` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位',
  `Fundamentals` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本情况页盖章回传',
  `Introduction` text CHARACTER SET utf8 COMMENT '项目简介',
  `Content` text CHARACTER SET utf8 COMMENT '项目详细内容',
  `AppSituation` text CHARACTER SET utf8 COMMENT '应用情况',
  `TotalFund` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目总投资金',
  `Payback` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '回收期',
  `Calculations` text CHARACTER SET utf8 COMMENT '项目计算依据',
  `Social` text CHARACTER SET utf8 COMMENT '社会效益',
  `Recommended` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位意见回传',
  `ApplyYear` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报年度',
  `Note` text CHARACTER SET utf8 COMMENT '审查意见',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0未提交，1形式审查中，2形式审查合格，3形式审查不合格，4评审中)',
  `Step` int(11) DEFAULT NULL COMMENT '已保存步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）',
  `GroupZH` int(50) DEFAULT NULL,
  `GroupTP` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `project` */

insert  into `project`(`id`,`CompanyID`,`ProjectCN`,`ProjectEN`,`Category`,`Group`,`StartTime`,`EndTime`,`FromTask`,`FromOther`,`PlanFund`,`Secret`,`SecretTime`,`RecommendCompany`,`Fundamentals`,`Introduction`,`Content`,`AppSituation`,`TotalFund`,`Payback`,`Calculations`,`Social`,`Recommended`,`ApplyYear`,`Note`,`Status`,`Step`,`GroupZH`,`GroupTP`) values (1,10,'项目1','123','1','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(2,10,'项目2','123','1','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(3,10,'项目3','123','2','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(4,10,'项目4','123','3','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(5,10,'项目5','123','4','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(6,10,'项目6','123','5','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(7,10,'项目7','123','5','1','2008-01-01','2009-01-01','','111','asdfa',1,'1111','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,1),(8,1,'23','23','1','2','2015-06-12','2016-01-16','1,2,3','23','23',1,'2','324','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/jbqk/114.jpg','dsfsdf','sdf','zxcsdfsdf','23','23','xffsd','sdfsfsdfsdf','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/dwyj/119.jpg','2015',NULL,1,1,NULL,NULL),(16,1,'sd','234','1','2','2015-04-29','2015-05-06','1,2',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL),(17,1,NULL,NULL,'1','2',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL),(18,1,NULL,NULL,'1','2',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL);

/*Table structure for table `project_accessory` */

DROP TABLE IF EXISTS `project_accessory`;

CREATE TABLE `project_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传类型',
  `filePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传地址',
  `fileName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `project_accessory` */

insert  into `project_accessory`(`id`,`type`,`filePath`,`fileName`,`ProjectID`) values (1,'主要论著的复印件','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档6.txt','新建文本文档6',8),(2,'被他人引用情况检索复印件','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档7.txt','新建文本文档7',8),(3,'科学评价证明','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档8.txt','新建文本文档8',8),(4,'技术评价证明(复印件)','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档9.txt','新建文本文档9',8),(5,'应用证明','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档10.txt','新建文本文档10',8),(6,'其它证明','C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档11.txt','新建文本文档11',8);

/*Table structure for table `project_economies` */

DROP TABLE IF EXISTS `project_economies`;

CREATE TABLE `project_economies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份',
  `Profit` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增利润',
  `Tax` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增税收',
  `Tevenue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创收外汇（美元）',
  `Cutting` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '节支总额',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `project_economies` */

insert  into `project_economies`(`id`,`Year`,`Profit`,`Tax`,`Tevenue`,`Cutting`,`ProjectID`) values (2,'2015',NULL,NULL,NULL,NULL,8),(3,'2014',NULL,NULL,NULL,NULL,8);

/*Table structure for table `project_key_person` */

DROP TABLE IF EXISTS `project_key_person`;

CREATE TABLE `project_key_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `Sex` bit(1) DEFAULT NULL COMMENT '性别，1男，0女',
  `Nation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '民族',
  `Homeplace` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '出生地',
  `Birthday` date DEFAULT NULL COMMENT '出生日期',
  `Parties` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '党派',
  `Company` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作单位',
  `ContactPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `ContactAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `ZipCode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `HomeAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '家庭住址',
  `HomePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '住宅电话',
  `EMail` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子信箱',
  `School` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '毕业学校',
  `Education` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '文化程度',
  `Degree` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '学位',
  `JobTitle` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '职务职称',
  `Speciality` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '专业专长',
  `Graduation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '毕业时间',
  `Honor` text CHARACTER SET utf8 COMMENT '曾获奖励及荣誉',
  `StartTime` date DEFAULT NULL COMMENT '本项目起时间',
  `EndTime` date DEFAULT NULL COMMENT '本项目止时间',
  `Contribution` text CHARACTER SET utf8 COMMENT '创建性贡献',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `project_key_person` */

insert  into `project_key_person`(`id`,`Sort`,`Name`,`Sex`,`Nation`,`Homeplace`,`Birthday`,`Parties`,`Company`,`ContactPhone`,`ContactAddress`,`ZipCode`,`HomeAddress`,`HomePhone`,`EMail`,`School`,`Education`,`Degree`,`JobTitle`,`Speciality`,`Graduation`,`Honor`,`StartTime`,`EndTime`,`Contribution`,`ProjectID`) values (1,NULL,'杨丹3','',NULL,NULL,'2015-02-01','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-10',NULL,'2015-02-10','2015-02-10',NULL,8),(2,NULL,'杨丹3','','汉族',NULL,'2015-02-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-10',NULL,'2015-02-10','2015-02-10',NULL,8),(3,NULL,'sdf','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8);

/*Table structure for table `project_major_company` */

DROP TABLE IF EXISTS `project_major_company`;

CREATE TABLE `project_major_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `CompanyAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '通讯地址',
  `ZipCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `LinkMan` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `LinkPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `project_major_company` */

insert  into `project_major_company`(`id`,`CompanyName`,`CompanyAddress`,`ZipCode`,`LinkMan`,`LinkPhone`,`ProjectID`) values (3,'单位14','sdf','324','sdf','sdf',8),(5,'单位14','sdf','sd','sdf','sdf',8),(6,'sdf','sdf','234','234','234',8);

/*Table structure for table `project_property` */

DROP TABLE IF EXISTS `project_property`;

CREATE TABLE `project_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '知识产权类别及国家（地区）',
  `Name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '知识产权具体名称',
  `ApplyDate` date DEFAULT NULL COMMENT '申请日期',
  `AuthorityDate` date DEFAULT NULL COMMENT 'AuthorityDate',
  `PatentNumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '专利号',
  `Obligee` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权利人',
  `Inventor` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '发明人',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `project_property` */

insert  into `project_property`(`id`,`Categories`,`Name`,`ApplyDate`,`AuthorityDate`,`PatentNumber`,`Obligee`,`Inventor`,`ProjectID`) values (1,'lksdfj','34','2014-01-02','2014-01-02','300002',NULL,NULL,8),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'士大夫','士大夫',NULL,NULL,NULL,NULL,NULL,8);

/*Table structure for table `project_review` */

DROP TABLE IF EXISTS `project_review`;

CREATE TABLE `project_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `recommend` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `prize` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐一等奖',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `project_review` */

insert  into `project_review`(`id`,`projectID`,`expertID`,`score`,`recommend`,`prize`,`note`,`status`) values (145,'1','1','2.00','0','0','','2'),(146,'2','1','2.00','0','0','','2'),(147,'3','1','3.00','0','0','','2'),(148,'4','1','2.00','0','0','','2'),(149,'5','1','3.00','0','0','','2'),(150,'6','1','4.00','0','0','','2'),(151,'7','1','2.00','0','0','','2'),(152,'1','2','3.00','0','0','','1'),(153,'2','2','2.00','0','0','','1'),(154,'3','2','14.00','1','1','213','1');

/*Table structure for table `project_review_gather` */

DROP TABLE IF EXISTS `project_review_gather`;

CREATE TABLE `project_review_gather` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `vote` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作',
  `statusTp` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '投票操作状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `project_review_gather` */

insert  into `project_review_gather`(`id`,`projectID`,`expertID`,`score`,`vote`,`note`,`status`,`statusTp`) values (9,NULL,NULL,NULL,NULL,NULL,'1','0'),(10,'1','1','2.00','1','','1','0'),(11,'2','1','23.00','0','','1','0'),(12,'3','1','3.00','0','','1','0'),(13,'4','2','4.00','1','','1','0'),(14,'4','1',NULL,'0',NULL,'0','0'),(15,'1','2',NULL,'1',NULL,'0','0'),(16,'2','2',NULL,'1',NULL,'0','0'),(17,'3','2',NULL,'1',NULL,'0','0'),(18,'5','2',NULL,'1',NULL,'0','0');

/*Table structure for table `project_review_other` */

DROP TABLE IF EXISTS `project_review_other`;

CREATE TABLE `project_review_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) DEFAULT NULL,
  `ExpertID` int(11) DEFAULT NULL,
  `FilePath` varchar(200) DEFAULT NULL,
  `Recommend` char(2) DEFAULT NULL,
  `Note` varchar(1000) DEFAULT NULL,
  `Status` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project_review_other` */

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ProjectID` int(11) DEFAULT NULL,
  `ExpertID` int(11) DEFAULT NULL,
  `Parameter1` double DEFAULT NULL COMMENT '评分参数',
  `Parameter2` double DEFAULT NULL COMMENT '评分参数',
  `Parameter3` double DEFAULT NULL COMMENT '评分参数',
  `Parameter4` double DEFAULT NULL COMMENT '评分参数',
  `Parameter5` double DEFAULT NULL COMMENT '评分参数',
  `Recommend` bit(1) DEFAULT NULL COMMENT '是否推荐(1推荐，0不推荐)',
  `Prize` int(11) DEFAULT NULL COMMENT '0特等奖，1：一等奖，2：二等奖，3：三等奖',
  `Note` text CHARACTER SET utf8 COMMENT '意见',
  `Status` bit(1) DEFAULT NULL COMMENT '状态(1：通过，0不通过)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review` */

/*Table structure for table `set_category` */

DROP TABLE IF EXISTS `set_category`;

CREATE TABLE `set_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `set_category` */

insert  into `set_category`(`id`,`Name`,`Status`) values (1,'技术发明项目',1),(2,'自然科学项目',1),(3,'技术开发项目',1),(4,'社会公益项目',0),(5,'重大工程项目',0),(6,'aaaaq11122',1),(7,'bbb',1);

/*Table structure for table `set_chapter` */

DROP TABLE IF EXISTS `set_chapter`;

CREATE TABLE `set_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `set_chapter` */

insert  into `set_chapter`(`id`,`Name`,`Status`) values (1,'saaaa222',0),(2,'sddssd',1),(3,'dddd',1),(4,'ccc',0),(5,'222',1),(6,'333',0),(7,'444',1);

/*Table structure for table `set_expertgroup` */

DROP TABLE IF EXISTS `set_expertgroup`;

CREATE TABLE `set_expertgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '评审组编号',
  `expert_id` int(11) DEFAULT NULL COMMENT '专家编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `set_expertgroup` */

insert  into `set_expertgroup`(`id`,`group_id`,`expert_id`) values (1,1,1),(2,1,2),(3,2,1);

/*Table structure for table `set_fromtask` */

DROP TABLE IF EXISTS `set_fromtask`;

CREATE TABLE `set_fromtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `set_fromtask` */

insert  into `set_fromtask`(`id`,`Name`,`Status`) values (1,'国家计划',1),(2,'部委计划',1),(3,'省市自治区计划',1),(4,'基金资助',1),(5,'国际合作',1),(6,'其它代为委托',1),(7,'自选',1),(8,'非职务',1),(9,'其他',1);

/*Table structure for table `set_group` */

DROP TABLE IF EXISTS `set_group`;

CREATE TABLE `set_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `set_group` */

insert  into `set_group`(`id`,`Name`,`Status`) values (1,'油脂2',0),(2,'食品',1),(3,'储藏333',0),(4,'信息',1),(5,'发酵面食',0),(6,'aaa',1),(7,'233',0);

/*Table structure for table `set_prize` */

DROP TABLE IF EXISTS `set_prize`;

CREATE TABLE `set_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Grandest` int(1) DEFAULT NULL COMMENT '是否有特等奖(1有，0无)',
  `One` int(1) DEFAULT NULL COMMENT '是否有一等奖',
  `Two` int(1) DEFAULT NULL COMMENT '是否有二等奖',
  `Three` int(1) DEFAULT NULL COMMENT '是否有三等奖',
  `Professional` int(1) DEFAULT NULL COMMENT '专评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
  `Composite` int(1) DEFAULT NULL COMMENT '综评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
  `GrandestVote` int(11) DEFAULT NULL COMMENT '特等奖票数',
  `OneVote` int(11) DEFAULT NULL COMMENT '一等奖票数',
  `TwoVote` int(11) DEFAULT NULL COMMENT '二等奖票数',
  `ThreeVote` int(11) DEFAULT NULL COMMENT '三等奖票数',
  `ApplyStartTime` datetime DEFAULT NULL COMMENT '申报开始时间',
  `ApplyEndTime` datetime DEFAULT NULL COMMENT '申报结束时间',
  `ProfessionalStartTime` datetime DEFAULT NULL,
  `ProfessionalEndTime` datetime DEFAULT NULL,
  `CompositeStartTime` datetime DEFAULT NULL,
  `CompositeEndTime` datetime DEFAULT NULL,
  `CompositeVoteStartTime` datetime DEFAULT NULL,
  `CompositeVoteEndTime` datetime DEFAULT NULL,
  `Watermark` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '水印文字设置',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1开启，0结束)',
  `Note` text CHARACTER SET utf8 COMMENT '注意事项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `set_prize` */

insert  into `set_prize`(`id`,`Grandest`,`One`,`Two`,`Three`,`Professional`,`Composite`,`GrandestVote`,`OneVote`,`TwoVote`,`ThreeVote`,`ApplyStartTime`,`ApplyEndTime`,`ProfessionalStartTime`,`ProfessionalEndTime`,`CompositeStartTime`,`CompositeEndTime`,`CompositeVoteStartTime`,`CompositeVoteEndTime`,`Watermark`,`Status`,`Note`) values (1,NULL,1,1,NULL,1,0,2333,21444,444,2355,'2015-05-05 01:27:46','2015-05-29 01:27:48','2015-05-11 01:27:50','2015-05-03 01:27:51','2015-05-05 01:27:52','2015-05-07 01:27:54','2015-05-09 01:27:55','2015-05-11 01:27:56','dsafas',1,'fsdafsdasdfsdf');

/*Table structure for table `set_template` */

DROP TABLE IF EXISTS `set_template`;

CREATE TABLE `set_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `Date` datetime DEFAULT NULL COMMENT '上传时间',
  `Note` text CHARACTER SET utf8 COMMENT '描述',
  `AdminId` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

/*Data for the table `set_template` */

insert  into `set_template`(`id`,`Title`,`Path`,`Date`,`Note`,`AdminId`) values (1,NULL,NULL,'2015-05-20 20:16:44',NULL,'1'),(2,NULL,NULL,'2015-05-20 20:18:32',NULL,'1'),(3,NULL,NULL,'2015-05-20 20:18:43',NULL,'1'),(4,NULL,NULL,'2015-05-20 20:19:49',NULL,'1'),(5,NULL,NULL,'2015-05-20 20:20:20',NULL,'1'),(6,NULL,NULL,'2015-05-20 20:20:59',NULL,'1'),(7,NULL,NULL,'2015-05-20 20:22:06',NULL,'1'),(8,NULL,NULL,'2015-05-20 20:23:19',NULL,'1'),(9,NULL,NULL,'2015-05-20 20:26:42',NULL,'1'),(10,NULL,NULL,'2015-05-20 20:28:07',NULL,'1'),(11,NULL,NULL,'2015-05-20 20:28:34',NULL,'1'),(12,NULL,NULL,'2015-05-20 20:29:33',NULL,'1'),(13,NULL,NULL,'2015-05-20 20:30:16',NULL,'1'),(14,NULL,NULL,'2015-05-20 20:31:15',NULL,'1'),(15,NULL,NULL,'2015-05-20 20:31:43',NULL,'1'),(16,NULL,NULL,'2015-05-20 20:32:14',NULL,'1'),(17,NULL,NULL,'2015-05-20 20:32:38',NULL,'1'),(18,NULL,NULL,'2015-05-20 20:33:36',NULL,'1'),(19,NULL,NULL,'2015-05-20 20:34:26',NULL,'1'),(20,NULL,NULL,'2015-05-20 20:35:02',NULL,'1'),(21,NULL,NULL,'2015-05-20 20:38:11',NULL,'1'),(22,NULL,NULL,'2015-05-20 20:39:11',NULL,'1'),(23,NULL,NULL,'2015-05-20 20:41:39',NULL,'1'),(24,NULL,NULL,'2015-05-20 20:42:20',NULL,'1'),(25,NULL,NULL,'2015-05-20 20:45:21',NULL,'1'),(26,NULL,NULL,'2015-05-20 20:47:01',NULL,'1'),(27,NULL,NULL,'2015-05-20 20:47:56',NULL,'1'),(28,NULL,NULL,'2015-05-20 20:50:02',NULL,'1'),(29,NULL,NULL,'2015-05-20 20:55:23',NULL,'1'),(30,NULL,NULL,'2015-05-20 20:57:52',NULL,'1'),(31,NULL,NULL,'2015-05-20 21:01:33',NULL,'1'),(32,NULL,NULL,'2015-05-20 21:05:56',NULL,'1'),(33,NULL,NULL,'2015-05-20 21:07:44',NULL,'1'),(34,NULL,NULL,'2015-05-20 21:10:42',NULL,'1'),(35,NULL,NULL,'2015-05-21 00:08:54',NULL,'1'),(36,NULL,NULL,'2015-05-21 00:10:04',NULL,'1'),(37,NULL,NULL,'2015-05-21 00:25:30',NULL,'1'),(38,NULL,NULL,'2015-05-21 00:25:55',NULL,'1'),(39,NULL,NULL,'2015-05-21 00:26:11',NULL,'1'),(40,NULL,NULL,'2015-05-21 00:26:55',NULL,'1'),(41,NULL,NULL,'2015-05-21 00:27:53',NULL,'1'),(42,NULL,NULL,'2015-05-21 00:31:46',NULL,'1'),(43,NULL,NULL,'2015-05-21 00:32:43',NULL,'1'),(44,NULL,NULL,'2015-05-21 00:33:16',NULL,'1'),(45,NULL,NULL,'2015-05-21 00:33:39',NULL,'1'),(46,NULL,NULL,'2015-05-21 00:35:15',NULL,'1'),(47,NULL,NULL,'2015-05-21 00:35:27',NULL,'1'),(48,NULL,NULL,'2015-05-21 00:38:22',NULL,'1'),(49,NULL,NULL,'2015-05-21 00:41:40',NULL,'1'),(50,NULL,NULL,'2015-05-21 00:42:11',NULL,'1'),(51,NULL,NULL,'2015-05-21 00:42:21',NULL,'1'),(52,NULL,NULL,'2015-05-21 00:42:49',NULL,'1'),(53,NULL,NULL,'2015-05-21 00:42:50',NULL,'1'),(54,NULL,NULL,'2015-05-21 00:43:01',NULL,'1'),(55,NULL,NULL,'2015-05-21 00:43:27',NULL,'1'),(56,NULL,NULL,'2015-05-21 00:43:29',NULL,'1'),(57,NULL,NULL,'2015-05-21 00:43:48',NULL,'1'),(58,NULL,NULL,'2015-05-21 00:44:08',NULL,'1'),(59,NULL,NULL,'2015-05-21 00:45:22',NULL,'1'),(60,NULL,NULL,'2015-05-21 00:57:41',NULL,'1'),(61,NULL,NULL,'2015-05-21 00:58:43',NULL,'1'),(62,NULL,NULL,'2015-05-21 01:00:22',NULL,'1'),(63,NULL,NULL,'2015-05-21 01:07:22',NULL,'1'),(64,NULL,NULL,'2015-05-21 01:12:34',NULL,'1'),(65,NULL,NULL,'2015-05-21 01:13:42',NULL,'1'),(66,NULL,NULL,'2015-05-21 01:16:12',NULL,'1'),(67,NULL,NULL,'2015-05-21 01:18:14',NULL,'1'),(68,'sdadsa',NULL,'2015-05-21 01:18:47','dsadas','1'),(69,'aaaaaaaaaaaaaaa',NULL,'2015-05-21 01:21:32','aaaaaabbbbbbbbbbb','1'),(70,'fdsafdds','License.txt','2015-05-21 02:02:25','fafsa','1'),(71,'fsdfds','D:\\xdworkspace\\ccoa\\WebRoot\\upload\\20150521\\README.txt','2015-05-21 02:03:57','fsd','1'),(72,'sadds','D:\\xdworkspace\\ccoa\\WebRoot\\upload\\20150521\\test.txt','2015-05-21 02:29:50','sad','1'),(76,'fdsaf','D:/xdworkspace/ccoa/WebRoot/upload/20150521/','2015-05-21 03:06:28','fsda','1'),(77,'fsda','D:/xdworkspace/ccoa/WebRoot/upload/20150521/','2015-05-21 03:07:07','fsd','1'),(78,'fsdafds11','/upload/20150521/','2015-05-21 03:12:20','sda','1'),(79,'fsda','/upload/20150521/讯得彩利_托管合同.doc','2015-05-21 03:13:30','sdasda','1'),(80,'sadasdsad','/upload/20150521/讯得彩利_计算机设备管理制度.doc','2015-05-21 03:14:25','sdaasd','1'),(81,'sda','/upload/20150521/autorun.inf','2015-05-21 03:15:13','dsass','1');

/*Table structure for table `t` */

DROP TABLE IF EXISTS `t`;

CREATE TABLE `t` (
  `b` bit(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t` */

insert  into `t`(`b`) values ('�');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
