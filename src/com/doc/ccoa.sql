/*
Navicat MySQL Data Transfer

Source Server         : BD
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ccoa

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-05-21 14:33:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员账号',
  `AdminPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员密码',
  `MobilePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `OfficePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '办公室电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'leilufeng', 'e10adc3949ba59abbe56e057f20f883e', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', '1', 'leilufeng', 'leilufeng', '0');
INSERT INTO `company` VALUES ('2', 'eea', '922aa8292277aac1bd8b88d476997512', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', '1', null, 'eea', '0');
INSERT INTO `company` VALUES ('3', 'eea12', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', '1', 'eea2', 'eea2', '0');
INSERT INTO `company` VALUES ('4', 'eea132', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', '1', null, 'eea2', '0');
INSERT INTO `company` VALUES ('5', 'asdf', '7b064dad507c266a161ffc73c53dcdc5', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', '1', 'adf', 'af', '0');
INSERT INTO `company` VALUES ('6', 'asdf11', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', '1', 'adf', 'af', '0');
INSERT INTO `company` VALUES ('7', 'asdf12', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', '1', null, 'af', '0');
INSERT INTO `company` VALUES ('8', 'asdf13', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', '1', null, 'af', '0');
INSERT INTO `company` VALUES ('9', 'eea122323', 'bc474a632bba14cfd321e7918a008a93', 'eea2', 'eea2', 'eea2', 'eea2', 'eea244444', 'eea2', 'eea2', 'eea2', '0', null, 'eea2', '0');
INSERT INTO `company` VALUES ('10', 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '1', 'test', 'test', '0');

-- ----------------------------
-- Table structure for `expert`
-- ----------------------------
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
  `Change` bit(1) DEFAULT NULL COMMENT '是否允许修改资料',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES ('1', 'admins', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `expert` VALUES ('2', 'xdf', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `expert_jobs`
-- ----------------------------
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

-- ----------------------------
-- Records of expert_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `expert_results`
-- ----------------------------
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

-- ----------------------------
-- Records of expert_results
-- ----------------------------

-- ----------------------------
-- Table structure for `expert_winners`
-- ----------------------------
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

-- ----------------------------
-- Records of expert_winners
-- ----------------------------

-- ----------------------------
-- Table structure for `expert_writings`
-- ----------------------------
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

-- ----------------------------
-- Records of expert_writings
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NewsTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻标题',
  `NewsContent` text CHARACTER SET utf8 COMMENT '新闻内容',
  `NewsType` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻类型',
  `NewsDate` date DEFAULT NULL COMMENT '发表时间',
  `NewsMan` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
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
  `GroupZH` int(50) DEFAULT NULL COMMENT '综合评审组',
  `GroupTP` int(50) DEFAULT NULL COMMENT '综合投票评审组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '10', '项目1', '123', '1', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('2', '10', '项目2', '123', '1', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('3', '10', '项目3', '123', '2', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('4', '10', '项目4', '123', '3', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('5', '10', '项目5', '123', '4', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('6', '10', '项目6', '123', '5', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('7', '10', '项目7', '123', '5', 0x31, '2008-01-01', '2009-01-01', '', '111', 'asdfa', '1', '1111', '1111', null, null, null, null, null, null, null, null, null, null, null, '0', null, '1', '1');
INSERT INTO `project` VALUES ('33', '1', '234', '345', '1', 0x31, '2015-05-12', '2015-08-12', '国家计划,部委计划,', '', '', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `project` VALUES ('34', '1', '项目4', '', '1', 0x31, '2015-05-12', '2015-08-12', '国家计划,部委计划,', '', '', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `project` VALUES ('35', '1', '项目8', 'xiangmu8', '1', 0x31, '2015-05-12', '2015-08-12', '国家计划,部委计划,', '', '', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `project` VALUES ('36', '1', '123', 'xiangmu8', '1', 0x31, '2015-05-12', '2015-08-12', '国家计划,', '', '', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null);
INSERT INTO `project` VALUES ('37', '1', '项目8', 'xiangmu8', '1', 0x31, '2015-05-12', '2015-08-12', '国家计划,', '', '', null, '', '', '123', '', '', null, '', '', '', '', '123', null, null, '1', '11', null, null);

-- ----------------------------
-- Table structure for `project_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `project_accessory`;
CREATE TABLE `project_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传类型',
  `filePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传地址',
  `fileName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_accessory
-- ----------------------------
INSERT INTO `project_accessory` VALUES ('8', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档6.txt', '新建文本文档6', '37');
INSERT INTO `project_accessory` VALUES ('9', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档7.txt', '新建文本文档7', '37');
INSERT INTO `project_accessory` VALUES ('10', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档8.txt', '新建文本文档8', '37');
INSERT INTO `project_accessory` VALUES ('11', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档9.txt', '新建文本文档9', '37');
INSERT INTO `project_accessory` VALUES ('12', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档10.txt', '新建文本文档10', '37');
INSERT INTO `project_accessory` VALUES ('13', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档11.txt', '新建文本文档11', '37');
INSERT INTO `project_accessory` VALUES ('14', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档.txt', '新建文本文档', '37');
INSERT INTO `project_accessory` VALUES ('15', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档1.txt', '新建文本文档1', '37');
INSERT INTO `project_accessory` VALUES ('16', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档2.txt', '新建文本文档2', '37');
INSERT INTO `project_accessory` VALUES ('17', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档3.txt', '新建文本文档3', '37');
INSERT INTO `project_accessory` VALUES ('18', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档4.txt', '新建文本文档4', '37');
INSERT INTO `project_accessory` VALUES ('19', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档5.txt', '新建文本文档5', '37');
INSERT INTO `project_accessory` VALUES ('20', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档6.txt', '新建文本文档6', '37');
INSERT INTO `project_accessory` VALUES ('21', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档7.txt', '新建文本文档7', '37');
INSERT INTO `project_accessory` VALUES ('22', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档8.txt', '新建文本文档8', '37');
INSERT INTO `project_accessory` VALUES ('23', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档9.txt', '新建文本文档9', '37');
INSERT INTO `project_accessory` VALUES ('24', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档10.txt', '新建文本文档10', '37');
INSERT INTO `project_accessory` VALUES ('25', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档11.txt', '新建文本文档11', '37');
INSERT INTO `project_accessory` VALUES ('26', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档12.txt', '新建文本文档12', '37');
INSERT INTO `project_accessory` VALUES ('27', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档13.txt', '新建文本文档13', '37');
INSERT INTO `project_accessory` VALUES ('28', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档14.txt', '新建文本文档14', '37');
INSERT INTO `project_accessory` VALUES ('29', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档15.txt', '新建文本文档15', '37');
INSERT INTO `project_accessory` VALUES ('30', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档16.txt', '新建文本文档16', '37');
INSERT INTO `project_accessory` VALUES ('31', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档17.txt', '新建文本文档17', '37');
INSERT INTO `project_accessory` VALUES ('32', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档18.txt', '新建文本文档18', '37');
INSERT INTO `project_accessory` VALUES ('33', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档19.txt', '新建文本文档19', '37');
INSERT INTO `project_accessory` VALUES ('34', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档20.txt', '新建文本文档20', '37');
INSERT INTO `project_accessory` VALUES ('35', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档21.txt', '新建文本文档21', '37');
INSERT INTO `project_accessory` VALUES ('36', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档22.txt', '新建文本文档22', '37');
INSERT INTO `project_accessory` VALUES ('37', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档23.txt', '新建文本文档23', '37');
INSERT INTO `project_accessory` VALUES ('38', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档24.txt', '新建文本文档24', '37');
INSERT INTO `project_accessory` VALUES ('39', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档25.txt', '新建文本文档25', '37');
INSERT INTO `project_accessory` VALUES ('40', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档26.txt', '新建文本文档26', '37');
INSERT INTO `project_accessory` VALUES ('41', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档27.txt', '新建文本文档27', '37');
INSERT INTO `project_accessory` VALUES ('42', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档28.txt', '新建文本文档28', '37');
INSERT INTO `project_accessory` VALUES ('43', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档29.txt', '新建文本文档29', '37');
INSERT INTO `project_accessory` VALUES ('44', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档30.txt', '新建文本文档30', '37');
INSERT INTO `project_accessory` VALUES ('45', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档31.txt', '新建文本文档31', '37');
INSERT INTO `project_accessory` VALUES ('46', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档32.txt', '新建文本文档32', '37');
INSERT INTO `project_accessory` VALUES ('47', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档33.txt', '新建文本文档33', '37');
INSERT INTO `project_accessory` VALUES ('48', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档34.txt', '新建文本文档34', '37');
INSERT INTO `project_accessory` VALUES ('49', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档35.txt', '新建文本文档35', '37');
INSERT INTO `project_accessory` VALUES ('50', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档36.txt', '新建文本文档36', '37');
INSERT INTO `project_accessory` VALUES ('51', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档37.txt', '新建文本文档37', '37');
INSERT INTO `project_accessory` VALUES ('52', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档38.txt', '新建文本文档38', '37');
INSERT INTO `project_accessory` VALUES ('53', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档39.txt', '新建文本文档39', '37');
INSERT INTO `project_accessory` VALUES ('54', '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档40.txt', '新建文本文档40', '37');
INSERT INTO `project_accessory` VALUES ('55', '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档41.txt', '新建文本文档41', '37');
INSERT INTO `project_accessory` VALUES ('56', '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档42.txt', '新建文本文档42', '37');
INSERT INTO `project_accessory` VALUES ('57', '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档43.txt', '新建文本文档43', '37');
INSERT INTO `project_accessory` VALUES ('58', '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档44.txt', '新建文本文档44', '37');
INSERT INTO `project_accessory` VALUES ('59', '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/temp/新建文本文档45.txt', '新建文本文档45', '37');

-- ----------------------------
-- Table structure for `project_economies`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_economies
-- ----------------------------
INSERT INTO `project_economies` VALUES ('2', '2015', '23', '10', '20', '10', '37');

-- ----------------------------
-- Table structure for `project_key_person`
-- ----------------------------
DROP TABLE IF EXISTS `project_key_person`;
CREATE TABLE `project_key_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `Sex` char(1) DEFAULT NULL COMMENT '性别，1男，0女',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_key_person
-- ----------------------------
INSERT INTO `project_key_person` VALUES ('1', null, '杨丹', '1', '汉族', '长沙', '2015-02-25', '共产党', '高科', '123456', '长沙', '210000', '长沙', '0731256978', '123', '123', '本科', '学士', '科长', '计算机', '2015-02-23', '士大夫', '2015-05-12', '2015-08-12', '士大夫', '35');
INSERT INTO `project_key_person` VALUES ('3', null, '杨丹', '1', '', '', '2015-02-25', '', '', '', '', '', '', '', '', '', '', '', '', '', '2015-02-23', '', '2015-05-12', '2015-08-12', '', '36');
INSERT INTO `project_key_person` VALUES ('4', null, '杨丹', '1', '', '', '2015-02-25', '', '', '', '', '', '', '', '', '', '', '', '', '', '2015-02-23', '', '2015-05-12', '2015-08-12', '', '37');

-- ----------------------------
-- Table structure for `project_major_company`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_major_company
-- ----------------------------
INSERT INTO `project_major_company` VALUES ('27', '345', '234', '234', '', '', '33');
INSERT INTO `project_major_company` VALUES ('28', '单位1', '', '', '', '', '34');
INSERT INTO `project_major_company` VALUES ('29', '单位1', '23', '', '', '', '35');
INSERT INTO `project_major_company` VALUES ('30', '单位1', '', '', '', '', '36');
INSERT INTO `project_major_company` VALUES ('31', '单位1', '', '', '', '', '37');

-- ----------------------------
-- Table structure for `project_property`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_property
-- ----------------------------
INSERT INTO `project_property` VALUES ('13', '士大夫', '杨丹', '2015-02-12', '2015-02-12', '', '', '', '37');

-- ----------------------------
-- Table structure for `project_review`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of project_review
-- ----------------------------
INSERT INTO `project_review` VALUES ('167', '1', '1', '2.00', '0', '0', '', '1');
INSERT INTO `project_review` VALUES ('168', '2', '1', '35.00', '0', '0', '32', '1');

-- ----------------------------
-- Table structure for `project_review_gather`
-- ----------------------------
DROP TABLE IF EXISTS `project_review_gather`;
CREATE TABLE `project_review_gather` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `vote` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作',
  `statustp` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '1 已投票 0 未投票 2 已提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of project_review_gather
-- ----------------------------
INSERT INTO `project_review_gather` VALUES ('18', '1', '1', '23.00', '1', '2', '1', '1');
INSERT INTO `project_review_gather` VALUES ('19', '2', '1', null, '1', null, '0', '1');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
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

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for `set_category`
-- ----------------------------
DROP TABLE IF EXISTS `set_category`;
CREATE TABLE `set_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_category
-- ----------------------------
INSERT INTO `set_category` VALUES ('1', '技术发明项目', '1');
INSERT INTO `set_category` VALUES ('2', '自然科学项目', '1');
INSERT INTO `set_category` VALUES ('3', '技术开发项目', '1');
INSERT INTO `set_category` VALUES ('4', '社会公益项目', '1');
INSERT INTO `set_category` VALUES ('5', '重大工程项目', '1');

-- ----------------------------
-- Table structure for `set_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `set_chapter`;
CREATE TABLE `set_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for `set_expertgroup`
-- ----------------------------
DROP TABLE IF EXISTS `set_expertgroup`;
CREATE TABLE `set_expertgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '评审组编号',
  `expert_id` int(11) DEFAULT NULL COMMENT '专家编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of set_expertgroup
-- ----------------------------
INSERT INTO `set_expertgroup` VALUES ('1', '1', '1');
INSERT INTO `set_expertgroup` VALUES ('2', '1', '2');
INSERT INTO `set_expertgroup` VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for `set_fromtask`
-- ----------------------------
DROP TABLE IF EXISTS `set_fromtask`;
CREATE TABLE `set_fromtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_fromtask
-- ----------------------------
INSERT INTO `set_fromtask` VALUES ('1', '国家计划', '1');
INSERT INTO `set_fromtask` VALUES ('2', '部委计划', '1');
INSERT INTO `set_fromtask` VALUES ('3', '省市自治区计划', '1');
INSERT INTO `set_fromtask` VALUES ('4', '基金资助', '1');
INSERT INTO `set_fromtask` VALUES ('5', '国际合作', '1');
INSERT INTO `set_fromtask` VALUES ('6', '其它代为委托', '1');
INSERT INTO `set_fromtask` VALUES ('7', '自选', '1');
INSERT INTO `set_fromtask` VALUES ('8', '非职务', '1');
INSERT INTO `set_fromtask` VALUES ('9', '其他', '1');

-- ----------------------------
-- Table structure for `set_group`
-- ----------------------------
DROP TABLE IF EXISTS `set_group`;
CREATE TABLE `set_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_group
-- ----------------------------
INSERT INTO `set_group` VALUES ('1', '油脂', '1');
INSERT INTO `set_group` VALUES ('2', '食品', '1');
INSERT INTO `set_group` VALUES ('3', '储藏', '1');
INSERT INTO `set_group` VALUES ('4', '信息', '1');
INSERT INTO `set_group` VALUES ('5', '发酵面食', '1');

-- ----------------------------
-- Table structure for `set_prize`
-- ----------------------------
DROP TABLE IF EXISTS `set_prize`;
CREATE TABLE `set_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Grandest` bit(1) DEFAULT NULL COMMENT '是否有特等奖(1有，0无)',
  `One` bit(1) DEFAULT NULL COMMENT '是否有一等奖',
  `Two` bit(1) DEFAULT NULL COMMENT '是否有二等奖',
  `Three` bit(1) DEFAULT NULL COMMENT '是否有三等奖',
  `Professional` bit(1) DEFAULT NULL COMMENT '专评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
  `Composite` bit(1) DEFAULT NULL COMMENT '综评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `set_template`
-- ----------------------------
DROP TABLE IF EXISTS `set_template`;
CREATE TABLE `set_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `Date` datetime DEFAULT NULL COMMENT '上传时间',
  `Note` text CHARACTER SET utf8 COMMENT '描述',
  `AdminId` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_template
-- ----------------------------
