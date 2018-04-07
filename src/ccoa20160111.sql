-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 21 日 00:58
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ccoa`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `AdminName`, `AdminPassword`, `MobilePhone`, `OfficePhone`) VALUES
(1, 'yun', 'e10adc3949ba59abbe56e057f20f883e', '18774017700', '123'),
(2, 'zhgl', 'e10adc3949ba59abbe56e057f20f883e', '18724017700', '345555'),
(3, 'sdfa', 'e10adc3949ba59abbe56e057f20f883e', '18724017700', '345555');

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
  `LoginTime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `status` int(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=151 ;

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `Username`, `Password`, `LinkmanName`, `LinkmanPhone`, `Email`, `CompanyName`, `CompanyAddress`, `ZipCode`, `CompanyPhone`, `CompanyFax`, `IsMember`, `MemberCode`, `Note`, `AccountType`, `LoginTime`, `status`) VALUES
(1, 'leilufeng', 'e10adc3949ba59abbe56e057f20f883e', 'leilufeng', 'leilufeng', 'ddd@163.com', '讯得111ssss', 'leilufeng', 'leilufeng', 'leilufeng', 'leilufeng', 1, 'leilufeng', 'leilufeng', 1, NULL, 1),
(2, 'eea', '922aa8292277aac1bd8b88d476997512', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 'eea', 1, NULL, 'eea', 0, NULL, NULL),
(3, 'eea12', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 1, 'eea2', 'eea2', 0, NULL, NULL),
(4, 'eea132', '49e443fe5918ec60381eaefae5fcda5b', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 'eea2', 1, NULL, 'eea2', 0, NULL, NULL),
(5, 'asdf', '7b064dad507c266a161ffc73c53dcdc5', 'asf', 'afd', 'asdf', '彩利', 'afd', 'afds', 'af', 'asf', 1, 'adf', 'af', 0, NULL, NULL),
(6, 'asdf11', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', '彩利', 'afd', 'afds', 'af', 'asf', 1, 'adf', 'af', 0, NULL, NULL),
(7, 'asdf12', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', '彩利', 'afd', 'afds', 'af', 'asf', 1, NULL, 'af', 0, NULL, NULL),
(8, 'asdf13', '100edd17d15056cc21411d095d123138', 'asf', 'afd', 'asdf', '彩利', 'afd', 'afds', 'af', 'asf', 1, NULL, 'af', 0, NULL, NULL),
(9, 'eea122323', 'bc474a632bba14cfd321e7918a008a93', 'eea2', 'eea2', 'eea2', 'eea2', 'eea244444', 'eea2', 'eea2', 'eea2', 0, NULL, 'eea2', 0, NULL, NULL),
(10, 'sbdw', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 1, 'test', 'test', 0, NULL, NULL),
(11, 't1', 'e10adc3949ba59abbe56e057f20f883e', 't1ln', 't1lp', 't1e', 't1cn', 't1ca', 't1zc', 't1cp', 't1cf', 0, 't1', NULL, 0, NULL, NULL),
(22, 't12', 'a461d688d013e47c4010387e7922940d', NULL, NULL, NULL, '彩利', NULL, NULL, NULL, NULL, 1, NULL, 'yeah', 0, NULL, NULL),
(23, 't13', NULL, NULL, NULL, NULL, '彩利', NULL, NULL, NULL, NULL, 0, NULL, 'nononodsaasdsdaasd11111', NULL, NULL, NULL),
(24, 't14', NULL, NULL, NULL, NULL, '彩利', NULL, NULL, NULL, NULL, 1, NULL, 'dsaasdasd121212', NULL, NULL, NULL),
(25, 't115', NULL, NULL, NULL, NULL, '彩利', NULL, NULL, NULL, NULL, 1, NULL, 'sdf', NULL, NULL, NULL),
(26, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 't116', NULL, NULL, NULL, NULL, '彩利', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'ds', NULL, NULL, NULL),
(29, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 't116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'test1', 'test1', 'test1linkname', '312123', 'test1email', 'test1', 'test1ad', 'test1zipcod', '1847017017', '12312', NULL, NULL, NULL, 0, NULL, NULL),
(109, 'fsd', 'fsd', 'fasd', '123231', 'fsd', 'fasdfd', 'af', 'fsa', '32123', '123', NULL, NULL, NULL, 0, NULL, NULL),
(110, 'fsd', 'fsd', 'fasd', '123231', 'fsd', 'fasdfd', 'af', 'fsa', '32123', '123', NULL, NULL, NULL, 0, NULL, NULL),
(111, 'dfs', 'dfs', 'dfs', '3123', 'dfs', 'dfs', 'sdf', '123', '312', '234', NULL, NULL, NULL, 0, NULL, NULL),
(112, 'dfs', 'dfs', 'dfs', '3123', 'dfs', 'dfs', 'sdf', '123', '312', '234', NULL, NULL, NULL, 0, NULL, NULL),
(120, 'test', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '测试', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(121, 'test2', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(122, 'test3', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(123, 'aaa123', '202cb962ac59075b964b07152d234b70', NULL, NULL, 'sdfsf@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'aaa12', '202cb962ac59075b964b07152d234b70', NULL, NULL, 'sfdf@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'aaa12111', '202cb962ac59075b964b07152d234b70', NULL, NULL, 'asd@163.cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'aaa1111', '202cb962ac59075b964b07152d234b70', '123', NULL, 'sdf@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'aaa1234', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, 'dfs@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'aaa12345', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, 'sdf@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'aaa123456', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'ss@163.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, '111aaa', '202cb962ac59075b964b07152d234b70', 'aaa', '123', 'sdf@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'df123', '202cb962ac59075b964b07152d234b70', 'sd', '123', 'as@163.com', 'sfd', NULL, NULL, NULL, NULL, NULL, NULL, 'sdf', NULL, NULL, NULL),
(132, 'sss123', '202cb962ac59075b964b07152d234b70', 'sd', '23432', 'sd@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'aaa123', '202cb962ac59075b964b07152d234b70', 'fd', '23423', '22@163.com', 'sfdsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'aaa123', '202cb962ac59075b964b07152d234b70', 'sd', '123', 'sdf@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'aaa123', '202cb962ac59075b964b07152d234b70', '12', '123', '2@163.c0m', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '123aaa', '202cb962ac59075b964b07152d234b70', '123', '23', '123@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'sss111', '202cb962ac59075b964b07152d234b70', '123', '123', '123@163.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'fff123', '202cb962ac59075b964b07152d234b70', '123', '123', 'sdf@163.com', 'sdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'qq111', '202cb962ac59075b964b07152d234b70', '123', '123', 'sdf@163.com', 'sss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'aaa222', '202cb962ac59075b964b07152d234b70', 'sad', '123', 'sdf@163.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'qqq123', '202cb962ac59075b964b07152d234b70', '123', '123', '123@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'af123', '202cb962ac59075b964b07152d234b70', '123', '12', 'ssa@163.com', 'sd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'www111', '202cb962ac59075b964b07152d234b70', '123', '123', '123@163.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'yyy123', '202cb962ac59075b964b07152d234b70', '123', '123', '123@163.com', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'aaa2', '202cb962ac59075b964b07152d234b70', '123', '12', '12@163.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'aa234', '202cb962ac59075b964b07152d234b70', '123', '123', '123@163.com', '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'ee333', '202cb962ac59075b964b07152d234b70', '12', '12', '12@163.com', 'sdf', NULL, NULL, NULL, NULL, 1, NULL, '', NULL, NULL, 0),
(148, '123rrr', 'd9b1d7db4cd6e70935368a1efb10e377', '123', '123', '123@163.com', '123', NULL, NULL, NULL, NULL, 1, NULL, 'sdf ', 0, NULL, NULL),
(149, '123aa', 'e10adc3949ba59abbe56e057f20f883e', '123', '123', '123@163.com', '123', NULL, NULL, NULL, NULL, 1, NULL, '', NULL, NULL, 1),
(150, 'aa111', 'e10adc3949ba59abbe56e057f20f883e', '测试数据', '1369854444', '111@163.com', '测试', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `expert`
--

DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` text CHARACTER SET utf8 COMMENT '用户名',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录密码',
  `Name` text CHARACTER SET utf8,
  `Nation` text CHARACTER SET utf8 COMMENT '民族',
  `Sex` int(1) DEFAULT NULL COMMENT '性别',
  `Origin` text CHARACTER SET utf8 COMMENT '籍贯',
  `Birthday` date DEFAULT NULL,
  `Parties` text CHARACTER SET utf8 COMMENT '政治面貌',
  `Degree` text CHARACTER SET utf8 COMMENT '学历学位',
  `Learn` text CHARACTER SET utf8 COMMENT '所学专业',
  `Working` text CHARACTER SET utf8 COMMENT '从事专业',
  `TechTitle` text CHARACTER SET utf8 COMMENT '专业技术职称',
  `School` text CHARACTER SET utf8 COMMENT '毕业学校',
  `Job` text CHARACTER SET utf8 COMMENT '工作单位及职务',
  `Identity` text CHARACTER SET utf8 COMMENT '身份证号',
  `Address` text CHARACTER SET utf8 COMMENT '通讯地址',
  `Phone` text CHARACTER SET utf8 COMMENT '电话',
  `Email` text CHARACTER SET utf8,
  `Moblie` text CHARACTER SET utf8 COMMENT '手机',
  `ChapterID` text CHARACTER SET utf8 COMMENT '所属分会编号(逗号隔开)',
  `Situation` text CHARACTER SET utf8 COMMENT '技术组织任职情况',
  `RecommendTime` datetime DEFAULT NULL COMMENT '推荐单位意见时间',
  `RecommendNote` text CHARACTER SET utf8 COMMENT '推荐单位意见',
  `OfficeTime` datetime DEFAULT NULL COMMENT '学会理事长办公会意见时间',
  `OfficeNote` text CHARACTER SET utf8 COMMENT '学会理事长办公会意见',
  `Change` int(1) DEFAULT NULL COMMENT '是否允许修改资料',
  `beizhu` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `expert`
--

INSERT INTO `expert` (`id`, `UserName`, `Password`, `Name`, `Nation`, `Sex`, `Origin`, `Birthday`, `Parties`, `Degree`, `Learn`, `Working`, `TechTitle`, `School`, `Job`, `Identity`, `Address`, `Phone`, `Email`, `Moblie`, `ChapterID`, `Situation`, `RecommendTime`, `RecommendNote`, `OfficeTime`, `OfficeNote`, `Change`, `beizhu`) VALUES
(30, 'zj', 'e10adc3949ba59abbe56e057f20f883e', 'fdasfa', NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, 'sdfsfd', NULL, 'sss', NULL, 'ss@16.com', '', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(31, 'aaa11', 'e10adc3949ba59abbe56e057f20f883e', '测试数据', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sfdsdfs', NULL, NULL, 'xdf@163.com', NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(32, 'zhuanjia', '7363a0d0604902af7b70b271a0b96480', '测试数据', NULL, 0, NULL, NULL, NULL, '本科', NULL, NULL, NULL, '长沙学院', NULL, '213444444444444444444', NULL, NULL, 'ddd@163.com', '15956981236', 1, 'sdf', '2015-06-10 15:49:21', '水电费水电费', '2015-06-12 15:49:27', '水电费', NULL, NULL),
(33, '23aaa', '202cb962ac59075b964b07152d234b70', '12', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aa@163.com', NULL, 1, NULL, '2015-07-02 11:51:43', NULL, '2015-07-03 11:51:48', NULL, 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `expert_jobs`
--

INSERT INTO `expert_jobs` (`id`, `ExpertID`, `StartTime`, `EndTime`, `Company`, `Job`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '2015-06-05', '2015-06-05', '11', NULL),
(4, NULL, '2015-06-05', '2015-06-05', '飞洒啊发', NULL),
(5, NULL, '2015-06-05', '2015-06-05', 'fas ', ' fa a'),
(6, NULL, '2015-06-05', '2015-06-05', '发沙发', '发发'),
(7, NULL, NULL, NULL, '发沙发', '发撒'),
(8, 10, '2015-06-05', '2015-06-09', 'FAS', 'FAS'),
(9, 10, '2015-06-05', NULL, NULL, NULL),
(10, 10, '2015-06-05', NULL, 'FAS2', 'FAS2'),
(11, 16, '2015-06-09', '2015-06-09', 'fd', 'fd'),
(12, 17, '2015-06-09', '2015-06-09', 'fd', 'd'),
(13, 18, '2015-06-09', '2015-06-09', 'fd', 'd'),
(14, 19, '2015-06-09', '2015-06-09', 'fa', 'fsa'),
(15, 20, '2015-06-09', '2015-06-09', 'd', 'd'),
(16, 22, '2015-06-12', '2015-06-11', 'd111', 'd'),
(17, 22, '2015-06-11', '2015-06-11', '2', '2'),
(18, 23, '2015-06-11', '2015-06-11', '搜索', '的'),
(19, 24, '2015-06-11', '2015-06-11', '22dd', '22fasafa'),
(20, 25, '2015-06-11', '2015-06-11', '等等', '的'),
(21, 25, '2015-06-11', '2015-06-11', '等等', '等等'),
(22, 25, '2015-06-11', '2015-06-11', '的dd', ' 的'),
(23, NULL, '2015-06-11', '2015-06-11', 'dd', 'ddd'),
(24, 25, '2015-06-11', '2015-06-11', 'fdsafasfas', 'fasfafa'),
(25, 26, '2015-06-04', '2015-06-10', 'sdf', 'sd'),
(26, 27, '2015-06-04', '2015-06-10', 'sdf', 'sd'),
(27, 30, '2015-06-16', '2015-06-16', 'a', 'a'),
(28, 33, '2015-07-01', '2015-07-18', '', ''),
(29, 34, '2015-07-01', '2015-07-02', '', ''),
(30, 34, '2015-07-09', '2015-07-15', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `expert_results`
--

INSERT INTO `expert_results` (`id`, `ExpertID`, `StartTime`, `EndTime`, `JobName`, `Role`, `Results`, `Situation`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '2015-06-05', '2015-06-05', '11', 'd', 'ddd', 'dd'),
(4, NULL, '2015-06-05', '2015-06-05', '法师法师', ' 阿发', '发飞发', '发沙发'),
(5, NULL, '2015-06-05', '2015-06-05', 'fas a', ' fas ', 'f as', ' fa '),
(6, NULL, '2015-06-05', '2015-06-05', '发撒', NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, '2015-06-05', '2015-06-05', 'FASFA', 'FAS', 'FAF', 'FAS'),
(9, 16, '2015-06-09', '2015-06-09', 'fd', 'fd', 'fd', 'fd'),
(17, 17, '2015-06-09', '2015-06-09', 'fd', 'fd', 'd', 'fdf'),
(18, 18, '2015-06-09', '2015-06-09', 'fd', 'fd', 'd', 'fdf'),
(19, 19, '2015-06-09', '2015-06-09', 'fa', 'fsa', 'f', 'fa'),
(20, 20, '2015-06-09', '2015-06-09', 'd', 'd', 'd', 'd'),
(21, 22, '2015-06-11', '2015-06-11', '1', '1', '1', '1'),
(22, 22, '2015-06-11', '2015-06-11', '2', '2', '2', '2'),
(23, 24, '2015-06-11', '2015-06-11', '12', '112', '22dd', '2dd'),
(24, 25, '2015-06-11', '2015-06-11', '的', '等等', '等等', '等等'),
(25, 30, NULL, '2015-06-16', 'a', 'a', 'a', 'a'),
(26, 32, '2015-06-03', '2015-07-03', '水电费', '', '', ''),
(27, 33, '2015-07-01', '2015-07-17', '', '', '', ''),
(28, 34, '2015-07-01', '2015-07-02', '', '', '', ''),
(29, 34, '2015-07-09', '2015-07-17', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `expert_winners`
--

CREATE TABLE IF NOT EXISTS `expert_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL COMMENT '时间',
  `Title` varchar(500)  CHARACTER SET utf8 DEFAULT NULL COMMENT '获奖项目名称',
  `Level` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖励名称及等级',
  `Ranking` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '排名',
  `Contribute` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '贡献',
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `expert_winners`
--

INSERT INTO `expert_winners` (`id`, `Date`, `Title`, `Level`, `Ranking`, `Contribute`, `ExpertID`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2015-06-05', 1, 'd', 'dd', 'd', NULL),
(4, '2015-06-05', 1, '飞按时阿发', '发沙发', '发沙发', NULL),
(5, '2015-06-05', 1, 'fasf', 'f af', 'fa ', NULL),
(6, '2015-06-05', 1, '发撒发f', ' 发沙发', ' 发撒', NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-06-05', 1, 'FA', 'AFASF', 'FA', NULL),
(9, '2015-06-09', 1, 'fa', 'f', 'fasfa', 19),
(20, '2015-06-09', 1, 'd', 'd', 'd', 20),
(21, '2015-06-11', 3, '1', '11', '1', 22),
(22, '2015-06-11', 5, '2', '2', '2', 22),
(23, '2015-06-11', 1, '2', '12', '12', 24),
(24, '2015-06-11', 1, '等等', '的', '的', 25),
(25, '2015-06-11', 1, 'dd', 'ddd', 'dd', 25),
(26, '2015-06-16', 4, 'a', 'a', 'a', 30),
(27, '2015-06-10', 7, '地方', '1', '', 32),
(28, '2015-07-03', 1, '', '', '', 33),
(29, '2015-07-01', 1, '', '', '', 34),
(30, '2015-07-02', NULL, '', '', '', 34);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `expert_writings`
--

INSERT INTO `expert_writings` (`id`, `ExpertID`, `Writings`, `Identity`, `Publishers`, `Date`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'dd', 'd', 'd', '2015-06-05'),
(4, NULL, '发沙发a', ' 阿发阿发', '飞asfa', '2015-06-05'),
(5, NULL, 'fa ', ' fa ', ' fa ', '2015-06-05'),
(6, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'FAS', 'FAS', 'FASF', '2015-06-05'),
(9, 19, 'faf', 'asffasd', 'as', '2015-06-09'),
(20, 20, 'd', 'd', 'd', '2015-06-09'),
(21, 22, '1', '1', '1', '2015-06-11'),
(22, 22, '2', '2', '2', '2015-06-11'),
(23, 24, '12', '12', '12', '2015-06-11'),
(24, 25, '等等dd', '等等dd', '等等dd', '2015-06-27'),
(25, 25, 'dd', 'dd', 'dddd', '2015-06-11'),
(26, 30, 'a', 'a', 'a', '2015-06-16'),
(27, 32, '水电费', '水电费', '水电费', '2015-06-17'),
(28, 33, '', '', '', '2015-07-01'),
(29, 34, '', '', '', '2015-07-01'),
(30, 34, '', '', '', '2015-06-28');

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
  `status` int(1) DEFAULT NULL COMMENT '状态（0取消 1发布）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `NewsTitle`, `NewsContent`, `NewsType`, `NewsDate`, `NewsMan`, `status`) VALUES
(2, 'fdasf', NULL, NULL, '2015-05-20', NULL, 1),
(4, 'fdsas', NULL, NULL, '2015-05-20', NULL, 1),
(6, 'fsd', NULL, NULL, '2015-05-20', NULL, 1),
(7, 'fdsdd3333', '<p>\n	3333fsdafsdFdsa\n</p>\n<p>\n	fdfs\n</p>\n<p>\n	df\n</p>\n<p>\n	sf\n</p>\n<p>\n	sd<img src="/attached/image/20150520/20150520172110_604.png" alt="" /> \n</p>', NULL, '2015-05-20', NULL, 1),
(8, 'aaaab222', '<p>\n	22222fsdaafddf\n</p>\n<p>\n	s\n</p>\n<p>\n	fd\n</p>\n<p>\n	sdf\n</p>\n<p>\n	fdsdf\n</p>\n<p>\n	a\n</p>\n<p>\n	df\n</p>\n<p>\n	as\n</p>', NULL, '2015-05-20', NULL, 1),
(10, '请规范申报内容', '是非法的', NULL, '2015-06-12', NULL, 1),
(11, 'sfd', NULL, NULL, '2015-06-16', NULL, 1),
(12, 'sdf', 'sfdsdf', NULL, '2015-06-26', NULL, 1),
(13, 'sdf', 'sfdsdf', NULL, '2015-06-26', NULL, 1),
(14, '435345', 'sdfsf', NULL, '2015-06-26', NULL, 1),
(15, '435345', 'sdfsf', NULL, '2015-06-26', NULL, 1),
(16, 'ceshi', 'sdfsf', NULL, '2015-06-30', NULL, 1);

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
  `Group` varbinary(50) DEFAULT NULL COMMENT '专业专家评审组',
  `GroupExpertIDs`  varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '发送专业评审时设置的该专家组所有的专家编号，以删除组员使用',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `FromTask` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源',
  `FromOther` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源其他',
  `PlanFund` text CHARACTER SET utf8  COMMENT '计划（基金）/名称/编号',
  `Secret` int(1) DEFAULT NULL COMMENT '是否保密',
  `SecretTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '保密期限',
  `RecommendCompany` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位',
  `Fundamentals` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本情况页盖章回传',
  `Introduction` text CHARACTER SET utf8 COMMENT '项目简介',
  `Content` text CHARACTER SET utf8 COMMENT '项目详细内容 --立项背景',
  `Content1` text CHARACTER SET utf8 COMMENT '项目详细内容--发现/发明及创新点',
  `Content2` text CHARACTER SET utf8 COMMENT '项目详细内容--保密要点',
  `Content3` text CHARACTER SET utf8 COMMENT '项目详细内容--与当前国内外同类研究、同类技术的综合比较',
  `Content4` text CHARACTER SET utf8 COMMENT '项目详细内容--详细科学技术内容',
  `AppSituation` text CHARACTER SET utf8 COMMENT '应用情况',
  `TotalFund` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目总投资金',
  `Payback` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '回收期',
  `Calculations` text CHARACTER SET utf8 COMMENT '项目计算依据',
  `Social` text CHARACTER SET utf8 COMMENT '社会效益',
  `Recommended` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位意见回传',
  `ApplyYear` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报年度',
  `Note` text CHARACTER SET utf8 COMMENT '审查意见',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0未提交，1形式审查中，2形式审查合格，项目评审中，3形式审查不合格，4评审中(状态4已没在用),5特等奖，6一等奖，7二等奖，8三等奖，9未中奖)',
  `Step` int(11) DEFAULT NULL COMMENT '已保存步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）',
  `GroupZH` int(50) DEFAULT NULL,
  `RegisterNum` int(10) DEFAULT NULL COMMENT '项目登记号',
  `Remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `recom_results` int(11) DEFAULT NULL COMMENT '推荐结果(1 推荐一等奖 2 推荐)',
  `state` int(11) DEFAULT NULL COMMENT '1、专家评审项目表发送  2、  专业项目评审推荐项目汇总表 3、发送给专家”，生成最终总分排序表 4、投票类型分配表保存 5、投票类型分配表发送 6、提交票数统计结果 7、发布到申报平台',
  `vote_type` int(11) DEFAULT '0' COMMENT '投票类别(1、特等奖、2、一等奖、3、二等奖、4、三等奖)  直接进入获奖项目列表(5、特等奖、6、一等奖、7、二等奖、8、三等奖)',
  `send_state` int(11) DEFAULT NULL COMMENT '获奖项目列表发布 1 是 2 否',
  `groupZH_person` text COMMENT '综评组中的专家信息（页面选中）多个以,分开',
  `GroupZY` int(11) DEFAULT NULL COMMENT '专业评审组',
  `winning_results` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖结果（特等奖，一等奖，二等奖，三等奖，未得奖）',
  `Applytime` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请时间 记录当前录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `CompanyID`, `ProjectCN`, `ProjectEN`, `Category`, `Group`, `StartTime`, `EndTime`, `FromTask`, `FromOther`, `PlanFund`, `Secret`, `SecretTime`, `RecommendCompany`, `Fundamentals`, `Introduction`, `Content`, `Content1`, `Content2`, `Content3`, `AppSituation`, `TotalFund`, `Payback`, `Calculations`, `Social`, `Recommended`, `ApplyYear`, `Note`, `Status`, `Step`, `GroupZH`, `RegisterNum`, `Remark`, `recom_results`, `state`, `vote_type`, `send_state`, `groupZH_person`, `GroupZY`, `winning_results`, `Applytime`) VALUES
(1, 1, '测试bug', '123', '1', '2', '2008-01-01', '2009-01-01', NULL, '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 0, 1, NULL, 134, 'sdf3sdfsdfsfsdfsdfsdf', NULL, 1, NULL, NULL, NULL, 1, NULL, '2015-07-14'),
(2, 1, '项目2', '123', '1', '', '2008-01-01', '2009-01-01', NULL, '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 0, 3, NULL, 234, 'sf', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2015-07-02'),
(3, 10, '项目3', '123', '2', '2', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 2, NULL, 11, 23, 'sf', 1, 7, 1, 1, '', NULL, '未得奖', NULL),
(4, 10, '项目4', '123', '3', '2', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 2, NULL, 11, 3, 'sdfsdf', 1, 7, 6, 1, '31,30,28', NULL, '一等奖', NULL),
(5, 10, '项目5', '123', '4', '', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 88, 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 10, '项目6', '123', '5', '', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, '项目7', '123', '5', '', '2008-01-01', '2009-01-01', '', '111', 'asdfa', 1, '1111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, 2, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, '23', '22', '1', '2', '2015-06-12', '2016-01-16', NULL, '23', '23', 1, '241', '324', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/jbqk/101.jpg', 'sd sdfsfsdsdfsdsdfsdfsdf<br />', 'sdfsdf dfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfssfdsdfsfsf<br />', 'sdf', 'sdf', 'sfd', 'zxcsdfsdf', '23', '23', 'xffsd', 'sdfsfsdfsdfhhhhhhhhhhhhhhhhhgghjhjghjghjkhjkhjkhjkhjkhjkhjkhhjjfgfgdfgf', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/dwyj/111.jpg', '2015', 'dfg', 1, 1, 11, 1, NULL, 2, 7, 3, 1, '28,30', 2, '未得奖', '2015-07-02'),
(39, 1, '测试1', '111', '1', '2', '2015-06-12', '2015-06-12', NULL, NULL, '212', 1, '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 'sdf', 2, 1, NULL, 5, NULL, NULL, 1, 0, NULL, NULL, 2, NULL, NULL),
(40, 1, '测试数据11', 'test', '1', '2', '2015-06-11', '2015-06-20', NULL, '测试', '士大夫', 1, '12', '123', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/jbqk/1162.jpg', '士大夫', '士大夫', '士大夫玩儿<br />', '士大夫士大夫', '是大幅度', '士大夫', '123', '12', '123', '时代复分', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/dwyj/9.jpg', '2015', 'sdf', 1, 1, NULL, 34, NULL, 2, 7, 5, 1, NULL, NULL, '特等奖', '2015-07-02');

-- --------------------------------------------------------

--
-- 表的结构 `project_accessory`
--

CREATE TABLE IF NOT EXISTS `project_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传类型',
  `filePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传地址',
  `fileName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `project_accessory`
--

INSERT INTO `project_accessory` (`id`, `type`, `filePath`, `fileName`, `ProjectID`) VALUES
(7, '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/新建 Microsoft Office Word 文档.docx', '新建 Microsoft Office Word 文档', 8),
(8, '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/新建 Microsoft Office Word 文档1.docx', '新建 Microsoft Office Word 文档1', 8),
(9, '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/新建 Microsoft Office Word 文档2.docx', '新建 Microsoft Office Word 文档2', 8),
(10, '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/10.jpg', '10', 8),
(11, '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/9.jpg', '9', 8),
(12, '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/5.jpg', '5', 8),
(13, '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/JAVA上机面试题目.doc', 'JAVA上机面试题目', 40),
(14, '被他人引用情况检索复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/rcNote.docx', 'rcNote', 40),
(15, '科学评价证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/temp.doc', 'temp', 40),
(16, '技术评价证明(复印件)', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/101.jpg', '101', 40),
(17, '应用证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/7.jpg', '7', 40),
(18, '其它证明', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/11.jpg', '11', 40),
(19, '主要论著的复印件', 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/temp3.doc', 'temp3', 8),
(20, '应用证明', 'F:\\XM\\ccoa\\WebRoot/upload/u=2347981092,2012789328&fm=23&gp=0.png', 'u=2347981092,2012789328&fm=23&gp=0', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `project_economies`
--

INSERT INTO `project_economies` (`id`, `Year`, `Profit`, `Tax`, `Tevenue`, `Cutting`, `ProjectID`) VALUES
(6, '2016', '23', '123', '23', NULL, 8),
(7, '2015', '12', '10', '36', '56', 8);

-- --------------------------------------------------------

--
-- 表的结构 `project_group`
--

CREATE TABLE IF NOT EXISTS `project_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `Status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `project_group`
--

INSERT INTO `project_group` (`id`, `Name`, `Status`) VALUES
(1, '测试', 1),
(2, '测试2', 1),
(3, '测试3', 0),
(4, '111', 1),
(5, '111', 0);

-- --------------------------------------------------------

--
-- 表的结构 `project_key_person`
--

CREATE TABLE IF NOT EXISTS `project_key_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `Sex` int(1) DEFAULT NULL COMMENT '性别，1男，0女',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `project_key_person`
--

INSERT INTO `project_key_person` (`id`, `Sort`, `Name`, `Sex`, `Nation`, `Homeplace`, `Birthday`, `Parties`, `Company`, `ContactPhone`, `ContactAddress`, `ZipCode`, `HomeAddress`, `HomePhone`, `EMail`, `School`, `Education`, `Degree`, `JobTitle`, `Speciality`, `Graduation`, `Honor`, `StartTime`, `EndTime`, `Contribution`, `ProjectID`) VALUES
(1, NULL, '杨丹3', 1, NULL, NULL, '2015-02-01', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-10', NULL, '2015-02-10', '2015-02-10', NULL, 8),
(4, NULL, '杨丹3', 1, 'sdf', 'sd', '2015-06-09', NULL, 'sd', '234', 'dfs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-10', '2015-06-11', NULL, 16),
(5, NULL, '测试人员', 1, '士大夫', '士大夫', '2015-06-11', '士大夫', '士大夫', '23423', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '士大夫', '2015-06-11', '2015-06-13', NULL, 40),
(6, NULL, '测试2', 1, NULL, NULL, '2015-06-11', NULL, '234', '2343', '长沙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-12', '2015-06-19', NULL, 40),
(7, NULL, '测试', 0, NULL, NULL, NULL, NULL, '水电费', '234234324', '234234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-29', '2015-07-31', NULL, 8),
(8, NULL, '杨丹', 1, '汉族', '长沙', '2015-07-08', '共产党', '长沙茹一腾', '23423444', '实打实地方', '2423424', '是否都是对方水电费', '232222', '232@163.com', '水电费', '水电费', '水电费', '水电费', '水电费', '2015-07-15', 'sdf', '2015-07-07', '2015-07-16', '水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `project_major_company`
--

INSERT INTO `project_major_company` (`id`, `CompanyName`, `CompanyAddress`, `ZipCode`, `LinkMan`, `LinkPhone`, `ProjectID`) VALUES
(3, '单位14', 'sdf', '324', 'sdf', 'sdf', 8),
(6, 'sdf', 'sdf', '234', '234', '234', 8),
(7, '单位14', 'sdf', 'sd', 'sdf', '234', 16),
(10, '测试单位', '123', '123', '123', '123', 40),
(11, '睿翊腾', '南京', '123456', '士大夫', '322', 40),
(12, '测试数据', '长沙市芙蓉广场', '4100000', '测试', '1213654', 2),
(14, '测试数据2', '长沙市', '234234', '234234', '234234234', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `project_property`
--

INSERT INTO `project_property` (`id`, `Categories`, `Name`, `ApplyDate`, `AuthorityDate`, `PatentNumber`, `Obligee`, `Inventor`, `ProjectID`) VALUES
(1, 'lksdfj', '34', '2014-01-02', '2014-01-02', '300002', '12', '34', 8),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '士大夫', '士大夫', NULL, NULL, NULL, NULL, NULL, 8),
(7, '二二', '234', '2015-06-02', '2015-06-17', '231233213', '123', '123', 40),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '23', '23', '2015-06-03', '2015-06-02', '23', '23', '23', 1),
(10, '水电费舒服点', '水电费', '2015-07-02', '2015-07-03', '21212', '111', '1111', 2);

-- --------------------------------------------------------

--
-- 表的结构 `project_review`
--

CREATE TABLE IF NOT EXISTS `project_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `recommend` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `prize` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐一等奖',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作', 
  prdescribe  varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '得分描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=175 ;

--
-- 转存表中的数据 `project_review`
--

INSERT INTO `project_review` (`id`, `projectID`, `expertID`, `score`, `recommend`, `prize`, `note`, `status`) VALUES
(162, '1', '28', '24.00', '1', '1', NULL, '0'),
(163, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(164, '3', '28', '30.00', '0', '0', NULL, '2'),
(165, '4', '28', '30.00', '1', '0', NULL, '2'),
(166, '8', '28', '39.00', '0', '0', NULL, '2'),
(167, '39', '28', '53.00', '1', '1', NULL, '2'),
(168, '40', '28', '39.00', '1', '1', NULL, '2'),
(169, '1', '30', '50.00', '1', '1', 's', '2'),
(170, '3', '30', '50.00', '0', '0', NULL, '2'),
(171, '4', '30', '60.00', '1', '0', NULL, '2'),
(172, '8', '30', '75.00', '1', '1', 'sfd', '2'),
(173, '39', '30', '60.00', '0', '0', NULL, '2'),
(174, '40', '30', '57.00', '0', '0', NULL, '2');

-- --------------------------------------------------------

--
-- 表的结构 `project_review_gather`
--

CREATE TABLE IF NOT EXISTS `project_review_gather` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `vote` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作',
  `statusTp` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '投票操作状态',
  prdescribe  varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '得分描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=108 ;

--
-- 转存表中的数据 `project_review_gather`
--

INSERT INTO `project_review_gather` (`id`, `projectID`, `expertID`, `score`, `vote`, `note`, `status`, `statusTp`) VALUES
(89, '8', '28', '82.00', '1', 'df', '0', '1'),
(90, '8', '30', '36.00', NULL, NULL, '2', '0'),
(91, '40', '4', NULL, NULL, NULL, '0', '0'),
(92, '40', '3', NULL, NULL, NULL, '0', '0'),
(93, '40', '1', NULL, NULL, NULL, '0', '0'),
(94, '40', '22', NULL, NULL, NULL, '0', '0'),
(95, '40', '31', NULL, NULL, NULL, '0', '0'),
(96, '40', '30', '70.00', NULL, NULL, '2', '0'),
(97, '40', '28', '56.00', '0', NULL, '2', '0'),
(98, '4', '31', NULL, NULL, NULL, '0', '0'),
(99, '4', '30', '60.00', NULL, NULL, '2', '0'),
(100, '4', '28', '92.00', '1', NULL, '2', '0'),
(101, '3', '4', NULL, NULL, NULL, '0', '0'),
(102, '3', '3', NULL, NULL, NULL, '0', '0'),
(103, '3', '1', NULL, NULL, NULL, '0', '0'),
(104, '3', '22', NULL, NULL, NULL, '0', '0'),
(105, '3', '31', NULL, NULL, NULL, '0', '0'),
(106, '3', '30', '51.00', NULL, NULL, '2', '0'),
(107, '3', '28', '85.00', '0', NULL, '2', '1');

-- --------------------------------------------------------

--
-- 表的结构 `project_review_other`
--

CREATE TABLE IF NOT EXISTS `project_review_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) DEFAULT NULL,
  `ExpertID` int(11) DEFAULT NULL,
  `FilePath` varchar(200) DEFAULT NULL,
  `Recommend` char(2) DEFAULT NULL,
  `Note` varchar(1000) DEFAULT NULL,
  `Status` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `project_review_other`
--

INSERT INTO `project_review_other` (`id`, `ProjectID`, `ExpertID`, `FilePath`, `Recommend`, `Note`, `Status`) VALUES
(7, 1, 1, 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/qtjx/新建 Microsoft Office Word 文档.docx', '1', 'sdfsdfsfd', '1'),
(8, 2, 1, 'C:\\Users\\john1\\workspace\\ccoa\\WebRoot/upload/qtjx/新建 Microsoft Office Word 文档1.docx', '0', NULL, '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `set_chapter`
--

INSERT INTO `set_chapter` (`id`, `Name`, `Status`) VALUES
(1, 'saaaa222', 0),
(2, 'sddssd', 0),
(3, 'dddd', 1),
(4, 'ccc', 0),
(5, '222', 1),
(6, '333', 0),
(7, '444', 1);

-- --------------------------------------------------------

--
-- 表的结构 `set_expertgroup`
--

CREATE TABLE IF NOT EXISTS `set_expertgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '评审组编号',
  `expert_id` int(11) DEFAULT NULL COMMENT '专家编号',
  `status` int(11) DEFAULT NULL COMMENT '标记为:1主任委员,2副主任委员,3委员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `set_expertgroup`
--

INSERT INTO `set_expertgroup` (`id`, `group_id`, `expert_id`, `status`) VALUES
(1, 1, 1, NULL),
(4, NULL, 3, NULL),
(5, NULL, 1, NULL),
(13, 13, 6, NULL),
(16, 8, 3, NULL),
(19, 11, 4, 1),
(20, 11, 3, NULL),
(29, 2, 1, 1),
(30, 2, 25, NULL),
(31, 2, 24, NULL),
(32, 11, 1, NULL),
(33, 11, 22, NULL),
(34, 2, 29, NULL),
(35, 2, 28, 2),
(36, 2, 31, 3),
(37, 2, 30, 3),
(38, 11, 31, NULL),
(39, 11, 30, NULL),
(41, 11, 28, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `set_fromreview`
--

CREATE TABLE IF NOT EXISTS `set_fromreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '形式审查编号',
  `ProjectID` int(11) DEFAULT NULL COMMENT '项目编号',
  `AdminID` int(11) DEFAULT NULL COMMENT '管理编号',
  `Note` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '审查意见',
  `Status` int(11) DEFAULT NULL COMMENT '状态 0 不通过 1通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `set_fromreview`
--

INSERT INTO `set_fromreview` (`id`, `ProjectID`, `AdminID`, `Note`, `Status`) VALUES
(1, 8, 1, 'xcv', 0),
(2, 8, 1, 'asdasd', 0),
(3, 7, 1, 'dfg', 1),
(4, 8, 1, NULL, 0),
(5, 1, 1, NULL, 1),
(6, 3, 1, NULL, 1),
(7, 4, 1, 'sdf', 0),
(8, 4, 1, 'we', 0),
(9, 4, 1, '453', 0),
(10, 4, 1, '2df', 0),
(11, 4, 1, '不通过', 0),
(12, 4, 1, 'sdf', 0),
(13, 8, 1, 'dfg', 1),
(14, 4, 1, NULL, 1),
(15, 39, 1, 'sdf', 1),
(16, 40, 1, 'sdf', 0),
(17, 40, 1, 'sdf', 1);

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

CREATE TABLE `set_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  `Group_Year` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年度',
  `Type` char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '1专业评审组 , 2 综评专家组,3自定义评审专家组',
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义奖项信息表id(type为3时有值)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


--
-- 转存表中的数据 `set_group`
--

INSERT INTO `set_group` (`id`, `Name`, `Status`, `Group_Year`, `Type`) VALUES
(1, '油脂2', 0, '2015', '1'),
(2, '食品7', 1, '2015', '1'),
(3, '储藏333', 0, '2015', '1'),
(4, '信息', 1, '2013', '1'),
(5, '发酵面食', 0, '2015', '1'),
(6, 'aaa', 1, '2014', '1'),
(7, '233', 0, '2015', '1'),
(8, '食品1', 1, '2015', '1'),
(9, '食品2', 1, '2015', '1'),
(10, '食品4', 1, '2015', '1'),
(11, '综评组1', 1, '2015', '2'),
(12, '综评组2', 1, '2014', '2'),
(13, '综评组3', 1, '2013', '2'),
(14, '食品5', 1, '2015', '1'),
(15, '食品6', 0, '2015', '1'),
(16, NULL, 0, NULL, NULL),
(17, NULL, 0, NULL, NULL),
(18, '食品6', 1, '2015', '1'),
(19, '综评组', 1, '2012', '2');

-- --------------------------------------------------------

--
-- 表的结构 `set_prize`
--

CREATE TABLE IF NOT EXISTS `set_prize` (
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
  `Status` int(1) DEFAULT NULL COMMENT '评审状态(1开启，0结束)',
  `Note` text CHARACTER SET utf8 COMMENT '注意事项',
  `PrizeYear` int(11) DEFAULT NULL COMMENT '年份',
  `StatusSb` int(1) DEFAULT '1' COMMENT '申报状态(1开启，0结束)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `set_prize`
--

INSERT INTO `set_prize` (`id`, `Grandest`, `One`, `Two`, `Three`, `Professional`, `Composite`, `GrandestVote`, `OneVote`, `TwoVote`, `ThreeVote`, `ApplyStartTime`, `ApplyEndTime`, `ProfessionalStartTime`, `ProfessionalEndTime`, `CompositeStartTime`, `CompositeEndTime`, `CompositeVoteStartTime`, `CompositeVoteEndTime`, `Watermark`, `Status`, `Note`, `PrizeYear`, `StatusSb`) VALUES
(1, NULL, 1, 1, 1, 1, 0, 2, 1, 0, 0, '2015-05-05 01:27:46', '2015-05-29 01:27:48', '2015-05-11 01:27:50', '2015-05-03 01:27:51', '2015-05-05 01:27:52', '2015-05-07 01:27:54', '2015-05-09 01:27:55', '2015-05-11 01:27:56', 'dsafas', 1, 'fsdafsdasdfsdf3434', NULL, NULL),
(2, 1, 1, 1, 1, 1, 1, 5, 3, 2, 1, '2015-05-31 16:42:15', '2016-07-01 16:42:20', '2015-06-07 16:42:26', '2015-07-11 16:42:30', '2015-06-08 16:42:36', '2015-07-04 16:42:40', '2015-06-18 16:42:44', '2015-07-04 16:42:48', NULL, 0, NULL, 2015, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- 转存表中的数据 `set_template`
--

INSERT INTO `set_template` (`id`, `Title`, `Path`, `Date`, `Note`, `AdminId`) VALUES
(69, 'aaaaaaaaaaaaaaa', NULL, '2015-05-21 01:21:32', 'aaaaaabbbbbbbbbbb', '1'),
(70, 'fdsafdds', 'License.txt', '2015-05-21 02:02:25', 'fafsa', '1'),
(71, 'fsdfds', 'D:\\xdworkspace\\ccoa\\WebRoot\\upload\\20150521\\README.txt', '2015-05-21 02:03:57', 'fsd', '1'),
(72, 'sadds', 'D:\\xdworkspace\\ccoa\\WebRoot\\upload\\20150521\\test.txt', '2015-05-21 02:29:50', 'sad', '1'),
(76, 'fdsaf', 'D:/xdworkspace/ccoa/WebRoot/upload/20150521/', '2015-05-21 03:06:28', 'fsda', '1'),
(77, 'fsda', 'D:/xdworkspace/ccoa/WebRoot/upload/20150521/', '2015-05-21 03:07:07', 'fsd', '1'),
(78, 'fsdafds11', '/upload/20150521/', '2015-05-21 03:12:20', 'sda', '1'),
(115, 'aa', '/upload/20150701/申报书.docx', '2015-07-01 15:21:51', NULL, '1'),
(119, 'aa', '/upload/20150701/申报书.docx', '2015-07-01 15:24:36', NULL, '1'),
(120, '111', '/upload/20150701/申报书.docx', '2015-07-01 15:25:49', NULL, '1');

-- --------------------------------------------------------

--
-- 表的结构 `t`
--

CREATE TABLE IF NOT EXISTS `t` (
  `b` bit(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t`
--

INSERT INTO `t` (`b`) VALUES
(b'00110000');

-- --------------------------------------------------------

--
-- 表的结构 `winning_list`
--

CREATE TABLE IF NOT EXISTS `winning_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) DEFAULT NULL COMMENT '父ID',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型：1表示父内容(获奖名单描述)；2表示子内容（项目获奖列表）',
  `winName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖名单',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态 ：1已发布 0 未发布',
  `registerNum` int(11) DEFAULT NULL COMMENT '登记号',
  `projectCN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `majorCompany` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主要完成单位',
  `keyPerson` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主要完成人',
  `recommendCompany` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '推荐单位',
  `winning` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖奖项',
  `winYear` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `winning_list`
--

INSERT INTO `winning_list` (`id`, `parentID`, `type`, `winName`, `status`, `registerNum`, `projectCN`, `majorCompany`, `keyPerson`, `recommendCompany`, `winning`, `winYear`) VALUES
(9, 5, '2', NULL, NULL, 34, '测试数据11', '测试单位,睿翊腾', '测试人员,测试2', '123', '特等奖', NULL),
(10, NULL, '1', '2015年项目获奖名单', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2015'),
(11, 10, '2', NULL, NULL, 3, '项目4', NULL, NULL, '1111', '一等奖', NULL),
(12, 10, '2', NULL, NULL, 34, '测试数据11', '测试单位,睿翊腾', '测试人员,测试2', '123', '特等奖', NULL),
(13, NULL, '1', '2015获奖名单', '0', NULL, NULL, NULL, NULL, NULL, NULL, '2015'),
(14, NULL, '1', '2015年获奖名单管理', '0', NULL, NULL, NULL, NULL, NULL, NULL, '2015');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- ----------------------------
-- Table structure for `ca_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ca_baseinfo`;
CREATE TABLE `ca_baseinfo` (
  `id` varchar(64) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖项名称',
  `Year` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '年度',
  `ReleaseStatus` int(11) DEFAULT NULL COMMENT '发布状态（0草稿，1未发布，2已发布）',
  `ISDeclaration` int(11) DEFAULT NULL COMMENT '是否可申报（0可申报，1不可申报）',
  `ISReview` int(11) DEFAULT NULL COMMENT '是否可评审（0可评审，1不可评审）',
  `DeclarationFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请书模板名称',
  `DeclarationFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报书模板路径',
  `ReviewFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表模板名称',
  `ReviewFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审书模板路径',
  `ReviewResultFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审结果文件名称（评审结果列表中发布到前台）',
  `ReviewResultFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审结果文件路径（评审结果列表中发布到前台）',
  `expertID` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '评审专家编号（用,号隔开）',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `Content` text CHARACTER SET utf8 COMMENT 'html内容',
  `HeaderAttribute` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '表头,用,隔开',
  `Build` text CHARACTER SET utf8 COMMENT '原始html',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `ca_declaration`
-- ----------------------------
DROP TABLE IF EXISTS `ca_declaration`;
CREATE TABLE `ca_declaration` (
  `id` varchar(64) NOT NULL,
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义奖项信息表id',
  `FormalReviewStatus` int(11) DEFAULT NULL COMMENT '形式审查状态（0形式审查中、1形式审查未通过-状态列显示补充材料按钮、2形式审查通过项目评审中、3项目评审通过、4项目评审未通过）',
  `FormalReviewOpinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '最新形式审查意见',
  `ReviewOpinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审意见',
  `DeclarationFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '提交申报书名称',
  `DeclarationFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报书上传路径',
  `DeclareID` int(11) DEFAULT NULL COMMENT '申报人编号',
  `Content` text CHARACTER SET utf8 COMMENT '申报内容，把界面保存进来',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `RegisterNum` int(10) DEFAULT NULL COMMENT '登记号',
  `HeaderAttributeValue` varchar(5000) CHARACTER SET utf8 DEFAULT NULL COMMENT '表头属性对应的值，用;----;号隔开(;----;这个可防止用户在输入内容中包括，前台已验证)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ----------------------------
-- Table structure for `ca_review`
-- ----------------------------
DROP TABLE IF EXISTS `ca_review`;
CREATE TABLE `ca_review` (
  `id` varchar(64) NOT NULL,
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义信息ID',
  `DeclarationID` varchar(64) DEFAULT NULL COMMENT '申报信息表id',
  `ISRecommend` int(11) DEFAULT NULL COMMENT '是否已推荐（0未推荐，1已推荐）',
  `ISSubmit` int(11) DEFAULT NULL COMMENT '是否已提交（1已提交，其他未提交，null也为未提交）',
  `Opinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '意见',
  `ExpertID` int(11) DEFAULT NULL COMMENT '评审人编号',
  `ScoreFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表名称',
  `ScoreFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表上传路径',
  `ReviewTime` datetime DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ----------------------------
-- Table structure for `ca_rormalreviewopinion`
-- ----------------------------
DROP TABLE IF EXISTS `ca_rormalreviewopinion`;
CREATE TABLE `ca_rormalreviewopinion` (
  `id` varchar(64) NOT NULL,
  `DeclarationID` varchar(64) DEFAULT NULL COMMENT '申报表id',
  `Status` int(11) DEFAULT NULL COMMENT '状态（1形式审查未通过2形式审查通过项目评审中）',
  `Opinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '意见',
  `AdminID` int(11) DEFAULT NULL COMMENT '审查人ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '审查时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

