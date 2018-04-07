-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-05-07 09:13:45
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ccoa`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员账号',
  `AdminPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员密码',
  `MobilePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `OfficePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '办公室电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `company`
--

CREATE TABLE IF NOT EXISTS `company` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `Username`, `Password`, `LinkmanName`, `LinkmanPhone`, `Email`, `CompanyName`, `CompanyAddress`, `ZipCode`, `CompanyPhone`, `CompanyFax`, `IsMember`, `MemberCode`, `Note`, `AccountType`) VALUES
(1, 'leilufeng', 'e10adc3949ba59abbe56e057f20f883e', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 1, 'leilufeng', 'leilufeng', 0),
(2, 'eea', '922aa8292277aac1bd8b88d476997512', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 1, NULL, 'eea', 0),
(3, 'eea12', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 1, 'eea2', 'eea2', 0),
(4, 'eea132', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 1, NULL, 'eea2', 0),
(5, 'asdf', '7b064dad507c266a161ffc73c53dcdc5', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', 1, 'adf', 'af', 0),
(6, 'asdf11', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', 1, 'adf', 'af', 0),
(7, 'asdf12', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', 1, NULL, 'af', 0),
(8, 'asdf13', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', 'asdf', 'afd', 'afds', 'af', 'asf', 1, NULL, 'af', 0),
(9, 'eea122323', 'bc474a632bba14cfd321e7918a008a93', 'eea2', 'eea2', 'eea2', 'eea2', 'eea244444', 'eea2', 'eea2', 'eea2', 0, NULL, 'eea2', 0),
(10, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 1, 'test', 'test', 0);

-- --------------------------------------------------------

--
-- 表的结构 `expert`
--

CREATE TABLE IF NOT EXISTS `expert` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `expert_jobs`
--

CREATE TABLE IF NOT EXISTS `expert_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `Company` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作或学习单位',
  `Job` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '职务/职称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `expert_results`
--

CREATE TABLE IF NOT EXISTS `expert_results` (
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

-- --------------------------------------------------------

--
-- 表的结构 `expert_winners`
--

CREATE TABLE IF NOT EXISTS `expert_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL COMMENT '时间',
  `Title` int(11) DEFAULT NULL COMMENT '获奖项目名称',
  `Level` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖励名称及等级',
  `Ranking` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '排名',
  `Contribute` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '贡献',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `expert_writings`
--

CREATE TABLE IF NOT EXISTS `expert_writings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `Writings` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '论文/著作名称',
  `Identity` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '作者身份',
  `Publishers` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表期刊/出版社',
  `Date` date DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NewsTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻标题',
  `NewsContent` text CHARACTER SET utf8 COMMENT '新闻内容',
  `NewsType` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻类型',
  `NewsDate` date DEFAULT NULL COMMENT '发表时间',
  `NewsMan` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `CompanyID`, `ProjectCN`, `ProjectEN`, `Category`, `Group`, `StartTime`, `EndTime`, `FromTask`, `FromOther`, `PlanFund`, `Secret`, `SecretTime`, `RecommendCompany`, `Fundamentals`, `Introduction`, `Content`, `AppSituation`, `TotalFund`, `Payback`, `Calculations`, `Social`, `Recommended`, `ApplyYear`, `Note`, `Status`, `Step`) VALUES
(1, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 10, '123', '123', '1', '1', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `project_accessory`
--

CREATE TABLE IF NOT EXISTS `project_accessory` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传类型',
  `filePath` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传地址',
  `fileName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `project_economies`
--

CREATE TABLE IF NOT EXISTS `project_economies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份',
  `Profit` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增利润',
  `Tax` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增税收',
  `Tevenue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创收外汇（美元）',
  `Cutting` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '节支总额',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `project_key_person`
--

CREATE TABLE IF NOT EXISTS `project_key_person` (
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
  `ContactAddress` varchar(300) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `project_major_company`
--

CREATE TABLE IF NOT EXISTS `project_major_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `CompanyAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '通讯地址',
  `ZipCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `LinkMan` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `LinkPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `project_property`
--

CREATE TABLE IF NOT EXISTS `project_property` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `review`
--

CREATE TABLE IF NOT EXISTS `review` (
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

-- --------------------------------------------------------

--
-- 表的结构 `set_category`
--

CREATE TABLE IF NOT EXISTS `set_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `set_category`
--

INSERT INTO `set_category` (`id`, `Name`, `Status`) VALUES
(1, '技术发明项目', 1),
(2, '自然科学项目', 1),
(3, '技术开发项目', 1),
(4, '社会公益项目', 1),
(5, '重大工程项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `set_chapter`
--

CREATE TABLE IF NOT EXISTS `set_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `set_fromtask`
--

CREATE TABLE IF NOT EXISTS `set_fromtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `set_fromtask`
--

INSERT INTO `set_fromtask` (`id`, `Name`, `Status`) VALUES
(1, '国家计划', 1),
(2, '部委计划', 1),
(3, '省市自治区计划', 1),
(4, '基金资助', 1),
(5, '国际合作', 1),
(6, '其它代为委托', 1),
(7, '自选', 1),
(8, '非职务', 1),
(9, '其他', 1);

-- --------------------------------------------------------

--
-- 表的结构 `set_group`
--

CREATE TABLE IF NOT EXISTS `set_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `set_group`
--

INSERT INTO `set_group` (`id`, `Name`, `Status`) VALUES
(1, '油脂', 1),
(2, '食品', 1),
(3, '储藏', 1),
(4, '信息', 1),
(5, '发酵面食', 1);

-- --------------------------------------------------------

--
-- 表的结构 `set_prize`
--

CREATE TABLE IF NOT EXISTS `set_prize` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `set_template`
--

CREATE TABLE IF NOT EXISTS `set_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `Date` datetime DEFAULT NULL COMMENT '上传时间',
  `Note` text CHARACTER SET utf8 COMMENT '描述',
  `AdminId` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
